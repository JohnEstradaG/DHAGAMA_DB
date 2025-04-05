----- BUSCAR TODOS LOS STATUS -----
Delimiter $$ 
CREATE OR REPLACE PROCEDURE stp_GC_status() 
BEGIN
    SELECT
        s.*
    FROM
        v_status s;
END $$
Delimiter $$