--
-- ���� ������������ � ������� SQLiteStudio v3.4.4 � �� ��� 25 08:33:13 2023
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
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (25, 7, 'add_women', 'Can add women');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (26, 7, 'change_women', 'Can change women');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (27, 7, 'delete_women', 'Can delete women');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (28, 7, 'view_women', 'Can view women');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (29, 8, 'add_category', 'Can add category');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (30, 8, 'change_category', 'Can change category');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (31, 8, 'delete_category', 'Can delete category');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (32, 8, 'view_category', 'Can view category');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (33, 9, 'add_tagpost', 'Can add tag post');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (34, 9, 'change_tagpost', 'Can change tag post');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (35, 9, 'delete_tagpost', 'Can delete tag post');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (36, 9, 'view_tagpost', 'Can view tag post');

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
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'women', 'women');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'women', 'category');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'women', 'tagpost');

-- �������: django_migrations
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2023-10-23 16:40:54.226922');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'auth', '0001_initial', '2023-10-23 16:40:54.645420');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'admin', '0001_initial', '2023-10-23 16:40:54.940833');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-10-23 16:40:55.066272');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-23 16:40:55.190220');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-10-23 16:40:55.359295');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-10-23 16:40:55.587765');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-10-23 16:40:55.739905');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-10-23 16:40:55.881867');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-10-23 16:40:56.011697');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-10-23 16:40:56.142760');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-10-23 16:40:56.258240');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-10-23 16:40:56.383121');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-10-23 16:40:56.512524');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-10-23 16:40:56.660985');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-10-23 16:40:56.773564');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-10-23 16:40:56.888245');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'sessions', '0001_initial', '2023-10-23 16:40:57.100382');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'women', '0001_initial', '2023-10-23 16:40:57.201585');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'women', '0002_alter_women_options_women_slug_and_more', '2023-10-29 16:03:44.008042');
INSERT INTO django_migrations (id, app, name, applied) VALUES (21, 'women', '0003_alter_women_slug', '2023-10-29 16:12:21.031847');
INSERT INTO django_migrations (id, app, name, applied) VALUES (22, 'women', '0004_category_alter_women_is_published_women_cat', '2023-11-01 15:21:16.833479');
INSERT INTO django_migrations (id, app, name, applied) VALUES (23, 'women', '0005_alter_women_cat', '2023-11-01 15:44:00.097620');
INSERT INTO django_migrations (id, app, name, applied) VALUES (24, 'women', '0006_tagpost_women_tags', '2023-11-10 16:17:19.800963');

-- �������: django_session
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);

-- �������: women_category
CREATE TABLE IF NOT EXISTS "women_category" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL, "slug" varchar(255) NOT NULL UNIQUE);
INSERT INTO women_category (id, name, slug) VALUES (1, '�������', 'aktrisy');
INSERT INTO women_category (id, name, slug) VALUES (2, '������', 'pevicy');
INSERT INTO women_category (id, name, slug) VALUES (3, '�����������', 'sportsmenky');

-- �������: women_tagpost
CREATE TABLE IF NOT EXISTS "women_tagpost" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "tag" varchar(100) NOT NULL, "slug" varchar(255) NOT NULL UNIQUE);
INSERT INTO women_tagpost (id, tag, slug) VALUES (1, '���������', 'blonde');
INSERT INTO women_tagpost (id, tag, slug) VALUES (2, '��������', 'brunetky');
INSERT INTO women_tagpost (id, tag, slug) VALUES (3, '�����', 'oskar');
INSERT INTO women_tagpost (id, tag, slug) VALUES (4, '���������', 'olimpiada');
INSERT INTO women_tagpost (id, tag, slug) VALUES (5, '�������', 'visokie');
INSERT INTO women_tagpost (id, tag, slug) VALUES (6, '�������', 'srednie');
INSERT INTO women_tagpost (id, tag, slug) VALUES (7, '������', 'niskie');

