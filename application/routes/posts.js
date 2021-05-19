var express = require('express');
var router = express.Router();
var PostModel = require('../models/Posts');
const { successPrint, errorPrint } = require('../helpers/debug/debugprinters');
var sharp = require('sharp');
var multer = require('multer');
var crypto = require('crypto');
var PostError = require('../helpers/error/PostError');

var storage = multer.diskStorage( {

    destination: function(req, file, cb) {
        cb(null, "public/images/uploads");
    },
    filename: function(req, file, cb) {
        let fileExt = file.mimetype.split('/')[1];
        let randomName = crypto.randomBytes(11).toString("hex");
        cb(null, `${randomName}.${fileExt}`); // it's a period . not a hyphen -
    }
});

var uploader = multer({storage: storage});

router.post('/createPost', uploader.single("image"), (req, res, next) => {

    let title = req.body.postTitle;
    let desc = req.body.description;

    if (!title || !desc || !req.file) {
        req.flash('error', 'post failed');
        res.redirect('/');
    }

    else {
        let fileUploaded = req.file.path;
        let fileAsThumbnail = `thumbnail-${req.file.filename}`;
        let destinationOfThumbnail = req.file.destination + "/" + fileAsThumbnail;
        let fk_userId = req.session.userId;
        sharp(fileUploaded)
        .resize(500)
        .toFile(destinationOfThumbnail)
        .then(() => {
            return PostModel.create(title, desc, fileUploaded, destinationOfThumbnail, fk_userId);
        })
        .then((postWasCreated) => {
            if (postWasCreated) {
                req.flash('success', "Your post was created successfully!");
                res.redirect('/');
            }
            else {
                throw new PostError('Post could not be created.', '/postimage', 200);
            }
        }).catch((err) => {

            if (err instanceof PostError) {
                errorPrint(err.getMessage());
                req.flash('error', err.getMessage());
                req.status(err.getStatus());
                res.redirect(err.getRedirectURL());
            }
            else {
                next(err);
            }
        });
    }       
});

router.get('/search', async (req, res, next) => {

    try {

        let searchTerm = req.query.search;
    
        if (!searchTerm) {
            res.send({
                message: "No search term given",
                results: []
            });
        }
        else {

            let results = await PostModel.search(searchTerm);

            if(results.length) {
                res.send({
                    message: `${results.length} Results Found`,
                    results: results
                });
            }
            else {
                let results = await PostModel.getNRecentPosts(8);
                res.send({
                    resultsStatus: "info",
                    message: "No results were found for your search, but here are the 8 most recent posts.",
                    results: results
                });
            }
        }
    } catch(err) {
        next(err);
    }
});

module.exports = router;