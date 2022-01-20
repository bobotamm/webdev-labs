-- Exercise 1 (done for you):
SELECT * FROM users;



-- Exercise 2 (done for you):
SELECT id, first_name, last_name 
FROM users;



-- Exercise 3
select id, first_name, last_name FROM users ORDER BY last_name;



-- Exercise 4
SELECT id, image_url, user_id FROM posts WHERE user_id = 26;



-- Exercise 5
SELECT id, image_url, user_id FROM posts WHERE user_id = 26 or user_id = 12;



-- Exercise 6
SELECT count(*) FROM posts;



-- Exercise 7
SELECT user_id, count(*) FROM comments GROUP BY user_id ORDER BY count(*) desc;



-- Exercise 8
SELECT posts.id, posts.image_url, posts.user_id, users.username, users.first_name, users.last_name
FROM posts
INNER JOIN users on users.id = posts.user_id
WHERE posts.user_id = 26 or posts.user_id = 12;



-- Exercise 9
SELECT posts.id, posts.pub_date, following.following_id FROM posts
INNER JOIN following ON following.following_id = posts.user_id
WHERE following.user_id = 26;



-- Exercise 10
SELECT posts.id, posts.pub_date, following.following_id, users.username FROM
posts
INNER JOIN following ON following.following_id = posts.user_id
INNER JOIN users ON following.following_id = users.id
WHERE following.user_id = 26
ORDER BY posts.pub_date DESC ;



-- Exercise 11
INSERT INTO bookmarks (user_id, post_id) VALUES (26,219);
INSERT INTO bookmarks (user_id, post_id) VALUES (26,220);
INSERT INTO bookmarks (user_id, post_id) VALUES (26,221);



-- Exercise 12
DELETE FROM bookmarks WHERE user_id=26 AND post_id=219;
DELETE FROM bookmarks WHERE user_id=26 AND post_id=220;
DELETE FROM bookmarks WHERE user_id=26 AND post_id=221;



-- Exercise 13
UPDATE users SET email='cyoung2022@gmail.com' WHERE id=26;



-- Exercise 14
SELECT posts.id, posts.user_id, count(comments.id), concat(substring(posts.caption, 0, 50), '...')
FROm posts
INNER JOIN comments on posts.id= comments.post_id
WHERE posts.user_id = 26
GROUP BY posts.id, posts.user_id, posts.caption
ORDER BY count(comments.id) desc;