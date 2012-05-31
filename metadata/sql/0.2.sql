ALTER TABLE appuser ADD COLUMN created timestamp NOT NULL DEFAULT now();
update permission set uris = '/file/list /category/save /category/list /category/navigation /file/save /file/download /category/delete /file/delete' where name = 'Gerenciar Arquivos';
insert into permission (id, version, name, uris) values (84, 0, 'Gerenciar Centralizado do WHL E1G', '/admin/whlexg');
insert into user_permission(user_id, permission_id) values (82, 84);
