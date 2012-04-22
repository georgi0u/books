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
        "SELECT" +
        "  A.firstname AS author_firstname, " +
        "  A.lastname AS author_lastname, " +
        "  B.title AS book_title, " +
        "  D.desc_text " +
        "FROM " +
        "  Descriptions AS D, " + 
        "  Users AS U, " +
        "  Books AS B, " + 
        "  Authors AS A " +
        "WHERE U.id = D.user_id " +
        "AND B.id = D.book_id " +
        "AND A.id = B.author_id " +
        "AND U.username = '" + username + "'";

    var cmd = db.query(sql_query);
    
    res.writeHead(200, {'Content-Type': 'application/json'});
    var rows = [];
    res.write("[");
    cmd.addListener("row", function(r) {
        if(rows.length)
            res.write(JSON.stringify(rows.pop()) + ",");
        rows.push(r);
    });

    cmd.addListener("error", function(e) {
        console.log(e.message);
        res.write(e.message);
    });
        
    cmd.addListener("end", function(e) {
        if(rows.length)
            res.write(JSON.stringify(rows.pop()));
        res.write("]");
        res.end();
    });

};