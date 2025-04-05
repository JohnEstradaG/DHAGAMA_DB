
Delimiter $$
CREATE OR REPLACE PROCEDURE stp_U_user(
	IN pid INT(11),
	IN pname VARCHAR(255),
	IN pfirst_name VARCHAR(255),
	IN plast_name VARCHAR(255),
	IN pprofile_picture_path VARCHAR(255),
	IN pid_status INT(11),
	IN plicense_number VARCHAR(255),
    IN pid_role INT(11),
	IN pphone VARCHAR(255)
)
BEGIN
	UPDATE
		tbl_users_data
	SET
		name = pname,
		first_name = pfirst_name,
		last_name = plast_name,
		profile_picture_path = pprofile_picture_path,
		id_status = pid_status,
		license_number =plicense_number,
		id_role = pid_role,
		phone = pphone
	WHERE
		id = pid;
END$$
Delimiter $$