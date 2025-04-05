CREATE OR REPLACE VIEW v_users AS
SELECT 
	ud.*,
	u.email,
	c.name company_name,
	s.name status_name,
	s.colour,
	s.text_colour,
	r.name role_name
FROM 
	tbl_users_data ud,
	tbl_users u,
	tbl_companies c,
	tbl_status s,
	tbl_roles r
WHERE 
	ud.id_user = u.id
AND ud.id_company = c.id
AND ud.id_status = s.id
AND ud.id_role = r.id