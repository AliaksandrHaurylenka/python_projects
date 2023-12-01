--
-- Файл сгенерирован с помощью SQLiteStudio v3.4.4 в Сб ноя 25 08:33:13 2023
--
-- Использованная кодировка текста: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: auth_group
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);

-- Таблица: auth_group_permissions
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);

-- Таблица: auth_permission
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

-- Таблица: auth_user
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);

-- Таблица: auth_user_groups
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);

-- Таблица: auth_user_user_permissions
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);

-- Таблица: django_admin_log
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);

-- Таблица: django_content_type
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

-- Таблица: django_migrations
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

-- Таблица: django_session
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);

-- Таблица: women_category
CREATE TABLE IF NOT EXISTS "women_category" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(100) NOT NULL, "slug" varchar(255) NOT NULL UNIQUE);
INSERT INTO women_category (id, name, slug) VALUES (1, 'Актрисы', 'aktrisy');
INSERT INTO women_category (id, name, slug) VALUES (2, 'Певицы', 'pevicy');
INSERT INTO women_category (id, name, slug) VALUES (3, 'Спортсменки', 'sportsmenky');

-- Таблица: women_tagpost
CREATE TABLE IF NOT EXISTS "women_tagpost" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "tag" varchar(100) NOT NULL, "slug" varchar(255) NOT NULL UNIQUE);
INSERT INTO women_tagpost (id, tag, slug) VALUES (1, 'Блондинки', 'blonde');
INSERT INTO women_tagpost (id, tag, slug) VALUES (2, 'Брюнетки', 'brunetky');
INSERT INTO women_tagpost (id, tag, slug) VALUES (3, 'Оскар', 'oskar');
INSERT INTO women_tagpost (id, tag, slug) VALUES (4, 'Олимпиада', 'olimpiada');
INSERT INTO women_tagpost (id, tag, slug) VALUES (5, 'Высокие', 'visokie');
INSERT INTO women_tagpost (id, tag, slug) VALUES (6, 'Средние', 'srednie');
INSERT INTO women_tagpost (id, tag, slug) VALUES (7, 'Низкие', 'niskie');

