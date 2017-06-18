﻿DELETE FROM auth.menu_access_policy
WHERE menu_id IN
(
 SELECT menu_id FROM core.menus
 WHERE app_name = 'TheSmsCentral'
);

DELETE FROM auth.group_menu_access_policy
WHERE menu_id IN
(
 SELECT menu_id FROM core.menus
 WHERE app_name = 'TheSmsCentral'
);

DELETE FROM core.menus
WHERE app_name = 'TheSmsCentral';


SELECT * FROM core.create_app('TheSmsCentral', 'TheSmsCentral', 'The SMS Central', '1.0', 'MixERP Inc.', 'December 1, 2015', 'pink comments', '/dashboard/tsc', NULL);

SELECT * FROM core.create_menu('TheSmsCentral', 'Tasks', 'Tasks', '', 'lightning', '');
SELECT * FROM core.create_menu('TheSmsCentral', 'TheSmsCentralSetup', 'TheSmsCentral Setup', '/dashboard/tsc', 'configure', 'Tasks');


SELECT * FROM auth.create_app_menu_policy
(
	'Admin', 
	core.get_office_id_by_office_name('Default'), 
	'TheSmsCentral',
	'{*}'
);
