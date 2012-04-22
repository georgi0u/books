var HARDCODED_USER = "user_4";

handleUserDescriptions = function(data) {
    console.log(data);
    $.each(data, function(index, row) {
        var books_ul = $("ul#books");
        
        if(!books_ul.length)
            throw "Can't find `<ul id=books>...` element";
        
        function buildBookLI(title, desc) {
            var li = $("<li id='book'></li>");
            var h1 = $("<h1></h1>");
            var p = $("<p class='description'></p>");
            li.append(title);
            p.append(desc);
            li.append(h1);
            li.append(p);
            
            return li;
        }
        
        var li = buildBookLI(row.book_title, row.desc_text)
        books_ul.append(li);
    });
}

$(function() {   
    // Fetch initial set of my books (aka descriptions)   
    $.getJSON("/user_descriptions/", 
              {"username":HARDCODED_USER}, 
              handleUserDescriptions);
});





