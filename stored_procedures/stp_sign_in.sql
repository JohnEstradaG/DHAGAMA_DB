  ----- LOGIN -----
Delimiter $$
CREATE OR REPLACE PROCEDURE stp_sign_in(
	IN pemail VARCHAR(255),
	IN ppassword VARCHAR(255)
)
BEGIN
    DECLARE idres INT;
	SET idres = (SELECT ud.id FROM tbl_users u, tbl_users_data ud WHERE ud.id_user = u.id AND ud.id_status = 1 AND u.email = pemail AND u.password = AES_ENCRYPT(ppassword, (SELECT encrypt FROM v_keys k WHERE k.id = 1)));
    IF idres > 0 THEN
    	SELECT * FROM v_users  WHERE id = idres;
    ELSE 
    	SELECT ud.id FROM tbl_users u, tbl_users_data ud WHERE ud.id_user = u.id AND ud.id_status = 1 AND u.email = pemail AND u.password = AES_ENCRYPT(ppassword, (SELECT encrypt FROM v_keys k WHERE k.id = 1));
    END IF;
END $$
Delimiter $$