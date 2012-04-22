var express = require('express');
var routes = require('./routes');

var app = module.exports = express.createServer();


// Configuration
app.configure(function(){
    app.set('views', __dirname + '/views');
    app.set('view engine', 'jade');
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(express.cookieParser());
    app.use(express.session({ secret: 'e09asduj9sdufh03iasjdelephant' }));
    app.use(app.router);
    app.use(express.static(__dirname + '/public'));
    // Jade Template Engine 
    app.set('view options', { layout: false });
});

app.configure('development', function(){
    app.use(express.errorHandler({ dumpExceptions: true, showStack: true }));
});

app.configure('production', function(){
    app.use(express.errorHandler());
});


// DB
db = require("mysql-native").createTCPClient();
db.auto_prepare = true;
db.auth("books", "georga5");


// Routes
app.get('/', routes.index);
app.get('/user_descriptions/', routes.getUserDescriptions);

// Start 'er up
app.listen(3000, function(){
  console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
});

