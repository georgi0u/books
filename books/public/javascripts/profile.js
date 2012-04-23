handleUserDescriptions = function(data) {
    $.each(data, function(index, row) {
        var books_ul = $("ul#books");
        
        if(!books_ul.length)
            throw "Can't find `<ul id=books>...` element";
        
        var _li = $("<li class = 'book_desc'></li>").attr("id", row.desc_id);
        var _time = $("<time></time>").attr("datetime", row.datetime_modified);
        var _booktitle = $("<span class = 'book_title'></span>").append(row.book_title);        
        var _by_author = $("<span class = 'book_author'></span>");
        _by_author.append(" by " + row.author_firstname + " " + row.author_lastname);
        
        var _link = $("<a></a>").attr('href', '/u/' + user + '/' + row.desc_id);
        var _title = $("<h2></h2>");
        _title.append(_booktitle);
        _title.append(_by_author);

        var _desc = $("<article class = 'description'></article>")
        _desc.append(row.desc_text)

        _li.append(_title)
        _li.append(_time);;
        _li.append(_desc);

        books_ul.append(_li);
    });
}

$(function() {   
    // Fetch initial set of my books (aka descriptions)   
    $.getJSON("/user_descriptions/", 
              {"username":user}, 
              handleUserDescriptions);
});





