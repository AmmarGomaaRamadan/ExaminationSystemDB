--insert into st_courses
--select s.st_id,c.c_code
--from Person.student s , Tracks.course c , Tracks.br_tracks b
--where s.st_t_id=c.c_track_id and c.c_track_id=b.b_t_id and b.br_id=s.st_b_id


--alter proc getStCourses @st_id int
--as
--begin
--	select s.st_Fname+' '+s.st_Lname as student_Name,c.c_name as courseName,
--	t.track_name as TrackName
--	from Person.student s,st_courses sc,Tracks.course c,Tracks.track t
--	where s.st_id=sc.st_id and c.c_code=sc.co_code and s.st_id=@st_id and s.st_t_id=t.track_id
--end

--create proc getStCoursesbyN @st_fn nvarchar(50)
--as
--begin
--	select s.st_Fname+' '+s.st_Lname as student_Name,c.c_name as courseName,
--	t.track_name as TrackName
--	from Person.student s,st_courses sc,Tracks.course c,Tracks.track t
--	where s.st_id=sc.st_id and c.c_code=sc.co_code and s.st_Fname=@st_fn and s.st_t_id=t.track_id
--end

alter proc get_C_St @code char(5)
as
begin
	select c.c_name as Couse_Name,s.st_Fname+' '+s.st_Lname as S_Name,t.track_name as Track
	,b.b_name
	from Tracks.course c,st_courses sc,Person.student s,
	Tracks.track t,Tracks.br_tracks bt,Tracks.branch b
	where c.c_code=sc.co_code and s.st_id=sc.st_id and s.st_t_id=t.track_id 
	and c.c_track_id=t.track_id and c.c_track_id =bt.t_id and bt.br_id=b.b_id and c.c_code=@code
 end
get_C_St 'DN2'

getStCourses 1
getStCoursesbyN 'ali'