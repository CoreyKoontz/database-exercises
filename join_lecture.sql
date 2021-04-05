use join_test_db;

INSERT INTO users (name, email, role_id) VALUES
('tim', 'tim@example.com', 2),
('sam', 'sam@example.com', 2),
('jill', 'jill@example.com', 2),
('nick', 'nick@example.com', null);

select users.name, roles.name from users
join roles on roles.id = users.role_id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

SELECT r.name, count(u.role_id)