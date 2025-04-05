Delimiter $$
CREATE OR replace PROCEDURE stp_PC_user(
	IN pid INT(11)
)
BEGIN
	select 
        * 
    from  
        v_users u
    where 
        u.id = pid;
END$$
Delimiter $$

