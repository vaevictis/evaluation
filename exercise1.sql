-- Tables creation and populating
create table students(id integer, name varchar(20), address varchar(100));
insert into students values(1, 'sean', '21 jump street');
insert into students values(2, 'robb', 'Kitsilano');
insert into students values(3, 'paul', '34 mainstreet, downtown');
insert into students values(4, 'anna', 'grenoble');
insert into students values(5, 'nathaly', 'vancouver');
insert into students values(6, 'frank', 'ontario');

create table applications(id integer, student_id integer, score float);
insert into applications values(1, 2, 18.5);
insert into applications values(2, 2, 14.0);
insert into applications values(3, 3, 2.0);
insert into applications values(4, 3, 8.0);
insert into applications values(5, 5, 7.0);
insert into applications values(6, 6, 13.5);

-- Query
SELECT COUNT(id), name FROM (
  SELECT applications.id, students.name
    FROM students
    LEFT JOIN applications on students.id = applications.student_id)
  GROUP BY name
  ORDER BY count(id) DESC, name;

-- Expected output :
-- 2|paul
-- 2|robb
-- 1|frank
-- 1|nathaly
-- 0|anna
-- 0|sean