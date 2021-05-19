var express = require('express');
var router = express.Router();
var isLoggedIn = require('../middleware/routeprotectors').userIsLoggedIn;
const {getRecentPosts, getPostById, getCommentsByPostId} = require('../middleware/postsmiddleware'); 
var db = require("../config/database");

router.get('/', getRecentPosts, (req, res, next) => {
  res.render('index', {title: "Student App", css: "home"});
});

router.get('/login',(req, res, next) => {
  res.render("login", {title: "Log In", css: "form"});
});

router.get('/registration',(req, res, next) => {
  res.render("registration", {title: "Register", css: "form"});
});

router.use('/postimage', isLoggedIn);
router.get('/postimage', (req, res, next) => {
  res.render("postimage", {title: "Create a Post", css: "form"});
});

router.get('/post/:id(\\d+)', getPostById, getCommentsByPostId, (req, res, next) => {
      res.render('imagepost', {title: `Post ${req.params.id}`, css: "home"});
});

module.exports = router;