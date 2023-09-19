
--- table user-----------------
create trigger insert_user
on Person.users
instead of insert
as
begin
       print'you are not permitted'
	   
end

create trigger update_user
on Person.users
instead of update
as
begin
       print'you are not permitted'
	   
end

create trigger delete_user
on Person.users
instead of delete
as
begin
       print'you are not permitted'
	   
end

----table t_manager----------ad

create trigger insert_manager
on Person.T_manger
instead of insert

as
begin
       print'you are not permitted'
	   
end

create trigger update_manager
on Person.T_manger
instead of update

as
begin
       print'you are not permitted'
	   
end

create trigger delete_manager
on Person.T_manger
instead of delete

as
begin
       print'you are not permitted'
	   
end

-----table instructor --------f

create trigger insert_instructor
on Person.instructor
instead of insert

as
begin
       print'you are not permitted'
	   
end

create trigger update_instructor
on Person.instructor
instead of update

as
begin
       print'you are not permitted'
	   
end
create trigger delete_instructor
on Person.instructor
instead of delete

as
begin
       print'you are not permitted'
	   
end

-----tracks-----------f

create trigger delete_track
on Tracks.track
instead of delete

as
begin
       print'you are not permitted'
	   
end

create trigger insert_track
on Tracks.track
instead of insert

as
begin
       print'you are not permitted'
	   
end

create trigger update_track
on Tracks.track
instead of update

as
begin
       print'you are not permitted'
	   
end

-----branch------------f

create trigger insert_branch
on Tracks.branch
instead of insert

as
begin
       print'you are not permitted'
	   
end

create trigger update_branch
on Tracks.branch
instead of update

as
begin
       print'you are not permitted'
	   
end

create trigger delete_branch
on Tracks.branch
instead of delete

as
begin
       print'you are not permitted'
	   
end


---------Tracks.course--------f

create trigger insert_course
on Tracks.course
instead of insert

as
begin
       print'you are not permitted'
	   
end
create trigger update_course
on Tracks.course
instead of update

as
begin
       print'you are not permitted'
	   
end
create trigger delete_course
on Tracks.course
instead of delete

as
begin
       print'you are not permitted'
	   
end

----------Person.student----------f

--create trigger insert_student
--on Person.student
--instead of insert

--as
--begin
--       print'you are not permitted'
	   
--end

--create trigger update_student
--on Person.student
--instead of update

--as
--begin
--       print'you are not permitted'
	   
--end

--create trigger delete_student
--on Person.student
--instead of delete

--as
--begin
--       print'you are not permitted'
	   
--end

--------st_courses--------------

--create trigger insert_bycourses
--on st_courses
--instead of insert

--as
--begin
--       print'you are not permitted'
	   
--end

--create trigger update_bycourses
--on st_courses
--instead of update

--as
--begin
--       print'you are not permitted'
	   
--end

--create trigger delete_bycourses
--on st_courses
--instead of delete

--as
--begin
--       print'you are not permitted'
	   
--end

------Exams.chooseQ------------f

create trigger insert_chooseQ
on Exams.chooseQ
instead of insert

as
begin
       print'you are not permitted'
	   
end

create trigger update_chooseQ
on Exams.chooseQ
instead of update

as
begin
       print'you are not permitted'
	   
end

create trigger delete_chooseQ
on Exams.chooseQ
instead of delete

as
begin
       print'you are not permitted'
	   
end



------- Exams.exam--------f

create trigger insert_exam
on Exams.exam
instead of insert

as
begin
       print'you are not permitted'
	   
end

create trigger update_exam
on Exams.exam
instead of update

as
begin
       print'you are not permitted'
	   
end

create trigger delete_exam
on Exams.exam
instead of delete

as
begin
       print'you are not permitted'
	   
end



---------Exams.ex_questions---------f------

create trigger insert_ex_questions
on Exams.ex_questions
instead of insert

as
begin
       print'you are not permitted'
	   
end

create trigger update_ex_questions
on Exams.ex_questions
instead of update

as
begin
       print'you are not permitted'
	   
end

create trigger delete_ex_questions
on Exams.ex_questions
instead of delete

as
begin
       print'you are not permitted'
	   
end



--------Exams.TFQ-------------f
create trigger insert_TFQ
on Exams.TFQ
instead of insert

as
begin
       print'you are not permitted'
	   
end

create trigger update_TFQ
on Exams.TFQ
instead of update

as
begin
       print'you are not permitted'
	   
end

create trigger delete_TFQ
on Exams.TFQ
instead of delete

as
begin
       print'you are not permitted'
	   
end

-------Exams.TexQ---------f
create trigger insert_TexQ
on Exams.TexQ
instead of insert

as
begin
       print'you are not permitted'
	   
end

create trigger update_TexQ
on Exams.TexQ
instead of update

as
begin
       print'you are not permitted'
	   
end

create trigger delete_TexQ
on Exams.TexQ
instead of delete

as
begin
       print'you are not permitted'
	   
end








