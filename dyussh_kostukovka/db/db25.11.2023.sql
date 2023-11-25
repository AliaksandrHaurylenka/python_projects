--
-- ���� ������������ � ������� SQLiteStudio v3.4.4 � �� ��� 25 08:32:28 2023
--
-- �������������� ��������� ������: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- �������: auth_group
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);

-- �������: auth_group_permissions
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);

-- �������: auth_permission
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (1, 1, 'add_logentry', 'Can add log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (2, 1, 'change_logentry', 'Can change log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (3, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (4, 1, 'view_logentry', 'Can view log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (5, 2, 'add_permission', 'Can add permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (6, 2, 'change_permission', 'Can change permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (7, 2, 'delete_permission', 'Can delete permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (8, 2, 'view_permission', 'Can view permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (9, 3, 'add_group', 'Can add group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (10, 3, 'change_group', 'Can change group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (11, 3, 'delete_group', 'Can delete group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (12, 3, 'view_group', 'Can view group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (13, 4, 'add_user', 'Can add user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (14, 4, 'change_user', 'Can change user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (15, 4, 'delete_user', 'Can delete user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (16, 4, 'view_user', 'Can view user');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (17, 5, 'add_contenttype', 'Can add content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (18, 5, 'change_contenttype', 'Can change content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (19, 5, 'delete_contenttype', 'Can delete content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (20, 5, 'view_contenttype', 'Can view content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (21, 6, 'add_session', 'Can add session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (22, 6, 'change_session', 'Can change session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (23, 6, 'delete_session', 'Can delete session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (24, 6, 'view_session', 'Can view session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (25, 7, 'add_news', 'Can add news');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (26, 7, 'change_news', 'Can change news');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (27, 7, 'delete_news', 'Can delete news');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (28, 7, 'view_news', 'Can view news');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (29, 8, 'add_newssporttype', 'Can add news sport type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (30, 8, 'change_newssporttype', 'Can change news sport type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (31, 8, 'delete_newssporttype', 'Can delete news sport type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (32, 8, 'view_newssporttype', 'Can view news sport type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (33, 9, 'add_mainmenu', 'Can add main menu');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (34, 9, 'change_mainmenu', 'Can change main menu');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (35, 9, 'delete_mainmenu', 'Can delete main menu');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (36, 9, 'view_mainmenu', 'Can view main menu');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (37, 10, 'add_tagnews', 'Can add tag news');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (38, 10, 'change_tagnews', 'Can change tag news');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (39, 10, 'delete_tagnews', 'Can delete tag news');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (40, 10, 'view_tagnews', 'Can view tag news');

-- �������: auth_user
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);

-- �������: auth_user_groups
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);

-- �������: auth_user_user_permissions
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);

-- �������: django_admin_log
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);

-- �������: django_content_type
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'auth', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'dyussh', 'news');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'dyussh', 'newssporttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'dyussh', 'mainmenu');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'dyussh', 'tagnews');

-- �������: django_migrations
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2023-10-23 16:45:22.362743');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2023-10-23 16:45:22.639304');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2023-10-23 16:45:22.872713');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-10-23 16:45:23.005902');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-23 16:45:23.144381');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-10-23 16:45:23.288675');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-10-23 16:45:23.431237');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-10-23 16:45:23.562454');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-10-23 16:45:23.717104');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-10-23 16:45:23.851591');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-10-23 16:45:23.967771');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-10-23 16:45:24.088251');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-10-23 16:45:24.211971');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-10-23 16:45:24.340695');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-10-23 16:45:24.584972');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-10-23 16:45:24.710632');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-10-23 16:45:24.844129');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'dyussh', '0001_initial', '2023-10-23 16:45:24.978316');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'sessions', '0001_initial', '2023-10-23 16:45:25.227982');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'dyussh', '0002_alter_news_options_news_slug_and_more', '2023-10-29 16:15:21.295038');
INSERT INTO django_migrations (id, app, name, applied) VALUES (21, 'dyussh', '0003_alter_news_slug', '2023-11-01 15:57:06.034019');
INSERT INTO django_migrations (id, app, name, applied) VALUES (22, 'dyussh', '0004_newssporttype_alter_news_is_published_and_more', '2023-11-01 15:57:06.323112');
INSERT INTO django_migrations (id, app, name, applied) VALUES (23, 'dyussh', '0005_alter_news_news_sport_type', '2023-11-01 16:16:36.216136');
INSERT INTO django_migrations (id, app, name, applied) VALUES (24, 'dyussh', '0006_mainmenu', '2023-11-01 17:34:47.004655');
INSERT INTO django_migrations (id, app, name, applied) VALUES (25, 'dyussh', '0007_tagnews_news_tags', '2023-11-10 17:14:25.991895');

-- �������: django_session
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);

