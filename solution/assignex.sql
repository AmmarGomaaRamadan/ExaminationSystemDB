
alter proc assignexam(@I_id int,@Ccode char(5),@F_d int,@e_d date,@e_s_t time,@e_e_t time)
as
begin
	if((select count(i.ins_id)from Person.instructor i
		where i.ins_id=@I_id)=1 and 
			(select count(tc.c_code)from Tracks.course tc 
					where tc.c_ins_id=@I_id)=1)
		begin
			if((select COUNT(u.u_id) 
			from Person.instructor i,Person.users u
			where i.ins_id=@I_id and i.ins_u_id=u.u_id and u.status=1)=1)
			begin
				if((@F_d+(select SUM(e.ex_total)from Exams.exam e where e.ex_c_code=@Ccode))<
				(select sum(ccc.c_maxDeg) from Tracks.course ccc where ccc.c_code=@Ccode) or 
				(select SUM(e.ex_total)from Exams.exam e where e.ex_c_code=@Ccode) is null)
					 begin
						insert into Exams.exam(ex_ins_id,ex_c_code,ex_total,ex_date,ex_s_time,ex_e_time)
						values(@I_id,@Ccode,@F_d,@e_d,@e_s_t,@e_e_t)
						print'Exam assigned now assign questions'
					 end
				else
					begin
						print 'may the course degree not allow or you are not the instructor of the coursee'
					end
			end
			else
				print'You must login'
		    end
	else
		print'You are not permitted to assign exam'
end

U_login 'ins','123'
 assignexam 4,'DN2',20,'2022-09-16','10:00:00','11:00:00'



				
				