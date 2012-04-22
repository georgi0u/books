exports.index = function(req, res){
    res.render('index', { title: 'Express' });
};

exports.getUserDescriptions = function(req, res) {    
    var username = req.query['username'];
    if(!username) {
        res.writeHead(400);
        res.end();
        return;
    }
    
    var sql_query =
        "SELECT * FROM Descriptions as D, Users as U\
         WHERE D.user_id = U.id\
         AND U.username = '" + username + "'";

    var cmd = db.query(sql_query);
    
    res.writeHead(200, {'Content-Type': 'text/plain'});
    cmd.addListener("row", function(r) {
        var row_str = JSON.stringify(r);
        res.write(row_str);
    });
        
    cmd.addListener("end", function(e) {
        res.end();
    });
};