-- Таблица: women_women
CREATE TABLE IF NOT EXISTS "women_women" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(255) NOT NULL, "content" text NOT NULL, "time_create" datetime NOT NULL, "time_update" datetime NOT NULL, "is_published" bool NOT NULL, "slug" varchar(255) NOT NULL UNIQUE, "cat_id" bigint NOT NULL REFERENCES "women_category" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO women_women (id, title, content, time_create, time_update, is_published, slug, cat_id) VALUES (1, 'Анжелина Джоли', 'Анджелина Джоли (англ. Angelina Jolie[7], при рождении Войт (англ. Voight), ранее Джоли Питт (англ. Jolie Pitt); род. 4 июня 1975, Лос-Анджелес, Калифорния, США) — американская актриса кино, телевидения и озвучивания, кинорежиссёр, сценаристка, продюсер, фотомодель, посол доброй воли ООН.

Обладательница премии «Оскар», трёх премий «Золотой глобус» (первая актриса в истории, три года подряд выигравшая премию) и двух «Премий Гильдии киноактёров США».

Дебютировала в кино в 1982 году, сыграв роль в комедийном фильме «В поисках выхода» (где снимались также её отец и мать)[8], однако известность получила после того, как сыграла героиню видеоигр Лару Крофт в фильмах «Лара Крофт: Расхитительница гробниц» и «Лара Крофт: Расхитительница гробниц 2 — Колыбель жизни».

В 2009, 2011 и 2013 годах по версии журнала Forbes Джоли была названа самой высокооплачиваемой актрисой Голливуда[9][10].

Её наиболее успешными с коммерческой стороны фильмами стали «Малефисента» (сборы в мировом прокате — 758 миллионов долларов США), «Мистер и миссис Смит» (сборы в мировом прокате — 478 миллионов долларов США), «Особо опасен» (341 миллион долларов США), «Солт» (293 миллиона долларов США), а также «Турист» (278 миллионов долларов США), «Лара Крофт: Расхитительница гробниц» (274 миллиона долларов США) и картина с участием Николаса Кейджа «Угнать за 60 секунд» (237 миллионов долларов США).', '2023-10-25 16:01:39.938216', '2023-10-25 16:01:39.938216', 1, 'andjelina-djoli', 1);
INSERT INTO women_women (id, title, content, time_create, time_update, is_published, slug, cat_id) VALUES (2, 'Елена Толстоганова', 'Родилась 24 марта 1972 года в Москве в семье инженера и преподавательницы английского языка. У Виктории три младшие сестры[2].

В школьные годы поступила в Театр юных москвичей (ТЮМ) при Дворце пионеров на Ленинских горах, где профессионально занималась театральным искусством[3].

После окончания средней школы три года подряд пыталась поступить в театральный ВУЗ. В 1992 году Виктория прошла отбор одновременно во ВГИК и в ГИТИС. Её выбор пал на ГИТИС, училась на курсе Народного артиста РСФСР, профессора Леонида Ефимовича Хейфеца, где прошла традиционную школу русского психологического театра. В 1996 году окончила институт. Ещё будучи студенткой, была приглашена в труппу Московского драматического театра имени К. С. Станиславского, где прослужила до середины 2000-х годов[3]. С 2019 года сотрудничает с Московским театром «Современник», позже вошла в труппу театра[4].

В кино дебютировала в 1997 году, сыграв главную роль в короткометражном художественном фильме режиссёра Романа Хруща «Дневная обязанность»[5]. Впоследствии, играла во множестве фильмов и сериалов, в их числе: «Ландыш серебристый», «Магнитные бури», «Движение вверх» и «Медиатор». В конце апреля 2022 года в российский прокат вышел триллер Ладо Кватании «Казнь», в котором Виктория исполнила одну из главных ролей. Также в фильме сыграли Нико Тавадзе, Евгений Ткачук и Аглая Тарасова[6].', '2023-10-25 16:54:21.817505', '2023-10-27 14:52:34.998222', 1, 'elena-tolstoganova', 1);
INSERT INTO women_women (id, title, content, time_create, time_update, is_published, slug, cat_id) VALUES (3, 'Джулия Робертс', 'Джулия Фиона Робертс (англ. Julia Fiona Roberts; род. 28 октября 1967, Атланта, Джорджия, США) — американская актриса кино и телевидения, продюсер. Первым успехом Джулии Робертс в кино стала роль в фильме «Стальные магнолии» (1989), за которую она получила премию «Золотой глобус» и номинацию на премию «Оскар» за «Лучшую женскую роль второго плана» в 1990 году. Через год она приобрела статус «звезды Голливуда» после исполнения главной роли в мелодраме «Красотка» (1990), принёсшей ей вторую премию «Золотой глобус», вторую номинацию на премию «Оскар» и номинацию на премию BAFTA в категории «Лучшая женская роль» в 1991 году.

В 2001 году, сыграв главную роль в биографическом фильме «Эрин Брокович» (2000), Робертс стала обладательницей множества наград, в том числе премии «Оскар», третьей премии «Золотой глобус», премии BAFTA и «Премии Гильдии киноактёров США» в номинации «Лучшая женская роль». В 2014 году Джулия Робертс была номинирована на премии «Оскар», «Золотой глобус» и BAFTA, а также на «Премию Гильдии киноактёров США» за «Лучшую женскую роль второго плана» в фильме «Август: Графство Осейдж» (2013).

Джулия Робертс — одна из самых высокооплачиваемых актрис в мире[4]. Фильмы с её участием принесли в мировом прокате прибыль на сумму свыше двух миллиардов долларов[5].

Родилась 28 октября 1967 года в городе Смирна (штат Джорджия, США)[6][7]. Будущая актриса стала третьим ребёнком в семье. У неё есть старший брат Эрик Робертс (род. 18 апреля 1956) и сестра Лиза (род. 5 августа 1965). Отец Джулии, Уолтер Грэйди Робертс (1933—1977), был продавцом водяных матрацев и одновременно был актёром и писателем. Мать Джулии, Бетти Лу Бредемас, работавшая секретарём в церковном приходе и по совместительству актриса, родилась в Миннеаполисе в 1934 году. Робертс имеет ирландские, шотландские, валлийские, английские, немецкие и шведские корни[8].

Родители Джулии на момент её появления в семье находились в тяжёлом финансовом положении. Отец Робертс владел маленькой актёрской школой для детей в Декейтере (Джорджия), которую посещали дети Мартина Лютера Кинга. Когда миссис Робертс родила Джулию, Кинг в знак благодарности за внимание к своим детям оплатил больничный счёт[9].

В 1971 году, когда Джулии исполнилось 4 года, её мать Бетти Лу Робертс подала на развод. В следующем году она повторно вышла замуж за театрального критика Майкла Моутса (Michael Motes). В браке матери Джулии и Майкла родилась дочь Нэнси Моутс (Nancy Motes), которая скончалась 9 февраля 2014 года в Лос-Анджелесе в результате передозировки наркотиками в возрасте 37 лет[10][11]. Брак Бетти Лу с Моутсом распался в 1983 году. Позже Бетти называла это замужество «большой ошибкой»: отчим применял физическое насилие к детям Бетти. Спустя годы Эрик Робертс сделал несколько публичных заявлений на эту болезненную для Джулии тему. Джулия не только не одобрила поступок брата, но и сама никогда не выступала с откровениями о своём тяжёлом детстве из уважения к своей матери и сестре Нэнси.
', '2023-10-25 16:55:15.128045', '2023-10-25 16:55:15.128045', 1, 'djuliya-roberts', 2);
INSERT INTO women_women (id, title, content, time_create, time_update, is_published, slug, cat_id) VALUES (4, 'Екатерина Гусева', 'Родилась 9 июля 1976 года в городе Москве.

Отец, Константин Васильевич Гусев — портной, мать, Тамара Михайловна Гусева, работает главным инспектором в Административно-технической инспекции города Москвы[2]. За время учёбы в школе Екатерина перепробовала множество занятий — спортивная гимнастика, фигурное катание, плавание, танцы, школьный театр.

Собиралась поступать в Московский биотехнологический институт, но на одном из школьных «капустников» её заметила ассистентка Евгения Рубеновича Симонова и предложила попробовать поступить в высшее театральное училище имени Б. В. Щукина. В 1993 году она поступила на курс Е. Р. Симонова, после смерти Симонова курс вела В. П. Николаенко.', '2023-10-25 16:55:56.158872', '2023-10-25 16:55:56.158872', 1, 'ekaterina-guseva', 3);
INSERT INTO women_women (id, title, content, time_create, time_update, is_published, slug, cat_id) VALUES (5, 'Ариана Гранде', 'Ариана Гранде-Бутера[3] (англ. Ariana Grande-Butera; род. 26 июня 1993, Бока-Ратон, Флорида)  американская певица, актриса, автор песен, музыкальный продюсер[4][5], обладательница премии Грэмми[6].

Профессиональную карьеру в шоу-бизнесе Ариана Гранде начала в 2008 году в бродвейском мюзикле 13. В 2009 году она получила роль Кэт Валентайн в телевизионном сериале Виктория-победительница на канале Nickelodeon, потом продолжила играть её же в телесериале Сэм и Кэт, выходившем в 20132014 годах. Ариана также принимала участие в записи саундтреков и озвучивании мультфильмов (в частности, мультсериала Клуб Винкс). В 2015 году она вернулась на телеэкраны с эпизодической ролью Сони Херфман в сериале Королевы  крика.', '2023-11-10 16:28:52.876172', '2023-11-10 16:28:52.876172', 1, 'ariana-grande', 2);

-- Таблица: women_women_tags
CREATE TABLE IF NOT EXISTS "women_women_tags" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "women_id" bigint NOT NULL REFERENCES "women_women" ("id") DEFERRABLE INITIALLY DEFERRED, "tagpost_id" bigint NOT NULL REFERENCES "women_tagpost" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO women_women_tags (id, women_id, tagpost_id) VALUES (1, 1, 2);
INSERT INTO women_women_tags (id, women_id, tagpost_id) VALUES (3, 1, 5);
INSERT INTO women_women_tags (id, women_id, tagpost_id) VALUES (4, 2, 2);
INSERT INTO women_women_tags (id, women_id, tagpost_id) VALUES (5, 5, 2);
INSERT INTO women_women_tags (id, women_id, tagpost_id) VALUES (6, 5, 5);

-- Индекс: auth_group_permissions_group_id_b120cbf9
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");

-- Индекс: auth_group_permissions_group_id_permission_id_0cd325b0_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");

-- Индекс: auth_group_permissions_permission_id_84c5c92e
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");

-- Индекс: auth_permission_content_type_id_2f476e4b
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");

-- Индекс: auth_permission_content_type_id_codename_01ab375a_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");

-- Индекс: auth_user_groups_group_id_97559544
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");

-- Индекс: auth_user_groups_user_id_6a12ed8b
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");

-- Индекс: auth_user_groups_user_id_group_id_94350c0c_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");

-- Индекс: auth_user_user_permissions_permission_id_1fbb5f2c
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");

-- Индекс: auth_user_user_permissions_user_id_a95ead1b
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");

-- Индекс: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");

-- Индекс: django_admin_log_content_type_id_c4bce8eb
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");

-- Индекс: django_admin_log_user_id_c564eba6
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");

-- Индекс: django_content_type_app_label_model_76bd3d3b_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");

-- Индекс: django_session_expire_date_a5c62663
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");

-- Индекс: women_tagpost_tag_04597d63
CREATE INDEX IF NOT EXISTS "women_tagpost_tag_04597d63" ON "women_tagpost" ("tag");

-- Индекс: women_women_cat_id_e0424379
CREATE INDEX IF NOT EXISTS "women_women_cat_id_e0424379" ON "women_women" ("cat_id");

-- Индекс: women_women_tags_tagpost_id_af7946fe
CREATE INDEX IF NOT EXISTS "women_women_tags_tagpost_id_af7946fe" ON "women_women_tags" ("tagpost_id");

-- Индекс: women_women_tags_women_id_043c6697
CREATE INDEX IF NOT EXISTS "women_women_tags_women_id_043c6697" ON "women_women_tags" ("women_id");

-- Индекс: women_women_tags_women_id_tagpost_id_3de4fc91_uniq
CREATE UNIQUE INDEX IF NOT EXISTS "women_women_tags_women_id_tagpost_id_3de4fc91_uniq" ON "women_women_tags" ("women_id", "tagpost_id");

-- Индекс: women_women_time_cr_9f33c2_idx
CREATE INDEX IF NOT EXISTS "women_women_time_cr_9f33c2_idx" ON "women_women" ("time_create" DESC);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
