function getDescFromID(username, id) {
    var sql_query =
        "SELECT" +
        "  A.firstname AS author_firstname, " +
        "  A.lastname AS author_lastname, " +
        "  B.title AS book_title, " +
        "  D.desc_text, " +
        "  D.datetime_modified, " +
        "  D.id AS desc_id " +
        "FROM " +
        "  Descriptions AS D, " + 
        "  Users AS U, " +
        "  Books AS B, " + 
        "  Authors AS A " +
        "WHERE U.id = D.user_id " +
        "AND B.id = D.book_id " +
        "AND A.id = B.author_id " +
        "AND U.username = '" + username + "' " + 
        "AND D.id = " + id + ";";
    
    return db.query(sql_query);
}

function getDescsFromUsername(username) {
    var sql_query =
        "SELECT" +
        "  A.firstname AS author_firstname, " +
        "  A.lastname AS author_lastname, " +
        "  B.title AS book_title, " +
        "  D.desc_text, " +
        "  D.datetime_modified, " +
        "  D.id AS desc_id " +
        "FROM " +
        "  Descriptions AS D, " + 
        "  Users AS U, " +
        "  Books AS B, " + 
        "  Authors AS A " +
        "WHERE U.id = D.user_id " +
        "AND B.id = D.book_id " +
        "AND A.id = B.author_id " +
        "AND U.username = '" + username + "'" + 
        "ORDER BY D.datetime_modified;";
    
    return db.query(sql_query);
}


exports.index = function(req, res) {
    res.render('index',{title:"Book Profile"});
}

exports.profile = function(req, res){
    var username = req.params[0];
    
    var sql_query = 
        "SELECT COUNT(id) FROM Users WHERE username = '" +
        username + "';";
    
    var cmd = db.query(sql_query);
    var user_exists = false;
    cmd.addListener("row", function(r) {
        var user_count = r["COUNT(id)"];
        switch(user_count) {
        case 0:
            user_exists = false;
            break;
        case 1:
            user_exists = true;
            break
        default:
            throw "Database Constraint Failed! '" +
                user_count + "' number of ussers named: '" + username + "'";
        }
    });
    
    cmd.addListener("end", function(e) {
        if(!user_exists) {
            res.render('404', {title: "404"});
            return;
        }
        
        res.render('profile', { 
            title: username + "'s book profile",
            user: username
        });
    });
}

exports.specificDescription = function(req, res){
    var username = req.params[0];
    var description_id = req.params[1];
    
    var cmd = getDescFromID(username, description_id);
    cmd.addListener("row", function(r) {
        
    });
    
    cmd.addListener("end", function(e) {
        res.render('specific', { 
            title: username + "'s book profile",
            user: username
        });
    });
}


exports.getUserDescriptions = function(req, res) {    
    var username = req.query['username'];
    if(!username) {
        res.writeHead(400);
        res.end();
        return;
    }
    
    var cmd = getDescsFromUsername(username);

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