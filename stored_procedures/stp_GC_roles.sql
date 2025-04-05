Delimiter $$ 
CREATE OR REPLACE PROCEDURE stp_GC_roles() 
BEGIN
    SELECT
        *
    FROM
        tbl_roles;
END $$
Delimiter $$ 