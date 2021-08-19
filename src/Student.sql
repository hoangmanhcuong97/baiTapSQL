create database managerStudent;
use managerStudent;
create table Address(
    id int primary key not null ,
    name_address nvarchar(50)
);
create table Classes(
    id_class int primary key not null ,
    name_class nvarchar(50),
    language nvarchar(50),
    description nvarchar(100)
);
create table Students(
    id_student int primary key not null ,
    fullname_student nvarchar(50),
    address_id int,
    foreign key (address_id) references Address(id),
    class_id int,
    foreign key (class_id) references Classes(id_class),
    phone int unique
);
create table Course(
    id_course int primary key not null ,
    name_course nvarchar(50),
    description_course nvarchar(100)
);
create table Point(
  id_point int primary key not null ,
  course_id int,
  foreign key (course_id) references Course(id_course),
  student_id int,
  foreign key (student_id) references Students(id_student),
  point float not null
);

insert into managerStudent.Address(id, name_address)
values (1, 'Hà Nội');
insert into managerStudent.Address(id, name_address)
values (2, 'Vĩnh Phúc');
insert into managerStudent.Address(id, name_address)
values (3, 'Bắc Ninh');
insert into managerStudent.Address(id, name_address)
values (4, 'Hà Nam');
insert into managerStudent.Address(id, name_address)
values (5, 'Bắc Giang');

insert into managerStudent.Classes(id_class, name_class, language, description)
values (1, 'class1', 'Java', 'Java FullTime');
insert into managerStudent.Classes(id_class, name_class, language, description)
values (2, 'class2', 'PHP', 'PHP FullTime');
insert into managerStudent.Classes(id_class, name_class, language, description)
values (3, 'class3', 'Ruby', 'Ruby FullTime');
insert into managerStudent.Classes(id_class, name_class, language, description)
values (4, 'class4', 'Python', 'Python FullTime');
insert into managerStudent.Classes(id_class, name_class, language, description)
values (5, 'class5', 'Java', 'Java PartTime');

insert into managerStudent.Students(id_student, fullname_student,address_id ,phone, class_id)
values (1, 'Nguyen Van A', 1, '098765432', 2);
insert into managerStudent.Students(id_student, fullname_student,address_id ,phone, class_id)
values (2, 'Nguyen Van B', 2, '098763455', 3);
insert into managerStudent.Students(id_student, fullname_student,address_id ,phone, class_id)
values (3, 'Nguyen Van C', 3, '098762344', 4);
insert into managerStudent.Students(id_student, fullname_student,address_id ,phone, class_id)
values (4, 'Nguyen Van D', 4, '098726266', 5);
insert into managerStudent.Students(id_student, fullname_student,address_id ,phone, class_id)
values (5, 'Nguyen Van E', 5, '098764574', 1);
insert into managerStudent.Students(id_student, fullname_student,address_id ,phone, class_id)
values (6, 'Nguyen Van F', 4, '098765756', 2);
insert into managerStudent.Students(id_student, fullname_student,address_id ,phone, class_id)
values (7, 'Nguyen Van G', 5, '098765439', 3);
insert into managerStudent.Students(id_student, fullname_student,address_id ,phone, class_id)
values (8, 'Nguyen Van H', 3, '098744566', 5);
insert into managerStudent.Students(id_student, fullname_student,address_id ,phone, class_id)
values (9, 'Nguyen Van I', 2, '098765423', 4);
insert into managerStudent.Students(id_student, fullname_student,address_id ,phone, class_id)
values (10, 'Nguyen Van K', 1, '098766457', 2);

insert into ManagerStudent.course(id_course, name_course, description_course)
values (1, 'Java FullTime', 'desc 1');
insert into ManagerStudent.course(id_course, name_course, description_course)
values (2, 'PHP FullTime', 'desc 2');
insert into ManagerStudent.course(id_course, name_course, description_course)
values (3, 'Ruby FullTime', 'desc 3');
insert into ManagerStudent.course(id_course, name_course, description_course)
values (4, 'Python FullTime', 'desc 4');
insert into ManagerStudent.course(id_course, name_course, description_course)
values (5, 'Java PartTime', 'desc 5');

insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (1, 1, 1, 5);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (2, 2, 3, 6);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (3, 3, 4, 7);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (4, 4, 5, 8);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (5, 5, 6, 9);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (6, 4, 7, 10);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (7, 3, 8, 9);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (8, 2, 9, 8);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (9, 1, 10, 7);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (10, 2, 10, 6);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (11, 3, 3, 5);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (12, 4, 5, 6);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (13, 5, 6, 7);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (14, 2, 7, 8);
insert into ManagerStudent.point(id_point, course_id, student_id, point)
values (15, 3, 1, 9);

# Thống kê số lượng học viên các lớp
select name_class, count(name_class) from Classes
join Students S on Classes.id_class = S.class_id group by name_class;

# Thống kê số lượng học viên các tỉnh
select name_address, count(name_address) from Address
join Students S on Address.id = S.address_id group by name_address;

# Tính điểm trung bình các khóa học
select name_course, avg(point) from Point
join Course c on Point.course_id = c.id_course group by name_course;

# Đưa ra khóa học có điểm trung bình cao nhất
select name_course, avg(point) avg_point from Point
join Course C on C.id_course = Point.course_id group by name_course
having avg_point >= ALL (select avg(point) from Point join Course c on Point.course_id = c.id_course group by name_course);