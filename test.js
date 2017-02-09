var mysql = require("mysql");

// First you need to create a connection to the db
var con = mysql.createConnection({
    host: "10.254.254.254",
    user: "m3dev",
    password: "9847tn34q8",
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

con.query('SELECT id,name,x,y,l FROM file_storage_item WHERE name = \'d6d1a71d-e4da-491a-8ab3-8722d5d3d891\'',function(err,rows){
    if(err) throw err;

    console.log('Data received from Db:\n');
    console.log(rows);
});

con.query(
    'UPDATE file_storage_item SET x = ?, y = ?, l = ?  WHERE name = ?',
    [5, 10, 15, 'd6d1a71d-e4da-491a-8ab3-8722d5d3d891'],
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