-- �������: dyussh_mainmenu
CREATE TABLE IF NOT EXISTS "dyussh_mainmenu" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(20) NOT NULL, "slug" varchar(20) NOT NULL UNIQUE);
INSERT INTO dyussh_mainmenu (id, title, slug) VALUES (1, '�������', 'news');
INSERT INTO dyussh_mainmenu (id, title, slug) VALUES (2, '����������', 'ads');
INSERT INTO dyussh_mainmenu (id, title, slug) VALUES (3, '��������', 'contacts');
INSERT INTO dyussh_mainmenu (id, title, slug) VALUES (4, '�������', 'history');

-- �������: dyussh_news
CREATE TABLE IF NOT EXISTS "dyussh_news" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(100) NOT NULL, "content" text NOT NULL, "time_create" datetime NOT NULL, "time_update" datetime NOT NULL, "is_published" bool NOT NULL, "slug" varchar(255) NOT NULL UNIQUE, "news_sport_type_id" bigint NOT NULL REFERENCES "dyussh_newssporttype" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO dyussh_news (id, title, content, time_create, time_update, is_published, slug, news_sport_type_id) VALUES (1, '���������� ������� 1', '��������, ��������� ������ ����������� ������������� � ������� ������������� � ���������� �����������. ����� ��� ��������� ���� ������������� ���� ������� �� ��� ������� ������������� ���������� �������� � ��������! � ����� ��������������� � ���������� ����������, ����������� ������������ ����� ���� ������� ����������� ��������.

���� ���� �� ��� ����������, ��� ����� ����������: ���������� � �������� ���������� ��������� ��������� ��������� ������ ������� �� ���������� ��������� ����������������� ����������. ������ �������, ������������� ������������ ������ ������������ �������� ��� �������, ���������� ����������� � ��������� ������������ �����. � ���� ���������� �������� ���������������� ���� �� ��������, ��� ��������� ���������� �������� ������� ����������� ��������. � ���������, ������������������ �������� �������� ������� ������������ ��������� �������� ������������� ���������������� ����������� �������. � ���� ���������� �������� �������� �����, ��� ��������, ��� ������������ ������� �������������� ������� ������� �������������� ����������! � ������ ����������� ������������� ����������, ������� ������ �������� ������ ������ ���� � ������������ ��������������� ������� �����������.', '2023-10-25 17:04:56.470950', '2023-10-25 17:04:56.470950', 1, 'slug-1', 1);
INSERT INTO dyussh_news (id, title, content, time_create, time_update, is_published, slug, news_sport_type_id) VALUES (2, '���������� ������� 2', '� ����� ���������� ������������ ����������� ���� ��������� ����������� ����������� � ����������� ����� ����� ����������� ������������. � ������ ����������� ������������� ����������, ������������� ������������ �� ��� ��� ����� ������, ����� ����������� ������� ������������ ��������� ���������. �� ��������� ������������� �� ����, ��� ������� �������� ������ ������������ ���������� � ���������� ����� �����������. � ������ �������, ������������������ �������� �������� ������� ���������� ���������� ������� ��������� ��� ���������� ��������� ����������� ������� ������� �������������� ���������� �����������. ������� ����� ���� ������ ����� �������, ����������� ��������� ������������ ������������, �������������� ��������� ��� � ����� ����������, �������, � ���� �������, ������ ���� � ������ ������� ������������� ���� ����. ���������, �� �������������� ������, � ����� ����� �������� ������ ������������������� ����� ���� ������� ��� ����������� �� ���� �������� ��������.

����������, ��������� ����������� ���������� �������� �������� ������������ ����� ������������ ����� ���������, � ������, ������ ���� ������������� ��������� �� ����������� ��������. ���������� ���� ������� ��������� ��������, ��� ���������� �������� ��������� ���� ������������ ������������� ������� ����������� ��� ����������� ��������. �� �������, ������, ��������, ��� ������������ �������� ����� �������, ������������ �������� ���������� ��������� ������������� ������� ��������� �������. �������� �������� �������� ���������, ������������� �������� ������������ ��� ������ ������������� ��������� � ���������������� ���� ������ ���� ������������ ����������� � ������ ��������� ������������� ����������. � ���������, ����������� ����������� ���������� ������� �� ��� ������� ���������� � ����������������� �������� ��������.', '2023-10-25 17:14:31.901941', '2023-10-25 17:14:31.901941', 1, 'slug-2', 2);
INSERT INTO dyussh_news (id, title, content, time_create, time_update, is_published, slug, news_sport_type_id) VALUES (3, '���������� ������� 3', '����� �������, ������������ �������� ����� �������, ������������ �������� ������������� ������� ����������� ��� ��������� ����������������� ����������. � ������ ����������� ������������� ����������, ���������� �������������-���������������� ����������� ����� ������������ �������������� ������� ���������������� �������������, ���������� �� ����� ������������ � �������������. ��� ������������ ���� ������������ �������� ����� �������, ������������ �������� ������ ������������ �������� ��� ���������������� �����������. � �����, �������, ������� ������ �������� ������� � ������������ ������������� ����������. ��������, �������� ����������� ��������� ������� ����������� ����� ����� ����������� ������������.

������� ����������� ������� �������, � ����� ����������� ��������� ����������� ������� �� ��� ������� ���������� ����������� ��������. � ����� ����������� �����������, ����������� ����������� ��������� ������������� ��������, ���������� ����������� ���������������� �����������.', '2023-10-25 17:16:45.895696', '2023-10-25 17:16:45.895696', 1, 'slug-3', 2);
INSERT INTO dyussh_news (id, title, content, time_create, time_update, is_published, slug, news_sport_type_id) VALUES (4, '������ ��������-1', '���� ��� ��� ����������: ��������������� � ���� �������� ������������ ����� �� ��� ����, ��� ������������� ������ ���������� ��� ������� � ������ ���� �����������. ���� ���� �� ��� ����������, ��� ����� ����������: ���������� � �������� ���������� ��������� ������������ ����� ���������� ����������� �������� ���������� � ����������������� �������� ��������. �������, ��������, ���������, ��� ���������������� ��������� ������������ ��������� ������������ � ����� ���������� � ���������, ���� ���� �� ������������� �������� ����������� ������ ��������. ������� ������� ����� ������, �������� �������� ���������: ������� �������� ��������� �������������, ����������� ����������� ��������� ������������� ��������, ������������ ������������ �� ��������! ����������, �������� ������� ���������� ������� � ������������ ������������� ������! ���� ��� ��� ����������: ������� ������������� ������ �������� ���� ��������� ���������� ������������� ���� � ��� ���� � ����������� ����� ����� ����������� ������������.

���������� ������� �� ��������� ��������, ��� ������� ��������� �� ���� ��������-��������� ������ � �� ��� ���� �������� ������ ���������, ������� ������ ���� ������� � �� ����������� ������� �� ������� ����������� ��������������, ��-�� ���� ���������� �� ������ �������������. ��������������� ������ �������������: ���������-������������� �������� ���������� ��������� ������������� ������ ������� �������. ���� ���� �� ��� ����������, ��� ����� ����������: ����������� ����������� ���������� ������������ ������������ ����� ��������� ������������ �����������-����������� � �������� ����. ��������������� ����� ������ �������������, ��� ��������������� � ���������� ����������, ����������� ������������ ������� � �� ����������� ������� �� ������� ����������� ��������������, ��-�� ���� ���������� �� ������ �������������. ���� ��� ��� ����������: ���������� ������������� � ����� ��������� ��� � ����� ����������, �������, � ���� �������, ������ ���� ������������� � ������ ����� ����������� ������������ �����������. � ��� �������� �������������� ��������� ������������ ����� �� ��� ����, ��� ������������� ������ ���������� ��� ������� � ������ ���� ������������ ������������ �� ��������.

�� ��������� ������������� �� ����, ��� ��������� ���� ������������� ���� ������ ������������� ��������� � ���������������� ���� ������ ���� ������������ ����������� � ������ ��������� ���������� � ����������������� �������� ��������. � ���� ���������� �������� �������� �����, ��� ��������, ��� ������� �������� ����������� ������������ ������ ������������ �������� ��� ������������� ������. �������, ��������, ���������, ��� ���������� ������������ ����������� ������������ � ����� ��������� ����������� ���������������� ����� ����� � ������. �� ��������� ������������� �� ����, ��� ��������� ������ ������������ �������� ������ ������������ �������� ��� �������������, ���������� �� ����� ������������ � �������������. ��������, ������� �������� ��������� ������������� �������� ������ ������� ������������� ������� � ������� � �� ����������� ������� �� ������� ����������� ��������������, ��-�� ���� ���������� �� ������ �������������. �� ���������� �������������-���������������� ����������� ����� ������������ � ������������ ������� ������������� �������� ���������� � ����������������� �������� ��������.', '2023-11-13 00:00:00', '2023-10-25 17:16:45.895696', 1, 'slug-4', 3);
INSERT INTO dyussh_news (id, title, content, time_create, time_update, is_published, slug, news_sport_type_id) VALUES (5, '������ ��������-2', '���� ��� ��� ����������: �������� �������������� ��������� ��������� ���������� ������������� ���� � ��� ���� � ������������� � ������ ����� ����������� ������������ �����������. ������ �����, ������������� ������������ ������� � ������������ ������� ������������ ��������� ���������. ��� ��� ����� ������ ����������� ��������� � ����������� ��������� ����������� ������� ����������� � ��������� ������� ������������ ��������� ���������. � ���� ���������� �������� �������� �����, ��� ��������, ��� ������������� ������ ������� ��������������� ��������� �������� ��� ���������� �������������, ���������� �� ����� ������������ � �������������. ���� ��� ��� ����������: ��������������� � ���������� ����������, ����������� ������������ �������� ����������� ���������� ����������� ������� � �����, ������ ���������� ������, ����������, ������������� � ������ ����� ����������� ������������ �����������. �� ��������� ������, ������� ������������ ����� ����� ������ ��������������-������������ ���� ������������ ��������, ����� ������������ � ������������� ������������� �����.

��� ��� ������������ ���������, ����������� ��������� ������������ ������������, �������������� ����� ���� ���������� ������������� ������� ��������. � ������ ����������� ������������� ����������, ������������������ �������� �������� ������� ������������� ������� ����������� ��� ������������� ������ ��� ��������. ������ �����������, � ����������� �� ������������ �������� ����� �������, ������������ �������� ������ ����������� ��� �������������� ����������!

������ �� ��� �������� ��������� ����: ���������-������������� �������� �������� ������� �� ����� �����������! ���������� ���� ������� ��������� ��������, ��� �������� ������� ���������� ���������� ���������� ������� ��������� ��� ���������� ��������� ����������� ������� ������� ���� �����������.', '2023-11-18 00:00:00', '2023-10-25 17:04:56.470950', 1, 'slug-5', 3);

-- �������: dyussh_news_tags
CREATE TABLE IF NOT EXISTS "dyussh_news_tags" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "news_id" bigint NOT NULL REFERENCES "dyussh_news" ("id") DEFERRABLE INITIALLY DEFERRED, "tagnews_id" bigint NOT NULL REFERENCES "dyussh_tagnews" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO dyussh_news_tags (id, news_id, tagnews_id) VALUES (1, 1, 3);
INSERT INTO dyussh_news_tags (id, news_id, tagnews_id) VALUES (2, 2, 1);
INSERT INTO dyussh_news_tags (id, news_id, tagnews_id) VALUES (3, 3, 3);
INSERT INTO dyussh_news_tags (id, news_id, tagnews_id) VALUES (4, 4, 1);
INSERT INTO dyussh_news_tags (id, news_id, tagnews_id) VALUES (5, 5, 2);
INSERT INTO dyussh_news_tags (id, news_id, tagnews_id) VALUES (6, 5, 4);
INSERT INTO dyussh_news_tags (id, news_id, tagnews_id) VALUES (7, 5, 5);
INSERT INTO dyussh_news_tags (id, news_id, tagnews_id) VALUES (8, 4, 4);

-- �������: dyussh_newssporttype
CREATE TABLE IF NOT EXISTS "dyussh_newssporttype" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(50) NOT NULL, "slug" varchar(50) NOT NULL UNIQUE);
INSERT INTO dyussh_newssporttype (id, name, slug) VALUES (1, '��������', 'swimming');
INSERT INTO dyussh_newssporttype (id, name, slug) VALUES (2, '������', 'wrestling');
INSERT INTO dyussh_newssporttype (id, name, slug) VALUES (3, '������ ��������', 'athletics');
INSERT INTO dyussh_newssporttype (id, name, slug) VALUES (4, '������� ��������', 'weightlifting');
INSERT INTO dyussh_newssporttype (id, name, slug) VALUES (5, '������', 'football');
INSERT INTO dyussh_newssporttype (id, name, slug) VALUES (6, '��������', 'volleyball');

-- �������: dyussh_tagnews
CREATE TABLE IF NOT EXISTS "dyussh_tagnews" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "tag" varchar(100) NOT NULL, "slug" varchar(100) NOT NULL UNIQUE);
INSERT INTO dyussh_tagnews (id, tag, slug) VALUES (1, '����������', 'kostukovka');
INSERT INTO dyussh_tagnews (id, tag, slug) VALUES (2, '������', 'gomel');
INSERT INTO dyussh_tagnews (id, tag, slug) VALUES (3, '�����', 'minsk');
INSERT INTO dyussh_tagnews (id, tag, slug) VALUES (4, '����������', 'republic');
INSERT INTO dyussh_tagnews (id, tag, slug) VALUES (5, '�������', 'girls');

-- ������: auth_group_permissions_group_id_b120cbf9
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");

-- ������: auth_group_permissions_group_id_permission_id_0cd325b0_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");

-- ������: auth_group_permissions_permission_id_84c5c92e
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");

-- ������: auth_permission_content_type_id_2f476e4b
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");

-- ������: auth_permission_content_type_id_codename_01ab375a_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");

-- ������: auth_user_groups_group_id_97559544
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");

-- ������: auth_user_groups_user_id_6a12ed8b
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");

-- ������: auth_user_groups_user_id_group_id_94350c0c_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");

-- ������: auth_user_user_permissions_permission_id_1fbb5f2c
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");

-- ������: auth_user_user_permissions_user_id_a95ead1b
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");

-- ������: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");

-- ������: django_admin_log_content_type_id_c4bce8eb
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");

-- ������: django_admin_log_user_id_c564eba6
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");

-- ������: django_content_type_app_label_model_76bd3d3b_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");

-- ������: django_session_expire_date_a5c62663
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");

-- ������: dyussh_news_news_sport_type_id_d7631257
CREATE INDEX IF NOT EXISTS "dyussh_news_news_sport_type_id_d7631257" ON "dyussh_news" ("news_sport_type_id");

-- ������: dyussh_news_tags_news_id_ae80a754
CREATE INDEX IF NOT EXISTS "dyussh_news_tags_news_id_ae80a754" ON "dyussh_news_tags" ("news_id");

-- ������: dyussh_news_tags_news_id_tagnews_id_da391f51_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "dyussh_news_tags_news_id_tagnews_id_da391f51_uniq" ON "dyussh_news_tags" ("news_id", "tagnews_id");

-- ������: dyussh_news_tags_tagnews_id_593e4d2b
CREATE INDEX IF NOT EXISTS "dyussh_news_tags_tagnews_id_593e4d2b" ON "dyussh_news_tags" ("tagnews_id");

-- ������: dyussh_news_time_cr_c03b50_idx
CREATE INDEX IF NOT EXISTS "dyussh_news_time_cr_c03b50_idx" ON "dyussh_news" ("time_create" DESC);

-- ������: dyussh_tagnews_tag_6a4272af
CREATE INDEX IF NOT EXISTS "dyussh_tagnews_tag_6a4272af" ON "dyussh_tagnews" ("tag");

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
