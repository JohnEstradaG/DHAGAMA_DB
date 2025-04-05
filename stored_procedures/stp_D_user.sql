----- EDITAR DATOS DEL USUARIO -----
Delimiter $$
CREATE OR replace PROCEDURE stp_D_user(
	IN pid INT(11)
)
BEGIN
	UPDATE
		tbl_users_data
	SET
		id_status = 3
	WHERE
		id = pid;
END$$
Delimiter $$