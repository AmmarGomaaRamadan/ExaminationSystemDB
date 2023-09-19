--create view StudentData
--as 
--select PS.st_id as 'StudentId',PS.st_Fname+' '+ PS.st_Lname as 'FullName',
--TB.b_name as 'BranchName',TT.track_name as 'TrackName'
--from Person.student PS,Tracks.branch TB,Tracks.track TT
--where PS.st_b_id=TB.b_id and ps.st_t_id=TT.track_id

--select *from StudentData
--create view CourseData
--as 
--select  TC.c_code,TC.c_name,TC.c_desc,TT.track_name,
--PIns.ins_Fname+' '+PIns.ins_Lname as 'InstructorName'
--from Tracks.course TC,Tracks.track TT,Person.instructor PIns
--where TC.c_ins_id=PIns.ins_id and TC.c_track_id=TT.track_id

--select *from CourseData
--create view ManagerData
--as 
--select PM.M_id,PM.M_Fname+' '+ PM.M_Lname as 'FullName',PM.M_adress,PM.M_start_date
--from Person.T_manger PM

--select *from ManagerData

--create view InstructorData
--as 
--select PIn.ins_id as Ins_id,PIn.ins_Fname+' '+ PIn.ins_Lname as FullName,
--PIn.ins_adress as Adress,PIn.ins_start_date as StartAt,b.b_name Branch
--from Person.instructor PIn,Person.br_instrucor bi,Tracks.branch b
--where PIn.ins_id=bi.ins_id and b.b_id=bi.b_id

--select*from InstructorData v
--where v.Branch='minia'
--create view ExamData
--as
--select EE.ex_id as ID,TC.c_name as Course_Of_The_exam,
--EE.ex_title as Title,
--PIN.ins_Fname+' '+PIN.ins_Lname as 'InstructorName',
--EE.ex_total Total_Degree,
--Year(EE.ex_date) as Exam_year
--from Exams.exam EE,Tracks.course TC, Person.instructor PIN
--where EE.ex_c_code=TC.c_code and EE.ex_ins_id=PIN.ins_id
--select *from ExamData

--create view TrackData
--as 
--select TT.track_id,TT.track_name,TD.d_name
--from Tracks.track TT,Tracks.department TD
--where TT.dept_id=TD.d_id

--select*from TrackData

--create view BranchData
--as 
--select TB.b_id,TB.b_name,TB.b_location,
--bM.ins_Fname+' '+bM.ins_Lname as 'Manager Name'
--from Tracks.branch TB,Person.instructor bM
--where tb.b_manger_id=bM.ins_id

--select*from BranchData
 --alter view Branch_tracks
 --as
 --select bt.b_t_id as ID,b.b_name as Branch_name,t.track_name as Track_anme,
 --sV.ins_Fname+sV.ins_Lname as Track_Supervisor,D.d_name as Track_Dept
 --from Tracks.br_tracks bt,Tracks.branch b,Tracks.track t,Person.instructor sV,
 --Tracks.department D
 --where bt.br_id=b.b_id and bt.su_id=sV.ins_id and bt.t_id=t.track_id and t.dept_id=D.d_id

 --select*from Branch_tracks

-- alter view StudentResult
--as
--select r.res_id as ID,s.st_Fname+' '+s.st_Lname as Fullname,
--e.ex_title,c.c_name,r.ex_res,deg=IIF((r.ex_res>e.ex_total*0.59),'sucess','fail')
--from st_results r,Person.student s,Exams.exam e,Tracks.course c
--where r.ex_id=e.ex_id and r.st_id=s.st_id and e.ex_c_code=c.c_code

--select*from StudentResult


--alter view StudentCourses
--as 
--select SC.st_course_id as ID,PS.st_Fname+' '+ PS.st_Lname as 'Student Name',
--TC.c_name as CourseName,t.track_name as Track
--from st_courses SC,Person.student PS,Tracks.course TC,Tracks.track t
--where SC.st_id=PS.st_id and SC.co_code=TC.c_code and TC.c_track_id=t.track_id

--select*from StudentCourses
--where CourseName='C#'