// const express = require('express');
// const router = express.Router();
// const db = require('../config/database');

// router.get('/getAllUsers', (req, res, next) => {
//     db.query('SELECT * from users;', (err, results, fields) => {

//         if (err) {
//             next(err);
//         }
//         console.log(results);
//         res.send(results);
//     })
// });

// router.get('/getAllPosts', function(req, res, next) {
//     db.query('SELECT * from posts;').then(([results, fields]) => {
//         console.log(results);
//         res.send(results);
//     }).catch((err) => {
//         next(err);
//     })
// });

// router.post('/createUser', (req, res, next) => {
//     console.log(req.body);
//     let username = req.body.username;
//     let email = req.body.email;
//     let password = req.body.password;
//     let confirmPw = req.body.confirmPw;

//     // validate data, if it is not good, send back a response

//     let baseSQL = 'INSERT INTO user (username, email, password, created) VALUES (?, ?, ?, now())';
//     db.query(baseSQL, [username, email, password, confirmPw]).then (([results, fields]) => {
//         if (results && results.affectedRows) {
//             res.send('user was made');
//         }
//         else {
//             res.send('user was not made');
//         }
//     }).catch((err) => {
//         next(err);
//     })
// });

// module.exports = router;