create table Person.users
(
	u_id int primary key,
	u_fullName  nvarchar(40),
	username nvarchar(20) unique not null,
	u_pass nvarchar(10)not null,
	status bit default 0,
	u_type nvarchar(10) not null
)
 
create table Person.T_manger
(
M_id int identity primary key,
M_Fname nvarchar(20) not null,
M_Lname nvarchar(40) not null,
M_phone nvarchar(11) not null,
M_adress nvarchar(30),
M_start_date date,
M_u_id int ,
 constraint M_FK1 foreign key(M_u_id)references Person.users(u_id)
)
create table Person.instructor
(
	ins_id int identity primary key,
	ins_Fname nvarchar(20) not null,
	ins_Lname nvarchar(40) not null,
	ins_phone nvarchar(11) not null,
	ins_adress nvarchar(30),
	ins_start_date date,
	ins_u_id int ,
	constraint ins_FK1 foreign key(ins_u_id)references Person.users(u_id)
)
alter table Person.instructor
add constraint ins_FK2 foreign key(ins_b_id)references Tracks.branch(b_id)
create table Tracks.department
(
	d_id int identity primary key,
	d_name nvarchar(40)not null,
	d_cheif int ,
	constraint d_FK1 foreign key(d_cheif)references Person.instructor(ins_id)
)
create table Tracks.track
(
	track_id int identity primary key,
	track_name nvarchar(40)not null,
	track_su_id int,
	dept_id int,
	constraint T_FK1 foreign key (track_su_id) references Person.instructor(ins_id) ,
	constraint T_FK2 foreign key(dept_id) references Tracks.department(d_id)
)
create table Tracks.branch
(
	b_id int primary key identity,
	b_name nvarchar(20)not null,
	b_location nvarchar(20)not null,
	b_manger_id int,
	constraint b_FK1 foreign key (b_manger_id)references Person.instructor(ins_id) 
)
create table Person.br_instrucor
(
	b_ins_id int primary  key identity,
	b_id int,
	ins_id int,
	constraint br_insCon unique (b_id,ins_id),
	constraint b_insFK1 foreign key(b_id)references Tracks.branch(b_id),
	constraint b_insFK2 foreign key(ins_id)references Person.instructor(ins_id),
)
create table Tracks.br_tracks
(
	b_t_id int primary key identity,
	br_id int,
	t_id int,
	su_id int,
	constraint con1 unique(br_id,t_id),
	constraint fk1 foreign key (br_id) references Tracks.branch(b_id), 
	constraint fk2 foreign key (t_id) references Tracks.track(track_id) ,
	constraint fk3 foreign key (su_id)references Person.br_instrucor(b_ins_id)
)

create table Tracks.course
(
	c_code char(5)primary key,
	c_name nvarchar(40)not null,
	c_desc nvarchar(50),
	c_maxDeg int,
	c_minDeg int,
	c_track_id int,
	c_ins_id int,
	constraint c_FK1 foreign key(c_track_id)references Tracks.track(track_id),
	constraint c_FK2 foreign key(c_ins_id)references Person.instructor(ins_id)
)

create table Person.student
(
	st_id int identity primary key,
	st_Fname nvarchar(20) not null,
	st_Lname nvarchar(40) not null,
	st_phone nvarchar(11) not null,
	st_adress nvarchar(30),
	st_u_id int,
	st_b_id int,
	st_t_id int,
	constraint st_FK1 foreign key(st_u_id)references Person.users(u_id),
	constraint st_FK3 foreign key(st_t_id)references Tracks.track(track_id),
	constraint st_FK2 foreign key(st_b_id)references Tracks.branch(b_id)
)
create table st_courses
(
	st_course_id int primary key identity,
	st_id int,
	co_code char(5),
	constraint st_c_fk1 foreign key(st_id) references Person.student(st_id),
	constraint st_c_fk2 foreign key(co_code) references Tracks.cousrse(c_code),
)
create table Exams.chooseQ
(
	ch_q_id int primary key identity,
	ch_q_text nvarchar(100) not null,
	ch_q_trueans nvarchar(50)not null,
	ch_q_ans1 nvarchar(50)not null,
	ch_q_ans2 nvarchar(50)not null,
	ch_q_ans3 nvarchar(50)not null,
	ch_q_degree int default 2,
	ch_q_course char(5),
	constraint ch_FK1 foreign key(ch_q_course)references Tracks.course(c_code)
)

create table Exams.TFQ
(
	tf_q_id int primary key identity,
	tf_q_text nvarchar(100) not null,
	tf_q_trueans nvarchar(10) not null,
	tf_q_ans1 nvarchar(10) default 'TRUE',
	tf_q_ans2 nvarchar(10) default 'FALSE',
	tf_q_degree int default 2 ,
	tf_q_course char(5),
	constraint tf_q_FK1 foreign key(tf_q_course)references Tracks.course(c_code)
)

create table Exams.TexQ
(
	tex_q_id int primary key identity,
	tex_q_text nvarchar(100) not null,
	tex_q_trueans nvarchar(100) not null,
	tex_q_ans1 nvarchar(100)not null,
	tex_q_degree int default 4 ,
	tex_q_course char(5),
	constraint tex_q_FK1 foreign key(tex_q_course)references Tracks.course(c_code)
)
create table Exams.exam
(
	ex_id int primary key identity,
	ex_c_code char(5),
	ex_ins_id int,
	ex_date date default GETDATE()+2,
	ex_s_time time default '10:00:00',
	ex_e_time time default '11:00:00',
	ex_total int default 20,
	constraint EX_FK1 foreign key (ex_c_code)references Tracks.cousrse(c_code),
	constraint EX_FK2 foreign key (ex_ins_id)references Person.instructor(ins_id)
)
alter table Exams.exam
add ex_title nvarchar(30)
create table Exams.st_exams
(
	st_ex_id int primary key identity,
	st_id int,
	ex_id int,
	constraint st_ex_cons unique(st_id,ex_id),
	constraint st_ex_FK1 foreign key(st_id)references Person.student(st_id),
	constraint st_ex_FK2 foreign key(ex_id)references Exams.exam(ex_id),
)
create table Exams.ex_questions
(
	ex_q_id int primary key identity,
	mcq_id int,
	tf_id int,
	texq_id int,
	ex_id int,
	constraint ex_qFK1 foreign key (mcq_id)references Exams.chooseQ(ch_q_id),
	constraint ex_qFK2 foreign key (tf_id)references Exams.TFQ(tf_q_id),
	constraint ex_qFK3 foreign key (texq_id)references Exams.TexQ(tex_q_id),
	constraint ex_qFK4 foreign key (ex_id)references Exams.exam(ex_id),
)

create table st_answer
(
	ans_id int primary key identity,
	ex_id int,
	st_id int,
	ex_q_id int,
	st_ans nvarchar(100),
	true_ans nvarchar(100),
	ans_deg int not null,
	constraint ans_FK1 foreign key (st_id) references Person.student(st_id),
	constraint ans_FK2 foreign key (ex_id) references Exams.exam(ex_id),
	constraint ans_FK3 foreign key (ex_q_id) references Exams.ex_questions(ex_q_id),
	constraint cons1 unique(st_id,ex_id,ex_q_id)
)

create table st_results
(
	res_id int primary key identity,
	st_id int,
	ex_id int,
	ex_res int,
	constraint resFK1 foreign key (st_id) references Person.student(st_id),
	constraint resFK2 foreign key (ex_id) references Exams.exam(ex_id),
	constraint rescons unique(st_id,ex_id,ex_res)
)

create table #ex_ans
(
	q_id int,
	ans nvarchar(50)
)