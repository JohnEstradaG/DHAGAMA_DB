Delimiter $$
CREATE OR REPLACE PROCEDURE stp_PC_count_users_by_search_company(
	IN psearch VARCHAR(255),
	IN pid_company INT(11),
   	IN pid_status VARCHAR(255)
)
BEGIN
   SELECT
		count(*) users
	FROM
		v_users ud
	WHERE
	     ud.id_company = pid_company
        AND IF(pid_status != 'null', ud.id_status = pid_status, ud.id_status < 3)
		AND IF(psearch != 'null', (LOWER(ud.name) LIKE CONCAT('%',LOWER(psearch),'%')
		OR LOWER(ud.last_name) LIKE CONCAT('%',LOWER(psearch),'%')
		OR LOWER(ud.email) LIKE CONCAT('%',LOWER(psearch),'%')
		OR (CONCAT(TRIM(' ' FROM ud.name),' ',TRIM(' ' FROM ud.first_name),' ',TRIM(' ' FROM ud.last_name))) LIKE CONCAT('%',LOWER(psearch),'%')
		),TRUE);
END $$
Delimiter $$