alter proc finishEx @ex_id int ,@s_id int
as
begin
	declare @ans table
	(
		id int primary key identity,
		ans nvarchar(100),
		deg int
	)
	declare @trueans table
	(
		id int primary key identity,
		tans nvarchar(100),
		deg int
	)

	insert into @ans
	select upper(st.st_ans),0 from st_answer st
	where st.ex_id=@ex_id and st.st_id=@s_id

	insert into @trueans
	select ch.ch_q_trueans,ch.ch_q_degree from Exams.ex_questions q,Exams.chooseQ ch
	where ch.ch_q_id=q.mcq_id and q.ex_id=@ex_id
	insert into @trueans
	select t.tf_q_trueans,t.tf_q_degree from Exams.ex_questions q,Exams.TFQ t
	where t.tf_q_id=q.tf_id and q.ex_id=@ex_id
	insert into @trueans
	select upper(x.tex_q_id),x.tex_q_degree from Exams.ex_questions q,Exams.TexQ x
	where x.tex_q_id=q.mcq_id and q.ex_id=@ex_id
	
	--declare @fin table(tru nvarchar(50),ans nvarchar(50),deg int)
	--declare @deg int
	--insert into @fin
	--select t.tans,a.ans from @trueans t,@ans a,select @deg=IIF((t.ans==a.tans),t.deg,a.deg)
	--where 
	declare @fin int
	set @fin=0
	set @fin+=(select sum(a.deg)from @trueans a,@ans a2 
	where a.tans=a2.ans )
	insert into st_results(st_id,ex_id,ex_res)values(@s_id,@ex_id,@fin)
end

