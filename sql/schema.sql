drop table if exists Descriptions;
drop table if exists Books;
drop table if exists Authors;
drop table if exists Users;


create table Users(
       id         MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
       username   VARCHAR(64) NOT NULL UNIQUE,
       email      VARCHAR(64) NOT NULL UNIQUE,       

       PRIMARY KEY(id),
       KEY(username),
       KEY(email)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table Authors(
       id               MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
       firstname        VARCHAR(64) NOT NULL,
       lastname         VARCHAR(64) NOT NULL,
       
       PRIMARY KEY(id),
       KEY first_and_last_name(firstname, lastname)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Books(
       id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
       author_id MEDIUMINT UNSIGNED NOT NULL,
       title VARCHAR(2048) NOT NULL,
       /*consider a title hash and then unique on title nad author*/
       isbn FIXED(13,0) NOT NULL UNIQUE,
       image_url VARCHAR(2083) NOT NULL DEFAULT '',
   
       PRIMARY KEY(id),
       KEY(isbn),
       FOREIGN KEY(author_id) REFERENCES Authors(id)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Descriptions(
       id                MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
       user_id           MEDIUMINT UNSIGNED NOT NULL,
       book_id           MEDIUMINT UNSIGNED NOT NULL,
       desc_text         TEXT NOT NULL DEFAULT '',
       image_url         VARCHAR(2083) NOT NULL DEFAULT '',
       datetime_modified TIMESTAMP NOT NULL,
   
       PRIMARY KEY(id),
       KEY users_book_desc(user_id, book_id),
       FOREIGN KEY(user_id) REFERENCES Users(id) ON DELETE CASCADE,
       FOREIGN KEY(book_id) REFERENCES Books(id) ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;