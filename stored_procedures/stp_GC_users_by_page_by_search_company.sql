Delimiter $$
CREATE OR replace PROCEDURE stp_GC_users_by_page_by_search_company(
    IN pindex INT(11),
    IN psize INT(11),
    IN psearch VARCHAR(255),
    IN pid_company INT(11),
    IN pid_status VARCHAR(255)
)
BEGIN
DECLARE plimit INT(11);
SET plimit = (pindex * psize);
	SELECT
    u.*
	FROM
        v_users u
    WHERE  u.id_company = pid_company
        AND IF(pid_status != 'null', u.id_status = pid_status, u.id_status < 3)
        AND IF(psearch != 'null', (LOWER(u.name) LIKE CONCAT('%', LOWER(psearch), '%')
        OR LOWER(u.last_name) LIKE CONCAT('%',LOWER(psearch),'%')
        OR LOWER(u.email) LIKE CONCAT('%',LOWER(psearch),'%')
        OR (CONCAT(TRIM(' ' FROM u.name),' ',TRIM(' ' FROM u.first_name),' ',TRIM(' ' FROM u.last_name))) LIKE CONCAT('%',LOWER(psearch),'%')
        ),TRUE)
    ORDER BY
        u.id ASC
    LIMIT psize
    OFFSET plimit;    
END$$
Delimiter $$