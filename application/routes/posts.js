var express = require('express');
var router = express.Router();
const db = require('../config/database');
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
        let randomName = crypto.randomBytes(22).toString("hex");
        cb(null, `${randomName}-${fileExt}`);
    }
});

var uploader = multer({storage: storage});

router.post('/createPost', uploader.single("image"), (req, res, next) => {

    console.log(req);
    res.send('');
});

module.exports = router;