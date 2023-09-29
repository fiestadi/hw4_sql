-- 1) Создайте таблицу staff (
-- id целое число, 
-- name, строка
-- surname, строка
-- age, целое число
-- position - строка
-- neponiatno v kakoj iz databaz sozdavat tablicu staff( sozdavala v learn)
use learn;
CREATE TABLE staff (
    id INT,
    name VARCHAR(64),
    surname VARCHAR(64),
    age INT,
    position VARCHAR(64)
    );
  --   2) Заполните таблицу значениями из 10 строк по примеру :

-- 1,'Alex','Alexeev',24,'worker'
-- 2,'Oleg','Olegov',36,'administration'
-- ……..
-- и так далее.
-- В качестве возможных значений в поле position используйте worker,administration, security
INSERT INTO staff (id, name, surname, age, position)
VALUES
    (1, 'Alex', 'Alexeev', 24, 'worker'),
    (2, 'Oleg', 'Olegov', 36, 'administration'),
    (3, 'Diana', 'Smirnova', 29, 'administration'),
    (4, 'Adela', 'Novakova', 31, 'worker'),
    (5, 'Honza', 'Bartak', 41, 'security'),
    (6, 'Milada', 'Kralova', 21, 'worker'),
    (7, 'Hana', 'Vacikova', 46, 'worker'),
    (8, 'Adam', 'Kotoun', 34, 'worker'),
    (9, 'Silvie', 'Parkova', 30, 'worker'),
    (10, 'Elena', 'Elenova', 29, 'security');
SELECT * 
FROM staff;

-- 3) Добавьте в уже готовую и заполненную таблицу поле salary - целое число.
ALTER TABLE staff 
ADD COLUMN salary INT;

-- 4) Проставьте значение поля salary следующим образом :
-- если сотрудник категории worker - 1000
-- если сотрудник категории administration - 5000
-- если сотрудник категории security - 2000
SET SQL_SAFE_UPDATES = 0; --  prishlos prinuditilno vstavit v tablicu inache postojanno pokazivalo oshibku((
UPDATE staff
SET salary = CASE
    WHEN position = 'worker' THEN 1000
    WHEN position = 'administration' THEN 5000
    WHEN position = 'security' THEN 2000
END;
SELECT * 
FROM staff;

-- 5) Увеличьте всем сотрудникам зарплату в два раза.

UPDATE staff
SET salary = salary * 2;
SELECT 
salary
FROM staff;

-- 6) Удалите из таблицы сотрудников, чей возраст больше чем 45.

DELETE FROM staff
WHERE age > 45;
SELECT 
age
FROM staff;

-- 7) Создайте три представления : первое - хранит только сотрудников типа worker, второй - security,
-- третье administration

CREATE VIEW worker_view AS
SELECT * 
FROM staff 
WHERE position = 'worker';
SELECT * 
FROM worker_view;

-- security
CREATE VIEW security_view AS
SELECT * 
FROM staff 
WHERE position = 'security';
SELECT * 
FROM security_view;

-- administration
CREATE VIEW administration_view AS
SELECT * 
FROM staff 
WHERE position = 'administration';
SELECT * 
FROM administration_view;

-- 8) Создайте новую таблицу на основе выборки из таблицы staff , которая будет хранить только name,surname,position
-- сотрудников , которые относятся к administration

CREATE TABLE administration_table AS
SELECT 
name,
surname, 
position
FROM staff
WHERE position = 'administration';
SELECT * 
FROM administration_table;

-- 9) Удалите колонку position из новой таблицы.
ALTER TABLE administration_table
DROP COLUMN position;
SELECT * 
FROM administration_table;










