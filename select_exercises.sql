use codeup_test_db;

SELECT 'Pink Floyd' AS 'All albums from:';

SELECT name
FROM albums
WHERE artist = 'Pink Floyd';

SELECT 'Sgt. Pepper''s Lonely Hearts Club Band' AS 'Year Released:';
SELECT release_date
FROM albums
WHERE name = 'Sgt.Peppers Lonely Hearts Club Band';

SELECT 'Nevermind' AS 'Genre of:';
SELECT genre
FROM albums
WHERE name = 'Nevermind';

SELECT '1990''s' AS 'Albums released in the:';
SELECT *
FROM albums
WHERE release_date >= 1990 AND release_date < 2000;

SELECT 'Less than 20 million sales' AS 'Albums:';
SELECT *
FROM albums
WHERE sales < 20;

SELECT 'Rock' AS 'All with genre of:';
SELECT *
FROM albums
WHERE genre = 'Rock';
