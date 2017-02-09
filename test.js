var mysql = require("mysql");

// First you need to create a connection to the db
var con = mysql.createConnection({
    host: "10.254.254.254",
    user: "m3dev",
    password: "tn34q8",
    database: "m3dev",
    port: 13306
});

con.connect(function(err){
    if(err){
        console.log('Error connecting to Db');
        return;
    }
    console.log('Connection established');
});

con.query('SELECT id,name,x,y,l FROM file_storage_item WHERE name = \'41dc366d-59b6-4068-9d95-2248f723a0af\'',function(err,rows){
    if(err) throw err;

    console.log('Data received from Db:\n');
    console.log(rows);
});

con.query(
    'UPDATE file_storage_item SET x = ?, y = ?, l = ?  WHERE name = ?',
    [5, 10, 15, '41dc366d-59b6-4068-9d95-2248f723a0af'],
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