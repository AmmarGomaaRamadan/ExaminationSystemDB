alter proc U_login (@u_name nvarchar(50),@pass nvarchar(10))
as
begin
	update person.users
	set status =1
	where Person.users.username=@u_name and u_pass=@pass
	if((select COUNT(u.username) from Person.users u 
	   where u.username=@u_name and u.u_pass=@pass)=1)
		begin
			print'Sucess'
			if(@u_name='adm')
			begin
			alter table Person.users disable trigger insert_user
			alter table Person.users disable trigger delete_user
			--alter table Person.users disable trigger update_user
			alter table Person.T_manger disable trigger insert_manager
			alter table Person.T_manger disable trigger update_manager
			alter table Person.T_manger disable trigger delete_manager
			end
			else if(@u_name='man')
			begin
			alter table Tracks.branch disable trigger delete_branch
			alter table Tracks.branch disable trigger update_branch
			alter table Tracks.branch disable trigger insert_branch
			alter table Tracks.track disable  trigger delete_track
			alter table Tracks.track disable  trigger insert_track
			alter table Tracks.track disable  trigger update_track
			alter table Person.instructor disable trigger insert_instructor
			alter table Person.instructor disable trigger update_instructor
			alter table Person.instructor disable trigger delete_instructor
			alter table Tracks.course disable trigger insert_course
			alter table Tracks.course disable trigger update_course
			alter table Tracks.course disable trigger delete_course
			end
			else if(@u_name='ins')
			begin
			alter table Exams.chooseQ disable  trigger insert_chooseQ
			alter table Exams.chooseQ disable  trigger delete_chooseQ
			alter table Exams.chooseQ disable  trigger update_chooseQ
			alter table Exams.TFQ disable trigger delete_TFQ
			alter table Exams.TFQ disable trigger insert_TFQ
			alter table Exams.TFQ disable trigger update_TFQ
			alter table Exams.TexQ disable trigger delete_TexQ
			alter table Exams.TexQ disable trigger insert_TexQ
			alter table Exams.TexQ disable trigger update_TexQ
			alter table Exams.exam disable trigger delete_exam
			alter table Exams.exam disable trigger insert_exam
			alter table Exams.exam disable trigger update_exam
			alter table Exams.ex_questions disable trigger insert_ex_questions
			alter table Exams.ex_questions disable trigger update_ex_questions
			alter table Exams.ex_questions disable trigger delete_ex_questions
			end
		end
	else
		begin
			print'Failed'
		end

end

