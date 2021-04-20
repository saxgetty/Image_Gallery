const mysql = require('mysql2');

const pool = mysql.createPool({
    connectionLimit = 50, 
    host: 'localhost', 
    user: 'samiapp',
    password: 'Dollas!79',
    database: 'samisdatabase',
    // debug: true
});

const promisePool = pool.promise();

module.exports = promisePool;