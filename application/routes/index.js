var express = require('express');
var router = express.Router();
var isLoggedIn = require('../middleware/routeprotectors').userIsLoggedIn;

/* GET home page. */
router.get('/', function(req, res, next) {
  //next(new Error('test'));
  res.render('home', {title: "Student App", css: "home"}); // Don't care about the extension
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

// router.get('/imagepost',(req, res, next) => {
//   res.render("imagepost");
// });

module.exports = router;