-- �������: women_women
CREATE TABLE IF NOT EXISTS "women_women" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(255) NOT NULL, "content" text NOT NULL, "time_create" datetime NOT NULL, "time_update" datetime NOT NULL, "is_published" bool NOT NULL, "slug" varchar(255) NOT NULL UNIQUE, "cat_id" bigint NOT NULL REFERENCES "women_category" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO women_women (id, title, content, time_create, time_update, is_published, slug, cat_id) VALUES (1, '�������� �����', '��������� ����� (����. Angelina Jolie[7], ��� �������� ���� (����. Voight), ����� ����� ���� (����. Jolie Pitt); ���. 4 ���� 1975, ���-��������, ����������, ���) � ������������ ������� ����, ����������� � �����������, �����������, �����������, ��������, ����������, ����� ������ ���� ���.

�������������� ������ ������, ��� ������ �������� ������ (������ ������� � �������, ��� ���� ������ ���������� ������) � ���� ������� ������� ���������� ����.

������������ � ���� � 1982 ����, ������ ���� � ���������� ������ �� ������� ������ (��� ��������� ����� � ���� � ����)[8], ������ ����������� �������� ����� ����, ��� ������� ������� �������� ���� ����� � ������� ����� �����: ��������������� �������� � ����� �����: ��������������� ������� 2 � �������� �����.

� 2009, 2011 � 2013 ����� �� ������ ������� Forbes ����� ���� ������� ����� ������������������ �������� ���������[9][10].

Ÿ �������� ��������� � ������������ ������� �������� ����� ������������ (����� � ������� ������� � 758 ��������� �������� ���), ������� � ������ ���� (����� � ������� ������� � 478 ��������� �������� ���), ������ ������ (341 ������� �������� ���), ����� (293 �������� �������� ���), � ����� ������� (278 ��������� �������� ���), ����� �����: ��������������� �������� (274 �������� �������� ���) � ������� � �������� �������� ������ ������� �� 60 ������ (237 ��������� �������� ���).', '2023-10-25 16:01:39.938216', '2023-10-25 16:01:39.938216', 1, 'andjelina-djoli', 1);
INSERT INTO women_women (id, title, content, time_create, time_update, is_published, slug, cat_id) VALUES (2, '����� ������������', '�������� 24 ����� 1972 ���� � ������ � ����� �������� � ����������������� ����������� �����. � �������� ��� ������� ������[2].

� �������� ���� ��������� � ����� ���� ��������� (���) ��� ������ �������� �� ��������� �����, ��� ��������������� ���������� ����������� ����������[3].

����� ��������� ������� ����� ��� ���� ������ �������� ��������� � ����������� ���. � 1992 ���� �������� ������ ����� ������������ �� ���� � � �����. Ÿ ����� ��� �� �����, ������� �� ����� ��������� ������� �����, ���������� ������� ��������� �������, ��� ������ ������������ ����� �������� ���������������� ������. � 1996 ���� �������� ��������. ��� ������ ����������, ���� ���������� � ������ ����������� �������������� ������ ����� �. �. ��������������, ��� ���������� �� �������� 2000-� �����[3]. � 2019 ���� ������������ � ���������� ������� ������������, ����� ����� � ������ ������[4].

� ���� ������������ � 1997 ����, ������ ������� ���� � ���������������� �������������� ������ �������� ������ ����� �������� ������������[5]. ������������, ������ �� ��������� ������� � ��������, � �� �����: ������� �����������, ���������� ����, ��������� ������ � ���������. � ����� ������ 2022 ���� � ���������� ������ ����� ������� ���� �������� �������, � ������� �������� ��������� ���� �� ������� �����. ����� � ������ ������� ���� �������, ������� ������ � ����� ��������[6].', '2023-10-25 16:54:21.817505', '2023-10-27 14:52:34.998222', 1, 'elena-tolstoganova', 1);
INSERT INTO women_women (id, title, content, time_create, time_update, is_published, slug, cat_id) VALUES (3, '������ �������', '������ ����� ������� (����. Julia Fiona Roberts; ���. 28 ������� 1967, �������, ��������, ���) � ������������ ������� ���� � �����������, ��������. ������ ������� ������ ������� � ���� ����� ���� � ������ ��������� �������� (1989), �� ������� ��� �������� ������ �������� ������ � ��������� �� ������ ������ �� ������� ������� ���� ������� ����� � 1990 ����. ����� ��� ��� ��������� ������ ������� ��������� ����� ���������� ������� ���� � ��������� ��������� (1990), �������� �� ������ ������ �������� ������, ������ ��������� �� ������ ������ � ��������� �� ������ BAFTA � ��������� ������� ������� ����� � 1991 ����.

� 2001 ����, ������ ������� ���� � �������������� ������ ����� ��������� (2000), ������� ����� ��������������� ��������� ������, � ��� ����� ������ ������, ������� ������ �������� ������, ������ BAFTA � ������� ������� ���������� ���� � ��������� ������� ������� �����. � 2014 ���� ������ ������� ���� ������������ �� ������ ������, �������� ������ � BAFTA, � ����� �� ������� ������� ���������� ���� �� ������� ������� ���� ������� ����� � ������ �������: �������� ������ (2013).

������ ������� � ���� �� ����� ������������������ ������ � ����[4]. ������ � � �������� �������� � ������� ������� ������� �� ����� ����� ���� ���������� ��������[5].

�������� 28 ������� 1967 ���� � ������ ������ (���� ��������, ���)[6][7]. ������� ������� ����� ������� ������� � �����. � �� ���� ������� ���� ���� ������� (���. 18 ������ 1956) � ������ ���� (���. 5 ������� 1965). ���� ������, ������ ������ ������� (1933�1977), ��� ��������� ������� �������� � ������������ ��� ������ � ���������. ���� ������, ����� �� ��������, ���������� ��������� � ��������� ������� � �� ���������������� �������, �������� � ������������ � 1934 ����. ������� ����� ����������, �����������, ����������, ����������, �������� � �������� �����[8].

�������� ������ �� ������ � ��������� � ����� ���������� � ������ ���������� ���������. ���� ������� ������ ��������� �������� ������ ��� ����� � ��������� (��������), ������� �������� ���� ������� ������ �����. ����� ������ ������� ������ ������, ���� � ���� ������������� �� �������� � ����� ����� ������� ���������� ����[9].

� 1971 ����, ����� ������ ����������� 4 ����, � ���� ����� �� ������� ������ �� ������. � ��������� ���� ��� �������� ����� ����� �� ������������ ������� ������ ������ (Michael Motes). � ����� ������ ������ � ������ �������� ���� ����� ����� (Nancy Motes), ������� ���������� 9 ������� 2014 ���� � ���-��������� � ���������� ������������� ����������� � �������� 37 ���[10][11]. ���� ����� �� � ������� �������� � 1983 ����. ����� ����� �������� ��� ���������� �������� �������: ����� �������� ���������� ������� � ����� �����. ������ ���� ���� ������� ������ ��������� ��������� ��������� �� ��� ����������� ��� ������ ����. ������ �� ������ �� �������� �������� �����, �� � ���� ������� �� ��������� � ������������ � ���� ������ ������� �� �������� � ����� ������ � ������ �����.
', '2023-10-25 16:55:15.128045', '2023-10-25 16:55:15.128045', 1, 'djuliya-roberts', 2);
INSERT INTO women_women (id, title, content, time_create, time_update, is_published, slug, cat_id) VALUES (4, '��������� ������', '�������� 9 ���� 1976 ���� � ������ ������.

����, ���������� ���������� ����� � �������, ����, ������ ���������� ������, �������� ������� ����������� � ���������������-����������� ��������� ������ ������[2]. �� ����� ����� � ����� ��������� ������������� ��������� ������� � ���������� ����������, �������� �������, ��������, �����, �������� �����.

���������� ��������� � ���������� ������������������ ��������, �� �� ����� �� �������� ������������ � �������� ����������� ������� ���������� �������� � ���������� ����������� ��������� � ������ ����������� ������� ����� �. �. ������. � 1993 ���� ��� ��������� �� ���� �. �. ��������, ����� ������ �������� ���� ���� �. �. ����������.', '2023-10-25 16:55:56.158872', '2023-10-25 16:55:56.158872', 1, 'ekaterina-guseva', 3);
INSERT INTO women_women (id, title, content, time_create, time_update, is_published, slug, cat_id) VALUES (5, '������ ������', '������ ������-������[3] (����. Ariana Grande-Butera; ���. 26 ���� 1993, ����-�����, �������)  ������������ ������, �������, ����� �����, ����������� ��������[4][5], �������������� ������ ������[6].

���������������� ������� � ���-������� ������ ������ ������ � 2008 ���� � ����������� ������� 13. � 2009 ���� ��� �������� ���� ��� ��������� � ������������� ������� ��������-�������������� �� ������ Nickelodeon, ����� ���������� ������ � �� � ����������� ��� � ���, ���������� � 20132014 �����. ������ ����� ��������� ������� � ������ ����������� � ����������� ������������ (� ���������, ������������ ���� �����). � 2015 ���� ��� ��������� �� ���������� � ������������� ����� ���� ������� � ������� ��������  �����.', '2023-11-10 16:28:52.876172', '2023-11-10 16:28:52.876172', 1, 'ariana-grande', 2);

-- �������: women_women_tags
CREATE TABLE IF NOT EXISTS "women_women_tags" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "women_id" bigint NOT NULL REFERENCES "women_women" ("id") DEFERRABLE INITIALLY DEFERRED, "tagpost_id" bigint NOT NULL REFERENCES "women_tagpost" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO women_women_tags (id, women_id, tagpost_id) VALUES (1, 1, 2);
INSERT INTO women_women_tags (id, women_id, tagpost_id) VALUES (3, 1, 5);
INSERT INTO women_women_tags (id, women_id, tagpost_id) VALUES (4, 2, 2);
INSERT INTO women_women_tags (id, women_id, tagpost_id) VALUES (5, 5, 2);
INSERT INTO women_women_tags (id, women_id, tagpost_id) VALUES (6, 5, 5);

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

-- ������: women_tagpost_tag_04597d63
CREATE INDEX IF NOT EXISTS "women_tagpost_tag_04597d63" ON "women_tagpost" ("tag");

-- ������: women_women_cat_id_e0424379
CREATE INDEX IF NOT EXISTS "women_women_cat_id_e0424379" ON "women_women" ("cat_id");

-- ������: women_women_tags_tagpost_id_af7946fe
CREATE INDEX IF NOT EXISTS "women_women_tags_tagpost_id_af7946fe" ON "women_women_tags" ("tagpost_id");

-- ������: women_women_tags_women_id_043c6697
CREATE INDEX IF NOT EXISTS "women_women_tags_women_id_043c6697" ON "women_women_tags" ("women_id");

-- ������: women_women_tags_women_id_tagpost_id_3de4fc91_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "women_women_tags_women_id_tagpost_id_3de4fc91_uniq" ON "women_women_tags" ("women_id", "tagpost_id");

-- ������: women_women_time_cr_9f33c2_idx
CREATE INDEX IF NOT EXISTS "women_women_time_cr_9f33c2_idx" ON "women_women" ("time_create" DESC);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
