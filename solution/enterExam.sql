alter proc enterexam(@s_id int,@ex_id int)
as
begin
	if((select count(s.st_id)from Person.student s,Tracks.course c,Exams.exam e
	where s.st_t_id=c.c_track_id and c.c_code=e.ex_c_code and s.st_id=@s_id and e.ex_id=@ex_id)>0 
	and (select convert(date,e.ex_date) from Exams.exam e where e.ex_id=@ex_id)=convert(date,GETDATE()))
	--and (select convert(time,e.ex_s_time)from Exams.exam e where e.ex_id=@ex_id)<convert(time,getdate())
	--and (select convert(time,e.ex_e_time)from Exams.exam e where e.ex_id=@ex_id)>convert(time,getdate()))
	begin
			select eq.ex_q_id as q_id, c.ch_q_text as MCQ_Questions,c.ch_q_ans1 as answer1,c.ch_q_ans2 as answer2,
			c.ch_q_ans3 as answer3
			from Exams.exam e,Exams.chooseQ c,Exams.ex_questions eq
			where eq.mcq_id=c.ch_q_id and eq.ex_id=e.ex_id and e.ex_id=@ex_id
			

			select eq.ex_q_id as q_id, t.tf_q_text as TF_Questions,t.tf_q_ans1 as answer1,t.tf_q_ans2 as answer2
			from Exams.exam e,Exams.ex_questions eq,Exams.TFQ t
			where eq.tf_id=t.tf_q_id and eq.ex_id=e.ex_id and e.ex_id=@ex_id
			
			select eq.ex_q_id as q_id,t.tex_q_text as Text_Questions 
			from Exams.exam e,Exams.TexQ t,Exams.ex_questions eq
			where eq.texq_id=t.tex_q_id and eq.ex_id=e.ex_id and e.ex_id=@ex_id 

			insert into st_answer(ex_id,st_id,ex_q_id,st_ans)
			select e.ex_id,s.st_id,eq.ex_q_id,'' from Exams.exam e,
			Person.student s,Exams.ex_questions eq where e.ex_id=eq.ex_id
			and  e.ex_id=@ex_id and s.st_id=@s_id

		end
	else
		begin
			print 'The Exam is not available !!!!'
		end
end
select*from Person.student
enterexam 1,6
--ans_quest @st_id int,@ex_id int,@q_id int,@ans nvarchar(100)
ans_quest 1,6,20,'A structure can contain protected data membe'
finishEx 5,1 
select w.mcq_id from Exams.ex_questions w
where w.mcq_id=20
select * from Exams.chooseQ q
where q.ch_q_id=20
 
 select* from st_answer 
