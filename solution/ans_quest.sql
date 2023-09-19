create proc ans_quest @st_id int,@ex_id int,@q_id int,@ans nvarchar(100)
as
begin
	update st_answer
	set st_ans=@ans
	where ex_id=@ex_id and st_id=@st_id and ex_q_id=@q_id
end
