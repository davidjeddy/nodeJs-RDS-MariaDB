var mysql = require("mysql");
var dotenv= require("dotenv").config();

var imageId = 'd6d1a71d-e4da-491a-8ab3-8722d5d3d891';

//var s3Object = ()
console.log(process.env.NODE_ENV);

// First you need to create a connection to the db
var con = mysql.createConnection({
    host: process.env.SQL_HOST,
    port: process.env.SQL_PORT,
    user: process.env.SQL_USER,
    password: process.env.SQL_PASS,
    database: process.env.SQL_DBSC
});

con.connect(function(err){
    if(err){
        console.log('Error connecting to Db');
        return;
    }
    console.log('Connection established');
});

con.query('SELECT id,name,x,y,l FROM file_storage_item WHERE name = \'' +  imageId + '\'',function(err,rows){
    if(err) throw err;

    console.log('Data received from Db:\n');
    console.log(rows);
});

con.query(
    'UPDATE file_storage_item SET x = ?, y = ?, l = ?  WHERE name = ?',
    [
        (Math.floor(Math.random() * 10 ) + 1),
        (Math.floor(Math.random() * 10 ) + 1),
        (Math.floor(Math.random() * 10 ) + 1),
        imageId
    ],
    function (err, result) {
        if (err) throw err;

        console.log('Changed ' + result.changedRows + ' rows');
    }
);

con.end(function(err) {
    // The connection is terminated gracefully
    // Ensures all previously enqueued queries are still
    // before sending a COM_QUIT packet to the MySQL server.
});
