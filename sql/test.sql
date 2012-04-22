TRUNCATE TABLE Descriptions;
TRUNCATE TABLE Books;
TRUNCATE TABLE Users;
TRUNCATE TABLE Authors;

INSERT INTO Users (username, email)
VALUES 
("user_1", "user1@example.com"),
("user_2", "user2@example.com"),
("user_3", "user3@example.com"),
("user_4", "user4@example.com"),
("user_5", "user5@example.com"),
("user_6", "user6@example.com"),
("user_7", "user7@example.com");


INSERT INTO Authors(firstname, lastname)
VALUES
("Bob","Jones"),
("Jim","Jones"),
("Bob","Smith"),
("Alexandar","Ebert"),
("Jade", "Jones"),
("Adam", "Obama");


INSERT INTO Books(author_id, title, isbn) 
VALUES
((SELECT id FROM Authors WHERE firstname = "Bob" AND lastname = "Jones"), "Title 1", 1234567891234),
((SELECT id FROM Authors WHERE firstname = "Jim" AND lastname = "Jones"), "Title 2", 2234567891234),
((SELECT id FROM Authors WHERE firstname = "Bob" AND lastname = "Jones"), "Title 3", 3234567891234),
((SELECT id FROM Authors WHERE firstname = "Bob" AND lastname = "Smith"), "Title 4", 4234567891234),
((SELECT id FROM Authors WHERE firstname = "Alexandar" AND lastname = "Ebert"), "Title 5", 5234567891234),
((SELECT id FROM Authors WHERE firstname = "Jade" AND lastname = "Jones"), "Title 6", 6234567891234),
((SELECT id FROM Authors WHERE firstname = "Adam" AND lastname = "Obama"), "Title 7", 7234567891234);



