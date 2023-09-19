alter proc assignQtoEx(@us_id int,@ex_id int,@q_id int,@q_type char(5))
as
begin
	if((select count(u.u_id) from Person.users u where u.u_id=@us_id
	  and u.username='ins' and u.status='TRUE')=1)
		begin
			if(@q_type='mcq')
				begin
					if((select count(ch.ch_q_degree)from Exams.chooseQ ch,Exams.ex_questions q
					where ch.ch_q_id=q.mcq_id)<7 or (select sum(ch1.ch_q_degree)
					from Exams.chooseQ ch1,Exams.ex_questions q1
					where ch1.ch_q_id=q1.mcq_id and q1.mcq_id=@q_id)is null)
					begin
						insert into Exams.ex_questions(ex_id,mcq_id)values(@ex_id,@q_id)
						print'success'
					end
					else
					begin
						print 'failed'
					end
				end
			else if(@q_type='tf')
				begin
					if((select count(t.tf_q_degree)from Exams.TFQ t,Exams.ex_questions q
					where t.tf_q_id=q.tf_id)<3 or (select sum(t1.tf_q_degree)
					from Exams.TFQ t1,Exams.ex_questions q1
					where t1.tf_q_id=q1.tf_id and q1.tf_id=@q_id)is null)
					begin
						insert into Exams.ex_questions(ex_id,tf_id)values(@ex_id,@q_id)
						print' success'
					end
					else
						begin
							print 'failed'
						end
						
				end
			else if(@q_type='tex')
				begin
				if((select count(te.tex_q_degree)from Exams.TexQ te,Exams.ex_questions q
					where te.tex_q_id=q.texq_id)<2 or (select sum(t1.tex_q_degree)
					from Exams.TexQ t1,Exams.ex_questions q1
					where t1.tex_q_id=q1.texq_id and q1.texq_id=@q_id)is null)
					begin
						insert into Exams.ex_questions(ex_id,texq_id)values(@ex_id,@q_id)
						print' success'
					end
					else
					   begin
							print 'failed'
					   end
				end
			else
				print'invalid question type'
		end
	else
		begin
			print'you are not permetted'
		end
end
