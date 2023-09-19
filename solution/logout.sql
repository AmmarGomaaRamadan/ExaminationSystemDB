alter proc U_logout @uname nvarchar(20)
as
begin
	update Person.users
	set status=0
	where username=@uname
	print'Logged out'
			if(@uname='adm')
			begin
			alter table Person.users enable trigger insert_user
			alter table Person.users enable trigger delete_user
			--alter table Person.users disable trigger update_user
			alter table Person.T_manger enable trigger insert_manager
			alter table Person.T_manger enable trigger update_manager
			alter table Person.T_manger enable trigger delete_manager
			end
			else if(@uname='man')
			begin
			alter table Tracks.branch enable trigger delete_branch
			alter table Tracks.branch enable trigger update_branch
			alter table Tracks.branch enable trigger insert_branch
			alter table Tracks.track disable  trigger delete_track
			alter table Tracks.track enable  trigger insert_track
			alter table Tracks.track enable  trigger update_track
			alter table Person.instructor enable trigger insert_instructor
			alter table Person.instructor enable trigger update_instructor
			alter table Person.instructor enable trigger delete_instructor
			alter table Tracks.course enable trigger insert_course
			alter table Tracks.course enable trigger update_course
			alter table Tracks.course enable trigger delete_course
			end
			else if(@uname='ins')
			begin
			alter table Exams.chooseQ enable  trigger insert_chooseQ
			alter table Exams.chooseQ enable  trigger delete_chooseQ
			alter table Exams.chooseQ enable  trigger update_chooseQ
			alter table Exams.TFQ enable trigger delete_TFQ
			alter table Exams.TFQ enable trigger insert_TFQ
			alter table Exams.TFQ enable trigger update_TFQ
			alter table Exams.TexQ enable trigger delete_TexQ
			alter table Exams.TexQ enable trigger insert_TexQ
			alter table Exams.TexQ enable trigger update_TexQ
			alter table Exams.exam enable trigger delete_exam
			alter table Exams.exam enable trigger insert_exam
			alter table Exams.exam enable trigger update_exam
			alter table Exams.ex_questions enable trigger insert_ex_questions
			alter table Exams.ex_questions enable trigger update_ex_questions
			alter table Exams.ex_questions enable trigger delete_ex_questions
			end

end

