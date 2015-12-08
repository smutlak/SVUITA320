Create Database SRS;
use SRS;

create table sys_role
(sysrole_id int not null
,sysrole_name varchar(20) not null
,sysrole_desc varchar(100) null
,sysrole_category varchar(1) not null
)
go
alter table sys_role add constraint sys_role_pk primary key (sysrole_id)
go
create table sys_user
(sysuser_id int not null
,sysuser_name varchar(20) not null
,sysuser_password varchar(20) not null
,sysuser_isadmin varchar(1) not null
,sysuser_register_date datetime not null default getdate()
,sysuser_role_id int null
)
go
alter table sys_user add constraint sys_user_pk primary key (sysuser_id)
go
alter table sys_user add constraint sys_user_role_fk foreign key (sysuser_role_id) references sys_role (sysrole_id)
go
create table user_information
(info_sysuser_id int not null
,info_first_name varchar(20) not null
,info_father_name varchar(20) not null
,info_sure_name varchar(20) not null
,info_birth_date datetime not null
,info_id_no varchar(11) not null
,info_address varchar(100) not null
,info_phone_no varchar(20) null
)
go
alter table user_information add constraint user_information_pk primary key (info_sysuser_id)
go
alter table user_information add constraint user_information_user_fk foreign key (info_sysuser_id) references sys_user (sysuser_id)
go
create table estate_type
(estate_type_id int not null
,estate_type_name varchar(20) not null
,estate_type_desc varchar(100) null
)
go
alter table estate_type add constraint estate_type_pk primary key (estate_type_id)
go
create table user_application
(appl_id int not null
,appl_sysuser_id int not null
,appl_date datetime not null
,appl_estate_type_id int not null
,appl_estate_no varchar(20) not null
,appl_estate_address varchar(100) not null
,appl_assign_sysuser_id int null
,appl_assign_date datetime null
)
go
alter table user_application add constraint user_application_pk primary key (appl_id)
go
alter table user_application add constraint user_application_user_fk foreign key (appl_sysuser_id) references sys_user (sysuser_id)
go
alter table user_application add constraint user_application_estatetype_fk foreign key (appl_estate_type_id) references estate_type (estate_type_id)
go
alter table user_application add constraint user_application_assignuser_fk foreign key (appl_assign_sysuser_id) references sys_user (sysuser_id)
go
insert into sys_user values (1,'admin','admin','1', GETDATE(), null);