INSERT INTO Descriptions(user_id, book_id, desc_text)
VALUES
(
    (SELECT id FROM Users WHERE username = "user_1"),
    (SELECT id FROM Books WHERE title = "Title 1"),
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin elit tortor, hendrerit id imperdiet rhoncus, luctus eu arcu. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer in placerat velit. Fusce sed purus vitae turpis gravida gravida non at ante. Morbi eu tellus laoreet nibh fringilla vehicula. Nullam sodales pellentesque sapien, nec adipiscing quam aliquam a. Nunc eget magna turpis.

Sed adipiscing, orci id pharetra interdum, nibh tortor hendrerit turpis, ut porta arcu metus nec justo. Sed a arcu eu velit auctor aliquam nec sit amet tortor. Ut molestie, libero in adipiscing egestas, ligula odio tincidunt odio, a gravida nulla neque sed nibh. Vivamus risus massa, aliquet eget accumsan sed, rutrum vitae elit. Phasellus mattis elit vel nulla consectetur rutrum. Fusce iaculis lectus eget ipsum varius convallis. Fusce pretium vulputate est ut mollis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam erat volutpat. Ut in orci enim, ac mattis diam. Pellentesque nisl ante, dignissim sit amet blandit sed, vulputate in nibh. Integer eget elit turpis, eget egestas velit. Mauris faucibus aliquam scelerisque. Vivamus elementum quam et tortor pellentesque sagittis.

Aenean nec magna elit, non sodales nisi. Duis non nulla vitae risus fringilla egestas ut vel quam. Mauris quis elit quis lacus elementum ullamcorper sit amet in metus. Aliquam erat volutpat. Nulla malesuada molestie ligula, at pulvinar magna volutpat eget. Nam a nisl risus. Mauris sit amet metus quis elit semper ultricies. Curabitur nec vestibulum sapien. Aenean ut orci ligula, eget semper nisl. Suspendisse et diam neque, ac adipiscing libero. Morbi ac enim at mi pretium condimentum.

Pellentesque ut blandit dui. Aenean pellentesque auctor tellus vitae sollicitudin. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed aliquet condimentum scelerisque. Integer in enim vitae massa accumsan pellentesque non a dolor. Cras nisi justo, volutpat quis gravida malesuada, sagittis et nulla. Phasellus pretium facilisis auctor. Aenean et diam ante, vitae facilisis odio. Integer elementum vulputate arcu, a egestas enim posuere sit amet. Nullam metus felis, congue eget mattis in, tristique eget eros.

Donec porttitor rhoncus cursus. Etiam tincidunt massa a metus rhoncus dapibus. Donec nec lectus neque. Etiam nec ipsum et nulla malesuada sodales. Praesent magna magna, pulvinar quis suscipit eget, venenatis non tellus. Fusce mattis, velit at egestas porttitor, dui lectus convallis risus, in sollicitudin tortor diam eget nulla. Sed sapien elit, gravida ac vulputate nec, condimentum sit amet purus. Pellentesque volutpat metus eget nibh ultricies sollicitudin. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum et enim risus. In non massa sem. Integer non orci lacinia justo ullamcorper dapibus. Ut eu ornare felis. Nulla ut metus risus.'
),
(
    (SELECT id FROM Users WHERE username = "user_2"),
    (SELECT id FROM Books WHERE title = "Title 3"),
    'Donec iaculis pharetra enim, vel hendrerit tortor rhoncus sed. Phasellus tempus euismod nunc, id lobortis enim rutrum eget. Etiam a ante vitae nunc ultricies fermentum. Proin pellentesque malesuada orci, at tincidunt diam commodo ut. Aliquam consequat nisi lacinia mauris aliquet quis dignissim nulla ornare. Nulla condimentum ante ut magna laoreet eu rhoncus libero imperdiet. Nulla adipiscing lacus semper lorem venenatis lacinia. Etiam non tellus nec turpis condimentum elementum. Donec pretium turpis vitae est fringilla vulputate et eu odio. Morbi vitae ornare lacus. Maecenas luctus, neque sed condimentum venenatis, massa ipsum condimentum mi, sed auctor tellus lectus eget leo. Morbi facilisis, elit sit amet tristique aliquet, tellus quam lobortis nibh, nec vestibulum libero augue vitae dolor. Maecenas volutpat volutpat odio a iaculis. Cras non nulla velit, in tempus nulla. Integer non elit enim. Phasellus nec luctus dolor.

Aliquam nec purus sed tellus rhoncus rutrum at venenatis massa. Aenean ac sagittis sem. Etiam nec orci magna. Proin ut lacus nulla, ut congue tellus. Sed interdum urna non lorem vestibulum lobortis. In lacus dui, consequat sed ornare id, dapibus fringilla diam. Aliquam eu magna sit amet lectus tincidunt semper. Phasellus orci justo, fringilla hendrerit volutpat in, volutpat id velit. Aliquam tempus pulvinar est, ut malesuada diam aliquet a. Nullam sit amet augue eget nulla rutrum blandit. Fusce et est ut nulla lacinia congue ac id urna.

Nam interdum nunc sem. Mauris metus velit, dignissim quis pretium id, vehicula nec nulla. Aenean libero risus, venenatis scelerisque iaculis tristique, commodo id purus. Sed hendrerit feugiat euismod. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer non scelerisque mauris. Quisque vulputate blandit metus, sit amet commodo orci porta eu. Morbi consequat augue laoreet dui dictum non scelerisque orci lacinia. Quisque mollis rutrum auctor.

Aenean in placerat turpis. Integer non risus pretium diam molestie aliquet. Nunc risus ligula, consectetur sed gravida ac, fringilla eget augue. Morbi sit amet neque dolor. Pellentesque rhoncus, nibh eget imperdiet eleifend, tortor turpis dictum nulla, euismod pulvinar tellus purus vel est. Duis at aliquam tellus. Aliquam erat volutpat. Cras ullamcorper ultrices consectetur. Aenean ut enim sit amet risus dignissim posuere eget eu lacus. Suspendisse potenti. Nulla eleifend libero quis est commodo in posuere elit sollicitudin.

Vestibulum eu dapibus velit. Sed lacus dolor, imperdiet euismod dignissim sit amet, aliquet sed augue. Nam ullamcorper semper dapibus. Aliquam volutpat pretium enim vitae convallis. Praesent porta, nibh quis pellentesque volutpat, nisi erat aliquet magna, quis aliquet arcu sem a diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam eu mauris vitae urna malesuada iaculis. Pellentesque pellentesque placerat ipsum, quis porttitor nisl tristique posuere. Etiam interdum velit nec magna semper dignissim. In hac habitasse platea dictumst. Quisque viverra fringilla nisi, sit amet laoreet magna pulvinar eget.

Aliquam id lectus et magna ultricies facilisis quis volutpat nunc. Proin egestas ornare magna. Nulla lorem nisi, sodales cursus consectetur suscipit, pharetra et neque. Fusce ac nulla vitae metus mattis tempor. Phasellus et sem tellus, rutrum aliquam elit. Aliquam in pharetra magna. Maecenas quam sapien, ornare vel vulputate eu, imperdiet posuere enim. Suspendisse molestie orci vitae dolor laoreet vulputate posuere nisl auctor. Donec ut urna et diam vehicula posuere bibendum dapibus turpis. Aliquam erat volutpat. Nullam ut turpis augue. Ut aliquam euismod justo, in fermentum magna aliquet ac. Nulla posuere dapibus turpis, non blandit sapien ornare ac. Suspendisse sed ipsum odio. Sed sagittis, enim nec dictum iaculis, leo purus cursus magna, et fermentum tellus justo vel est. In vitae quam eu tortor commodo elementum.'
),
(
    (SELECT id FROM Users WHERE username = "user_4"),
    (SELECT id FROM Books WHERE title = "Title 2"),
    'Pellentesque lacinia elementum arcu, nec luctus ante fringilla in. Cras quis nulla iaculis est tempor feugiat blandit sed purus. Quisque ut enim nec lacus semper eleifend et ut augue. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc dignissim dui non eros egestas sed faucibus sem lacinia. Aliquam diam eros, ultrices sed tincidunt placerat, consectetur non ante. Nunc egestas, ipsum hendrerit tempus egestas, velit orci aliquam lectus, non porta nibh enim nec felis. Aliquam ullamcorper ligula at urna dapibus in fringilla dolor laoreet. Pellentesque pharetra, turpis vitae venenatis ullamcorper, augue turpis ultrices arcu, ut mattis urna augue sit amet ipsum. Donec bibendum, massa tristique adipiscing mollis, augue turpis aliquet lacus, non consequat libero turpis at neque. Mauris semper urna non sapien sodales cursus. Praesent bibendum bibendum nisl, eget pellentesque mauris accumsan tristique.

In ut velit purus, quis rhoncus nunc. Mauris imperdiet mi id dolor suscipit quis commodo tortor adipiscing. Cras ac eros est, eu aliquet neque. Pellentesque vel purus in dui hendrerit aliquet ut sit amet magna. Nunc et dui accumsan erat fringilla ultricies id ac dolor. Fusce fermentum tincidunt nunc, ac sollicitudin massa lacinia vel. In sed metus quam, non molestie eros. Nulla lectus dolor, elementum sit amet luctus eget, feugiat porta elit. Etiam tincidunt mollis felis, eu lacinia risus volutpat sit amet. Duis cursus velit eget purus bibendum sed iaculis diam hendrerit. Sed eget sem nisl. Nulla sagittis, nisl nec faucibus aliquam, risus dolor cursus metus, a venenatis nisi orci non nunc. Morbi urna neque, porta ac iaculis sed, euismod in mi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce in massa ligula, nec eleifend erat. In in malesuada enim.

Donec tincidunt fringilla tempor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean quis accumsan augue. Etiam sit amet convallis sem. Nullam facilisis, nunc sed tincidunt viverra, est nulla ornare nisi, nec luctus orci sem id eros. Nulla adipiscing, enim ac malesuada tincidunt, sem massa viverra ante, in rhoncus orci elit a dui. Etiam risus est, dignissim ac laoreet gravida, tincidunt in ante.'
),
(
    (SELECT id FROM Users WHERE username = "user_4"),
    (SELECT id FROM Books WHERE title = "Title 3"),
    'In ut velit purus, quis rhoncus nunc. Mauris imperdiet mi id dolor suscipit quis commodo tortor adipiscing. Cras ac eros est, eu aliquet neque. Pellentesque vel purus in dui hendrerit aliquet ut sit amet magna. Nunc et dui accumsan erat fringilla ultricies id ac dolor. Fusce fermentum tincidunt nunc, ac sollicitudin massa lacinia vel. In sed metus quam, non molestie eros. Nulla lectus dolor, elementum sit amet luctus eget, feugiat porta elit. Etiam tincidunt mollis felis, eu lacinia risus volutpat sit amet. Duis cursus velit eget purus bibendum sed iaculis diam hendrerit. Sed eget sem nisl. Nulla sagittis, nisl nec faucibus aliquam, risus dolor cursus metus, a venenatis nisi orci non nunc. Morbi urna neque, porta ac iaculis sed, euismod in mi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce in massa ligula, nec eleifend erat. In in malesuada enim.

Donec tincidunt fringilla tempor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean quis accumsan augue. Etiam sit amet convallis sem. Nullam facilisis, nunc sed tincidunt viverra, est nulla ornare nisi, nec luctus orci sem id eros. Nulla adipiscing, enim ac malesuada tincidunt, sem massa viverra ante, in rhoncus orci elit a dui. Etiam risus est, dignissim ac laoreet gravida, tincidunt in ante.'
),
(
    (SELECT id FROM Users WHERE username = "user_4"),
    (SELECT id FROM Books WHERE title = "Title 6"),
    'In ut velit purus, quis rhoncus nunc. Mauris imperdiet mi id dolor suscipit quis commodo tortor adipiscing. Cras ac eros est, eu aliquet neque. Pellentesque vel purus in dui hendrerit aliquet ut sit amet magna. Nunc et dui accumsan erat fringilla ultricies id ac dolor. Fusce fermentum tincidunt nunc, ac sollicitudin massa lacinia vel. In sed metus quam, non molestie eros. Nulla lectus dolor, elementum sit amet luctus eget, feugiat porta elit. Etiam tincidunt mollis felis, eu lacinia risus volutpat sit amet. Duis cursus velit eget purus bibendum sed iaculis diam hendrerit. Sed eget sem nisl. Nulla sagittis, nisl nec faucibus aliquam, risus dolor cursus metus, a venenatis nisi orci non nunc. Morbi urna neque, porta ac iaculis sed, euismod in mi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce in massa ligula, nec eleifend erat. In in malesuada enim.

Donec tincidunt fringilla tempor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Aenean quis accumsan augue. Etiam sit amet convallis sem. Nullam facilisis, nunc sed tincidunt viverra, est nulla ornare nisi, nec luctus orci sem id eros. Nulla adipiscing, enim ac malesuada tincidunt, sem massa viverra ante, in rhoncus orci elit a dui. Etiam risus est, dignissim ac laoreet gravida, tincidunt in ante.'
);