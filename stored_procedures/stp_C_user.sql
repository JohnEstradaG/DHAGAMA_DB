DELIMITER $$
CREATE OR REPLACE PROCEDURE stp_C_user(
	IN pemail VARCHAR(255),
	IN pforgot_password_token VARCHAR(255),
	IN pname VARCHAR(255),
	IN pfirst_name VARCHAR(255),
	IN plast_name VARCHAR(255),
	IN pphone VARCHAR(255),
    IN plicense_number VARCHAR(255),
	IN pid_company INT(11),
	IN pid_role INT(11),
	IN pcreated_by VARCHAR(255)
)
BEGIN
DECLARE id_user INT;
DECLARE count_users INT;
SET count_users = (SELECT COUNT(*) FROM v_users u WHERE u.email = pemail AND u.id_status < 3);
START TRANSACTION;
IF  count_users = 0 then
	INSERT INTO tbl_users (
 		email, 
		forgot_password_token
        ) VALUES (
            pemail, 
            pforgot_password_token
        );
        SET id_user = LAST_INSERT_ID();

        INSERT INTO tbl_users_data (
            name,
            first_name,
            last_name,
            phone,
            license_number,
            id_company,
            id_user,
            id_role,
            created_by
        ) VALUES (
            pname,
            pfirst_name,
            plast_name,
            pphone,
            plicense_number,
            pid_company,
            id_user,
            pid_role,
            pcreated_by
        );

        SELECT LAST_INSERT_ID() AS id_user_data;
    ELSE
        SELECT COUNT(*) number_exsiten_users FROM v_users u WHERE u.email = pemail AND u.id_status < 3;
    END IF;
    COMMIT;
END$$
DELIMITER $$