-- MYSQL --
mysql -h localhost -u root -proot test

create database role_management_db;

use role_management_db;

select database();

select user();

show tables;

drop table if exists user_modules_rights_tbl;
drop table if exists modules_hierarchy_tbl;
drop table if exists user_groups_tbl;
drop table if exists rights_tbl;
drop table if exists modules_tbl;
drop table if exists users_tbl;

create table rights_tbl (
    rights_id integer(3) auto_increment,
    rights_text varchar(10) not null unique,
    rights_deleted tinyint(1) not null,
    primary key(rights_id)
);

create table modules_tbl (
    modules_id integer(5) auto_increment,
    modules_text varchar(20) not null unique,
    modules_deleted tinyint(1) not null,
    primary key(modules_id)
);

create table modules_hierarchy_tbl (
    modules_parent_id integer(5) not null,
    modules_child_id integer(5) not null,
    foreign key (modules_parent_id)
        references modules_tbl(modules_id),
    foreign key (modules_child_id)
        references modules_tbl( modules_id),
    primary key(modules_parent_id, modules_child_id)
);

create table users_tbl (
    users_id integer(10) auto_increment,
    users_name varchar(20) not null unique,
    users_fname varchar(20) not null,
    users_lname varchar(20) not null,
    users_paswd varchar(20) not null,
    users_deleted tinyint(1) not null,
    primary key(users_id)
);

create table user_groups_tbl (
    user_groups_id integer(5) auto_increment,
    users_text varchar(20) not null unique,
    users_deleted tinyint(1) not null,
    primary key(user_groups_id)
);

create table user_modules_rights_tbl (
    user_rights_user_groups_id integer(5) not null,
    user_rights_modules_id integer(5) not null,
    user_rights_rights_id integer(3) not null,
    foreign key (user_rights_user_groups_id)
        references user_groups_tbl (user_groups_id),
    foreign key (user_rights_modules_id)
        references modules_tbl(modules_id),
    foreign key (user_rights_rights_id)
        references rights_tbl(rights_id),
    primary key(user_rights_user_groups_id, user_rights_modules_id,
        user_rights_rights_id)
);

desc modules_hierarchy_tbl;
desc modules_tbl;
desc rights_tbl;
desc user_groups_tbl;
desc user_modules_rights_tbl;
desc users_tbl;

-- HSQLDB --
drop table if exists user_modules_rights_tbl
drop table if exists modules_hierarchy_tbl
drop table if exists user_groups_tbl
drop table if exists rights_tbl
drop table if exists modules_tbl
drop table if exists users_tbl

create table rights_tbl (
    rights_id identity,
    rights_text varchar(20) not null unique,
    rights_deleted tinyint not null
)

create table modules_tbl (
    modules_id identity,
    modules_text varchar(20) not null unique,
    modules_deleted tinyint not null
)

create table modules_hierarchy_tbl (
    modules_parent_id integer not null,
	modules_child_id integer not null,
	foreign key (modules_parent_id)
	    references modules_tbl(modules_id),
	foreign key (modules_child_id)
	    references modules_tbl( modules_id),
	primary key(modules_parent_id, modules_child_id)
)

create table users_tbl (
    users_id identity,
    users_name varchar(20) not null unique,
	users_fname varchar(20) not null,
	users_lname varchar(20) not null,
	users_paswd varchar(20) not null,
    users_deleted tinyint not null
)

create table user_groups_tbl (
    user_groups_id identity,
    users_text varchar(20) not null unique,
    users_deleted tinyint not null
)

create table user_modules_rights_tbl (
    user_rights_user_groups_id integer not null,
	user_rights_modules_id integer not null,
	user_rights_rights_id integer not null,
	foreign key (user_rights_user_groups_id)
	    references user_groups_tbl (user_groups_id),
	foreign key (user_rights_modules_id)
	    references modules_tbl(modules_id),
	foreign key (user_rights_rights_id)
	    references rights_tbl(rights_id),
	primary key(user_rights_user_groups_id, user_rights_modules_id,user_rights_rights_id)
)

