USE staff;
SET foreign_key_checks = 0;

CREATE TABLE IF NOT EXISTS applicant_bad_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(50) NOT NULL COMMENT 'тип проступка',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'чёрный список соискателей';



CREATE TABLE IF NOT EXISTS base (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  version VARCHAR(10) NOT NULL COMMENT 'версия',
  date_update DATETIME DEFAULT NULL COMMENT 'дата актуализации',
  PRIMARY KEY (code)
)
COMMENT = 'служебная таблица';

--
-- Описание для таблицы business_code
--

CREATE TABLE IF NOT EXISTS business_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(50) NOT NULL COMMENT 'название бизнеса',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'таблица видов бизнеса';

--
-- Описание для таблицы cattell_query
--

CREATE TABLE IF NOT EXISTS cattell_query (
  number SMALLINT UNSIGNED NOT NULL COMMENT 'порядковый номер',
  query VARCHAR(255) NOT NULL COMMENT 'вопрос',
  answer_1 VARCHAR(120) NOT NULL COMMENT '1-й вариант ответа',
  answer_2 VARCHAR(120) NOT NULL COMMENT '2-й вариант ответа',
  answer_3 VARCHAR(120) NOT NULL COMMENT '3-й вариант ответа',
  factor VARCHAR(2) NOT NULL COMMENT 'фактор',
  score_1 TINYINT UNSIGNED NOT NULL COMMENT 'баллы за 1-й вариант ответа',
  score_2 TINYINT NOT NULL COMMENT 'баллы за 2-й вариант ответа',
  score_3 TINYINT NOT NULL COMMENT 'баллы за 3-й вариант ответа',
  score_1_md TINYINT NOT NULL COMMENT 'баллы фактор md 1-й вариант ответа',
  score_3_md TINYINT UNSIGNED NOT NULL COMMENT 'баллы фактор md 3-й вариант ответа',
  score_1_fb TINYINT UNSIGNED NOT NULL COMMENT 'баллы фактор fb 1-й вариант ответа',
  score_3_fb TINYINT UNSIGNED NOT NULL COMMENT 'баллы фактор fb 3-й вариант ответа',
  answer_code SMALLINT UNSIGNED DEFAULT NULL COMMENT 'код варианта ответа',
  answer_view VARCHAR(1) DEFAULT NULL COMMENT 'а), б) или в) для обработки оператором'
)
COMMENT = 'шаблон опросника КЕТТЕЛЛ';

--
-- Описание для таблицы cattell_sten
--

CREATE TABLE IF NOT EXISTS cattell_sten (
  number SMALLINT UNSIGNED NOT NULL COMMENT 'бесполезный код',
  sex TINYINT UNSIGNED NOT NULL COMMENT 'пол',
  age_min SMALLINT UNSIGNED NOT NULL COMMENT 'минимальный возраст',
  age_max SMALLINT UNSIGNED NOT NULL COMMENT 'максимальный возраст',
  factor VARCHAR(2) NOT NULL COMMENT 'фактор',
  sten1 SMALLINT NOT NULL COMMENT 'максимальная граница возраста',
  sten2 SMALLINT NOT NULL COMMENT 'максимальная граница возраста',
  sten3 SMALLINT NOT NULL COMMENT 'максимальная граница возраста',
  sten4 SMALLINT NOT NULL COMMENT 'максимальная граница возраста',
  sten5 SMALLINT NOT NULL COMMENT 'максимальная граница возраста',
  sten6 SMALLINT NOT NULL COMMENT 'максимальная граница возраста',
  sten7 SMALLINT NOT NULL COMMENT 'максимальная граница возраста',
  sten8 SMALLINT NOT NULL COMMENT 'максимальная граница возраста',
  sten9 SMALLINT NOT NULL COMMENT 'максимальная граница возраста'
)
COMMENT = 'таблица перевода сырых балов в стены';

--
-- Описание для таблицы cattell_text
--

CREATE TABLE IF NOT EXISTS cattell_text (
  factor VARCHAR(5) DEFAULT NULL COMMENT 'фактор',
  `group` SMALLINT DEFAULT NULL COMMENT 'группа фактора',
  min SMALLINT DEFAULT NULL COMMENT 'минимальное значение фактора',
  max SMALLINT DEFAULT NULL COMMENT 'максимальное значение фактора',
  personalities TEXT DEFAULT NULL COMMENT 'свойства личности',
  conclusion TEXT DEFAULT NULL COMMENT 'профзаключение',
  recommendation TEXT DEFAULT NULL COMMENT 'рекомендации'
)
COMMENT = 'текстовая интерпретация факторов';

--
-- Описание для таблицы contact_method_code
--

CREATE TABLE IF NOT EXISTS contact_method_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(32) CHARACTER SET cp1251 COLLATE cp1251_general_ci NOT NULL,
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COLLATE utf8_general_ci;

--
-- Описание для таблицы contact_type_code
--

CREATE TABLE IF NOT EXISTS contact_type_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(32) CHARACTER SET cp1251 COLLATE cp1251_general_ci NOT NULL,
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COLLATE utf8_general_ci;

--
-- Описание для таблицы criterion_code
--

CREATE TABLE IF NOT EXISTS criterion_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ключевое поле',
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'TIMESTAMP',
  name VARCHAR(50) NOT NULL COMMENT 'название критерия',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COLLATE utf8_general_ci;

--
-- Описание для таблицы customer_bad_code
--

CREATE TABLE IF NOT EXISTS customer_bad_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(50) NOT NULL COMMENT 'название проступка',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'чёрный список заказчиков';

--
-- Описание для таблицы customer_code
--

CREATE TABLE IF NOT EXISTS customer_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(50) NOT NULL COMMENT 'тип заказчика',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'классификация заказчиков';

--
-- Описание для таблицы education_code
--

CREATE TABLE IF NOT EXISTS education_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(30) NOT NULL COMMENT 'тип обучения',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'таблица типов обучения';

--
-- Описание для таблицы family_code
--

CREATE TABLE IF NOT EXISTS family_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(30) NOT NULL COMMENT 'тип семейных отношений',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'таблица кодов семейных отношений';

--
-- Описание для таблицы formation_code
--

CREATE TABLE IF NOT EXISTS formation_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(40) NOT NULL COMMENT 'тип образования',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'таблица кодов образования';

--
-- Описание для таблицы housing_code
--

CREATE TABLE IF NOT EXISTS housing_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(30) NOT NULL COMMENT 'вид проживания',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'таблица видов проживания';

--
-- Описание для таблицы language_code
--

CREATE TABLE IF NOT EXISTS language_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(20) NOT NULL COMMENT 'название языка',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'таблица кодов иностранных языков';

--
-- Описание для таблицы locus_query
--

CREATE TABLE IF NOT EXISTS locus_query (
  number SMALLINT NOT NULL COMMENT 'порядковый номер сравнения',
  statement_1 VARCHAR(120) NOT NULL COMMENT 'Экстернальность',
  code_1 SMALLINT NOT NULL COMMENT 'код Экстернальность',
  statement_2 VARCHAR(120) NOT NULL COMMENT 'Интернальность',
  code_2 SMALLINT NOT NULL COMMENT 'код Интернальность',
  answer_code SMALLINT DEFAULT NULL COMMENT 'код выбранного утверждения',
  answer_view VARCHAR(1) DEFAULT NULL COMMENT 'а) или б) для обработки оператором'
)
COMMENT = 'шаблон теста локус контроля';

--
-- Описание для таблицы need_query
--

CREATE TABLE IF NOT EXISTS need_query (
  number SMALLINT NOT NULL COMMENT 'порядковый номер сравнения',
  statement_1 VARCHAR(60) NOT NULL COMMENT '1-е утверждение',
  code_1 SMALLINT NOT NULL COMMENT 'код 1-го утверждения',
  statement_2 VARCHAR(60) NOT NULL COMMENT '2-е утверждение',
  code_2 SMALLINT NOT NULL COMMENT 'код 2-го утверждения',
  answer_code SMALLINT DEFAULT NULL COMMENT 'код выбранного утверждения',
  answer_view VARCHAR(1) DEFAULT NULL COMMENT 'а) или б) для обработки оператором'
)
COMMENT = 'шаблон опросника парных сравнений';

--
-- Описание для таблицы placement_close_code
--

CREATE TABLE IF NOT EXISTS placement_close_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(50) NOT NULL COMMENT 'причина закрытия заказа',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'таблица кодов закрытия заказа';

--
-- Описание для таблицы profession_book
--

CREATE TABLE IF NOT EXISTS profession_book (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(64) NOT NULL COMMENT 'название профессии',
  parent INT NOT NULL COMMENT 'код родителя',
  folder TINYINT NOT NULL COMMENT 'индикатор папки',
  PRIMARY KEY (code)
)
COMMENT = 'справочник профессий';

--
-- Описание для таблицы program_book
--

CREATE TABLE IF NOT EXISTS program_book (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(64) NOT NULL COMMENT 'название программы',
  parent INT NOT NULL COMMENT 'код родителя',
  folder TINYINT NOT NULL COMMENT 'флаг папки',
  PRIMARY KEY (code)
)
COMMENT = 'справочник программ';

--
-- Описание для таблицы psychology
--

CREATE TABLE IF NOT EXISTS psychology (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'уникальный код',
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'TIMESTAMP',
  date_registration DATETIME DEFAULT NULL COMMENT 'дата регистрации',
  surname VARCHAR(30) NOT NULL DEFAULT 'Новая пустая запись' COMMENT 'фамилия',
  name VARCHAR(30) DEFAULT NULL COMMENT 'имя',
  patronymic VARCHAR(30) DEFAULT NULL COMMENT 'отчество',
  birthday DATETIME DEFAULT NULL COMMENT 'дата рождения',
  sex TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пол',
  iq TINYINT UNSIGNED DEFAULT NULL COMMENT 'интеллект',
  a_ TINYINT DEFAULT NULL COMMENT 'общительность (без коррекции)',
  a TINYINT UNSIGNED DEFAULT NULL COMMENT 'общительность',
  b TINYINT UNSIGNED DEFAULT NULL COMMENT 'способность к обучению',
  c_ TINYINT DEFAULT NULL COMMENT 'эмоциональная устойчивость (без коррекции)',
  c TINYINT UNSIGNED DEFAULT NULL COMMENT 'эмоциональная устойчивость',
  e TINYINT UNSIGNED DEFAULT NULL COMMENT 'властность',
  f_ TINYINT DEFAULT NULL COMMENT 'импульсивность (без коррекции)',
  f TINYINT UNSIGNED DEFAULT NULL COMMENT 'импульсивность',
  g TINYINT UNSIGNED DEFAULT NULL COMMENT 'дисциплинированность',
  h_ TINYINT DEFAULT NULL COMMENT 'социальная смелость (без коррекции)',
  h TINYINT UNSIGNED DEFAULT NULL COMMENT 'социальная смелость',
  i TINYINT UNSIGNED DEFAULT NULL COMMENT 'чувствительност',
  l_ TINYINT DEFAULT NULL COMMENT 'подозрительность (без коррекции)',
  l TINYINT UNSIGNED DEFAULT NULL COMMENT 'подозрительность',
  m TINYINT UNSIGNED DEFAULT NULL COMMENT 'творческий потенциал',
  n TINYINT UNSIGNED DEFAULT NULL COMMENT 'проницательность',
  o_ TINYINT DEFAULT NULL COMMENT 'неуверенность в себе (без коррекции)',
  o TINYINT UNSIGNED DEFAULT NULL COMMENT 'неуверенность в себе',
  q1 TINYINT UNSIGNED DEFAULT NULL COMMENT 'новаторство',
  q2_ TINYINT DEFAULT NULL COMMENT 'самодостаточность (без коррекции)',
  q2 TINYINT UNSIGNED DEFAULT NULL COMMENT 'самодостаточность',
  q3 TINYINT UNSIGNED DEFAULT NULL COMMENT 'самоконтроль',
  q4_ TINYINT DEFAULT NULL COMMENT 'напряжённость (без коррекции)',
  q4 TINYINT UNSIGNED DEFAULT NULL COMMENT 'напряжённость',
  md TINYINT UNSIGNED DEFAULT NULL COMMENT 'самооценка',
  ft TINYINT UNSIGNED DEFAULT NULL COMMENT 'тревожность',
  fe TINYINT UNSIGNED DEFAULT NULL COMMENT 'экстровертность',
  fb TINYINT UNSIGNED DEFAULT NULL COMMENT 'ложь',
  time_kettell SMALLINT UNSIGNED DEFAULT NULL COMMENT 'время тестирования Кеттелл',
  personalities TEXT DEFAULT NULL COMMENT 'свойства личности',
  conclusion TEXT DEFAULT NULL COMMENT 'профзаключение',
  recommendation TEXT DEFAULT NULL COMMENT 'рекомендации',
  material TINYINT UNSIGNED DEFAULT NULL COMMENT 'материальные (парные сравнения)',
  safety TINYINT UNSIGNED DEFAULT NULL COMMENT 'безопасность (парные сравнения)',
  socia TINYINT UNSIGNED DEFAULT NULL COMMENT 'социальные (парные сравнения)',
  confession TINYINT UNSIGNED DEFAULT NULL COMMENT 'признание (парные сравнения)',
  express TINYINT UNSIGNED DEFAULT NULL COMMENT 'самовыражение (парные сравнения)',
  time_need SMALLINT UNSIGNED DEFAULT NULL COMMENT 'время тест парных сравнений',
  contend TINYINT UNSIGNED DEFAULT NULL COMMENT 'соперничество (Томас)',
  cooperate TINYINT UNSIGNED DEFAULT NULL COMMENT 'сотрудничество (Томас)',
  compromise TINYINT UNSIGNED DEFAULT NULL COMMENT 'компромисс (Томас)',
  adapt TINYINT UNSIGNED DEFAULT NULL COMMENT 'приспособление (Томас)',
  avoid TINYINT UNSIGNED DEFAULT NULL COMMENT 'избегание (Томас)',
  time_tomas SMALLINT UNSIGNED DEFAULT NULL COMMENT 'время (Томас)',
  lk TINYINT UNSIGNED DEFAULT NULL COMMENT 'локус контроля',
  time_locus SMALLINT UNSIGNED DEFAULT NULL COMMENT 'время Локус контроля',
  time_all SMALLINT DEFAULT NULL COMMENT 'общее время тестирования',
  note VARCHAR(255) DEFAULT NULL COMMENT 'комментарий',
  PRIMARY KEY (code),
  INDEX Ind_name (name),
  INDEX Ind_patronymic (patronymic),
  INDEX Ind_surname (surname)
)
COMMENT = 'психология';

--
-- Описание для таблицы recruit_deflect_code
--

CREATE TABLE IF NOT EXISTS recruit_deflect_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(60) NOT NULL COMMENT 'причина отклонения соискателя',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'таблица причин отклонения соискателей';

--
-- Описание для таблицы region_code
--

CREATE TABLE IF NOT EXISTS region_code (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(30) NOT NULL COMMENT 'район города',
  PRIMARY KEY (code),
  UNIQUE INDEX name (name)
)
COMMENT = 'таблица районов города';

--
-- Описание для таблицы speciality_book
--

CREATE TABLE IF NOT EXISTS speciality_book (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  name VARCHAR(250) NOT NULL COMMENT 'название специальности',
  parent INT NOT NULL COMMENT 'код родителя',
  folder TINYINT NOT NULL COMMENT 'флаг папки',
  PRIMARY KEY (code)
)
COMMENT = 'справочник специальностей';

--
-- Описание для таблицы tomas_query
--

CREATE TABLE IF NOT EXISTS tomas_query (
  number SMALLINT NOT NULL COMMENT 'порядковый номер сравнения',
  statement_1 VARCHAR(130) NOT NULL COMMENT '1-е утверждение',
  code_1 SMALLINT NOT NULL COMMENT 'код 1-го утверждения',
  statement_2 VARCHAR(130) NOT NULL COMMENT '2-е утверждение',
  code_2 SMALLINT NOT NULL COMMENT 'код 2-го утверждения',
  answer_code SMALLINT DEFAULT NULL COMMENT 'код выбранного утверждения',
  answer_view VARCHAR(255) DEFAULT NULL COMMENT 'а) или б) для обработки оператором'
)
COMMENT = 'шаблон теста томаса';

--
-- Описание для таблицы user
--

CREATE TABLE IF NOT EXISTS user (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  surname VARCHAR(32) NOT NULL COMMENT 'фамилия',
  name VARCHAR(32) NOT NULL COMMENT 'имя',
  patronymic VARCHAR(32) NOT NULL COMMENT 'отчество',
  passwd VARCHAR(32) NOT NULL COMMENT 'пароль',
  access TINYINT NOT NULL DEFAULT 0 COMMENT 'тип доступа',
  block TINYINT NOT NULL DEFAULT 0 COMMENT 'флаг блокировка доступа',
  deleted TINYINT NOT NULL DEFAULT 0 COMMENT 'флаг удаление пользователя',
  PRIMARY KEY (code),
  UNIQUE INDEX surname (surname)
)
COMMENT = 'пользователи';

--
-- Описание для таблицы applicant
--

CREATE TABLE IF NOT EXISTS applicant (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'уникальный код',
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'TIMESTAMP',
  surname VARCHAR(30) NOT NULL DEFAULT 'Новая запись' COMMENT 'фамилия',
  name VARCHAR(30) DEFAULT NULL COMMENT 'имя',
  patronymic VARCHAR(30) DEFAULT NULL COMMENT 'отчество',
  birthday DATETIME DEFAULT NULL COMMENT 'дата рождения',
  sex TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'пол',
  date_registration DATETIME DEFAULT NULL COMMENT 'дата регистрации',
  crime TINYINT NOT NULL DEFAULT 0 COMMENT 'криминальная проверка',
  date_update DATETIME DEFAULT NULL COMMENT 'дата актуализации',
  photo MEDIUMBLOB DEFAULT NULL COMMENT 'фото',
  growing TINYINT UNSIGNED DEFAULT NULL COMMENT 'рост',
  weight TINYINT UNSIGNED DEFAULT NULL COMMENT 'вес',
  smoking TINYINT NOT NULL DEFAULT 0 COMMENT 'курение',
  chronic VARCHAR(60) DEFAULT NULL COMMENT 'хронические заболевания',
  address VARCHAR(90) DEFAULT NULL COMMENT 'адрес проживания',
  region INT UNSIGNED DEFAULT NULL COMMENT 'район проживания',
  housing INT UNSIGNED DEFAULT NULL COMMENT 'условия проживания',
  family INT UNSIGNED DEFAULT NULL COMMENT 'семейное положение',
  passport VARCHAR(120) DEFAULT NULL COMMENT 'паспорт',
  check_passport TINYINT NOT NULL DEFAULT 0 COMMENT 'сверка паспорта',
  phone_home VARCHAR(20) DEFAULT NULL COMMENT 'домашний телефон',
  phone_office VARCHAR(40) DEFAULT NULL COMMENT 'рабочий телефон',
  phone_mobile VARCHAR(20) DEFAULT NULL COMMENT 'мобильный телефон',
  e_mail VARCHAR(40) DEFAULT NULL COMMENT 'электронная почта',
  skype VARCHAR(40) DEFAULT NULL COMMENT 'SKYPE',
  icq VARCHAR(20) DEFAULT NULL COMMENT 'ICQ',
  formation INT UNSIGNED DEFAULT NULL COMMENT 'образование',
  a_category TINYINT NOT NULL DEFAULT 0 COMMENT 'водительское удостоверение категория A',
  b_category TINYINT NOT NULL DEFAULT 0 COMMENT 'водительское удостоверение категория B',
  c_category TINYINT NOT NULL DEFAULT 0 COMMENT 'водительское удостоверение категория С',
  d_category TINYINT NOT NULL DEFAULT 0 COMMENT 'водительское удостоверение категория D',
  e_category TINYINT NOT NULL DEFAULT 0 COMMENT 'водительское удостоверение категория E',
  car VARCHAR(40) DEFAULT NULL COMMENT 'марка личного автомобиля',
  year_car YEAR(4) DEFAULT NULL COMMENT 'год выпуска автомобиля',
  use_car TINYINT NOT NULL DEFAULT 0 COMMENT 'служебное использование автомобиля',
  reason VARCHAR(80) DEFAULT NULL COMMENT 'причина поиска  работы',
  requirement VARCHAR(80) DEFAULT NULL COMMENT 'требования к работе',
  salary_last INT UNSIGNED DEFAULT NULL COMMENT 'зарплата на последней работе',
  salary_desired INT UNSIGNED DEFAULT NULL COMMENT 'желаемая зарплата',
  date_salary DATETIME DEFAULT NULL COMMENT 'дата обновления желаемой зарплаты',
  income INT UNSIGNED DEFAULT NULL COMMENT 'средний доход на члена семьи',
  overtime TINYINT NOT NULL DEFAULT 0 COMMENT 'сверхурочная работа',
  trip TINYINT NOT NULL DEFAULT 0 COMMENT 'командировки',
  region_city TINYINT NOT NULL DEFAULT 0 COMMENT 'работа в любом районе города',
  city TINYINT NOT NULL DEFAULT 0 COMMENT 'работа в любом городе',
  employed TINYINT NOT NULL DEFAULT 0 COMMENT 'трудоустроен',
  date_warranty DATETIME DEFAULT NULL COMMENT 'конец испытательного срока',
  expert INT UNSIGNED DEFAULT NULL COMMENT 'эксперт по профессии',
  date_back DATETIME DEFAULT NULL COMMENT 'с какой даты предлагать работу',
  bad INT UNSIGNED DEFAULT NULL COMMENT 'черный список',
  note VARCHAR(255) DEFAULT NULL COMMENT 'примечание',
  date_career DATETIME DEFAULT NULL COMMENT 'дата обновления карьеры',
  date_skill DATETIME DEFAULT NULL COMMENT 'дата обновления опыта',
  date_profession DATETIME DEFAULT NULL COMMENT 'дата обновления профессий',
  hobby VARCHAR(255) DEFAULT NULL COMMENT 'хобби',
  iq TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология IQ',
  a TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор A',
  b TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор B',
  c TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор C',
  e TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор E',
  f TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор F',
  g TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор G',
  h TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор H',
  i TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор I',
  l TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор L',
  m TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор M',
  n TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор N',
  o TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор O',
  q1 TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор Q1',
  q2 TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор Q2',
  q3 TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор Q3',
  q4 TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор Q4',
  md TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор MD',
  ft TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор FT',
  fe TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор FE',
  fb TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор FB',
  lk TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология локус контроля',
  personalities TEXT DEFAULT NULL COMMENT 'психология свойства личности',
  conclusion TEXT DEFAULT NULL COMMENT 'психология профзаключение',
  recommendation TEXT DEFAULT NULL COMMENT 'психология рекомендации',
  material TINYINT UNSIGNED DEFAULT NULL COMMENT 'Материальные',
  safety TINYINT UNSIGNED DEFAULT NULL COMMENT 'Безопасность',
  socia TINYINT UNSIGNED DEFAULT NULL COMMENT 'Социальные',
  confession TINYINT UNSIGNED DEFAULT NULL COMMENT 'Признание',
  express TINYINT UNSIGNED DEFAULT NULL COMMENT 'Самовыражение',
  contend TINYINT UNSIGNED DEFAULT NULL COMMENT 'Соперничество',
  cooperate TINYINT UNSIGNED DEFAULT NULL COMMENT 'Сотрудничество',
  compromise TINYINT UNSIGNED DEFAULT NULL COMMENT 'Компромисс',
  adapt TINYINT UNSIGNED DEFAULT NULL COMMENT 'Приспособление',
  avoid TINYINT UNSIGNED DEFAULT NULL COMMENT 'Избегание',
  kettell_time SMALLINT UNSIGNED DEFAULT NULL COMMENT 'время тестирования Кеттелл',
  need_time SMALLINT UNSIGNED DEFAULT NULL COMMENT 'время тестирования Парные сравнения',
  tomas_time SMALLINT UNSIGNED DEFAULT NULL COMMENT 'время тестирования Томас',
  locus_time SMALLINT UNSIGNED DEFAULT NULL COMMENT 'время тестирования Локус контроля',
  experience TEXT DEFAULT NULL COMMENT 'опыт',
  program VARCHAR(500) DEFAULT NULL COMMENT 'коды программ из таблицы `program`',
  children VARCHAR(100) DEFAULT NULL COMMENT 'дети',
  PRIMARY KEY (code),
  INDEX family (family),
  INDEX formation (formation),
  INDEX housing (housing),
  INDEX Ind_a (a),
  INDEX Ind_a_category (a_category),
  INDEX Ind_b_category (b_category),
  INDEX Ind_back (date_back),
  INDEX Ind_birthday (birthday),
  INDEX Ind_c_category (c_category),
  INDEX Ind_d_category (d_category),
  INDEX Ind_e_category (e_category),
  INDEX Ind_expert (expert),
  INDEX Ind_name (name),
  INDEX Ind_patronymic (patronymic),
  INDEX Ind_placement (employed),
  INDEX Ind_refusal (bad),
  INDEX Ind_registration (date_registration),
  INDEX Ind_salary_date (date_salary),
  INDEX Ind_salary_desired (salary_desired),
  INDEX Ind_sex (sex),
  INDEX Ind_surname (surname),
  INDEX Ind_warranty (date_warranty),
  INDEX region (region),
  CONSTRAINT applicant_ibfk_1 FOREIGN KEY (region)
    REFERENCES region_code(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT applicant_ibfk_2 FOREIGN KEY (housing)
    REFERENCES housing_code(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT applicant_ibfk_3 FOREIGN KEY (family)
    REFERENCES family_code(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT applicant_ibfk_4 FOREIGN KEY (formation)
    REFERENCES formation_code(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT applicant_ibfk_5 FOREIGN KEY (expert)
    REFERENCES profession_book(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_applicant_applicant_bad_code_code FOREIGN KEY (bad)
    REFERENCES applicant_bad_code(code) ON DELETE SET NULL ON UPDATE CASCADE
)
COMMENT = 'соискатели';

--
-- Описание для таблицы criterion_query
--

CREATE TABLE IF NOT EXISTS criterion_query (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  criterion INT UNSIGNED DEFAULT NULL COMMENT 'код критерия',
  question VARCHAR(255) DEFAULT NULL COMMENT 'вопрос',
  note VARCHAR(255) DEFAULT NULL COMMENT 'пояснения',
  score TINYINT DEFAULT NULL COMMENT 'оценка',
  PRIMARY KEY (code),
  INDEX criterion (criterion),
  CONSTRAINT FK_criterion_query_criterion_code_code FOREIGN KEY (criterion)
    REFERENCES criterion_code(code) ON DELETE CASCADE ON UPDATE CASCADE
)
COLLATE utf8_general_ci;

--
-- Описание для таблицы customer
--

CREATE TABLE IF NOT EXISTS customer (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  date_update DATETIME DEFAULT NULL COMMENT 'дата актуализации',
  consultant INT UNSIGNED DEFAULT NULL COMMENT 'куратор',
  type INT UNSIGNED DEFAULT NULL COMMENT 'класс клиента',
  bad INT UNSIGNED DEFAULT NULL COMMENT 'черный список',
  name VARCHAR(160) NOT NULL DEFAULT 'Новая пустая запись' COMMENT 'торговое имя',
  name_legal VARCHAR(100) DEFAULT NULL COMMENT 'юридическое имя',
  date_registration DATETIME DEFAULT NULL COMMENT 'дата регистрации фирмы',
  specialization VARCHAR(255) DEFAULT NULL COMMENT 'специализация',
  business INT UNSIGNED DEFAULT NULL COMMENT 'сфера деятельности',
  phone_code VARCHAR(10) DEFAULT NULL COMMENT 'телефонный код города',
  time_work VARCHAR(60) DEFAULT NULL COMMENT 'время работы',
  phone_office VARCHAR(40) DEFAULT NULL COMMENT 'рабочие телефоны',
  phone_fax VARCHAR(20) DEFAULT NULL COMMENT 'факс',
  phone_mobile VARCHAR(20) DEFAULT NULL COMMENT 'мобильный телефон',
  e_mail VARCHAR(40) DEFAULT NULL COMMENT 'электронная почта',
  www VARCHAR(40) DEFAULT NULL COMMENT 'адрес сайта',
  icq VARCHAR(20) DEFAULT NULL COMMENT 'ICQ',
  skype VARCHAR(40) DEFAULT NULL COMMENT 'СКАЙП',
  address VARCHAR(255) DEFAULT NULL COMMENT 'физический адрес',
  note VARCHAR(255) DEFAULT NULL COMMENT 'примечание',
  PRIMARY KEY (code),
  INDEX account (consultant),
  INDEX business (business),
  INDEX refusal (bad),
  INDEX type (type),
  CONSTRAINT customer_ibfk_2 FOREIGN KEY (business)
    REFERENCES business_code(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT customer_ibfk_3 FOREIGN KEY (type)
    REFERENCES customer_code(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_customer_customer_bad_code_code FOREIGN KEY (bad)
    REFERENCES customer_bad_code(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT FK_customer_user_code FOREIGN KEY (consultant)
    REFERENCES user(code) ON DELETE SET NULL ON UPDATE CASCADE
)
COMMENT = 'таблица заказчиков';

--
-- Описание для таблицы profile
--

CREATE TABLE IF NOT EXISTS profile (
  code INT UNSIGNED NOT NULL,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  expert_count INT UNSIGNED DEFAULT NULL,
  avg_a TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор A - среднее',
  std_a TINYINT UNSIGNED DEFAULT NULL COMMENT 'психология Кеттелл фактор A - отклонение',
  avg_b TINYINT UNSIGNED DEFAULT NULL,
  std_b TINYINT UNSIGNED DEFAULT NULL,
  avg_c TINYINT UNSIGNED DEFAULT NULL,
  std_c TINYINT UNSIGNED DEFAULT NULL,
  avg_e TINYINT UNSIGNED DEFAULT NULL,
  std_e TINYINT UNSIGNED DEFAULT NULL,
  avg_f TINYINT UNSIGNED DEFAULT NULL,
  std_f TINYINT UNSIGNED DEFAULT NULL,
  avg_g TINYINT UNSIGNED DEFAULT NULL,
  std_g TINYINT UNSIGNED DEFAULT NULL,
  avg_h TINYINT UNSIGNED DEFAULT NULL,
  std_h TINYINT UNSIGNED DEFAULT NULL,
  avg_i TINYINT UNSIGNED DEFAULT NULL,
  std_i TINYINT UNSIGNED DEFAULT NULL,
  avg_l TINYINT UNSIGNED DEFAULT NULL,
  std_l TINYINT UNSIGNED DEFAULT NULL,
  avg_m TINYINT UNSIGNED DEFAULT NULL,
  std_m TINYINT UNSIGNED DEFAULT NULL,
  avg_n TINYINT UNSIGNED DEFAULT NULL,
  std_n TINYINT UNSIGNED DEFAULT NULL,
  avg_o TINYINT UNSIGNED DEFAULT NULL,
  std_o TINYINT UNSIGNED DEFAULT NULL,
  avg_q1 TINYINT UNSIGNED DEFAULT NULL,
  std_q1 TINYINT UNSIGNED DEFAULT NULL,
  avg_q2 TINYINT UNSIGNED DEFAULT NULL,
  std_q2 TINYINT UNSIGNED DEFAULT NULL,
  avg_q3 TINYINT UNSIGNED DEFAULT NULL,
  std_q3 TINYINT UNSIGNED DEFAULT NULL,
  avg_q4 TINYINT UNSIGNED DEFAULT NULL,
  std_q4 TINYINT UNSIGNED DEFAULT NULL,
  avg_md TINYINT UNSIGNED DEFAULT NULL,
  std_md TINYINT UNSIGNED DEFAULT NULL,
  avg_ft TINYINT UNSIGNED DEFAULT NULL,
  std_ft TINYINT UNSIGNED DEFAULT NULL,
  avg_fe TINYINT UNSIGNED DEFAULT NULL,
  std_fe TINYINT UNSIGNED DEFAULT NULL,
  avg_lk TINYINT UNSIGNED DEFAULT NULL,
  std_lk TINYINT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (code),
  CONSTRAINT FK_profile_profession_book_code FOREIGN KEY (code)
    REFERENCES profession_book(code) ON DELETE CASCADE ON UPDATE CASCADE
)
COMMENT = 'таблица профилей профессий';

--
-- Описание для таблицы career
--

CREATE TABLE IF NOT EXISTS career (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  applicant INT UNSIGNED DEFAULT NULL COMMENT 'код соискателя',
  entering DATETIME DEFAULT NULL COMMENT 'дата поступления',
  completion DATETIME DEFAULT NULL COMMENT 'дата увольнения',
  firm VARCHAR(100) DEFAULT NULL COMMENT 'название организации',
  business INT UNSIGNED DEFAULT NULL COMMENT 'сфера деятельности организации',
  specialization VARCHAR(80) DEFAULT NULL COMMENT 'специализация',
  job_title VARCHAR(70) DEFAULT NULL COMMENT 'должность',
  motive VARCHAR(255) DEFAULT NULL COMMENT 'мотив увольнения',
  leader VARCHAR(60) DEFAULT NULL COMMENT 'ФИО руководителя',
  job_title_leader VARCHAR(50) DEFAULT NULL COMMENT 'должность руководителя',
  phone VARCHAR(50) DEFAULT NULL COMMENT 'телефоны руководителя',
  letter VARCHAR(60) DEFAULT NULL COMMENT 'адрес рекомендательного письма',
  skill TEXT DEFAULT NULL COMMENT 'опыт, навыки, достижения',
  checked TINYINT NOT NULL DEFAULT 0 COMMENT 'проверено',
  PRIMARY KEY (code),
  INDEX business (business),
  INDEX recruit (applicant),
  CONSTRAINT career_fk FOREIGN KEY (applicant)
    REFERENCES applicant(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT career_ibfk_2 FOREIGN KEY (business)
    REFERENCES business_code(code) ON DELETE SET NULL ON UPDATE CASCADE
)
COMMENT = 'карьера';

--
-- Описание для таблицы children
--

CREATE TABLE IF NOT EXISTS children (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  applicant INT UNSIGNED NOT NULL COMMENT 'код соискателя',
  birthday DATETIME NOT NULL COMMENT 'дата рождения',
  PRIMARY KEY (code),
  INDEX recruit (applicant),
  CONSTRAINT children_fk FOREIGN KEY (applicant)
    REFERENCES applicant(code) ON DELETE CASCADE ON UPDATE CASCADE
)
COMMENT = 'дети';

--
-- Описание для таблицы education_add
--

CREATE TABLE IF NOT EXISTS education_add (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  applicant INT UNSIGNED DEFAULT NULL COMMENT 'код соискателя',
  completion YEAR(4) DEFAULT NULL COMMENT 'год обучения',
  institute VARCHAR(100) DEFAULT NULL COMMENT 'название образовательного учреждения',
  city VARCHAR(30) DEFAULT NULL COMMENT 'город',
  duration VARCHAR(30) DEFAULT NULL COMMENT 'продолжительность обучения',
  name VARCHAR(80) DEFAULT NULL COMMENT 'название курсов',
  PRIMARY KEY (code),
  INDEX recruit (applicant),
  CONSTRAINT education_add_fk FOREIGN KEY (applicant)
    REFERENCES applicant(code) ON DELETE CASCADE ON UPDATE CASCADE
)
COMMENT = 'дополнительное образование';

--
-- Описание для таблицы education_base
--

CREATE TABLE IF NOT EXISTS education_base (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  applicant INT UNSIGNED DEFAULT NULL COMMENT 'код соискателя',
  entering YEAR(4) DEFAULT NULL COMMENT 'год поступления',
  completion YEAR(4) DEFAULT NULL COMMENT 'год окончания',
  institute VARCHAR(100) DEFAULT NULL COMMENT 'учебное заведение',
  city VARCHAR(30) DEFAULT NULL COMMENT 'город',
  type INT UNSIGNED DEFAULT NULL COMMENT 'тип обучения',
  speciality INT UNSIGNED DEFAULT NULL COMMENT 'специальность',
  specialization VARCHAR(80) DEFAULT NULL COMMENT 'специализация',
  PRIMARY KEY (code),
  INDEX recruit (applicant),
  INDEX speciality (speciality),
  INDEX type (type),
  CONSTRAINT education_base_fk FOREIGN KEY (applicant)
    REFERENCES applicant(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT education_base_ibfk_2 FOREIGN KEY (type)
    REFERENCES education_code(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT education_base_ibfk_3 FOREIGN KEY (speciality)
    REFERENCES speciality_book(code) ON DELETE SET NULL ON UPDATE CASCADE
)
COMMENT = 'базовое образование';

--
-- Описание для таблицы language
--

CREATE TABLE IF NOT EXISTS language (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  applicant INT UNSIGNED DEFAULT NULL COMMENT 'код соискателя',
  language INT UNSIGNED DEFAULT NULL COMMENT 'код языка',
  level INT UNSIGNED DEFAULT NULL COMMENT 'уровень владения',
  PRIMARY KEY (code),
  INDEX Ind_language (language),
  INDEX level (level),
  INDEX recruit (applicant),
  CONSTRAINT FK_applicant_code FOREIGN KEY (applicant)
    REFERENCES applicant(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT language_ibfk_2 FOREIGN KEY (language)
    REFERENCES language_code(code) ON DELETE CASCADE ON UPDATE CASCADE
)
COMMENT = 'иностранные языки';

--
-- Описание для таблицы marketing
--

CREATE TABLE IF NOT EXISTS marketing (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  customer INT UNSIGNED DEFAULT NULL COMMENT 'код заказчика',
  date_contact DATETIME DEFAULT NULL COMMENT 'дата контакта',
  method INT UNSIGNED DEFAULT NULL COMMENT 'способ контакта: e-mail, звонок письмо ...',
  consultant INT UNSIGNED DEFAULT NULL COMMENT 'код консультанта',
  type INT UNSIGNED DEFAULT NULL COMMENT 'тип контакта: КП, сделка, презентация ...',
  person VARCHAR(80) DEFAULT NULL COMMENT 'контактное лицо',
  note VARCHAR(255) DEFAULT NULL COMMENT 'результат контакта',
  PRIMARY KEY (code),
  INDEX account (consultant),
  INDEX customer (customer),
  INDEX method (method),
  INDEX person (person),
  INDEX type (type),
  CONSTRAINT FK_marketing_user_code FOREIGN KEY (consultant)
    REFERENCES user(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT marketing_ibfk_1 FOREIGN KEY (customer)
    REFERENCES customer(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT marketing_ibfk_3 FOREIGN KEY (type)
    REFERENCES contact_type_code(code) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT marketing_ibfk_4 FOREIGN KEY (method)
    REFERENCES contact_method_code(code) ON DELETE SET NULL ON UPDATE CASCADE
)
COMMENT = 'CRM';

--
-- Описание для таблицы personnel
--

CREATE TABLE IF NOT EXISTS personnel (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  customer INT UNSIGNED DEFAULT NULL COMMENT 'код заказчика',
  surname VARCHAR(30) DEFAULT NULL COMMENT 'фамилия',
  name VARCHAR(30) DEFAULT NULL COMMENT 'имя',
  patronymic VARCHAR(30) DEFAULT NULL COMMENT 'отчество',
  department VARCHAR(60) DEFAULT NULL COMMENT 'название подразделения',
  job_title VARCHAR(60) DEFAULT NULL COMMENT 'должность',
  mobile VARCHAR(20) DEFAULT NULL COMMENT 'мобильный телефон',
  phone VARCHAR(30) DEFAULT NULL COMMENT 'рабочий телефон',
  e_mail VARCHAR(50) DEFAULT NULL COMMENT 'электронная почта',
  skype VARCHAR(30) DEFAULT NULL COMMENT 'скайп',
  icq VARCHAR(30) DEFAULT NULL COMMENT 'ICQ',
  note VARCHAR(140) DEFAULT NULL COMMENT 'примечания',
  PRIMARY KEY (code),
  INDEX customer (customer),
  CONSTRAINT personnel_ibfk_1 FOREIGN KEY (customer)
    REFERENCES customer(code) ON DELETE CASCADE ON UPDATE CASCADE
)
COMMENT = 'персонал заказчика';

--
-- Описание для таблицы placement
--

CREATE TABLE IF NOT EXISTS placement (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'уникальный код заказа',
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'TIMESTAMP',
  customer INT UNSIGNED DEFAULT NULL COMMENT 'код заказчика',
  date_registration DATETIME DEFAULT NULL COMMENT 'дата регистрации',
  vacancy VARCHAR(70) DEFAULT NULL COMMENT 'название вакансии',
  consultant INT UNSIGNED DEFAULT NULL COMMENT 'код консультанта',
  number_contract VARCHAR(10) DEFAULT NULL COMMENT 'номер договора',
  date_contract DATETIME DEFAULT NULL COMMENT 'дата договора',
  price INT UNSIGNED DEFAULT NULL COMMENT 'стоимость подбра',
  credit TINYINT NOT NULL DEFAULT 0 COMMENT 'подбор в кредит',
  free TINYINT NOT NULL DEFAULT 0 COMMENT 'бесплатный подбор',
  warranty TINYINT UNSIGNED DEFAULT NULL COMMENT 'гарантия в месяцах',
  note TEXT DEFAULT NULL COMMENT 'примечание',
  date_select_end DATETIME DEFAULT NULL COMMENT 'дата окончания подбора',
  date_work DATETIME DEFAULT NULL COMMENT 'дата выхода работника на рабочее место',
  date_invoice DATETIME DEFAULT NULL COMMENT 'дата выставления счёта',
  date_payment DATETIME DEFAULT NULL COMMENT 'дата оплаты',
  date_reselect DATETIME DEFAULT NULL COMMENT 'дата начала переподбора',
  date_reselect_end DATETIME DEFAULT NULL COMMENT 'дата окончания переподбора',
  date_rework_date DATETIME DEFAULT NULL COMMENT 'дата выхода работника на рабочее место',
  date_refusal DATETIME DEFAULT NULL COMMENT 'дата отказа от плейсмента',
  reason_close INT UNSIGNED DEFAULT NULL COMMENT 'причина закрытия',
  codes_search TEXT DEFAULT NULL COMMENT 'хранение полей для сложного поиска',
  PRIMARY KEY (code),
  INDEX customer (customer),
  INDEX placement_ibfk_3 (consultant),
  INDEX reason_close (reason_close),
  CONSTRAINT FK_placement_user_code FOREIGN KEY (consultant)
    REFERENCES user(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT placement_ibfk_1 FOREIGN KEY (customer)
    REFERENCES customer(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT placement_ibfk_2 FOREIGN KEY (reason_close)
    REFERENCES placement_close_code(code) ON DELETE SET NULL ON UPDATE CASCADE
)
COMMENT = 'заказы';

--
-- Описание для таблицы profession
--

CREATE TABLE IF NOT EXISTS profession (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  applicant INT UNSIGNED DEFAULT NULL COMMENT 'код соискателя',
  profession INT UNSIGNED DEFAULT NULL COMMENT 'код профессии',
  PRIMARY KEY (code),
  INDEX profession (profession),
  INDEX recruit (applicant),
  CONSTRAINT FK_profession_applicant_code FOREIGN KEY (applicant)
    REFERENCES applicant(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT profession_ibfk_2 FOREIGN KEY (profession)
    REFERENCES profession_book(code) ON DELETE CASCADE ON UPDATE CASCADE
)
COMMENT = 'желаемые профессии';

--
-- Описание для таблицы program
--

CREATE TABLE IF NOT EXISTS program (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  applicant INT UNSIGNED DEFAULT NULL COMMENT 'код соискателя',
  program INT UNSIGNED DEFAULT NULL COMMENT 'код программы',
  level INT UNSIGNED DEFAULT NULL COMMENT 'уровень владения программой',
  PRIMARY KEY (code),
  INDEX level (level),
  INDEX program (program),
  INDEX recruit (applicant),
  CONSTRAINT FK_applicant FOREIGN KEY (applicant)
    REFERENCES applicant(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT program_ibfk_2 FOREIGN KEY (program)
    REFERENCES program_book(code) ON DELETE CASCADE ON UPDATE CASCADE
)
COMMENT = 'программы';

--
-- Описание для таблицы review
--

CREATE TABLE IF NOT EXISTS review (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  applicant INT UNSIGNED DEFAULT NULL COMMENT 'код соискателя',
  date_record DATETIME DEFAULT NULL COMMENT 'дата записи информации',
  consultant INT UNSIGNED DEFAULT NULL COMMENT 'код пользователя',
  firm VARCHAR(50) DEFAULT NULL COMMENT 'название организации',
  leader VARCHAR(50) DEFAULT NULL COMMENT 'руководитель',
  job_title VARCHAR(50) DEFAULT NULL COMMENT 'должность руководителя',
  phone VARCHAR(50) DEFAULT NULL COMMENT 'телефон руководителя',
  plus VARCHAR(255) DEFAULT NULL COMMENT 'положительные отзывы',
  minus VARCHAR(255) DEFAULT NULL COMMENT 'отрицательные отзывы',
  PRIMARY KEY (code),
  INDEX consultant (consultant),
  INDEX recruit (applicant),
  CONSTRAINT FK_review_applicant_code FOREIGN KEY (applicant)
    REFERENCES applicant(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_review_user_code FOREIGN KEY (consultant)
    REFERENCES user(code) ON DELETE SET NULL ON UPDATE CASCADE
)
COMMENT = 'отзывы';

--
-- Описание для таблицы criterion
--

CREATE TABLE IF NOT EXISTS criterion (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  placement INT UNSIGNED DEFAULT NULL,
  criterion INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (code),
  INDEX criterion (criterion),
  INDEX FK_criterion_placement_code (placement),
  CONSTRAINT criterion_ibfk_1 FOREIGN KEY (criterion)
    REFERENCES criterion_code(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_criterion_placement_code FOREIGN KEY (placement)
    REFERENCES placement(code) ON DELETE CASCADE ON UPDATE CASCADE
)
COMMENT = 'отзывы';

--
-- Описание для таблицы history
--

CREATE TABLE IF NOT EXISTS history (
  code INT UNSIGNED NOT NULL AUTO_INCREMENT,
  ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  applicant INT UNSIGNED DEFAULT NULL COMMENT 'код соискателя',
  placement INT UNSIGNED DEFAULT NULL COMMENT 'номер заказа',
  date_selection DATETIME DEFAULT NULL COMMENT 'дата отбора кандидата',
  date_contact DATETIME DEFAULT NULL COMMENT 'дата передачи информации',
  date_consultation DATETIME DEFAULT NULL COMMENT 'дата консультации',
  date_resume DATETIME DEFAULT NULL COMMENT 'дата предоствления резюме',
  date_conversation DATETIME DEFAULT NULL COMMENT 'дата собеседования',
  date_placement DATETIME DEFAULT NULL COMMENT 'дата трудоустройства',
  deflect INT UNSIGNED DEFAULT NULL COMMENT 'причина отклонения',
  detal TEXT DEFAULT NULL COMMENT 'оченки по критериям',
  average FLOAT(2, 1) DEFAULT NULL COMMENT 'средняя оценка',
  note VARCHAR(255) DEFAULT NULL COMMENT 'примечание',
  marker TINYINT NOT NULL DEFAULT 0 COMMENT 'маркер обработки',
  PRIMARY KEY (code),
  INDEX deflect (deflect),
  INDEX Ind_consultation_date (date_consultation),
  INDEX Ind_contact_date (date_contact),
  INDEX Ind_conversation_date (date_conversation),
  INDEX Ind_marker (marker),
  INDEX Ind_placement_date (date_placement),
  INDEX Ind_resume_date (date_resume),
  INDEX placement (placement),
  INDEX recruit (applicant),
  CONSTRAINT FK_history_applicant_code FOREIGN KEY (applicant)
    REFERENCES applicant(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT history_ibfk_2 FOREIGN KEY (placement)
    REFERENCES placement(code) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT history_ibfk_3 FOREIGN KEY (deflect)
    REFERENCES recruit_deflect_code(code) ON DELETE SET NULL ON UPDATE CASCADE
)
COMMENT = 'история заказов';


--
-- Описание для процедуры applicant_back
--
DELIMITER $$
CREATE PROCEDURE applicant_back()
  SQL SECURITY INVOKER
  MODIFIES SQL DATA
  COMMENT 'Update temporarily not in need of work applicants.'
BEGIN
  UPDATE applicant SET back = NULL WHERE back < CURRENT_DATE;
END
$$
DELIMITER ;
--
-- Описание для процедуры calc_profile
--
DELIMITER $$
CREATE PROCEDURE calc_profile(IN prof INT)
  SQL SECURITY INVOKER
  MODIFIES SQL DATA
  COMMENT 'Update temporarily not in need of work applicants.'
BEGIN
	DECLARE i INT;
	SELECT count(*) INTO i FROM applicant WHERE a Is Not Null AND a > 0 AND expert = prof;
	IF i > 2 THEN
		REPLACE profile (code, expert_count, avg_a, avg_b, avg_c, avg_e, avg_f, avg_g, avg_h, 
			avg_i, avg_l, avg_m, avg_n, avg_o, avg_q1, avg_q2, avg_q3, avg_q4, avg_md, avg_ft, avg_fe, avg_lk, 
			std_a, std_b, std_c, std_e, std_f, std_g, std_h, std_i, std_l, 
			std_m, std_n, std_o, std_q1, std_q2, std_q3, std_q4, std_md, std_ft, std_fe, std_lk) 
			SELECT expert, COUNT(*), avg(a), avg(b), avg(c), avg(e), avg(f), avg(g), avg(h), avg(i), avg(l),
			avg(m), avg(n), avg(o), avg(q1), avg(q2), avg(q3), avg(q4), avg(md), avg(ft), avg(fe), avg(lk),
    		std(a), std(b), std(c), std(e), std(f), std(g), std(h), std(i), std(l), 
			std(m), std(n), std(o), std(q1), std(q2), std(q3), std(q4), std(md), std(ft), std(fe), std(lk)
			FROM applicant WHERE lk Is Not Null AND lk > 0 AND expert = prof;
	END IF;
END
$$
DELIMITER ;

--
-- Описание для функции age
--
DELIMITER $$
CREATE FUNCTION age(birthday DATETIME)
  RETURNS char(255)
  NO SQL
  SQL SECURITY INVOKER
  COMMENT 'calculates a persones age by date of birth'
BEGIN
  DECLARE years INT DEFAULT 0;

  SET years = DATEDIFF(CURDATE(), birthday) DIV 365;
  RETURN CONCAT(years, year_noun (years));
END
$$
DELIMITER ;

--
-- Описание для функции factor_score
--
DELIMITER $$
CREATE FUNCTION factor_score(factor VARCHAR(2))
  RETURNS INT
  DETERMINISTIC
  SQL SECURITY INVOKER
BEGIN
RETURN IFNULL((
      SELECT SUM(score)
      FROM (        SELECT SUM(cq.score_1) score FROM cattell_tmp cq WHERE cq.answer = 1 AND cq.factor =  factor
          UNION ALL SELECT SUM(cq.score_2) score FROM cattell_tmp cq WHERE cq.answer = 2 AND cq.factor =  factor
          UNION ALL SELECT SUM(cq.score_3) score FROM cattell_tmp cq WHERE cq.answer = 3 AND cq.factor =  factor
        ) t ), 0 );
END
$$
DELIMITER ;

--
-- Описание для функции md_sten
--
DELIMITER $$
CREATE FUNCTION md_sten()
  RETURNS INT
  DETERMINISTIC
  SQL SECURITY INVOKER
BEGIN
RETURN sten(IFNULL((
      SELECT SUM(score)
      FROM (        SELECT SUM(cq.score_1_md) score FROM cattell_query cq WHERE cq.answer = 1
          UNION ALL SELECT SUM(score_3_md) score FROM cattell_query cq WHERE cq.answer = 3
        ) t ), 0 ),'md',0,0);
END
$$
DELIMITER ;

--
-- Описание для функции time_work
--
DELIMITER $$
CREATE FUNCTION time_work(date_begin DATETIME, date_end DATETIME)
  RETURNS char(255) CHARSET utf8
  DETERMINISTIC
  SQL SECURITY INVOKER
  COMMENT 'Продолжительность работы.'
BEGIN
  DECLARE years ,day, month INT DEFAULT 0;
  DECLARE s VARCHAR(50);

IF (date_begin is NULL) THEN
 RETURN 'Нет даты поступления.';
END IF;
SET s = '';
IF (date_end is NULL) THEN  
 SET date_end = CURDATE();
END IF;
SET day = DATEDIFF(date_end, date_begin);
IF ( day < 0) THEN
 RETURN 'Ошибка дат!';
END IF;
SET years = day DIV 365, month =  (day -  years * 365) / 31;
IF (years=0) AND (month = 0) THEN 
  RETURN 'Меньше месяца';
END IF;
IF years > 0 THEN 
  SET s = CONCAT(years,year_noun (years),' ');
END IF;
IF month > 0 THEN 
  SET s = CONCAT(s,CONCAT (month,' мес.'));
END IF;
RETURN s;
END
$$
DELIMITER ;

--
-- Описание для функции year_noun
--
DELIMITER $$
CREATE FUNCTION year_noun(years INT)
  RETURNS char(5) CHARSET utf8
  DETERMINISTIC
  SQL SECURITY INVOKER
BEGIN
  DECLARE modulo  INT DEFAULT 0;
  DECLARE s              VARCHAR(5);

  IF (years >= 11) AND
  (years <= 14) THEN
    RETURN ' лет';
  END IF;
  SET modulo = MOD(years, 10);  
    CASE
    WHEN modulo IN
    (0, 5, 6, 7, 8, 9) THEN
      RETURN ' лет';
    WHEN modulo = 1 THEN
      RETURN ' год';
    WHEN modulo IN
    (2, 3, 4) THEN
      RETURN ' года';
    END CASE;
END
$$

DELIMITER ;

-- 
-- Вывод данных для таблицы applicant_bad_code
--
INSERT INTO applicant_bad_code VALUES 
  (1, '2007-03-17 16:34:10', 'наркоман'),
  (2, '2007-03-17 16:34:10', 'алкоголик'),
  (3, '2007-03-17 16:34:10', 'воровство'),
  (4, '2007-03-17 16:34:10', 'нарушители дисциплины (подвели КА)'),
  (5, '2007-03-17 16:34:10', 'низкое IQ'),
  (6, '2007-03-17 16:34:10', 'судимость'),
  (7, '2007-03-17 16:34:10', 'плохие отзывы'),
  (8, '2007-03-17 16:34:10', 'психические отклонения'),
  (9, '2007-03-17 16:34:10', 'скандалист'),
  (11, '2007-03-17 16:34:10', 'систематически игнорирует контакты'),
  (12, '2011-03-08 14:06:00', 'потерян контакт');

-- 
-- Вывод данных для таблицы base
--
INSERT INTO base VALUES 
  (1, '2011-01-15 21:46:53', '2.01', '2010-04-12 17:00:27');

-- 
-- Вывод данных для таблицы business_code
--
INSERT INTO business_code VALUES 
  (1, '2011-03-08 14:07:45', 'СМИ');

-- 
-- Вывод данных для таблицы cattell_query
--
INSERT INTO cattell_query VALUES 
  (1, 'Я хорошо понял инструкцию к этому опроснику.', 'да', 'не уверен', 'нет', '', 0, 0, 0, 0, 0, 0, 0, 1, NULL),
  (2, 'Я готов как можно искренней ответить на вопросы.', 'да', 'не уверен', 'нет', '', 0, 0, 0, 0, 0, 0, 0, 3, NULL),
  (3, 'Я предпочел бы иметь дачу:', 'в оживленном дачном поселке', 'нечто среднее', 'уединенную, в лесу', 'a', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (4, 'Я могу найти в себе достаточно сил, чтобы справиться с жизненными трудностями.', 'всегда', 'обычно', 'редко', 'c', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (5, 'При виде диких животных мне становится несколько не по себе, даже если они надежно заперты в клетках.', 'да, это верно', 'не уверен', 'нет, это неверно', 'c', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (6, 'Я воздерживаюсь от критики людей и их взглядов.', 'да', 'иногда', 'нет', 'e', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (7, 'Я делаю людям резкие, критические замечания, если мне кажется, что они этого заслуживают.', 'обычно', 'иногда', 'никогда не делаю', 'e', 2, 1, 0, 0, 1, 0, 0, 1, NULL),
  (8, 'Я предпочитаю несложную классическую музыку современным популярным мелодиям.', 'верно', 'не уверен', 'неверно', 'f', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (9, 'Если бы я увидел ссорящихся не на шутку соседских детей:', 'я предоставил бы им самим выяснить свои отношения', 'не знаю, что предпринял бы', 'я постарался бы разобраться в их ссоре.', 'g', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (10, 'На собраниях и в компаниях:', 'я легко выхожу вперед', 'верно нечто среднее', 'я предпочитаю держаться в стороне', 'h', 2, 1, 0, 0, 0, 0, 0, 2, NULL),
  (11, 'По-моему, интереснее быть:', 'инженером-конструктором', 'не знаю, что предпочесть', 'драматургом', 'i', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (12, 'На улице я скорее остановлюсь, чтобы посмотреть, как работает художник, чем стану наблюдать за уличной ссорой.', 'да, это верно', 'не уверен', 'нет, это неверно', 'i', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (13, 'Обычно я спокойно переношу самодовольство людей, даже когда они хвастаются или другим образом показывают, что они высокого мнения о себе.', 'да', 'верно нечто среднее', 'нет', 'l', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (14, 'Если человек обманывает, я почти всегда могу заметить это по выражению его лица.', 'да', 'верно нечто среднее', 'нет', 'm', 0, 1, 2, 0, 0, 1, 0, 3, NULL),
  (15, 'Я считаю, что самую скучную повседневную работу всегда нужно доводить до конца, даже если кажется, что в этом нет необходимости.', 'согласен', 'не уверен', 'не согласен', 'm', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (16, 'Я предпочел бы взяться за работу:', 'где можно много зарабатывать, если даже заработки непостоянны', 'не знаю, что выбрать', 'с постоянной, но относительно невысокой зарплатой.', 'n', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (17, 'Я говорю о своих чувствах:', 'только в случае необходимости', 'верно нечто среднее', 'охотно, когда предоставляется возможность', 'n', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (18, 'Изредка я испытываю чувство внезапного страха или неопределенного беспокойства, сам не знаю отчего.', 'да', 'верно нечто среднее', 'нет', 'o', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (19, 'Когда меня несправедливо критикуют за то, в чем я не виноват:', 'никакого чувства вины у меня не возникает', 'верно нечто среднее', 'я все же чувствую себя немного виноватым', 'o', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (20, 'На работе у меня бывает больше затруднений с людьми, которые:', 'отказываются использовать современные методы', 'не знаю, что выбрать', 'постоянно пытаются что-то изменить в работе, которая и так идет нормально', 'q1', 2, 1, 0, 0, 0, 0, 0, 2, NULL),
  (21, 'Принимая решения, я руководствуюсь больше:', 'сердцем', 'сердцем и рассудком в равной мере', 'рассудком', 'q1', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (22, 'Люди были бы счастливее, если бы они больше времени проводили в обществе своих друзей.', 'да', 'верно нечто среднее', 'нет', 'q2', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (23, 'Строя планы на будущее, я часто рассчитываю на удачу.', 'да', 'затрудняюсь ответить', 'нет', 'q3', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (24, 'Разговаривая, я склонен:', 'высказывать свои мысли сразу, как только они приходят', 'верно нечто среднее', 'прежде хорошенько собраться с мыслями', 'q3', 0, 1, 2, 0, 1, 0, 0, 3, NULL),
  (25, 'Даже если я чем-нибудь сильно взбешен, я успокаиваюсь довольно быстро.', 'да', 'верно нечто среднее', 'нет', 'q4', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (26, 'При равной продолжительности рабочего дня и одинаковой зарплате мне было бы интереснее работать:', 'столяром или поваром', 'не знаю, что выбрать', 'официантом в хорошем ресторане', 'a', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (27, 'У меня было:', 'очень мало выборных должностей', 'несколько', 'много выборных должностей', 'a', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (28, 'Слово "лопата" так относится к слову "копать", как слово "нож" к слову:', 'острый', 'резать', 'точить', 'b', 0, 1, 0, 0, 0, 0, 0, 3, NULL),
  (29, 'Иногда какая-нибудь навязчивая мысль не дает мне заснуть.', 'да, это верно', 'не уверен', 'нет, это неверно', 'c', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (30, 'В своей жизни я, как правило, достигаю тех целей, которые ставлю перед собой.', 'да, это верно', 'не уверен', 'нет, это неверно', 'c', 2, 1, 0, 0, 0, 0, 0, 2, NULL),
  (31, 'Устаревший закон должен быть изменен:', 'только после основательного обсуждения', 'верно нечто среднее', 'немедленно', 'e', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (32, 'Мне становится не по себе, когда дело требует от меня быстрых действий, которые как-то влияют на других людей.', 'да, это верно', 'верно нечто среднее', 'нет, это неверно', 'e', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (33, 'Большинство знакомых считают меня веселым собеседником.', 'да', 'не уверен', 'нет', 'f', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (34, 'Когда я вижу неопрятных, неряшливых людей', 'меня это не волнует', 'верно нечто среднее', 'они вызывают у меня неприязнь и отвращение', 'g', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (35, 'Я слегка теряюсь, неожиданно оказавшись в центре внимания.', 'да', 'верно нечто среднее', 'нет', 'h', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (36, 'Я всегда рад присоединиться к большой компании, например: встретиться вечером с друзьями, пойти на танцы, принять участие в интересном общественном мероприятии.', 'да', 'верно нечто среднее', 'нет', 'h', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (37, 'В школе я предпочитал:', 'уроки музыки (пения)', 'затрудняюсь сказать', 'занятия в мастерских, ручной труд', 'i', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (38, 'Если меня назначают ответственным за что-либо, я настаиваю, чтобы мои распоряжения строго выполнялись, а иначе я отказываюсь от поручения.', 'да', 'иногда', 'нет', 'l', 2, 1, 0, 0, 0, 1, 0, 3, NULL),
  (39, 'Важнее, чтобы родители:', 'способствовали тонкому развитию чувств у своих детей', 'нечто среднее между а) и в)', 'учили детей управлять своими чувствами', 'm', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (40, 'Участвуя в коллективной работе, я предпочел бы:', 'попытаться внести улучшения в организацию работы', 'верно нечто среднее', 'вести записи и следить за тем, чтобы соблюдались правила', 'm', 2, 1, 0, 0, 0, 0, 0, 2, NULL),
  (41, 'Время от времени я чувствую потребность заняться чем-нибудь, что требует значительных физических усилий.', 'да', 'верно нечто среднее', 'нет', 'n', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (42, 'Я предпочел бы общаться с людьми вежливыми и деликатными, чем с грубоватыми и прямолинейными.', 'да', 'верно нечто среднее', 'нет', 'n', 2, 1, 0, 0, 0, 0, 1, 3, NULL),
  (43, 'Когда меня критикуют на людях, это меня крайне угнетает.', 'да, это верно', 'верно нечто среднее', 'это неверно', 'o', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (44, 'Если меня вызывает к себе начальник, я:', 'использую этот случай, чтобы попросить о том, что мне нужно', 'верно нечто среднее', 'беспокоюсь, что сделал что-то не так', 'o', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (45, 'Я считаю, что люди должны очень серьезно подумать, прежде чем отказываться от опыта прошлых веков.', 'да', 'не уверен', 'нет', 'q1', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (46, 'Читая что-либо, я всегда хорошо осознаю скрытое намерение автора убедить меня в чем-то.', 'да', 'не уверен', 'нет', 'q1', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (47, 'Когда я учился в 7-10 классах, я участвовал в спортивной жизни школы:', 'очень редко', 'от случая к случаю', 'довольно часто', 'q2', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (48, 'Я поддерживаю дома хороший порядок и почти всегда знаю, что где лежит.', 'да', 'верно нечто среднее', 'нет', 'q3', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (49, 'Когда я думаю о том, что произошло в течение дня, я нередко испытываю беспокойство.', 'да', 'верно нечто среднее', 'нет', 'q4', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (50, 'Иногда я сомневаюсь, действительно ли люди, с которыми я беседую, интересуются тем, что я говорю.', 'да', 'верно нечто среднее', 'нет', 'q4', 2, 1, 0, 0, 0, 0, 0, 2, NULL),
  (51, 'Если бы мне пришлось выбирать, я предпочел бы быть:', 'лесничим', 'трудно выбрать', 'учителем старших классов', 'a', 0, 1, 2, 0, 0, 1, 0, 1, NULL),
  (52, 'Ко дню рождения, к праздникам:', 'я люблю делать подарки', 'затрудняюсь ответить', 'считаю, что покупка подарков - несколько неприятная обязанность', 'a', 2, 1, 0, 0, 0, 0, 1, 3, NULL),
  (53, 'Слово "усталый" так относится к слову "работа", как . слово "гордый" к слову:', 'улыбка', 'успех', 'счастливый', 'b', 0, 1, 0, 0, 0, 0, 0, 1, NULL),
  (54, 'Какое из данных слов не подходит к двум остальным:', 'свеча', 'луна', 'лампа', 'b', 0, 1, 0, 0, 0, 0, 0, 3, NULL),
  (55, 'Мои друзья:', 'меня не подводили', 'изредка', 'подводили довольно часто', 'c', 2, 1, 0, 0, 0, 0, 1, 1, NULL),
  (56, 'У меня есть такие качества, по которым я определенно превосхожу других людей.', 'да', 'не уверен', 'нет', 'e', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (57, 'Когда я расстроен, я всячески стараюсь скрыть свои чувства от других.', 'да, это верно', 'верно нечто среднее', 'нет, это неверно', 'e', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (58, 'Мне хотелось бы ходить в кино, на разные представления и в другие места, где можно развлечься:', 'чаще одного раза в неделю (чаще, чем большинство людей)', 'примерно раз в неделю (как большинство)', 'реже одного раза в неделю (реже, чем большинство)', 'f', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (59, 'Я думаю, что личная свобода в поведении важнее хороших манер и соблюдения этикета.', 'да', 'не уверен', 'нет', 'g', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (60, 'В присутствии людей, более значительных, чем я (людей старше меня, или с большим опытом, или с более высоким положением), я склонен держаться скромно.', 'да', 'верно нечто среднее', 'нет', 'h', 0, 1, 2, 0, 0, 0, 0, 2, NULL),
  (61, 'Мне трудно рассказать что-либо большой группе людей или выступить перед большой аудиторией.', 'да', 'верно нечто среднее', 'нет', 'h', 0, 1, 2, 0, 1, 0, 0, 1, NULL),
  (62, 'Я хорошо ориентируюсь в незнакомой местности: легко могу сказать, где север, где юг, где восток или запад.', 'да', 'верно нечто среднее', 'нет', 'i', 0, 1, 2, 1, 0, 0, 0, 3, NULL),
  (63, 'Если бы кто-то разозлился на меня:', 'я постарался бы его успокоить', 'не знаю, что бы я предпринял', 'это вызвало бы у меня раздражение', 'l', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (64, 'Когда я вижу статью, которую считаю несправедливой, я скорее склонен забыть об этом, чем с возмущением ответить автору.', 'да, это верно', 'не уверен', 'нет, это неверно', 'l', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (65, 'В моей памяти не задерживаются надолго несущественные мелочи, например, название улиц, магазинов.', 'да', 'верно нечто среднее', 'нет', 'm', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (66, 'Мне могла бы понравиться профессия ветеринара, который лечит и оперирует животных.', 'да', 'трудно сказать', 'нет', 'n', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (67, 'Я ем с наслаждением и не всегда столь тщательно забочусь о своих манерах, как это делают другие люди.', 'да, это верно', 'не уверен', 'нет, это неверно', 'n', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (68, 'Бывают периоды, когда мне ни с кем не хочется встречаться.', 'очень редко', 'среднее между а) и в)', 'довольно часто', 'o', 0, 1, 2, 0, 0, 0, 1, 3, NULL),
  (69, 'Иногда мне говорят, что мой голос и вид слишком явно выдают мое волнение.', 'да', 'среднее между а) и в)', 'нет', 'o', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (70, 'Когда я был подростком и мое мнение расходилось с родительским, я обычно:', 'оставался при своем мнении', 'среднее между а) и в)', 'уступал, признавая их авторитет', 'q1', 2, 1, 0, 0, 0, 0, 0, 2, NULL),
  (71, 'Мне бы хотелось работать в отдельной комнате, а не вместе с коллегами.', 'да', 'не уверен', 'нет', 'q2', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (72, 'Я предпочел бы жить тихо, так, как мне нравится, нежели быть предметом восхищения благодаря своим успехам.', 'да', 'верно нечто среднее', 'нет', 'q2', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (73, 'Во многих отношениях я считаю себя вполне зрелым человеком.', 'это верно', 'не уверен', 'это неверно', 'q3', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (74, 'Критика в том виде, в каком ее осуществляют многие люди, скорее выбивает меня из колеи, чем помогает.', 'часто', 'изредка', 'никогда', 'q4', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (75, 'Я всегда в состоянии строго контролировать проявление своих чувств.', 'да', 'верно нечто среднее', 'нет', 'q4', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (76, 'Если бы я сделал полезное изобретение, я предпочел бы:', 'работать над ним в лаборатории дальше', 'трудно выбрать', 'позаботиться о его практическом использовании', 'a', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (77, 'Слово "удивление" так относится к слову "необычный", как слово "страх" к слову:', 'храбрый', 'беспокойный', 'ужасный', 'b', 0, 0, 1, 0, 0, 0, 0, 1, NULL),
  (78, 'Какая из следующих дробей не подходит к двум остальным:', '3/7', '3/9', '3/11', 'b', 0, 1, 0, 0, 0, 0, 0, 3, NULL),
  (79, 'Мне кажется, что некоторые люди не замечают или избегают меня, хотя и не знаю, почему.', 'верно', 'не уверен', 'неверно', 'c', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (80, 'Люди относятся ко мне менее доброжелательно чем я того заслуживаю своим добрым к ним отношением.', 'очень часто', 'иногда', 'никогда', 'c', 0, 1, 2, 0, 0, 1, 0, 2, NULL),
  (81, 'Употребление нецензурных выражений мне всегда противно (даже если при этом нет лиц другого пола).', 'да', 'среднее между а) и в)', 'нет', 'e', 0, 1, 2, 1, 0, 0, 0, 1, NULL),
  (82, 'У меня безусловно меньше друзей, чем у большинства людей.', 'да', 'среднее между а) и в)', 'нет', 'f', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (83, 'Очень не люблю бывать там, где не с кем поговорить.', 'верно', 'не уверен', 'неверно', 'f', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (84, 'Люди иногда называют меня легкомысленным, хотя и считают приятным человеком.', 'да', 'среднее между а) и в)', 'нет', 'g', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (85, 'В различных ситуациях в обществе я испытывал волнение, похожее на то, которое испытывает человек перед выходом не сцену.', 'довольно часто', 'изредка', 'едва ли когда-нибудь', 'h', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (86, 'Находясь в небольшой группе людей, я довольствуюсь тем, что держусь в стороне и по большей части предоставляю возможность говорить другим.', 'да', 'верно нечто среднее', 'нет', 'h', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (87, 'Мне больше нравится читать:', 'реалистические описания острых военных или политических конфликтов', 'не знаю, что выбрать', 'роман, возбуждающий воображение и чувства', 'i', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (88, 'Когда мною пытаются командовать, я нарочно делаю все наоборот.', 'да', 'верно нечто среднее', 'нет', 'l', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (89, 'Если начальство или члены семьи в чем-то меня упрекают, то, как правило, только за дело.', 'верно', 'нечто среднее между а) и. в)', 'неверно', 'l', 0, 1, 2, 0, 0, 0, 1, 1, NULL),
  (90, 'Мне не нравится манера некоторых людей "уставиться" и бесцеремонно смотреть на человека в магазине или на улице.', 'верно', 'верно нечто среднее', 'неверно', 'm', 0, 1, 2, 0, 0, 0, 0, 2, NULL),
  (91, 'Во время продолжительного путешествия я предпочел бы:', 'читать что-нибудь сложное, но интересное', 'не знаю, что выбрал бы', 'провести время, беседуя с попутчиком', 'm', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (92, 'В шутках о смерти нет ничего дурного или противного хорошему вкусу.', 'да', 'верно нечто среднее', 'нет, не согласен', 'n', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (93, 'Если мои знакомые плохо обращаются со мной и не скрывают своей неприязни:', 'это нисколько меня не угнетает', 'верно нечто среднее', 'я падаю духом', 'o', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (94, 'Мне становится не по себе, когда мне говорят комплименты и хвалят в лицо.', 'верно', 'верно нечто среднее', 'неверно', 'o', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (95, 'Я предпочел бы иметь работу:', 'с четко определенным и постоянным заработком', 'верно нечто среднее', 'с более высокой зарплатой, которая бы зависела от моих усилий и продуктивности', 'q1', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (96, 'Мне легче решить трудный вопрос или проблему:', 'если я обсуждаю их с другими', 'верно нечто среднее', 'если я обдумываю их в одиночестве', 'q2', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (97, 'Я охотно участвую в общественной жизни, в работе разных комиссий и т. д.', 'да', 'верно нечто среднее', 'нет', 'q2', 0, 1, 2, 1, 0, 0, 0, 1, NULL),
  (98, 'Выполняя какую-либо работу, я не успокаиваюсь, пока не будут учтены даже самые незначительные детали.', 'да', 'среднее между а) и в)', 'нет', 'q3', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (99, 'Иногда совсем незначительные препятствия очень сильно раздражают меня.', 'да', 'верно нечто среднее', 'нет', 'q4', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (100, 'Я сплю крепко, никогда не разговариваю во сне.', 'да', 'верно нечто среднее', 'нет', 'q4', 0, 1, 2, 0, 0, 0, 0, 2, NULL),
  (101, 'Если бы я работал в хозяйственной сфере, мне было бы интереснее:', 'работать с клиентами', 'нечто среднее', 'работать с документацией', 'a', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (102, 'Слово "размер" так относится к слово "длина", как  слово "нечестный" к слову:', 'тюрьма', 'грешный', 'укравший', 'b', 0, 0, 1, 0, 0, 0, 0, 3, NULL),
  (103, 'АБ так относится к ГВ, как СР к:', 'ПО', 'ОП', 'ТУ', 'b', 0, 1, 0, 0, 0, 0, 0, 1, NULL),
  (104, 'Когда люди ведут себя неблагоразумно и безрассудно:', 'я отношусь к этому спокойно', 'верно нечто среднее', 'испытываю к ним чувство презрения', 'c', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (105, 'Когда я слушаю музыку, а рядом громко разговаривают:', 'это мне не мешает, я могу сосредоточиться', 'верно нечто среднее', 'это портит мне все удовольствие и злит меня', 'c', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (106, 'Думаю, что обо мне правильнее сказать, что я:', 'вежливый и спокойный', 'верно нечто среднее', 'энергичный и напористый', 'e', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (107, 'Я считаю, что:', 'жить нужно по принципу "делу - время, потехе - час"', 'нечто среднее между а) и в)', 'жить нужно весело, не особенно заботясь о завтрашнем дне', 'f', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (108, 'Лучше быть осторожным и ожидать малого, чем заранее радоваться, в глубине души предвкушая успех.', 'согласен', 'не уверен', 'не согласен', 'f', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (109, 'Если я задумываюсь о возможных трудностях в своей работе:', 'я стараюсь заранее придумать, как с ними справиться', 'верно нечто среднее', 'думаю, что справлюсь с ними, когда они появятся', 'g', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (110, 'Я легко осваиваюсь в любом обществе.', 'да', 'не уверен', 'нет', 'h', 2, 1, 0, 0, 0, 0, 0, 2, NULL),
  (111, 'Когда нужно немного дипломатии и умения убедить людей в чем-нибудь, обычно обращаются ко мне.', 'да', 'верно нечто среднее', 'нет', 'h', 2, 1, 0, 1, 0, 0, 0, 1, NULL),
  (112, 'Мне было бы интереснее:', 'консультировать молодых людей, помогать им в выборе работы', 'затрудняюсь ответить', 'работать инженером-экономистом', 'i', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (113, 'Если я абсолютно уверен, что человек поступает несправедливо или эгоистично, я заявляю ему об этом, даже если это грозит мне некоторыми неприятностями.', 'да', 'верно нечто среднее', 'нет', 'l', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (114, 'Иногда я в шутку делаю какое-нибудь дурашливое замечание только для того, чтобы удивить людей и посмотреть, что они на это скажут.', 'да', 'верно нечто среднее', 'нет', 'l', 2, 1, 0, 0, 1, 0, 0, 3, NULL),
  (115, 'Я бы с удовольствием работал в газете обозревателем театральных постановок, концертов и т. п.', 'да', 'не уверен', 'нет', 'm', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (116, 'Если мне приходится долго сидеть на собрании, не разговаривая и не двигаясь, я никогда не испытываю потребности рисовать что-либо и ерзать на стуле.', 'согласен', 'не уверен', 'не согласен', 'm', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (117, 'Если мне кто-то говорит то, что, как мне известно, не соответствует действительности, я скорее подумаю:', '"Он - лжец"', 'верно нечто среднее', '"Видимо, его неверно информировали"', 'n', 2, 1, 0, 0, 0, 1, 0, 1, NULL),
  (118, 'Предчувствие, что меня ожидает какое-то наказание, даже если я не сделал ничего дурного, возникает у меня:', 'часто', 'иногда', 'никогда', 'o', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (119, 'Мнение, что болезни вызываются психическими причинами в той же мере, что и физическими (телесными), значительно преувеличено.', 'да', 'верно нечто среднее', 'нет', 'o', 2, 1, 0, 0, 0, 1, 0, 1, NULL),
  (120, 'Торжественность, красочность должны обязательно сохраняться в любой важной государственной церемонии.', 'да', 'верно нечто среднее', 'нет', 'q1', 0, 1, 2, 0, 0, 0, 0, 2, NULL),
  (121, 'Мне неприятно, если люди считают, что я слишком невыдержан и пренебрегаю правилами приличия.', 'очень', 'немного', 'совсем не беспокоит', 'q2', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (122, 'Работая над чем-то, я предпочел бы делать это:', 'в коллективе', 'не знаю, что выбрал бы', 'самостоятельно', 'q2', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (123, 'Бывают периоды, когда трудно удержаться от чувства жалости к самому себе.', 'часто', 'иногда', 'никогда', 'q3', 0, 1, 2, 0, 1, 1, 0, 1, NULL),
  (124, 'Зачастую люди слишком быстро выводят меня из себя.', 'да', 'верно нечто среднее', 'нет', 'q4', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (125, 'Я всегда могу без особых трудностей избавиться от старых привычек и не возвращаться к ним больше.', 'да', 'верно нечто среднее', 'нет', 'q4', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (126, 'При одинаковой зарплате я предпочел бы быть:', 'адвокатом', 'затрудняюсь выбрать', 'штурманом или летчиком', 'a', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (127, 'Слово "лучше" так относится к слову "наихудший", как слово "медленнее" к слову:', 'скорый', 'наилучший', 'быстрейший', 'b', 0, 0, 1, 0, 0, 0, 0, 1, NULL),
  (128, 'Какое из следующих сочетаний знаков должно продолжить этот ряд: ХООООХХОООХХХ?', 'ОХХХ', 'ООХХ', 'ХООО', 'b', 0, 1, 0, 0, 0, 0, 0, 3, NULL),
  (129, 'Когда приходит время для осуществления того, что я заранее планировал и ждал, я иногда чувствую себя не в состоянии это сделать.', 'согласен', 'верно нечто среднее', 'не согласен', 'c', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (130, 'Обычно я могу сосредоточенно работать, не обращая внимания на то, что люди вокруг меня шумят.', 'да', 'верно нечто среднее', 'нет', 'c', 2, 1, 0, 1, 0, 0, 0, 2, NULL),
  (131, 'Бывает, что я говорю незнакомым людям о вещах, которые кажутся мне важными, независимо от того, спрашивают меня об этом или нет.', 'да', 'верно нечто среднее', 'нет', 'e', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (132, 'Я провожу много свободного времени, беседуя с друзьями о тех приятных событиях, которые мы вместе пережили когда-то.', 'да', 'верно нечто среднее', 'нет', 'f', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (133, 'Мне доставляет удовольствие совершать рискованные поступки только ради забавы.', 'да', 'верно нечто среднее', 'нет', 'f', 2, 1, 0, 0, 1, 0, 0, 1, NULL),
  (134, 'Меня очень раздражает вид неубранной комнаты.', 'да', 'верно нечто среднее', 'нет', 'g', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (135, 'Я считаю себя очень общительным (открытым) человеком.', 'да', 'верно нечто среднее', 'нет', 'h', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (136, 'В общении с людьми:', 'я не стараюсь сдерживать свои чувства', 'верно нечто среднее', 'я скрываю свои чувства', 'h', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (137, 'Я люблю музыку:', 'легкую, живую, холодноватую', 'верно нечто среднее', 'эмоционально насыщенную и сентиментальную', 'i', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (138, 'Меня больше восхищает красота стиха, чем красота и совершенство оружия.', 'да', 'не уверен', 'нет', 'i', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (139, 'Если мое удачное замечание осталось незамеченным:', 'я не повторяю его', 'затрудняюсь ответить', 'повторяю свое замечание снова', 'l', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (140, 'Мне бы хотелось вести работу среди несовершеннолетних правонарушителей, освобожденных на поруки.', 'да', 'не уверен', 'нет', 'm', 2, 1, 0, 0, 0, 0, 0, 2, NULL),
  (141, 'Для меня более важно:', 'сохранять хорошие отношения с людьми', 'верно нечто среднее', 'свободно выражать свои чувства', 'm', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (142, 'В туристском путешествии я предпочел бы придерживаться программы, составленной специалистами, нежели самому планировать свой маршрут.', 'да', 'не уверен', 'нет', 'n', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (143, 'Обо мне справедливо думают, что я упорный и трудолюбивый человек, но успехов добиваюсь редко.', 'да', 'не уверен', 'нет', 'o', 2, 1, 0, 0, 0, 1, 0, 1, NULL),
  (144, 'Если люди злоупотребляют моим расположением к ним, я не обижаюсь и быстро забываю об этом.', 'согласен', 'не уверен', 'не согласен', 'o', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (145, 'Если бы в группе разгорелся жаркий спор:', 'мне было бы любопытно, кто выйдет победителем', 'верно нечто среднее', 'я бы очень хотел, чтобы все закончилось мирно', 'q1', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (146, 'Я предпочитаю планировать свои дела сам, без постороннего вмешательства и чужих советов.', 'да', 'верно нечто среднее', 'нет', 'q2', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (147, 'Иногда чувство зависти влияет на мои поступки.', 'да', 'верно нечто среднее', 'нет', 'q3', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (148, 'Я твердо убежден, что начальник может быть не всегда прав, но он всегда имеет право настоять на на своем.', 'да', 'не уверен', 'нет', 'q3', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (149, 'Я начинаю нервничать, когда задумываюсь обо всем, что меня ожидает.', 'да', 'иногда', 'нет', 'q4', 2, 1, 0, 0, 1, 0, 0, 1, NULL),
  (150, 'Если я участвую в какой-нибудь игре, а окружающие громко высказывают свои соображения, меня это не выводит из равновесия.', 'согласен', 'не уверен', 'не согласен', 'q4', 0, 1, 2, 0, 0, 0, 0, 2, NULL),
  (151, 'Мне кажется, интереснее быть:', 'художником', 'не знаю, что выбрать', 'директором театра или киностудии', 'a', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (152, 'Какое из следующих слов не подходит к двум остальным:', 'какой-либо', 'несколько', 'большая часть', 'b', 1, 0, 0, 0, 0, 0, 0, 3, NULL),
  (153, 'Слово "пламя" так относится к слову "жара", как слово "роза" к слову:', 'шипы', 'красные лепестки', 'запах', 'b', 0, 0, 1, 0, 0, 0, 0, 1, NULL),
  (154, 'У меня бывают такие волнующие сны, что я просыпаюсь.', 'часто', 'изредка', 'практически никогда', 'c', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (155, 'Даже если многое против успеха какого-либо начинания, я все-таки считаю, что стоит рискнуть.', 'да', 'верно нечто среднее', 'нет', 'e', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (156, 'Мне нравятся ситуации, в которых я невольно оказываюсь в роли руководителя, потому что лучше всех знаю, что должен делать коллектив.', 'да', 'верно нечто среднее', 'нет', 'e', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (157, 'Я предпочел бы одеваться скорее скромно, так, как все, чем броско и оригинально.', 'согласен', 'не уверен', 'не согласен', 'f', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (158, 'Вечер, проведенный за любимым занятием, привлекает меня больше, чем оживленная вечеринка.', 'согласен', 'не уверен', 'не согласен', 'f', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (159, 'Порой я пренебрегаю добрыми советами людей, хотя и знаю, что не должен бы этого делать.', 'изредка', 'вряд ли когда-нибудь', 'никогда', 'g', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (160, 'Принимая решения, я считаю для себя обязательным учитывать основные нормы поведения «Что такое хорошо и что такое плохо".', 'да', 'верно нечто среднее', 'нет', 'g', 2, 1, 0, 0, 0, 0, 0, 2, NULL),
  (161, 'Мне не нравится, когда люди смотрят, как я работаю.', 'да', 'верно нечто среднее', 'нет', 'h', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (162, 'Не всегда можно осуществить что-либо постепенными, умеренными методами, иногда необходимо применить силу.', 'согласен', 'верно нечто среднее', 'не согласен', 'i', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (163, 'В школе я предпочитал (предпочитаю):', 'русский язык', 'трудно сказать', 'математику или арифметику', 'i', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (164, 'Иногда у меня бывали огорчения из-за того, что люди говорили обо мне дурно за глаза без всяких на то оснований.', 'да', 'затрудняюсь ответить', 'нет', 'l', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (165, 'Разговоры с людьми заурядными, связанными условностями и своими привычками:', 'часто бывают весьма интересны и содержательны', 'верно нечто среднее', 'раздражают меня, так как беседа вертится вокруг пустяков и ей недостает глубины', 'm', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (166, 'Некоторые вещи вызывают во мне такой гнев, что я предпочитаю вообще о них не говорить.', 'да', 'верно нечто среднее', 'нет', 'm', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (167, 'В воспитании важнее:', 'окружить ребенка любовью и заботой', 'верно нечто среднее', 'выработать у ребенка желательные навыки и взгляды', 'n', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (168, 'Люди считают меня спокойным, уравновешенным человеком, который остается невозмутимым при любых обстоятельствах.', 'да', 'верно нечто среднее', 'нет', 'o', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (169, 'Я думаю, что наше общество, руководствуясь целесообразностью, должно создавать новые обычаи и отбрасывать в сторону старые привычки и традиции.', 'да', 'верно нечто среднее', 'нет', 'q1', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (170, 'У меня бывали неприятные случаи из-за того, что, задумавшись, я становился невнимателен.', 'едва ли когда-нибудь', 'верно нечто среднее', 'несколько раз', 'q1', 0, 1, 2, 0, 0, 0, 0, 2, NULL),
  (171, 'Я лучше усваиваю материал:', 'читая хорошо написанную книгу', 'верно нечто среднее', 'участвуя в коллективном обсуждении', 'q2', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (172, 'Я предпочитаю действовать посвоему, вместо того, чтобы придерживаться общепринятых правил.', 'согласен', 'не уверен', 'не согласен', 'q3', 0, 1, 2, 0, 0, 0, 0, 3, NULL),
  (173, 'Прежде чем высказать свое мнение, я предпочитаю подождать, пока не буду полностью уверен в своей правоте.', 'всегда', 'обычно', 'только если это практически возможно', 'q3', 2, 1, 0, 1, 0, 0, 0, 1, NULL),
  (174, 'Иногда мелочи нестерпимо действуют на нервы, хотя я и понимаю, что это пустяки.', 'да', 'верно нечто среднее', 'нет', 'q4', 2, 1, 0, 0, 1, 0, 0, 3, NULL),
  (175, 'Я не часто говорю под влиянием момента такое, о чем мне позже приходится пожалеть.', 'согласен', 'не уверен', 'не согласен', 'q4', 0, 1, 2, 0, 0, 0, 0, 1, NULL),
  (176, 'Если бы меня попросили организовать сбор денег на подарок кому-нибудь или участвовать в организации юбилейного торжества:', 'я согласился бы', 'не знаю, что сделал бы', 'сказал бы, что, к сожалению, очень занят', 'a', 2, 1, 0, 0, 0, 0, 1, 3, NULL),
  (177, 'Какое из следующих слов не подходит к двум остальным:', 'широкий', 'зигзагообразный', 'прямой', 'b', 1, 0, 0, 0, 0, 0, 0, 1, NULL),
  (178, 'Слово "скоро" так относится к слову "никогда", как слово "близко" к слову:', 'нигде', 'далеко', 'прочь', 'b', 1, 0, 0, 0, 0, 0, 0, 3, NULL),
  (179, 'Если я совершил какой-то промах в обществе, я довольно быстро забываю об этом.', 'да', 'верно нечто среднее', 'нет', 'c', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (180, 'Окружающим известно, что у меня много разных идей и я почти всегда могу предложить какое-то решение проблемы.', 'да', 'верно нечто среднее', 'нет', 'e', 2, 1, 0, 0, 0, 0, 0, 2, NULL),
  (181, 'Пожалуй, для меня более характерна:', 'нервозность при встрече с неожиданными трудностями', 'не знаю, что выбрать', 'терпимость к желаниям (требованиям) других людей', 'e', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (182, 'Меня считают очень восторженным человеком.', 'да', 'верно нечто среднее', 'нет', 'f', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (183, 'Мне нравится работа разнообразная, связанная с частыми переменами и поездками, даже если она немного опасна.', 'да', 'верно нечто среднее', 'нет', 'f', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (184, 'Я человек весьма пунктуальный и всегда настаиваю на том, чтобы все выполнялось как можно точнее.', 'согласен', 'верно нечто среднее', 'не согласен', 'g', 2, 1, 0, 1, 0, 0, 0, 3, NULL),
  (185, 'Мне доставляет удовольствие работа, которая требует особой добросовестности и тонкого мастерства.', 'да', 'верно нечто среднее', 'нет', 'g', 2, 1, 0, 0, 0, 0, 0, 1, NULL),
  (186, 'Я принадлежу к числу энергичных людей, которые всегда чем-то заняты.', 'да', 'не уверен', 'нет', 'h', 2, 1, 0, 0, 0, 0, 0, 3, NULL),
  (187, 'Я добросовестно ответил на все вопросы и ни одного не пропустил.', 'да', 'не уверен', 'нет', '', 0, 0, 0, 0, 0, 0, 0, 1, NULL);

-- 
-- Вывод данных для таблицы cattell_sten
--
INSERT INTO cattell_sten VALUES 
  (1, 1, 16, 19, 'a', 4, 6, 7, 8, 10, 12, 13, 15, 16),
  (2, 1, 16, 19, 'b', 3, 4, 5, 6, 7, 9, 10, 11, 12),
  (3, 1, 16, 19, 'c', 6, 8, 10, 12, 14, 16, 18, 20, 22),
  (4, 1, 16, 19, 'e', 4, 6, 9, 11, 14, 17, 19, 22, 24),
  (5, 1, 16, 19, 'f', 5, 7, 9, 12, 14, 17, 19, 21, 24),
  (6, 1, 16, 19, 'g', 0, 2, 4, 6, 9, 12, 14, 16, 18),
  (7, 1, 16, 19, 'h', 2, 4, 6, 8, 11, 15, 17, 19, 21),
  (8, 1, 16, 19, 'i', 1, 3, 5, 7, 8, 10, 13, 15, 17),
  (9, 1, 16, 19, 'l', 3, 5, 7, 9, 10, 12, 14, 16, 17),
  (10, 1, 16, 19, 'm', 4, 6, 8, 9, 11, 13, 14, 16, 18),
  (11, 1, 16, 19, 'n', 3, 4, 5, 7, 8, 9, 11, 12, 13),
  (12, 1, 16, 19, 'o', 2, 4, 6, 7, 9, 11, 13, 14, 16),
  (13, 1, 16, 19, 'q1', 2, 5, 7, 8, 10, 12, 14, 16, 17),
  (14, 1, 16, 19, 'q2', 5, 7, 8, 10, 11, 13, 14, 16, 17),
  (15, 1, 16, 19, 'q3', 5, 6, 8, 9, 11, 12, 14, 15, 17),
  (16, 1, 16, 19, 'q4', 2, 4, 7, 9, 11, 14, 16, 19, 21),
  (17, 1, 20, 24, 'a', 4, 5, 7, 9, 10, 12, 14, 15, 17),
  (18, 1, 20, 24, 'b', 3, 4, 5, 6, 7, 8, 9, 10, 11),
  (19, 1, 20, 24, 'c', 5, 7, 9, 11, 14, 16, 18, 20, 22),
  (20, 1, 20, 24, 'e', 3, 5, 8, 10, 13, 16, 18, 21, 23),
  (21, 1, 20, 24, 'f', 4, 6, 8, 11, 13, 15, 18, 20, 22),
  (22, 1, 20, 24, 'g', 2, 4, 6, 8, 11, 13, 15, 17, 18),
  (23, 1, 20, 24, 'h', 1, 3, 5, 8, 11, 15, 17, 19, 21),
  (24, 1, 20, 24, 'i', 1, 3, 5, 7, 8, 10, 12, 14, 16),
  (25, 1, 20, 24, 'l', 4, 5, 7, 9, 10, 12, 13, 15, 16),
  (26, 1, 20, 24, 'm', 5, 6, 8, 9, 11, 13, 14, 16, 18),
  (27, 1, 20, 24, 'n', 3, 5, 6, 7, 9, 10, 11, 13, 14),
  (28, 1, 20, 24, 'o', 1, 3, 5, 7, 9, 11, 13, 14, 16),
  (29, 1, 20, 24, 'q1', 1, 3, 5, 7, 9, 11, 13, 14, 16),
  (30, 1, 20, 24, 'q2', 5, 6, 8, 9, 11, 13, 14, 16, 17),
  (31, 1, 20, 24, 'q3', 5, 7, 8, 10, 11, 13, 14, 16, 17),
  (32, 1, 20, 24, 'q4', 2, 4, 7, 9, 11, 14, 16, 19, 21),
  (33, 1, 25, 33, 'a', 4, 6, 7, 9, 11, 12, 14, 16, 18),
  (34, 1, 25, 33, 'b', 3, 4, 5, 6, 7, 8, 9, 10, 11),
  (35, 1, 25, 33, 'c', 5, 7, 9, 11, 13, 15, 18, 20, 22),
  (36, 1, 25, 33, 'e', 3, 5, 8, 10, 13, 15, 18, 21, 23),
  (37, 1, 25, 33, 'f', 4, 6, 8, 10, 12, 14, 16, 18, 20),
  (38, 1, 25, 33, 'g', 4, 7, 9, 10, 13, 14, 16, 17, 19),
  (39, 1, 25, 33, 'h', 1, 4, 5, 8, 10, 15, 17, 19, 21),
  (40, 1, 25, 33, 'i', 1, 3, 4, 6, 7, 9, 11, 14, 16),
  (41, 1, 25, 33, 'l', 4, 5, 7, 9, 10, 12, 13, 15, 16),
  (42, 1, 25, 33, 'm', 5, 7, 8, 10, 11, 13, 14, 16, 17),
  (43, 1, 25, 33, 'n', 4, 5, 7, 8, 9, 11, 12, 13, 15),
  (44, 1, 25, 33, 'o', 1, 3, 5, 7, 9, 11, 13, 15, 17),
  (45, 1, 25, 33, 'q1', 2, 4, 5, 6, 8, 10, 12, 13, 15),
  (46, 1, 25, 33, 'q2', 4, 6, 7, 9, 10, 12, 13, 15, 17),
  (47, 1, 25, 33, 'q3', 6, 7, 9, 10, 12, 14, 15, 17, 18),
  (48, 1, 25, 33, 'q4', 2, 5, 7, 9, 11, 14, 16, 18, 21),
  (49, 1, 34, 45, 'a', 4, 6, 8, 9, 11, 13, 15, 17, 18),
  (50, 1, 34, 45, 'b', 3, 4, 5, 6, 7, 8, 8, 9, 10),
  (51, 1, 34, 45, 'c', 5, 7, 9, 11, 13, 15, 17, 19, 21),
  (52, 1, 34, 45, 'e', 2, 5, 7, 10, 12, 15, 18, 20, 23),
  (53, 1, 34, 45, 'f', 3, 5, 7, 9, 11, 13, 15, 17, 19),
  (54, 1, 34, 45, 'g', 6, 9, 11, 13, 15, 16, 17, 18, 19),
  (55, 1, 34, 45, 'h', 1, 4, 5, 8, 11, 15, 17, 19, 21),
  (56, 1, 34, 45, 'i', 1, 3, 4, 6, 7, 9, 11, 14, 16),
  (57, 1, 34, 45, 'l', 5, 6, 8, 9, 10, 12, 13, 15, 16),
  (58, 1, 34, 45, 'm', 6, 7, 9, 10, 12, 13, 15, 16, 18),
  (59, 1, 34, 45, 'n', 5, 6, 7, 9, 10, 11, 13, 14, 15),
  (60, 1, 34, 45, 'o', 1, 3, 5, 7, 9, 11, 13, 15, 18),
  (61, 1, 34, 45, 'q1', 2, 3, 5, 6, 7, 9, 11, 12, 14),
  (62, 1, 34, 45, 'q2', 3, 5, 7, 8, 10, 11, 13, 14, 16),
  (63, 1, 34, 45, 'q3', 7, 8, 10, 11, 13, 14, 16, 17, 18),
  (64, 1, 34, 45, 'q4', 2, 5, 7, 9, 11, 14, 16, 18, 21),
  (65, 1, 46, 60, 'a', 4, 6, 8, 10, 12, 14, 16, 17, 19),
  (66, 1, 46, 60, 'b', 2, 3, 4, 5, 6, 7, 8, 9, 10),
  (67, 1, 46, 60, 'c', 4, 6, 8, 10, 12, 15, 17, 19, 21),
  (68, 1, 46, 60, 'e', 2, 5, 7, 10, 13, 15, 18, 20, 23),
  (69, 1, 46, 60, 'f', 2, 4, 6, 8, 10, 11, 13, 15, 17),
  (70, 1, 46, 60, 'g', 8, 11, 14, 15, 16, 17, 18, 19, 19),
  (71, 1, 46, 60, 'h', 2, 4, 5, 8, 12, 14, 17, 20, 22),
  (72, 1, 46, 60, 'i', 1, 2, 4, 5, 7, 9, 11, 14, 16),
  (73, 1, 46, 60, 'l', 5, 6, 8, 9, 10, 12, 13, 14, 16),
  (74, 1, 46, 60, 'm', 7, 8, 10, 11, 12, 14, 15, 17, 18),
  (75, 1, 46, 60, 'n', 5, 7, 8, 9, 11, 12, 13, 15, 16),
  (76, 1, 46, 60, 'o', 1, 3, 5, 8, 10, 12, 14, 16, 18),
  (77, 1, 46, 60, 'q1', 2, 3, 4, 6, 7, 8, 10, 12, 14),
  (78, 1, 46, 60, 'q2', 3, 4, 6, 7, 9, 10, 12, 13, 15),
  (79, 1, 46, 60, 'q3', 7, 9, 11, 12, 14, 15, 17, 17, 19),
  (80, 1, 46, 60, 'q4', 3, 5, 7, 9, 11, 14, 16, 18, 20),
  (81, 2, 16, 19, 'a', 5, 7, 8, 10, 12, 14, 15, 17, 19),
  (82, 2, 16, 19, 'b', 3, 4, 5, 6, 7, 9, 10, 11, 12),
  (83, 2, 16, 19, 'c', 5, 7, 9, 11, 12, 14, 16, 18, 20),
  (84, 2, 16, 19, 'e', 3, 5, 7, 9, 11, 13, 16, 18, 20),
  (85, 2, 16, 19, 'f', 6, 8, 10, 12, 13, 16, 18, 20, 22),
  (86, 2, 16, 19, 'g', 3, 5, 8, 10, 11, 13, 15, 16, 18),
  (87, 2, 16, 19, 'h', 1, 2, 5, 7, 10, 13, 16, 19, 22),
  (88, 2, 16, 19, 'i', 7, 9, 10, 12, 13, 15, 16, 17, 19),
  (89, 2, 16, 19, 'l', 4, 6, 8, 9, 11, 12, 13, 15, 17),
  (90, 2, 16, 19, 'm', 3, 5, 6, 8, 10, 12, 14, 15, 17),
  (91, 2, 16, 19, 'n', 4, 5, 7, 8, 10, 11, 13, 14, 16),
  (92, 2, 16, 19, 'o', 4, 6, 8, 9, 11, 13, 15, 17, 19),
  (93, 2, 16, 19, 'q1', 1, 3, 4, 6, 8, 9, 11, 12, 14),
  (94, 2, 16, 19, 'q2', 5, 7, 8, 9, 10, 12, 13, 14, 15),
  (95, 2, 16, 19, 'q3', 4, 5, 7, 8, 10, 11, 13, 14, 16),
  (96, 2, 16, 19, 'q4', 7, 8, 10, 12, 14, 16, 18, 20, 23),
  (97, 2, 20, 24, 'a', 5, 7, 8, 10, 12, 14, 15, 17, 19),
  (98, 2, 20, 24, 'b', 3, 4, 5, 6, 7, 9, 10, 11, 12),
  (99, 2, 20, 24, 'c', 4, 6, 8, 10, 12, 13, 15, 17, 20),
  (100, 2, 20, 24, 'e', 2, 5, 7, 9, 11, 13, 15, 17, 20),
  (101, 2, 20, 24, 'f', 4, 6, 8, 10, 12, 14, 16, 18, 20),
  (102, 2, 20, 24, 'g', 5, 7, 9, 11, 12, 14, 15, 16, 18),
  (103, 2, 20, 24, 'h', 0, 2, 4, 7, 10, 12, 16, 19, 22),
  (104, 2, 20, 24, 'i', 7, 8, 10, 12, 13, 15, 16, 17, 19),
  (105, 2, 20, 24, 'l', 4, 6, 8, 9, 11, 12, 14, 15, 17),
  (106, 2, 20, 24, 'm', 4, 5, 7, 9, 10, 12, 14, 15, 17),
  (107, 2, 20, 24, 'n', 4, 5, 7, 9, 10, 12, 13, 15, 17),
  (108, 2, 20, 24, 'o', 4, 6, 8, 9, 11, 13, 15, 17, 19),
  (109, 2, 20, 24, 'q1', 1, 3, 4, 6, 8, 9, 11, 12, 14),
  (110, 2, 20, 24, 'q2', 5, 7, 8, 9, 10, 12, 13, 14, 15),
  (111, 2, 20, 24, 'q3', 5, 6, 8, 9, 10, 12, 13, 15, 17),
  (112, 2, 20, 24, 'q4', 6, 8, 10, 12, 14, 16, 18, 20, 23),
  (113, 2, 25, 33, 'a', 5, 6, 8, 10, 12, 13, 15, 17, 18),
  (114, 2, 25, 33, 'b', 2, 4, 5, 6, 7, 8, 9, 10, 11),
  (115, 2, 25, 33, 'c', 3, 5, 7, 9, 11, 13, 15, 17, 19),
  (116, 2, 25, 33, 'e', 2, 4, 7, 9, 11, 13, 15, 17, 19),
  (117, 2, 25, 33, 'f', 3, 5, 7, 9, 11, 13, 15, 17, 19),
  (118, 2, 25, 33, 'g', 7, 8, 10, 11, 13, 15, 16, 17, 18),
  (119, 2, 25, 33, 'h', 0, 2, 4, 7, 9, 12, 15, 18, 22),
  (120, 2, 25, 33, 'i', 7, 8, 10, 12, 13, 15, 16, 17, 19),
  (121, 2, 25, 33, 'l', 4, 6, 7, 9, 10, 12, 13, 15, 16),
  (122, 2, 25, 33, 'm', 4, 6, 7, 9, 11, 12, 14, 16, 17),
  (123, 2, 25, 33, 'n', 5, 6, 8, 9, 11, 12, 14, 15, 17),
  (124, 2, 25, 33, 'o', 4, 6, 8, 9, 11, 13, 15, 17, 19),
  (125, 2, 25, 33, 'q1', 2, 3, 5, 6, 7, 9, 11, 12, 14),
  (126, 2, 25, 33, 'q2', 5, 6, 8, 9, 11, 12, 14, 15, 17),
  (127, 2, 25, 33, 'q3', 5, 7, 8, 10, 11, 13, 14, 16, 17),
  (128, 2, 25, 33, 'q4', 5, 7, 10, 12, 14, 16, 18, 21, 22),
  (129, 2, 34, 45, 'a', 5, 6, 8, 10, 11, 13, 15, 16, 18),
  (130, 2, 34, 45, 'b', 2, 3, 4, 5, 6, 7, 8, 9, 10),
  (131, 2, 34, 45, 'c', 4, 5, 7, 9, 11, 13, 15, 17, 19),
  (132, 2, 34, 45, 'e', 2, 4, 6, 8, 11, 13, 15, 17, 19),
  (133, 2, 34, 45, 'f', 2, 4, 6, 8, 10, 12, 14, 16, 18),
  (134, 2, 34, 45, 'g', 8, 10, 11, 12, 14, 15, 17, 18, 19),
  (135, 2, 34, 45, 'h', 0, 2, 4, 6, 9, 11, 15, 18, 22),
  (136, 2, 34, 45, 'i', 6, 8, 10, 12, 14, 15, 16, 17, 18),
  (137, 2, 34, 45, 'l', 4, 6, 7, 9, 10, 12, 13, 15, 16),
  (138, 2, 34, 45, 'm', 4, 6, 8, 9, 11, 13, 14, 16, 17),
  (139, 2, 34, 45, 'n', 5, 6, 8, 9, 11, 12, 14, 15, 17),
  (140, 2, 34, 45, 'o', 4, 6, 8, 9, 11, 13, 15, 17, 19),
  (141, 2, 34, 45, 'q1', 2, 3, 4, 5, 7, 9, 11, 12, 13),
  (142, 2, 34, 45, 'q2', 5, 6, 8, 9, 11, 12, 14, 16, 17),
  (143, 2, 34, 45, 'q3', 6, 7, 9, 10, 12, 13, 15, 16, 18),
  (144, 2, 34, 45, 'q4', 5, 7, 9, 12, 14, 16, 18, 21, 22),
  (145, 2, 46, 55, 'a', 5, 6, 8, 10, 11, 13, 15, 16, 18),
  (146, 2, 46, 55, 'b', 1, 2, 3, 4, 5, 6, 7, 8, 10),
  (147, 2, 46, 55, 'c', 4, 6, 8, 10, 12, 14, 15, 17, 19),
  (148, 2, 46, 55, 'e', 2, 4, 6, 8, 10, 12, 14, 17, 19),
  (149, 2, 46, 55, 'f', 0, 2, 4, 6, 8, 10, 12, 14, 16),
  (150, 2, 46, 55, 'g', 9, 10, 12, 13, 15, 16, 17, 18, 19),
  (151, 2, 46, 55, 'h', 0, 2, 4, 6, 8, 10, 14, 17, 22),
  (152, 2, 46, 55, 'i', 6, 8, 10, 12, 14, 15, 17, 18, 19),
  (153, 2, 46, 55, 'l', 4, 5, 7, 8, 10, 11, 13, 14, 16),
  (154, 2, 46, 55, 'm', 4, 6, 8, 9, 11, 13, 15, 17, 18),
  (155, 2, 46, 55, 'n', 6, 8, 9, 11, 12, 13, 15, 16, 17),
  (156, 2, 46, 55, 'o', 4, 6, 8, 9, 11, 13, 15, 17, 19),
  (157, 2, 46, 55, 'q1', 1, 2, 4, 5, 6, 8, 10, 11, 12),
  (158, 2, 46, 55, 'q2', 5, 6, 8, 9, 11, 13, 14, 16, 17),
  (159, 2, 46, 55, 'q3', 6, 8, 9, 11, 12, 14, 15, 17, 18),
  (160, 2, 46, 55, 'q4', 5, 7, 9, 12, 14, 16, 18, 21, 22),
  (161, 0, 0, 100, 'md', 2, 3, 4, 5, 6, 7, 8, 9, 10),
  (162, 0, 0, 100, 'fb', 1, 2, 3, 3, 4, 4, 5, 5, 6),
  (163, 0, 0, 100, 'ft', -11, -2, 7, 19, 32, 44, 56, 68, 78),
  (164, 0, 0, 100, 'fe', 12, 23, 38, 54, 70, 86, 100, 116, 129);

-- 
-- Вывод данных для таблицы cattell_text
--
INSERT INTO cattell_text VALUES 
  ('a', 3, 1, 15, 'Эмоционально скуп, не нуждается в общении и избегает его. Предпочитает работать в одиночестве. Часто бывает недружелюбен, отчужден, равнодушен.', 'Следует обратить внимание на возможность возникновения межличностных конфликтов и трудностей во взаимоотношениях с людьми.', 'Данному работнику рекомендуется профессиональная деятельность, требующая практического подхода к решению интеллектуальных задач. Он может испытывать значительные трудности во взаимоотношениях с людьми.'),
  ('a', 3, 16, 35, 'Эмоционально сдержан, мало общителен. Нередко испытывает дискомфорт в коллективе, желание работать в одиночестве.', 'Следует обратить внимание на возможность возникновения трудностей во взаимоотношениях с людьми.', 'Этому работнику рекомендуется профессиональная деятельность, допускающая хотя бы периодически работу в одиночестве или в коллективе из двух-трех человек. Такая работа позволит ему преодолевать возникающие порой трудности в отношениях с людьми.'),
  ('a', 3, 36, 65, 'Эпизодически предпочитает работать в одиночестве. В благоприятных обстоятельствах может ладить с людьми. Излишняя эмоциональность для данного работника не характерна.', NULL, NULL),
  ('a', 3, 66, 85, 'Достаточно открыт в общении, любит работать с людьми.', NULL, 'В своих действиях и поступках этот работник, как правило, учитывает мнение коллектива.'),
  ('a', 3, 86, 100, 'Этот работник очень эмоционален, открыт и непринужден в общении. Доброжелателен к людям.', 'Ваше несомненное достоинство - общительный, открытый и доброжелательный характер.', 'Данный работник может формировать вокруг себя на производстве активные группы (напр., оперативные группы для быстрого решения возникшей проблемы), любит идти в ногу с событиями. Он во многом полагается на мнение коллектива.'),
  ('b', 1, 1, 15, 'Обладая конкретным мышлением, данный работник не любит абстрактных и неопределенных задач, понятий, ситуаций. Для него характерны трудности при обучении и отсутствие желания работать.', 'Особенности Вашего мышления позволяют Вам решать главным образом практические задачи - задачи с четкими условиями и готовыми алгоритмами решения.', 'Этот работник эффективен в работе, требующей исполнения готовых предписаний. Противопоказана работа, связанная с принятием решений, выработкой стратегии, логическим анализом и решением теоретических задач. Необходим постоянный контроль со стороны руководства.'),
  ('b', 1, 16, 35, 'В большинстве ситуаций этот работник мыслит конкретно, предпочитает решать практические задачи. Возможны трудности в обучении традиционными методами', 'Особенности Вашего мышления позволяют Вам успешнее решать задачи практического, а не абстрактного характера.', 'Наиболее подходящая для данного работника профессиональная деятельность - это деятельность, протекающая по заданным алгоритмам, работа, выполняемая по готовым инструкциям. Не рекомендуется работа, для выполнения которой требуются нестандартные решения. В работе желателен эпизодический контроль со стороны руководства.'),
  ('b', 1, 36, 65, 'У этого работника скорее конкретное, чем абстрактное мышление. Многое воспринимает буквально. Может испытывать трудности при овладении теоретическим материалом', NULL, NULL),
  ('b', 1, 66, 85, 'У данного работника довольно большие способности к обучению. В зависимости от задач и обстоятельств может мыслить и конкретно и абстрактно.', NULL, 'Этот работник может быть эффективен в профессиональной деятельности, требующей логического анализа ситуаций.'),
  ('b', 1, 86, 100, 'Мышление данного работника абстрактно, способности к обучению значительно выше средних. Характерна высокая работоспособность и постоянное желание работать.', 'Ваша способность к абстрактному мышлению позволяет Вам решать сложные профессиональные и житейские проблемы. Некоторая неорганизованность может приводить к возникновению "авралов" в работе.', 'Этот работник чрезвычайно эффективен в профессиональной деятельности, требующей стратегического видения всего комплекса задач, логического анализа сложных ситуаций, решения теоретических проблем.'),
  ('c', 2, 1, 15, 'Данный работник весьма подвержен влиянию стрессов. Страдает бессонницей и головными болями. Очень тяжело и долго переживает неудачи.', 'Советуем Вам остерегаться сложных, травмирующих жизненных ситуаций, поскольку Ваша нервная система легко ранима. Обращайте внимание на режим труда и отдыха.', 'Из-за высокой чувствительности нервной системы, этому работнику противопоказана профессиональная деятельность, создающая повышенные нервно-психические нагрузки (напр., моральная и материальная ответственность, конфликты и т.п.).'),
  ('c', 2, 16, 35, 'У этого работника нередко нарушен сон. Неудачи могут выбивать его из колеи в профессиональном плане.', 'Советуем Вам остерегаться сложных, травмирующих жизненных ситуаций, поскольку Ваша нервная система чувствительна к стрессам. Обращайте внимание на режим труда и отдыха.', 'Повышенная чувствительность нервной системы не всегда позволяет этому работнику правильно действовать в ситуациях, создающих нервно-психические нагрузки (напр., моральная и материальная ответственность, конфликты).'),
  ('c', 2, 36, 65, 'Этот работник периодически возбудим. Бывают смены настроения без причины. Возможны нарушения сна. Довольно чувствителен к стрессовым ситуациям.', NULL, NULL),
  ('c', 2, 66, 85, 'Данный работник довольно устойчив к стрессам, может действовать в неблагоприятных жизненных обстоятельствах, когда они не слишком тяжелы.', NULL, 'Данный работник вынослив в напряженных критических ситуациях. Эффективен в работе, связанной с эпизодическим преодолением внешних трудностей, когда такое преодоление не вызывает повышенных нервных нагрузок.'),
  ('c', 2, 86, 100, 'Этот работник отличается реалистичным взглядом на жизнь. Может действовать даже в самых тяжелых обстоятельствах.', 'Такие Ваши отличительные черты, как спокойствие и реалистичный взгляд на жизнь, способствуют эффективной работе с людьми.', 'Данный работник вынослив в напряженных критических ситуациях. Способен поддержать моральный дух коллектива в трудную минуту. Эффективен в работе, связанной с постоянным преодолением внешних трудностей (в том числе и тогда, когда такое преодоление вызывает высокие нервно-психические нагрузки).'),
  ('e', 3, 1, 15, 'Тактичен, послушен, отличается чрезмерной покорностью, пассивностью, уступчивостью. Зависим от мнений и оценок окружающих.', 'Советуем обратить внимание на некоторую зависимость Вашего мнения и поведения от оценок окружающих.', 'Склонен к работе, требующей не самостоятельного принятия решений, а исполнительской деятельности. При этом тактичность этого работника позволяет ему, как правило, поддерживать с коллегами хорошие отношения.'),
  ('e', 3, 16, 35, 'Во многих ситуациях данному работнику свойственна пассивность. Чувствителен к оценкам и одобрению окружающих.', 'Советуем обратить внимание на Вашу чувствительность к оценкам и одобрению окружающих.', 'Рекомендуется работа, требующая исполнительской деятельности. Руководству желательно не забывать поощрять его хорошо выполненную работу, поскольку такое поощрение является важным условием успешной профессиональной деятельности данного работника.'),
  ('e', 3, 36, 65, 'Этот работник отличается некоторой покорностью, пассивностью. Нередко он ждет одобрения окружающих.', NULL, NULL),
  ('e', 3, 66, 85, 'Довольно энергичен, склонен к упрямству и некоторой агрессивности. От окружающих порой ждет восхищения', NULL, 'Данный работник может быть эффективен в профессиональной деятельности, содержащей возможность принятия самостоятельных решений. Однако неумение видеть собственные ошибки и иные точки зрения требует от руководства периодически контролировать его работу.'),
  ('e', 3, 86, 100, 'Очень энергичен. Бывает грубым, упрямым и агрессивным. В конфликтных ситуациях обвиняет других, а не себя. Требует восхищения от окружающих.', 'У Вас есть многие предпосылки, чтобы быть лидером. Однако для этого следует развивать способность к уважению и пониманию точек зрения, отличных от Вашей.', 'Можете быть эффективен в профессиональной деятельности, требующей постоянного принятия самостоятельных решений. Однако данному работнику мешает нежелание признавать чужую точку зрения и собственные ошибки.'),
  ('f', 3, 1, 15, 'Очень серьезен, флегматичен, немногословен, склонен к постоянному анализу своих действий (такой анализ нередко переходит в травмирующее самокопание). Для этого работника характерны длительные состояния беспричинной озабоченности.', 'Ваша склонность к самоанализу на фоне часто возникающих состояний пессимизма и безысходности может привести к "зацикливанию" на своих проблемах.', 'Рекомендуется профессиональная деятельность, требующая минимального общения с другими работниками.'),
  ('f', 3, 16, 35, 'Данный работник часто серьезен, периодами склонен к самоанализу. У него нередко бывают состояния беспричинной озабоченности, хотя такие состояния, как правило, не длятся очень долго.', 'Ваша склонность к самоанализу на фоне периодически возникающих состояний пессимизма может приводить подчас к "зацикливанию" на своих проблемах.', 'Рекомендуется профессиональная деятельность, не требующая постоянного активного общения с другими работниками.'),
  ('f', 3, 36, 65, 'Изредка у этого работника бывают состояния озабоченности без видимой причины.', NULL, NULL),
  ('f', 3, 66, 85, 'Временами, данный работник весел, разговорчив. Бывает импульсивным, ярким. Эти его качества могут сплачивать людей в неформальной обстановке, но могут и отвлекать их от работы.', NULL, 'Склонен к профессиональной деятельности, требующей сообразительности и протекающей в кругу людей. Данный работник, как правило, бывает более эффективен как организатор или генератор идей, чем как человек, реализующий идеи в кропотливой работе.'),
  ('f', 3, 86, 100, 'Очень энергичен, активен, весел, временами беспечен. Чрезвычайно импульсивен, ярок, полон энтузиазма. Импульсивность в сочетании с беспечностью часто приводят его к "разбросанности". Поэтому у данного работника крайне важно развивать навыки самоконтроля.', 'Вы можете быть "душой компании", однако Ваша импульсивность и\r\nбеспечность приводит к некоторой "разбросанности". Поэтому советуем Вам развивать навыки самоконтроля и самоанализа.', 'Рекомендуется профессиональная деятельность, требующая быстроты\r\nдействий и сообразительности, и протекающая в кругу людей, а не бумаг или\r\nмашин. В профессиональном плане данный работник - организатор и генератор\r\nидей. Однако он может оказаться неспособным практически реализовать идею\r\nв тщательной и кропотливой работе. Поэтому рядом с таким работником\r\nжелательны исполнители, воплощающие его замыслы.'),
  ('g', 2, 1, 15, 'Ориентирован на собственные желания, игнорирует общепринятые правила и нормы поведения.', 'Вам необходимо серьезнее и с большей отдачей выполнять свои профессиональные и другие обязанности. Кроме того, преследуя собственные интересы, не следует забывать интересы окружающих.', 'Может быть рекомендована лишь такая работа, ход и результаты которой можно постоянно контролировать. При этом за качество выполнения этой работы все равно нельзя поручиться.'),
  ('g', 2, 16, 35, 'В большинстве ситуаций потворствует собственным желаниям, не всегда считается с правилами и нормами поведения. Отличается некоторым легкомыслием.', 'Советуем Вам с большей отдачей выполнять свои профессиональные и другие обязанности. Кроме того, реализуя свои замыслы, не забывайте интересов окружающих.', 'Не рекомендуется работа, требующая пунктуальности, выполнения жестко установленных сроков.'),
  ('g', 2, 36, 65, 'Нередко этот работник руководствуется собственными интересами и потребностями, не стремится следовать общепринятым нормам. Его работу желательно контролировать.', NULL, NULL),
  ('g', 2, 66, 85, 'Довольно строг, отличается принципиальностью.', NULL, NULL),
  ('g', 2, 86, 100, 'У этого работника - повышенное чувство ответственности и долга. Принципиален по отношению к себе и другим (подчас запредельно).', 'Ваше повышенное чувство ответственности незаменимо ни на производстве, ни в семейных отношениях. Это редкое и необходимое качество.', 'Этот работник эффективен при выполнении производственных заданий, требующих преодоления определенных трудностей.'),
  ('h', 3, 1, 15, 'Не склонен к авантюрам и неожиданным поступкам, старается держаться в стороне, весьма чувствителен к опасности. Предпочитает иметь одного-двух близких друзей.', 'Вам необходимо преодолеть свою робость и застенчивость и действовать более решительно, смело.', 'Не рекомендуется профессиональная деятельность, связанная с личными контактами, а также социальной или физической опасностью. Однако даже при очень "спокойной" деятельности такому работнику необходима постоянная поддержка коллектива.'),
  ('h', 3, 16, 35, 'Часто старается избегать ситуаций, требующих неожиданных поступков и новых контактов. Предпочитает узкий круг общения хорошо знакомых людей.', 'В некоторых ситуациях имеет смысл преодолевать свою застенчивость и действовать решительнее.', 'Рекомендуется профессиональная деятельность, не связанная с постоянными активными личными контактами, конфликтами, длительными нагрузками. Этому работнику подходят только "спокойные" профессии.'),
  ('h', 3, 36, 65, 'Довольно чувствителен к опасности. Предпочитает не расширять круг общения.', NULL, NULL),
  ('h', 3, 66, 85, 'Этот работник любит новую обстановку. В отдельных ситуациях может рискнуть, иногда не думая об опасности.', NULL, NULL),
  ('h', 3, 86, 100, 'Склонен к риску и авантюрам, любит нетривиальные ситуации, впечатления. Не боится опасности.', 'Вы человек смелый, деятельный, авантюристичный, и это помогает Вам вносить в жизнь и работу элементы творчества и разнообразия.', 'Эффективен в профессиональной деятельности, требующей социальной смелости. При отсутствии должного самоконтроля (что у такого работника случается достаточно редко) может увлечься, совершить авантюрный поступок, не задумываясь о последствиях.'),
  ('i', 2, 1, 15, 'Крайне реалистичен, несентиментален, не верит в иллюзии, всегда действует, руководствуясь практическими логическими законами и не обращая внимания на физические недомогания. Отличается твердостью, суровостью, порой излишней жесткостью.', 'Советуем Вам быть доброжелательнее, мягче и терпимее к окружающим.', 'Склонен к профессиональной деятельности, требующей постоянной личной ответственности в принятии решений, порой суровых и непопулярных. Эффективен в работе, где приходится не обращать внимание на физические недомогания, действовать твердо, по практическим логическим законам.'),
  ('i', 2, 16, 35, 'В целом данный работник - реалист, не склонный к сентиментальности. Отличается практицизмом, временами -\r\nнесколько суров.', 'Советуем Вам доброжелательнее относиться к окружающим.', 'Склонен к профессиональной деятельности, в которой может оказаться необходимо принимать ответственность на себя. Временами способен действовать твердо, однако это не является стилем работы. Груз личной ответственности подчас приводит к перенапряжению нервной системы данного работника.'),
  ('i', 2, 36, 65, 'В зависимости от ситуации и обстоятельств может проявлять себя и как не склонный к сентиментальности реалист, и как мечтатель.', NULL, NULL),
  ('i', 2, 66, 85, 'Хотя данный работник и может действовать по законам логики, в большинстве случаев он все же руководствуется интуицией. Ему свойственна некоторая мягкость, мечтательность, утонченность.', NULL, NULL),
  ('i', 2, 86, 100, 'Во всем полагается на интуицию, а не на логику. Данному работнику особенно свойственна мечтательность, утонченность, сентиментальность. При этом он нередко "витает в облаках" и в реальном производстве окружающим необходимо периодически возвращать его к реальности.', 'Ваша утонченность, склонность к фантазии, развитая интуиция предполагают у Вас развитые музыкальные и художественные способности.', 'Склонен к "интуитивной" творческой профессиональной деятельности, не требующей строгого соблюдения законов логики. Может быть эффективен в работе, требующей проявления мягкости.'),
  ('l', 3, 1, 15, 'В отношениях с людьми очень доверчив (часто - чрезмерно), независтлив, невзыскателен, беспретенциозен, не ревнив.', NULL, NULL),
  ('l', 3, 16, 35, 'Довольно доверчив, практически свободен от зависти.', NULL, NULL),
  ('l', 3, 36, 65, 'Может ладить далеко не со всеми людьми. В неблагоприятных обстоятельствах бывает завистливым и раздражительным.', NULL, NULL),
  ('l', 3, 66, 85, 'Довольно подозрителен, недоверчив, нередко придирчив к мелочам. Даже в благоприятных обстоятельствах возможны периоды ревнивости и раздражительности, которые, как правило, сменяются периодами относительного спокойствия.', 'Советуем Вам обратить внимание на Вашу подчас проявляющуюся обидчивость. Это может мешать Вам как на работе, так и в отношениях с близкими.', 'Руководству следует обратить внимание на периодически проявляющуюся обидчивость данного работника. Это может мешать ему в выполнении производственных заданий, особенно при работе в коллективе.'),
  ('l', 3, 86, 100, 'Очень подозрителен, недоверчив, обидчив, крайне ревнив. Придирчив, склонен к постоянной раздражительности и акцентированию внимания на своих и чужих ошибках.', 'Вам необходимо обратить внимание на Вашу обидчивость. Это может мешать Вам как на работе (особенно при работе в коллективе), так и в отношениях с близкими.', 'Данный работник очень обидчив. Свои обиды он может тщательно скрывать, однако они постоянно влияют на качество его работы. При коллективном выполнении какого-либо задания, чрезмерная обидчивость данного работника нередко становится источником конфликтов.'),
  ('m', 1, 1, 15, 'Весьма практичен, не "витает в облаках". Всегда руководствуется достижимым, пунктуален.', 'Вы обладаете ценными деловыми качествами, необходимыми для решения практических задач.', 'Этот работник наиболее соответствует профессиональной деятельности, требующей решения практических вопросов, уравновешенности, четкой работы, в том числе в условиях жесткого графика.'),
  ('m', 1, 16, 35, 'Данный работник старается быть практичным, пунктуальным, строить реальные планы. В условиях четкого графика работы ему это нередко удается.', NULL, 'Этот работник способен к профессиональной деятельности, требующей решения практических вопросов, уравновешенности. При этом работа в условиях жесткого графика может снижать производственные показатели данного работника, а его уравновешенность наиболее полно проявляется только при благоприятном морально-психологическом климате в коллективе.'),
  ('m', 1, 36, 65, 'Данный работник старается быть практичным, пунктуальным, строить реальные планы. В условиях четкого графика работы ему это нередко удается.', NULL, NULL),
  ('m', 1, 66, 85, 'Мало практичен. Имеет развитое воображение. Руководствуется скорее духовными ценностями, нежели практической реальностью. Часто не пунктуален.', NULL, 'Не рекомендуются работы, требующие собранности.'),
  ('m', 1, 86, 100, 'Данный работник совершенно не практичен и не пунктуален. Имеет очень богатое воображение, нередко далеко уводящее его от действительности. Полностью погружен в себя и ориентирован на свои духовные потребности.', 'У Вас явно творческие способности, чему в немалой степени способствуют фантазия и богатое воображение.', 'Противопоказаны работы, где могут возникать аварийные ситуации, работы требующие собранности, а также работы, при выполнении которых необходимо соблюдать жесткий производственный график.'),
  ('md', 3, 1, 15, 'Данному работнику свойственно недооценивать свои возможности .', NULL, NULL),
  ('md', 3, 16, 35, 'Существует тенденция к недооценке своих качеств.', NULL, NULL),
  ('md', 3, 36, 65, 'Достаточно хорошо развито самосознание, самооценка характеризуется адекватностью.', NULL, NULL),
  ('md', 3, 66, 85, 'Несколько завышено мнение о себе, недостаточно развита самокритичность, имеется склонность к самообману.', NULL, NULL),
  ('md', 3, 86, 100, 'Данному работнику свойственно завышать свои возможности и переоценивать себя.', NULL, NULL),
  ('n', 3, 1, 15, 'Весьма простодушен, непосредственен, бесхитростен, очень прямолинеен, часто бывает грубоватым и резким. Как правило, довольствуется имеющимся.', 'Вашими положительными свойствами являются эмоциональность, искренность, простота, непринужденность. Однако не забывайте, что Ваша излишняя прямолинейность может обидеть людей.', NULL),
  ('n', 3, 16, 35, 'Довольно искренен в отношениях, с хорошо знакомыми людьми может быть прямолинеен и бесхитростен. Подчас довольствуется имеющимся.', 'Не забывайте, что Ваша прямолинейность может порой обижать некоторых окружающих Вас людей.', NULL),
  ('n', 3, 36, 65, 'Довольно внимателен, в привычной обстановке - проницателен, при благоприятном морально-психологическом климате в коллективе - непосредственен.', NULL, NULL),
  ('n', 3, 66, 85, 'Этот работник проницателен, умудрен опытом, хорошо разбирается в людях.', NULL, 'Может быть эффективен в профессиональной деятельности, требующей компетентности в сфере человеческих отношений. Однако данный работник порой излишне полагается на свой предыдущий опыт в этом вопросе и это мешает ему использовать в деловом общении нестандартные стратегии поведения.'),
  ('n', 3, 86, 100, 'Очень расчетлив и проницателен. Обладает богатым жизненным опытом. Временами циничен.', 'Ваши возможности позволяют достичь успехов в сфере человеческих отношений. Советуем при этом больше доверять окружающим.', 'Этого работника отличает умение видеть за внешними устремлениями и поступками людей их истинный смысл. Он способен быть неформальным лидером трудового коллектива. Успешному выполнению функций руководителя может мешать его порой излишние расчетливость, цинизм и недоверие к окружающим.'),
  ('o', 2, 1, 15, 'Даже в непривычной обстановке данный работник невозмутим, его трудно вывести из себя. Подчас его отношение к себе граничит с самодовольством.', 'Обратите внимание на "закрытость для критики", свойственную Вам.', 'Способен быть лидером во внезапных аварийных ситуациях. Быстрое изменение обстановки не снижает способности данного работника принимать правильные решения.'),
  ('o', 2, 16, 35, 'В привычной обстановке этот работник, как правило, невозмутим, уверен в успехе своих начинаний. Критику не принимает близко к сердцу. Непривычные обстоятельства могут выбивать его из колеи.', 'Обратите внимание на некоторую "закрытость для критики", подчас свойственную Вам.', 'Способен принимать правильные решения в быстроменяющейся обстановке. Однако роль лидера в такой обстановке не всегда по плечу.'),
  ('o', 2, 36, 65, 'Полосы уверенности в себе периодически сменяются у данного работника полосами сомнений во всем, и в это время ему свойственны ощущения тревоги, беспокойства, пессимистические предчувствия.', NULL, NULL),
  ('o', 2, 66, 85, 'Этому работнику свойственно чувство беспокойства, тревоги. Он склонен к депрессии. Нередко бывают плохое настроение, мрачные мысли.', 'Помните, что не всегда есть реальные причины для беспокойства, которое Вы порой испытываете.', 'Противопоказаны виды деятельности, связанные с возможностью возникновения аварийных ситуаций. При конфликтах в производственном коллективе данный работник может резко снижать эффективность своей работы.'),
  ('o', 2, 86, 100, 'Этот работник очень тревожен, беспокоен, для него характерны состояния безысходности, депрессии; преобладает плохое настроение, часто бывает ощущение беспросветности.', 'В быстро меняющейся обстановке можете терять контроль над происходящим. Условия положительного результата в любой Вашей деятельности - это благоприятный моральный климат в коллективе. Помните, что не всегда есть реальные причины для беспокойства, которое Вы часто испытываете.', 'Эффективен в тех областях профессиональной деятельности, где требуется осторожность. В быстро меняющейся обстановке может терять контроль над происходящим. Обязательное условие положительного результата этого работника в любой деятельности – благоприятный морально-психологический климат в коллективе. Категорически противопоказаны виды деятельности, связанные с возможностью возникновения любых нештатных ситуаций.'),
  ('q1', 1, 1, 15, 'Очень консервативен, не настроен на восприятие новых идей и часто противостоит им. Строго придерживается традиций во всем, многое принимает на веру без лишних рассуждений.', 'Советуем Вам, не отказываясь полностью от традиций, все же допускать необходимость назревших изменений Ваших взглядов, линии поведения и т.п.', 'Эффективен в профессиональной деятельности, связанной с использованием классических методов и способов и не требующей принятия нетрадиционных решений даже в экстремальных ситуациях.'),
  ('q1', 1, 16, 35, 'Этот работник довольно консервативен, с опаской относится к нововведениям и порой противится им. Старается придерживаться традиций. Предпочитает проверенные методы и формы работы.', 'Советуем Вам чаще допускать необходимость назревших изменений Ваших форм работы, методов и т.п.', 'Склонен к профессиональной деятельности, связанной с использованием проверенных методов и способов. Нетрадиционные подходы к решению задач применяет редко.'),
  ('q1', 1, 36, 65, 'Тщательно взвешивает новые идеи, относится к ним с осторожностью. Однако вера в правильность традиций борется с пониманием необходимости нововведений, поэтому данный работник в зависимости от ситуации может выступать и как новатор и как консерватор.', NULL, NULL),
  ('q1', 1, 66, 85, 'Склонен к новшествам, эксперименту, нередко сомневается в правильности сложившихся традиций.', NULL, 'Склонен к профессиональной деятельности, содержащей возможности нестандартного решения задач.'),
  ('q1', 1, 86, 100, 'Любит экспериментировать. Критически настроен по отношению к уже существующим методам и способам работы, старается вникнуть в сущность идеи или выполняемого дела. Не является рабом традиций.', 'Вашим безусловным достоинством является склонность к аналитическому мышлению, полное отсутствие консерватизма. Однако советуем Вам избегать чрезмерного скепсиса в отношении традиционного.', 'Эффективен в профессиональной деятельности, содержащей возможности эксперимента, нешаблонного решения задач. В подобной деятельности стремится к лидерству. Может чрезмерно увлекаться новизной решения, забывая об уже существующих проверенных способах.'),
  ('q2', 3, 1, 15, 'В своих решениях и поступках этот работник полностью зависим от окружающих. Для предотвращения нервно-психических срывов должен находиться в коллективе, даже при выполнении индивидуального задания. Со стороны окружающих необходима постоянная поддержка.', 'Вам необходимо проявлять большую самостоятельность в принятии решений.', 'Склонен к такой профессиональной деятельности, где от данного работника совершенно не требуется принятие собственных решений.'),
  ('q2', 3, 16, 35, 'В своих решениях и поступках этот работник во многом зависим от окружающих. Общественное мнение для него играет не последнюю роль. Одобрение со стороны окружающих благоприятно сказываются на его работоспособности.', 'Советуем Вам иногда проявлять большую самостоятельность в принятии решений.', 'Рекомендуется профессиональная деятельность, где не часто требуется принимать собственные решения и перед принятием таких решений можно посоветоваться с другими работниками.'),
  ('q2', 3, 36, 65, 'Данный работник может сам принимать решения, однако, предварительно посоветовавшись с окружающими. Иногда поступает вопреки общественному мнению, хотя все же заинтересован в поддержке окружающих.', NULL, NULL),
  ('q2', 3, 66, 85, 'Этот работник мало зависим от окружающих, может принимать решения при минимальных консультациях с ними.', NULL, NULL),
  ('q2', 3, 86, 100, 'Этот работник независим от окружающих, предпочитает самостоятельно принимать решения. Предприимчив, изобретателен. Нельзя сказать, что окружающие ему безразличны, просто он не нуждается в их поддержке.', 'Вашим положительным качеством является твердость и самостоятельность в принятии решений и действиях. В любом вопросе у Вас есть собственная позиция.', 'Может быть эффективен в профессиональной деятельности, требующей твердости, самостоятельности, находчивости, решительности. Как правило, независим в принятии решений.'),
  ('q3', 2, 1, 15, 'Этот работник отличается чрезвычайно слабым самоконтролем, Игнорирует социальные требования.', 'Вам следует научиться контролировать себя, стать собраннее в работе, больше считаться с общепринятыми правилами.', 'Обязательное условие профессиональной деятельности данного работника - постоянный жесткий контроль со стороны руководства и окружающих. Но и в этом случае трудно поручиться за его высокие трудовые показатели.'),
  ('q3', 2, 16, 35, 'Для этого работника характерен пониженный самоконтроль, периодически - конфликтность. Собственная репутация его мало беспокоит.', 'Вам следует научиться лучше контролировать себя, быть собраннее в работе.', 'Для более результативной работы данному работнику желателен эпизодический контроль со стороны руководства, трудового коллектива.'),
  ('q3', 2, 36, 65, 'Периоды соблюдения социальных требований сменяются у данного работника периодами ослабления самоконтроля, хотя он пытается заботиться о своей общественной репутации.', NULL, NULL),
  ('q3', 2, 66, 85, 'Общественная репутация для этого работника довольно значима. Он стремится быть подтянутым, собранным в выполнении социальных требований.', NULL, 'Эффективен в профессиональной деятельности, где требуется самоконтроль, чувство долга. При этом необходимость постоянного поддержания высокого самоконтроля может приводить данного работника к нервным срывам.'),
  ('q3', 2, 86, 100, 'Для этого работника характерен очень высокий самоконтроль. Он чрезвычайно заботится о своей общественной репутации, точен в выполнении социальных требований, строго следует своему представлению о себе. Собран, подтянут. Временами склонен к упрямству.', 'Вашими положительными качествами являются собранность, аккуратность. Вместе с тем излишний самоконтроль может служить помехой в некоторых жизненных ситуациях, требующих раскованности и принятия нетривиальных решений.', 'Эффективен в профессиональной деятельности, где требуется высокий самоконтроль, сознательность, развитое чувство долга, аккуратность. При этом поддержание постоянно высокого самоконтроля не снижает качества труда данного работника.'),
  ('q4', 2, 1, 15, 'Данный работник совершенно лишен внутренней напряженности, очень спокоен, расслаблен. Периодами вял и апатичен.', 'Вашим безусловным достоинством является отсутствие внутренней напряженности. При этом советуем Вам стараться преодолевать периодически возникающие вялость и апатию.', 'Склонен к профессиональной деятельности, где необходима низкая внутренняя напряженность.'),
  ('q4', 2, 16, 35, 'Данный работник - человек без излишней внутренней напряженности; как правило, спокоен, временами несколько расслаблен.', NULL, 'Эффективен в профессиональной деятельности, где эпизодически может потребоваться самообладание, когда такая деятельность протекает спокойно, без "авралов".'),
  ('q4', 2, 36, 65, 'Данный работник может быть спокойным, расслабленным, в периоды же усталости - раздражен, взвинчен, неудовлетворен.', NULL, NULL),
  ('q4', 2, 66, 85, 'Для данного работника характерно эпизодическое раздражение без причины, беспокойство, он не может долго усидеть на одном месте. Нередко находится "не в своей тарелке".', 'При Ваших реальных психологических характеристиках у Вас мало оснований для беспокойства, которое Вы порой испытываете.', 'Рекомендуется профессиональная деятельность, не требующая постоянного интенсивного общения, где не часто возникают нервно-психические нагрузки.'),
  ('q4', 2, 86, 100, 'Данный работник склонен к постоянной беспричинной внутренней напряженности, раздражительности, взвинченности, суетливости. Его нервная система все время "на взводе".', 'При Ваших реальных психологических характеристиках у Вас нет достаточных оснований для беспокойства, тревоги и напряженности, сопутствующих Вам в настоящее время.', 'Противопоказана профессиональная деятельность, содержащая нервно- психические нагрузки и интенсивное общение.'),
  ('lk', 4, 1, 33, 'Данный работник, как правило, считает, что то, что произошло, происходит или произойдёт с ним, зависит от того, как он в этом случае себя вёл, ведёт или будет вести. Такие люди менее склонны подчиняться давлению других, больше доверяют собственному мнению. Менее подвержены социальному влиянию; сильнее реагируют на содержание, а не на престиж источника информации. Они активно ищут информацию и более осведомлены о ситуации, чем другие. Эти работники отличаются эмоциональной стабильностью и склонностью к теоретическому мышлению. Они лучше работают самостоятельно, чем под контролем, предпочитают более трудные задания, но больше расстраиваются из-за неудачи в лёгком задании. Они предпочитают отсроченное, но сильное подкрепление слабому, но немедленному. В межличностных отношениях больше рассчитывают на убеждение, чем на власть. Их поведение направлено на последовательное достижение успеха путем развития навыков и более глубокой обработки информации, постановки все возрастающих по своей сложности задач. Такие люди производят впечатление достаточно уверенных в себе, тем более что в жизни они чаще занимают высокое общественное положение.', 'Вы, как правило, считаете, что то, что произошло, происходит или произойдёт с Вами, зависит от того, как Вы в этом случае себя вели, ведёте или будете вести. Вам следует помнить, что иногда случаются ситуации, на которые Вы не можете повлиять, а значит, и не можете нести ответственность за их исход.', 'В трудовой деятельности убеждены, что усердная работа, вероятнее всего ведет к высокой продуктивности, а высокая продуктивность способствует получению высокого вознаграждения.\r\nОни предпочитают руководителей со стилем управления, позволяющим работнику участвовать в принятии решений.'),
  ('lk', 4, 34, 66, 'Данный работник отличается сбалансированным локусом контроля. Такие люди считают, что все происходящее с ними зависит в равной степени, как от них самих, так и от внешних обстоятельств.', NULL, NULL),
  ('lk', 4, 67, 100, 'Данный работник склонен думать, что происходящее с ним не зависит от его действий, он не верит в свои возможности контролировать ситуацию и надеется на удачу. Он убежден, что его неудачи являются результатом невезения, случайностей, отрицательного влияния других людей. Для него свойственно внешне направленное защитное поведение. Одобрение и поддержка таким людям весьма необходимы, иначе они хуже работают. Такие работники отличаются эмоциональной нестабильностью и практическим, неопосредствованным мышлением.', 'Вы склонны думать, что происходящее с Вами не зависит от Ваших действий, не верите в свои возможности контролировать ситуацию, и надеетесь на удачу. Зачастую, Вы думаете, что неудачи являются результатом невезения, случайностей или отрицательного влияния других людей. Вам следует помнить, что чаще всего Вы сами являетесь причиной Ваших удач и неудач. Вам следует тщательнее планировать свои действия и верить в свои возможности.', 'Экстерналам импонирует. директивный стиль руководства, Одобрение и поддержка таким людям необходимы, иначе они работают хуже. Экстерналы отличаются эмоциональной нестабильностью и практическим, неопосредствованным мышлением. Среди экстерналов чаще. наблюдаются люди тревожные и депрессивные. Человек с экстернальным ЛК склонен думать, что так как происходящее с ним не зависит от его действий, то не следует чересчур отдаваться какой-либо деятельности.');

-- 
-- Вывод данных для таблицы contact_method_code
--
INSERT INTO contact_method_code VALUES 
  (1, '2007-12-03 12:22:37', 'Факс'),
  (2, '2007-12-03 12:22:44', 'Письмо'),
  (3, '2007-12-03 12:23:00', 'E-mail'),
  (4, '2007-12-03 12:23:06', 'ICQ'),
  (5, '2007-12-03 12:23:15', 'SMS'),
  (6, '2007-12-03 12:23:29', 'Звонок'),
  (7, '2007-12-03 12:23:34', 'Встреча');

-- 
-- Вывод данных для таблицы contact_type_code
--
INSERT INTO contact_type_code VALUES 
  (1, '2007-12-10 05:17:10', 'Коммерческое предложение'),
  (2, '2007-12-03 08:53:29', 'Презентация'),
  (3, '2007-12-03 08:54:08', 'Сделка'),
  (4, '2007-12-03 08:54:23', 'Консультация');

-- 
-- Вывод данных для таблицы criterion_code
--
INSERT INTO criterion_code VALUES 
  (1, '2007-03-17 16:34:10', 'Активность, инициативность, самостоятельность'),
  (2, '2007-03-17 16:34:10', 'Ориентация на достижения'),
  (3, '2007-03-17 16:34:10', 'Ответственность'),
  (4, '2007-03-17 16:34:10', 'Ценности и установки'),
  (5, '2007-03-17 16:34:10', 'Отношению к обучению, развитию'),
  (6, '2007-03-17 16:34:10', 'Самооценка'),
  (7, '2007-03-17 16:34:10', 'Отношение к руководству'),
  (8, '2007-03-17 16:34:10', 'Причины увольнения'),
  (9, '2007-03-17 16:34:10', 'Квалификация, профессионализм'),
  (10, '2007-03-17 16:34:10', 'Представление о рассматриваемой должности'),
  (11, '2007-03-17 16:34:10', 'Руководящие способности'),
  (12, '2007-03-17 16:34:10', 'Безопасность'),
  (13, '2007-03-17 16:34:10', 'Навыки продаж '),
  (14, '2007-03-17 16:34:10', 'Внешний вид'),
  (15, '2007-03-17 16:34:10', 'Профессианализм секретаря'),
  (16, '2007-03-17 16:34:10', 'Профессионализм'),
  (17, '2007-03-17 16:34:10', 'Профессионализм супервайзера'),
  (18, '2007-03-17 16:34:10', 'Профессионализм специалиста по кредитам'),
  (19, '2007-03-17 16:34:10', 'Доброжелательность'),
  (20, '2007-03-17 16:34:10', 'Мотивация'),
  (21, '2011-03-03 22:57:15', 'Толерантность'),
  (22, '2007-03-17 16:34:10', 'Профессионализм зав. Производством'),
  (24, '2007-03-17 16:34:11', 'Профессионализм контролера ОТК'),
  (25, '2007-03-17 16:34:11', 'Профессионализм специалиста по страхованию'),
  (26, '2008-07-21 15:24:34', 'Начальник отдела продаж'),
  (27, '2007-03-17 16:34:11', 'Профессионализм бухгалтера'),
  (28, '2007-03-17 16:34:11', 'Профессионализм экономиста'),
  (29, '2007-03-17 16:34:11', 'Профессионализм старшего кассира');

-- 
-- Вывод данных для таблицы customer_bad_code
--
INSERT INTO customer_bad_code VALUES 
  (1, '2007-03-17 16:34:10', 'не платит кадровым агентствам'),
  (2, '2007-03-17 16:34:10', 'текучка'),
  (3, '2007-03-17 16:34:10', 'плохое отношение к работникам'),
  (4, '2007-03-17 16:34:10', 'нарушение КЗоТ'),
  (5, '2007-03-17 16:34:10', 'не платит работникам'),
  (6, '2007-03-17 16:34:10', 'плохие условия труда');

-- 
-- Вывод данных для таблицы customer_code
--
INSERT INTO customer_code VALUES 
  (1, '2011-03-08 14:38:35', 'Потенциальный клиент'),
  (2, '2011-02-27 20:01:54', 'Постоянный клиент');

-- 
-- Вывод данных для таблицы education_code
--
INSERT INTO education_code VALUES 
  (1, '2007-03-17 16:34:10', 'очно'),
  (2, '2007-03-17 16:34:10', 'заочно'),
  (3, '2007-03-17 16:34:10', 'вечерний'),
  (4, '2007-03-17 16:34:10', 'очно/заочный'),
  (5, '2011-03-08 14:40:04', 'дистантно'),
  (6, '2011-03-08 14:40:06', 'экстерн');

-- 
-- Вывод данных для таблицы family_code
--
INSERT INTO family_code VALUES 
  (1, '2007-03-17 16:34:10', 'не в браке'),
  (2, '2007-03-17 16:34:10', 'гражданский брак'),
  (3, '2007-03-17 16:34:10', 'в браке'),
  (4, '2007-03-17 16:34:10', 'в разводе'),
  (5, '2007-03-17 16:34:10', 'вдовец / вдова');

-- 
-- Вывод данных для таблицы formation_code
--
INSERT INTO formation_code VALUES 
  (1, '2011-03-08 14:51:29', 'основное общее'),
  (2, '2011-03-08 14:55:03', 'среднее общее'),
  (3, '2011-03-08 14:51:34', 'начальное профессиональное'),
  (4, '2011-03-08 14:51:37', 'среднее профессиональное'),
  (5, '2011-03-08 14:49:55', 'бакалавриат'),
  (6, '2011-03-08 14:50:36', 'магистратура'),
  (7, '2011-03-08 14:50:41', 'аспирантура'),
  (8, '2011-03-08 14:51:01', 'докторантура');

-- 
-- Вывод данных для таблицы housing_code
--
INSERT INTO housing_code VALUES 
  (1, '2007-03-17 16:34:10', 'собственное жильё'),
  (2, '2007-03-17 16:34:10', 'с родителями'),
  (3, '2007-03-17 16:34:10', 'малосемейка'),
  (4, '2007-03-17 16:34:10', 'общежитие'),
  (5, '2007-03-17 16:34:10', 'съёмное жильё');

-- 
-- Вывод данных для таблицы language_code
--
INSERT INTO language_code VALUES 
  (1, '2007-03-17 16:34:10', 'английский'),
  (2, '2007-03-17 16:34:10', 'немецкий'),
  (3, '2007-03-17 16:34:10', 'французский'),
  (4, '2007-03-17 16:34:10', 'испанский'),
  (5, '2007-03-17 16:34:10', 'итальянский'),
  (6, '2007-03-17 16:34:10', 'польский'),
  (7, '2007-03-17 16:34:10', 'болгарский'),
  (8, '2007-03-17 16:34:10', 'украинский'),
  (9, '2007-03-17 16:34:10', 'латынь'),
  (10, '2007-03-17 16:34:10', 'латышский'),
  (11, '2007-03-17 16:34:10', 'шведский'),
  (12, '2007-03-17 16:34:10', 'арабский'),
  (13, '2007-03-17 16:34:10', 'финский'),
  (14, '2007-03-17 16:34:10', 'персидский'),
  (15, '2007-03-17 16:34:10', 'турецкий'),
  (16, '2007-03-17 16:34:10', 'азербайджанский'),
  (17, '2007-03-17 16:34:10', 'татарский'),
  (18, '2007-03-17 16:34:10', 'таджикский'),
  (19, '2007-03-17 16:34:10', 'казахский'),
  (20, '2007-03-17 16:34:10', 'португальский'),
  (21, '2007-03-17 16:34:10', 'узбекский'),
  (22, '2007-03-17 16:34:10', 'японский'),
  (23, '2007-03-17 16:34:10', 'чешский'),
  (24, '2007-03-17 16:34:10', 'иврит'),
  (25, '2007-03-17 16:34:10', 'венгерский'),
  (26, '2007-03-17 16:34:10', 'литовский'),
  (27, '2007-03-17 16:34:10', 'сербско-харватский'),
  (28, '2007-03-17 16:34:10', 'киргизский'),
  (29, '2007-03-17 16:34:10', 'белоруский'),
  (30, '2007-03-17 16:34:10', 'китайский'),
  (31, '2007-03-17 16:34:10', 'чеченский'),
  (32, '2007-03-17 16:34:10', 'фарси'),
  (33, '2007-03-17 16:34:10', 'сербский');

-- 
-- Вывод данных для таблицы locus_query
--
INSERT INTO locus_query VALUES 
  (1, 'Дети попадают в беду потому, что родители слишком часто их наказывают.', 0, 'В наше время неприятности случаются с детьми чаще всего по тому, что родители слишком мягко относятся к ним.', 0, 0, 'а'),
  (2, 'Многие неудачи происходят от невезения.', 1, 'Неудачи людей являются результатом собственных ошибок.', 0, 0, 'а'),
  (3, 'Одна из главных причин, почему совершаются аморальные поступки в обществе, состоит в том, что окружающие мирятся с ними.', 0, 'Всегда будут встречаться аморальные поступки независимо от того, насколько усердно окружающие пытаются предотвратить их.', 1, 0, 'а'),
  (4, 'В конце концов к людям приходит заслуженное признание.', 0, 'К сожалению, заслуги человека часто остаются не признанными.', 1, 1, 'а'),
  (5, 'Мнение, что преподаватели несправедливы к учащимся - неверно.', 0, 'Многие учащиеся не понимают, что их отметки могут зависеть от случайных обстоятельств.', 1, 0, 'а'),
  (6, 'Успех руководителя во многом зависит от удачного стечения обстоятельств.', 1, 'Способные люди, которые не стали руководителями, сами не использовали свои возможности.', 0, 0, 'б'),
  (7, 'Как бы Вы не старались, некоторые люди все равно не будут симпатизировать Вам.', 1, 'Тот, кто не сумел завоевать симпатии окружающих, просто не умеет ладить с другими.', 0, 1, 'б'),
  (8, 'Наследственность играет главную роль в формировании характера и поведения человека.', 0, 'Только жизненный опыт определяет характер и поведение человека.', 0, 0, 'б'),
  (9, 'Я часто замечал справедливость поговорки “Чему быть - тому не миновать”.', 1, 'По-моему, лучше принять решение и действовать, чем надеяться на судьбу.', 0, 1, 'б'),
  (10, 'Для хорошо подготовленного специалиста не существует такой вещи, как пристрастная проверка.', 0, 'Даже хорошо подготовленный специалист обычно не выдерживает пристрастной проверки.', 1, 1, 'б'),
  (11, 'Успех является результатом усердной работы и мало зависит от везения.', 0, 'Чтобы добиться успеха, нужно не упустить удобный случай.', 1, 0, 'б'),
  (12, 'Каждый гражданин может оказывать влияние на важное государственное решение.', 0, 'Обществом управляют люди, которые выдвинуты на ответственные посты, а рядовой человек мало, что может сделать.', 1, 1, 'б'),
  (13, 'Когда я строю планы, то, в общем, убежден, что смогу осуществить их.', 0, 'Не всегда благоразумно планировать далеко вперед, потому что многое зависит от того, как сложатся обстоятельства.', 1, 0, 'б'),
  (14, 'Есть люди, о которых смело можно сказать, что они нехорошие.', 0, 'В каждом человеке есть что-то хорошее.', 0, 0, 'б'),
  (15, 'Осуществление моих желаний не связано с везением.', 0, 'Когда не знают, как быть, подбрасывают монету. По-моему, в жизни можно часто прибегать к этому.', 1, 0, 'б'),
  (16, 'Руководителем часто становятся благодаря счастливому стечению обстоятельств.', 1, 'Достижение руководящего положения зависит от способности управлять людьми, везение тут ни при чем.', 0, 0, 'б'),
  (17, 'Большинство из нас не может влиять сколько-нибудь серьезно на мировые события.', 1, 'Принимая активное участие в общественной жизни, люди могут управлять событиями в мире.', 0, 0, 'б'),
  (18, 'Большинство людей не понимает, насколько их жизнь зависит от случайных обстоятельств.', 1, 'В действительности не существует такой вещи как везение.', 0, 0, 'а'),
  (19, 'Всегда следует быть готовым признать свои ошибки.', 0, 'Как правило, лучше не подчеркивать своих ошибок.', 0, 0, 'а'),
  (20, 'Трудно узнать, действительно ли Вы нравитесь человеку, или нет.', 1, 'Число Ваших друзей зависит от того, насколько Вы располагаете к себе других.', 0, 0, 'а'),
  (21, 'В конце концов неприятности, которые случаются с нами, уравновешиваются приятными событиями.', 1, 'Большинство неудач являются результатом отсутствия способностей, незнания, лености или всех трех причин вместе взятых.', 0, 1, 'а'),
  (22, 'Если приложить достаточные усилия, то можно искоренить бездушие и формализм.', 0, 'Есть вещи, с которыми трудно бороться, поэтому бездушие и формализм не искоренить.', 1, 1, 'а'),
  (23, 'Иногда трудно понять, на чем основываются руководители, когда они выдвигают человека на поощрение.', 1, 'Поощрения зависят от того, насколько усердно человек трудится.', 0, 1, 'а'),
  (24, 'Хороший руководитель ожидает от подчиненных, чтобы они сами решили то, что должны делать.', 0, 'Хороший руководитель ясно дает понять, в чем состоит работа каждого подчиненного.', 0, 0, 'а'),
  (25, 'Я часто чувствую, что мало влияю на то, что происходит со мной.', 1, 'Не могу поверить, что случай или судьба играют важную роль в моей судьбе.', 0, 1, 'а'),
  (26, 'Люди одиноки из-за того, что они не проявляют дружелюбия к окружающим.', 0, 'Бесполезно слишком стараться расположить к себе людей: если ты им не нравишься, то не нравишься.', 1, 1, 'а'),
  (27, 'Характер человека зависит главным образом от его силы воли.', 0, 'Характер человека формируется, в основном, в коллективе.', 0, 0, 'а'),
  (28, 'То, что со мной случается - это дело моих собственных рук.', 0, 'Иногда я чувствую, что моя жизнь развивается в направлении, не зависящем от моей силы воли.', 1, 1, 'а'),
  (29, 'Я часто не могу понять, почему руководители поступают именно так, а не иначе.', 1, 'В конце концов, за плохое управление организацией ответственны сами люди, которые в ней работают.', 0, 1, 'а');

-- 
-- Вывод данных для таблицы need_query
--
INSERT INTO need_query VALUES 
  (1, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу иметь тёплые отношения с людьми.', 2, 1, NULL),
  (2, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу обеспечить себе надёжное будущее.', 3, 1, NULL),
  (3, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу зарабатывать на жизнь.', 4, 1, NULL),
  (4, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу иметь хороших собеседников.', 5, 1, NULL),
  (5, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу упрочить своё положение.', 6, 1, NULL),
  (6, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу развивать свои силы и способности.', 7, 7, NULL),
  (7, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу обеспечить себе материальный комфорт.', 8, 8, NULL),
  (8, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу повышать уровень мастерства и компетентности.', 9, 9, NULL),
  (9, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу избегать неприятностей.', 10, 10, NULL),
  (10, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу стермиться к новому и неизведанному.', 11, 11, NULL),
  (11, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу обеспечить себе положение влияния.', 12, 1, NULL),
  (12, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу покупать хорошие вещи.', 13, 1, NULL),
  (13, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 1, NULL),
  (14, 'Я хочу добиться признания и уважениия.', 1, 'Я хочу быть понятым другими людьми.', 15, 1, NULL),
  (15, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу обеспечить себе надёжное будущее.', 3, 2, NULL),
  (16, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу зарабатывать на жизнь.', 4, 4, NULL),
  (17, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу иметь хороших собеседников.', 5, 5, NULL),
  (18, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу упрочить своё положение.', 6, 6, NULL),
  (19, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу развивать свои силы и способности.', 7, 7, NULL),
  (20, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу обеспечить себе материальный комфорт.', 8, 8, NULL),
  (21, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу повышать уровень мастерства и компетентности.', 9, 2, NULL),
  (22, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу избегать неприятностей.', 10, 2, NULL),
  (23, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу стермиться к новому и неизведанному.', 11, 2, NULL),
  (24, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу обеспечить себе положение влияния.', 12, 2, NULL),
  (25, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу покупать хорошие вещи.', 13, 2, NULL),
  (26, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 14, NULL),
  (27, 'Я хочу иметь тёплые отношения с людьми.', 2, 'Я хочу быть понятым другими людьми.', 15, 15, NULL),
  (28, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу зарабатывать на жизнь.', 4, 4, NULL),
  (29, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу иметь хороших собеседников.', 5, 5, NULL),
  (30, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу упрочить своё положение.', 6, 6, NULL),
  (31, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу развивать свои силы и способности.', 7, 3, NULL),
  (32, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу обеспечить себе материальный комфорт.', 8, 3, NULL),
  (33, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу повышать уровень мастерства и компетентности.', 9, 3, NULL),
  (34, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу избегать неприятностей.', 10, 3, NULL),
  (35, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу стермиться к новому и неизведанному.', 11, 3, NULL),
  (36, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу обеспечить себе положение влияния.', 12, 12, NULL),
  (37, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу покупать хорошие вещи.', 13, 13, NULL),
  (38, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 14, NULL),
  (39, 'Я хочу обеспечить себе надёжное будущее.', 3, 'Я хочу быть понятым другими людьми.', 15, 15, NULL),
  (40, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу иметь хороших собеседников.', 5, 5, NULL),
  (41, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу упрочить своё положение.', 6, 4, NULL),
  (42, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу развивать свои силы и способности.', 7, 4, NULL),
  (43, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу обеспечить себе материальный комфорт.', 8, 4, NULL),
  (44, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу повышать уровень мастерства и компетентности.', 9, 4, NULL),
  (45, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу избегать неприятностей.', 10, 4, NULL),
  (46, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу стермиться к новому и неизведанному.', 11, 11, NULL),
  (47, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу обеспечить себе положение влияния.', 12, 12, NULL),
  (48, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу покупать хорошие вещи.', 13, 13, NULL),
  (49, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 14, NULL),
  (50, 'Я хочу зарабатывать на жизнь.', 4, 'Я хочу быть понятым другими людьми.', 15, 15, NULL),
  (51, 'Я хочу иметь хороших собеседников.', 5, 'Я хочу упрочить своё положение.', 6, 5, NULL),
  (52, 'Я хочу иметь хороших собеседников.', 5, 'Я хочу развивать свои силы и способности.', 7, 5, NULL),
  (53, 'Я хочу иметь хороших собеседников.', 5, 'Я хочу обеспечить себе материальный комфорт.', 8, 5, NULL),
  (54, 'Я хочу иметь хороших собеседников.', 5, 'Я хочу повышать уровень мастерства и компетентности.', 9, 5, NULL),
  (55, 'Я хочу иметь хороших собеседников.', 5, 'Я хочу избегать неприятностей.', 10, 5, NULL),
  (56, 'Я хочу иметь хороших собеседников.', 5, 'Я хочу стермиться к новому и неизведанному.', 11, 11, NULL),
  (57, 'Я хочу иметь хороших собеседников.', 5, 'Я хочу обеспечить себе положение влияния.', 12, 12, NULL),
  (58, 'Я хочу иметь хороших собеседников.', 5, 'Я хочу покупать хорошие вещи.', 13, 13, NULL),
  (59, 'Я хочу иметь хороших собеседников.', 5, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 14, NULL),
  (60, 'Я хочу иметь хороших собеседников.', 5, 'Я хочу быть понятым другими людьми.', 15, 15, NULL),
  (61, 'Я хочу упрочить своё положение.', 6, 'Я хочу развивать свои силы и способности.', 7, 6, NULL),
  (62, 'Я хочу упрочить своё положение.', 6, 'Я хочу обеспечить себе материальный комфорт.', 8, 6, NULL),
  (63, 'Я хочу упрочить своё положение.', 6, 'Я хочу повышать уровень мастерства и компетентности.', 9, 6, NULL),
  (64, 'Я хочу упрочить своё положение.', 6, 'Я хочу избегать неприятностей.', 10, 6, NULL),
  (65, 'Я хочу упрочить своё положение.', 6, 'Я хочу стермиться к новому и неизведанному.', 11, 6, NULL),
  (66, 'Я хочу упрочить своё положение.', 6, 'Я хочу обеспечить себе положение влияния.', 12, 12, NULL),
  (67, 'Я хочу упрочить своё положение.', 6, 'Я хочу покупать хорошие вещи.', 13, 13, NULL),
  (68, 'Я хочу упрочить своё положение.', 6, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 14, NULL),
  (69, 'Я хочу упрочить своё положение.', 6, 'Я хочу быть понятым другими людьми.', 15, 15, NULL),
  (70, 'Я хочу развивать свои силы и способности.', 7, 'Я хочу обеспечить себе материальный комфорт.', 8, 8, NULL),
  (71, 'Я хочу развивать свои силы и способности.', 7, 'Я хочу повышать уровень мастерства и компетентности.', 9, 7, NULL),
  (72, 'Я хочу развивать свои силы и способности.', 7, 'Я хочу избегать неприятностей.', 10, 7, NULL),
  (73, 'Я хочу развивать свои силы и способности.', 7, 'Я хочу стермиться к новому и неизведанному.', 11, 7, NULL),
  (74, 'Я хочу развивать свои силы и способности.', 7, 'Я хочу обеспечить себе положение влияния.', 12, 7, NULL),
  (75, 'Я хочу развивать свои силы и способности.', 7, 'Я хочу покупать хорошие вещи.', 13, 7, NULL),
  (76, 'Я хочу развивать свои силы и способности.', 7, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 14, NULL),
  (77, 'Я хочу развивать свои силы и способности.', 7, 'Я хочу быть понятым другими людьми.', 15, 15, NULL),
  (78, 'Я хочу обеспечить себе материальный комфорт.', 8, 'Я хочу повышать уровень мастерства и компетентности.', 9, 9, NULL),
  (79, 'Я хочу обеспечить себе материальный комфорт.', 8, 'Я хочу избегать неприятностей.', 10, 10, NULL),
  (80, 'Я хочу обеспечить себе материальный комфорт.', 8, 'Я хочу стермиться к новому и неизведанному.', 11, 11, NULL),
  (81, 'Я хочу обеспечить себе материальный комфорт.', 8, 'Я хочу обеспечить себе положение влияния.', 12, 8, NULL),
  (82, 'Я хочу обеспечить себе материальный комфорт.', 8, 'Я хочу покупать хорошие вещи.', 13, 8, NULL),
  (83, 'Я хочу обеспечить себе материальный комфорт.', 8, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 8, NULL),
  (84, 'Я хочу обеспечить себе материальный комфорт.', 8, 'Я хочу быть понятым другими людьми.', 15, 8, NULL),
  (85, 'Я хочу повышать уровень мастерства и компетентности.', 9, 'Я хочу избегать неприятностей.', 10, 9, NULL),
  (86, 'Я хочу повышать уровень мастерства и компетентности.', 9, 'Я хочу стермиться к новому и неизведанному.', 11, 11, NULL),
  (87, 'Я хочу повышать уровень мастерства и компетентности.', 9, 'Я хочу обеспечить себе положение влияния.', 12, 12, NULL),
  (88, 'Я хочу повышать уровень мастерства и компетентности.', 9, 'Я хочу покупать хорошие вещи.', 13, 13, NULL),
  (89, 'Я хочу повышать уровень мастерства и компетентности.', 9, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 14, NULL),
  (90, 'Я хочу повышать уровень мастерства и компетентности.', 9, 'Я хочу быть понятым другими людьми.', 15, 15, NULL),
  (91, 'Я хочу избегать неприятностей.', 10, 'Я хочу стермиться к новому и неизведанному.', 11, 10, NULL),
  (92, 'Я хочу избегать неприятностей.', 10, 'Я хочу обеспечить себе положение влияния.', 12, 10, NULL),
  (93, 'Я хочу избегать неприятностей.', 10, 'Я хочу покупать хорошие вещи.', 13, 10, NULL),
  (94, 'Я хочу избегать неприятностей.', 10, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 10, NULL),
  (95, 'Я хочу избегать неприятностей.', 10, 'Я хочу быть понятым другими людьми.', 15, 10, NULL),
  (96, 'Я хочу стермиться к новому и неизведанному.', 11, 'Я хочу обеспечить себе положение влияния.', 12, 12, NULL),
  (97, 'Я хочу стермиться к новому и неизведанному.', 11, 'Я хочу покупать хорошие вещи.', 13, 13, NULL),
  (98, 'Я хочу стермиться к новому и неизведанному.', 11, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 14, NULL),
  (99, 'Я хочу стермиться к новому и неизведанному.', 11, 'Я хочу быть понятым другими людьми.', 15, 15, NULL),
  (100, 'Я хочу обеспечить себе положение влияния.', 12, 'Я хочу покупать хорошие вещи.', 13, 13, NULL),
  (101, 'Я хочу обеспечить себе положение влияния.', 12, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 12, NULL),
  (102, 'Я хочу обеспечить себе положение влияния.', 12, 'Я хочу быть понятым другими людьми.', 15, 12, NULL),
  (103, 'Я хочу покупать хорошие вещи.', 13, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 13, NULL),
  (104, 'Я хочу покупать хорошие вещи.', 13, 'Я хочу быть понятым другими людьми.', 15, 13, NULL),
  (105, 'Я хочу заниматься делом, требующим полной отдачи.', 14, 'Я хочу быть понятым другими людьми.', 15, 14, NULL);

-- 
-- Вывод данных для таблицы placement_close_code
--
INSERT INTO placement_close_code VALUES 
  (1, '2011-03-08 14:59:19', 'заказ снят заказчиком'),
  (2, '2011-03-08 15:01:37', 'отказ всем кандидатам'),
  (3, '2011-03-08 15:02:25', 'супертребования к кандидатам'),
  (4, '2011-03-08 15:02:26', 'нет кандидатов'),
  (5, '2011-03-08 15:02:27', 'низкая зарплата'),
  (6, '2011-03-08 15:02:28', 'все кандидаты отказались');

-- 
-- Вывод данных для таблицы profession_book
--
INSERT INTO profession_book VALUES 
  (1, '2007-03-17 16:34:13', 'бухгалтер', 1014, 0),
  (3, '2007-03-17 16:34:13', 'психолог', 1008, 0),
  (4, '2007-03-17 16:34:13', 'секретарь', 1008, 0),
  (16, '2007-03-17 16:34:13', 'администратор', 1008, 0),
  (20, '2007-03-17 16:34:13', 'экономист', 1014, 0),
  (28, '2007-03-17 16:34:13', 'начальник отдела проектирования', 1006, 0),
  (31, '2007-03-17 16:34:13', 'технолог машиностроения', 1331, 0),
  (32, '2007-03-17 16:34:13', 'оператор ПК', 1002, 0),
  (35, '2007-03-17 16:34:13', 'инженер-электрик', 1331, 0),
  (37, '2007-03-17 16:34:13', 'менеджер по рекламе', 1005, 0),
  (41, '2007-03-17 16:34:13', 'переводчик', 1008, 0),
  (45, '2007-03-17 16:34:13', 'инженер-конструктор', 1331, 0),
  (50, '2007-03-17 16:34:13', 'товаровед', 1003, 0),
  (58, '2007-03-17 16:34:13', 'программист', 1002, 0),
  (61, '2007-03-17 16:34:13', 'инженер-технолог', 1331, 0),
  (71, '2007-03-17 16:34:13', 'специалист по ценным бумагам', 1014, 0),
  (73, '2007-03-17 16:34:13', 'аудитор', 1014, 0),
  (76, '2007-03-17 16:34:13', 'офис-менеджер', 1008, 0),
  (87, '2007-03-17 16:34:13', 'финансовый инспектор', 1014, 0),
  (99, '2007-03-17 16:34:13', 'инженер-электромеханик', 1331, 0),
  (103, '2007-03-17 16:34:13', 'менеджер по продажам, сбыту', 1003, 0),
  (104, '2007-03-17 16:34:13', 'дизайнер полиграфии', 1324, 0),
  (107, '2007-03-17 16:34:13', 'продавец-консультант', 1003, 0),
  (109, '2007-03-17 16:34:13', 'прораб', 1006, 0),
  (110, '2007-03-17 16:34:13', 'начальник цеха', 1331, 0),
  (114, '2007-03-17 16:34:13', 'директор по экономике', 1014, 0),
  (117, '2007-03-17 16:34:13', 'технический директор', 1008, 0),
  (118, '2007-03-17 16:34:13', 'директор по маркетингу', 1005, 0),
  (120, '2007-03-17 16:34:13', 'директор СТО', 1007, 0),
  (125, '2007-03-17 16:34:13', 'менеджер по закупкам', 1003, 0),
  (126, '2007-03-17 16:34:13', 'косметолог', 1009, 0),
  (127, '2007-03-17 16:34:13', 'менеджер по персоналу', 1008, 0),
  (130, '2007-03-17 16:34:13', 'заместитель главного бухгалтера', 1014, 0),
  (136, '2007-03-17 16:34:13', 'заведующий секцией', 1003, 0),
  (142, '2007-03-17 16:34:13', 'специалист по внешне-экономической деятельности', 1007, 0),
  (143, '2007-03-17 16:34:13', 'менеджер по туризму', 1023, 0),
  (167, '2007-03-17 16:34:13', 'сметчик', 1006, 0),
  (175, '2007-03-17 16:34:13', 'инженер-радиотехник', 1002, 0),
  (178, '2007-03-17 16:34:13', 'лифтер', 1022, 0),
  (186, '2007-03-17 16:34:13', 'супервайзер', 1003, 0),
  (188, '2007-03-17 16:34:13', 'инженер-металлург', 1331, 0),
  (190, '2007-03-17 16:34:13', 'специалист по складскому хозяйству', 1007, 0),
  (205, '2007-03-17 16:34:13', 'корректор', 1324, 0),
  (213, '2007-03-17 16:34:13', 'инспектор отдела технического контроля (ОТК)', 1331, 0),
  (234, '2007-03-17 16:34:13', 'архитектор', 1006, 0),
  (263, '2007-03-17 16:34:13', 'региональный представитель', 1003, 0),
  (269, '2007-03-17 16:34:13', 'фармацевт', 1009, 0),
  (275, '2007-03-17 16:34:13', 'начальник отдела маркетинга и рекламы', 1005, 0),
  (277, '2007-03-17 16:34:13', 'инженер-проектировщик', 1006, 0),
  (282, '2007-03-17 16:34:13', 'провизор', 1009, 0),
  (288, '2007-03-17 16:34:13', 'начальник юридического отдела', 1008, 0),
  (289, '2007-03-17 16:34:13', 'художник-модельер', 1331, 0),
  (293, '2007-03-17 16:34:13', 'начальник хозяйственного отдела', 1008, 0),
  (295, '2007-03-17 16:34:13', 'web-мастер', 1002, 0),
  (307, '2007-03-17 16:34:13', 'директор планово-диспетчерского отдела (ПДО)', 1331, 0),
  (309, '2007-03-17 16:34:13', 'инженер АСУ', 1002, 0),
  (312, '2007-03-17 16:34:13', 'директор по логистике', 1007, 0),
  (314, '2007-03-17 16:34:13', 'инженер АТС', 1002, 0),
  (315, '2007-03-17 16:34:13', 'инженер контрольно-измерительных приборов и автоматизации', 1331, 0),
  (316, '2007-03-17 16:34:13', 'инженер водоснабжения', 1331, 0),
  (317, '2007-03-17 16:34:13', 'инженер холодильных установок', 1331, 0),
  (319, '2007-03-17 16:34:13', 'инженер-сантехник', 1006, 0),
  (322, '2007-03-17 16:34:13', 'менеджер по работе с клиентами', 1003, 0),
  (323, '2007-03-17 16:34:13', 'монтажник вентиляционного обрудования', 1006, 0),
  (324, '2007-03-17 16:34:13', 'монтажник охранно-пожарных систем (ОПС)', 1006, 0),
  (328, '2007-03-17 16:34:13', 'начальник отдела продаж', 1003, 0),
  (333, '2007-03-17 16:34:13', 'начальник сметно-договорного отдела', 1014, 0),
  (345, '2007-03-17 16:34:13', 'руководитель участка автотюнинга', 1007, 0),
  (348, '2007-03-17 16:34:13', 'администратор локальных сетей', 1002, 0),
  (352, '2007-03-17 16:34:13', 'технолог швейного производства', 1331, 0),
  (361, '2007-03-17 16:34:13', 'печатник', 1324, 0),
  (364, '2007-03-17 16:34:13', 'дерматолог', 1009, 0),
  (381, '2007-03-17 16:34:13', 'настройщик ПК и ПО', 1002, 0),
  (388, '2007-03-17 16:34:13', 'инженер-гидротехник', 1331, 0),
  (392, '2007-03-17 16:34:13', 'финансовый директор', 1014, 0),
  (393, '2007-03-17 16:34:13', 'начальник финансового отдела', 1014, 0),
  (416, '2007-03-17 16:34:13', 'мерчендайзер', 1003, 0),
  (420, '2007-03-17 16:34:13', 'инженер тепло-газоснабжения и вентиляции (ТГВ)', 1006, 0),
  (443, '2007-03-17 16:34:13', 'инженер промышленно-гражданского строительства (ПГС)', 1006, 0),
  (463, '2007-03-17 16:34:13', 'инженер-энергетик', 1331, 0),
  (477, '2007-03-17 16:34:13', 'начальник участка', 1331, 0),
  (487, '2007-03-17 16:34:13', 'инженер ООТиЗ', 1008, 0),
  (495, '2007-03-17 16:34:13', 'инженер по техническому обслуживанию оборудования', 1331, 0),
  (500, '2007-03-17 16:34:13', 'инженер по транспорту', 1007, 0),
  (524, '2007-03-17 16:34:13', 'зубной техник', 1009, 0),
  (534, '2007-03-17 16:34:13', 'консультант по подбору персонала', 1008, 0),
  (547, '2007-03-17 16:34:13', 'инспектор по кадрам', 1008, 0),
  (555, '2007-03-17 16:34:13', 'верстальщик', 1324, 0),
  (577, '2007-03-17 16:34:13', 'главный редактор', 1324, 0),
  (592, '2007-03-17 16:34:13', 'дизайнер интерьера', 1324, 0),
  (602, '2007-03-17 16:34:13', 'начальник производственно-технологического отдела (ПТО)', 1331, 0),
  (608, '2007-03-17 16:34:13', 'дизайнер ландшафта', 1324, 0),
  (611, '2007-03-17 16:34:13', 'юрисконсульт', 1008, 0),
  (652, '2007-03-17 16:34:13', 'администратор кафе/ресторана', 1021, 0),
  (666, '2007-03-17 16:34:13', 'начальник транспортного отдела', 1007, 0),
  (668, '2007-03-17 16:34:13', 'директор производства', 1331, 0),
  (681, '2007-03-17 16:34:13', 'инженер по охране труда', 1331, 0),
  (683, '2007-03-17 16:34:13', 'администратор салона', 1023, 0),
  (696, '2007-03-17 16:34:13', 'администратор торгового зала', 1003, 0),
  (697, '2007-03-17 16:34:13', 'инженер контрольно-кассовых машин (ККМ)', 1331, 0),
  (702, '2007-03-17 16:34:13', '!наркоман', 1018, 0),
  (704, '2007-03-17 16:34:13', 'мастер производственного цеха', 1331, 0),
  (705, '2007-03-17 16:34:13', 'главный геодезист', 1006, 0),
  (712, '2007-03-17 16:34:13', 'начальник планово-экономического отдела', 1014, 0),
  (714, '2007-03-17 16:34:13', 'главный бухгалтер', 1014, 0),
  (717, '2007-03-17 16:34:13', 'главный инженер', 1006, 0),
  (720, '2007-03-17 16:34:13', 'инженер производственно-технологического отдела (ПТО)', 1331, 0),
  (723, '2007-03-17 16:34:13', 'инженер охранно-пожарной сигнализации (ОПС)', 1331, 0),
  (724, '2007-03-17 16:34:13', '!алкоголик мужчина', 1018, 0),
  (725, '2007-03-17 16:34:13', '!наркоман мужчина', 1018, 0),
  (726, '2007-03-17 16:34:13', '!наркоман женщина', 1018, 0),
  (731, '2007-03-17 16:34:13', 'начальник участка рихтовки', 1007, 0),
  (732, '2007-03-17 16:34:13', 'коммерческий директор', 1003, 0),
  (737, '2007-03-17 16:34:13', 'системный администратор', 1002, 0),
  (743, '2007-03-17 16:34:13', 'начальник ООТиЗ', 1008, 0),
  (747, '2007-03-17 16:34:13', 'логист/специалист отдела логистики', 1007, 0),
  (753, '2007-03-17 16:34:13', 'инженер-теплоэнергетик', 1331, 0),
  (758, '2007-03-17 16:34:13', 'шеф-повар', 1021, 0),
  (761, '2007-03-17 16:34:13', 'управляющий кафе/ресторана', 1021, 0),
  (764, '2007-03-17 16:34:13', 'торговый представитель', 1003, 0),
  (767, '2007-03-17 16:34:13', 'инженер планово-диспетчерского отдела (ПДО)', 1331, 0),
  (769, '2007-03-17 16:34:13', '!алкоголик женщина', 1018, 0),
  (770, '2007-03-17 16:34:13', '!нарушители дисциплины (подвели КА)', 1018, 0),
  (771, '2007-03-17 16:34:13', '!скандалист', 1018, 0),
  (772, '2007-03-17 16:34:13', '!вор', 1018, 0),
  (773, '2007-03-17 16:34:13', '!психические отклонения', 1018, 0),
  (1000, '2011-01-28 13:27:16', 'Профессии', 0, 1),
  (1002, '2011-01-28 13:27:16', 'Компьютерные технологии, IT, связь', 1000, 1),
  (1003, '2011-01-28 13:27:16', 'Торговля, коммерция', 1000, 1),
  (1005, '2011-01-28 13:27:16', 'Маркетинг, реклама и PR', 1000, 1),
  (1006, '2011-01-28 13:27:16', 'Строительство, ТГВ', 1000, 1),
  (1007, '2011-01-28 13:27:16', 'Транспорт, логистика', 1000, 1),
  (1008, '2011-01-28 13:27:16', 'Административно-хозяйственная работа, кадры', 1000, 1),
  (1009, '2011-01-28 13:27:16', 'Медицина и фармацевтика', 1000, 1),
  (1014, '2011-01-28 13:27:16', 'Финансы, банки, бухгалтерия, аудит', 1000, 1),
  (1018, '2011-03-09 13:36:13', 'Деструктивная группа', 1000, 1),
  (1019, '2007-03-17 16:34:14', 'специалист по розничным продажам', 1003, 0),
  (1021, '2011-01-28 13:27:16', 'Рестораны, развлекательные комплексы', 1000, 1),
  (1023, '2011-01-28 13:27:16', 'Туризм, услуги', 1000, 1),
  (1038, '2007-03-17 16:34:14', 'начальник склада', 1007, 0),
  (1039, '2007-03-17 16:34:14', 'бизнес-тренер', 1008, 0),
  (1049, '2007-03-17 16:34:14', 'программист 1С', 1002, 0),
  (1052, '2007-03-17 16:34:14', 'начальник отдела снабжения', 1331, 0),
  (1058, '2007-03-17 16:34:14', 'начальник отдела закупок', 1003, 0),
  (1062, '2007-03-17 16:34:14', 'мастер строительно-монтажного участка', 1006, 0),
  (1063, '2007-03-17 16:34:14', 'руководитель службы по эксплуатации зданий', 1008, 0),
  (1067, '2007-03-17 16:34:14', 'региональный менеджер по продажам', 1003, 0),
  (1072, '2007-03-17 16:34:14', 'главный специалист тепло-газоснабжения и вентиляции (ТГВ)', 1006, 0),
  (1078, '2007-03-17 16:34:14', 'кассир-операционист', 1014, 0),
  (1083, '2007-03-17 16:34:14', 'администратор БД', 1002, 0),
  (1091, '2007-03-17 16:34:14', 'PR-менеджер', 1005, 0),
  (1094, '2007-03-17 16:34:14', 'начальник участка', 1006, 0),
  (1099, '2007-03-17 16:34:14', 'специалист по маркетингу', 1005, 0),
  (1123, '2007-03-17 16:34:14', 'начальник отдела по работе с клиентами', 1003, 0),
  (1124, '2007-03-17 16:34:14', 'главный инженер', 1331, 0),
  (1132, '2007-03-17 16:34:14', 'менеджер по развитию рынка', 1003, 0),
  (1140, '2007-03-17 16:34:14', 'специалист вексельного отдела', 1014, 0),
  (1144, '2007-03-17 16:34:14', 'финансовый специалист/консультант', 1014, 0),
  (1155, '2007-03-17 16:34:14', 'территориальный менеджер', 1003, 0),
  (1166, '2007-03-17 16:34:14', 'инженер по обслуживанию зданий', 1008, 0),
  (1173, '2007-03-17 16:34:14', 'инженер-химик', 1331, 0),
  (1177, '2007-03-17 16:34:14', 'главный энергетик', 1331, 0),
  (1205, '2007-03-17 16:34:14', 'специалист отдела страхования', 1322, 0),
  (1212, '2007-03-17 16:34:14', 'мастер отдела технического контроля (ОТК)', 1331, 0),
  (1218, '2007-03-17 16:34:14', 'технолог общественного питания', 1021, 0),
  (1221, '2007-03-17 16:34:14', 'директор по качеству', 1331, 0),
  (1236, '2007-03-17 16:34:14', 'главный механик', 1331, 0),
  (1239, '2007-03-17 16:34:14', 'инженер-автомеханик', 1007, 0),
  (1247, '2007-03-17 16:34:14', 'специалист по страхованию', 1022, 0),
  (1255, '2007-03-17 16:34:14', 'инженер-нефтяник', 1331, 0),
  (1264, '2007-03-17 16:34:14', 'специалист по качеству', 1331, 0),
  (1274, '2007-03-17 16:34:14', 'директор по транспорту', 1007, 0),
  (1290, '2007-03-17 16:34:14', 'главный технолог', 1331, 0),
  (1291, '2007-03-17 16:34:14', 'начальник отдела технического контроля (ОТК)', 1331, 0),
  (1293, '2007-03-17 16:34:14', 'менеджер по поставкам', 1003, 0),
  (1294, '2007-03-17 16:34:14', 'медицинский представитель', 1009, 0),
  (1297, '2007-03-17 16:34:14', 'начальник расчетного отдела', 1014, 0),
  (1298, '2007-03-17 16:34:14', 'инженер-геодезист', 1006, 0),
  (1301, '2007-03-17 16:34:14', 'управляющий банком', 1014, 0),
  (1303, '2007-03-17 16:34:14', 'начальник кредитного отдела', 1014, 0),
  (1304, '2007-03-17 16:34:14', 'руководитель IT-отдела', 1002, 0),
  (1305, '2007-03-17 16:34:14', 'инженер-электронщик', 1002, 0),
  (1314, '2007-03-17 16:34:14', 'директор по персоналу', 1008, 0),
  (1315, '2007-03-17 16:34:14', 'исполнительный директор', 1008, 0),
  (1317, '2007-03-17 16:34:14', 'директор фармацевтической компании', 1009, 0),
  (1318, '2007-03-17 16:34:14', 'менеджер по закупкам', 1009, 0),
  (1319, '2007-03-17 16:34:14', 'менеджер по продажам', 1009, 0),
  (1321, '2007-03-17 16:34:14', 'директор туристического агентства', 1023, 0),
  (1322, '2011-01-28 13:27:16', 'Страхование, недвижимость', 1000, 1),
  (1323, '2007-03-17 16:34:14', 'директор страховой компании', 1322, 0),
  (1324, '2011-01-28 13:27:16', 'СМИ, издательство, дизайн', 1000, 1),
  (1327, '2007-03-17 16:34:14', 'директор рекламного агентства', 1324, 0),
  (1329, '2007-03-17 16:34:14', 'руководитель отдела рекламы', 1324, 0),
  (1330, '2007-03-17 16:34:14', 'начальник отдела страхования', 1322, 0),
  (1331, '2011-01-28 13:27:16', 'Промышленность, производство', 1000, 1),
  (1332, '2007-03-17 16:34:14', 'директор по строительству', 1006, 0),
  (1336, '2007-03-17 16:34:14', 'специалист кредитного отдела', 1014, 0),
  (1337, '2007-03-17 16:34:14', 'специалист планово-экономического отдела', 1014, 0),
  (1343, '2007-03-17 16:34:14', 'директор торговой компании', 1003, 0),
  (1346, '2007-03-17 16:34:14', 'руководитель филиала', 1003, 0),
  (1347, '2007-03-17 16:34:14', 'начальник отдела розницы', 1003, 0),
  (1351, '2007-03-17 16:34:14', 'заведующий пищевым производством', 1021, 0),
  (1354, '2007-03-17 16:34:14', 'проект-менеджер', 1006, 0),
  (1355, '2007-03-17 16:34:14', 'начальник отдела кадров', 1008, 0),
  (1356, '2007-03-17 16:34:14', 'web-дизайнер', 1002, 0),
  (1357, '2007-03-17 16:34:14', 'инженер по охране труда', 1006, 0),
  (1358, '2007-03-17 16:34:14', 'директор агентства недвижимости', 1322, 0),
  (1359, '2007-03-17 16:34:14', 'начальник отдела недвижимости', 1322, 0),
  (1360, '2007-03-17 16:34:14', 'специалист отдела недвижимости', 1322, 0),
  (1361, '2007-03-17 16:34:14', 'менеджер по снабжению', 1331, 0),
  (1362, '2007-03-17 16:34:14', 'брэнд-менеджер', 1005, 0),
  (1363, '2007-03-17 16:34:14', 'директор по стратегическому и корпоративному управлению', 1014, 0),
  (1367, '2007-03-17 16:34:14', 'технолог/оператор полиграфического производства', 1324, 0),
  (1368, '2007-03-17 16:34:14', 'специалист по сертификации', 1003, 0),
  (1369, '2007-03-17 16:34:14', 'начальник отдела оценки', 1322, 0),
  (1370, '2007-03-17 16:34:14', 'специалист отдела оценки', 1322, 0),
  (1371, '2007-03-17 16:34:14', 'директор магазина', 1003, 0),
  (1372, '2007-03-17 16:34:14', 'помощник руководителя', 1008, 0),
  (1374, '2009-03-02 11:21:41', 'рекламный агент', 1324, 0);
-- 
-- Вывод данных для таблицы program_book
--
INSERT INTO program_book VALUES 
  (1, '2011-03-09 11:15:01', 'ПРОГРАММЫ', 0, 1),
  (2, '2011-03-09 11:36:16', 'Инструментальные', 1, 1),
  (3, '2011-03-09 12:12:41', 'СУБД', 2, 1),
  (4, '2011-03-09 12:11:40', 'Драйверы устройств', 9, 1),
  (5, '2011-03-09 12:11:34', 'Декодеры', 9, 1),
  (7, '2011-03-09 11:38:27', 'Сетевые', 9, 1),
  (8, '2011-03-09 11:38:31', 'Утилиты', 9, 1),
  (9, '2011-03-09 11:43:08', 'Операционные системы', 1, 1),
  (10, '2011-03-09 11:48:55', 'Офисные', 11, 1),
  (11, '2011-03-09 11:35:58', 'Прикладные', 1, 1),
  (12, '2011-03-09 11:58:48', 'Веб-браузер', 1168, 1),
  (13, '2011-03-09 11:59:03', 'Электронная почта', 1168, 1),
  (14, '2011-03-09 11:41:44', 'Общие', 9, 1),
  (15, '2011-03-09 11:41:55', 'Windows', 14, 0),
  (16, '2011-03-09 11:42:01', 'Linux', 14, 0),
  (17, '2011-03-09 11:53:14', 'Бухгалтерские', 11, 1),
  (18, '2011-03-09 11:49:14', 'MS Word', 10, 0),
  (19, '2011-03-09 11:49:16', 'MS Excel', 10, 0),
  (20, '2011-03-09 11:49:19', 'Bat', 13, 0),
  (21, '2011-03-09 12:01:10', '1C', 17, 0),
  (22, '2011-03-09 12:01:13', 'Opera', 12, 0),
  (23, '2011-03-09 12:01:15', 'Chrome', 12, 0),
  (24, '2011-03-09 12:01:17', 'Firefox', 12, 0),
  (25, '2011-03-09 12:08:40', 'САПР, CAD', 11, 1),
  (26, '2011-03-09 12:01:36', 'AvtoCAD', 25, 0),
  (27, '2011-03-09 12:01:54', 'Доступ к интернет-сервисам', 11, 1),
  (28, '2011-03-09 12:02:11', 'Правовые', 11, 1),
  (29, '2011-03-09 12:02:50', 'Кодекс', 28, 0),
  (30, '2011-03-09 12:02:56', 'Гарант', 28, 0),
  (31, '2011-03-09 12:02:59', 'Консультатн плюс', 28, 0),
  (32, '2011-03-09 12:03:01', 'Главбух', 28, 0),
  (33, '2011-03-09 12:03:02', 'Референт', 28, 0),
  (34, '2011-03-09 12:03:08', 'Система мгновенного обмена сообщениями', 27, 1),
  (35, '2011-03-09 12:03:15', 'ICQ', 34, 0),
  (36, '2011-03-09 12:03:23', 'Банк-клиент', 27, 1),
  (37, '2011-03-09 12:03:29', 'iBank', 36, 0),
  (38, '2011-03-09 12:03:31', 'Скайп', 34, 0),
  (39, '2011-03-09 12:07:37', 'Мультимедиа', 11, 1),
  (40, '2011-03-09 12:07:52', 'Графические', 39, 1),
  (41, '2011-03-09 12:08:06', 'Видеоредактор', 39, 1),
  (42, '2011-03-09 12:08:08', 'Аудиоредактор', 39, 1),
  (43, '2011-03-09 12:08:11', 'CorelDRAW', 40, 0),
  (44, '2011-03-09 12:08:13', 'Adobe Photoshop', 40, 0),
  (45, '2011-03-09 12:08:16', 'Adobe Illustrator', 40, 0),
  (46, '2011-03-09 12:16:45', 'Компьютерная вёрстка', 11, 1),
  (47, '2011-03-09 12:16:57', 'Adobe InDesign', 46, 0),
  (48, '2011-03-09 12:17:04', 'QuarkXPress', 46, 0),
  (49, '2011-03-09 12:17:06', 'Среда разработки', 2, 1),
  (50, '2011-03-09 12:17:17', 'С++', 49, 0),
  (51, '2011-03-09 12:17:19', 'Delphi', 49, 0),
  (52, '2011-03-09 12:17:42', 'MS SQL', 3, 0),
  (53, '2011-03-09 12:54:36', 'MySQL', 3, 0);

-- 
-- Вывод данных для таблицы psychology
--
INSERT INTO psychology VALUES 
  (1, '2011-02-01 22:36:49', '2002-02-20 00:00:00', 'Ярцева', 'Галина', 'Владимировна', '1966-09-03 00:00:00', 2, NULL, NULL, 90, 63, NULL, 90, 63, NULL, 72, 63, NULL, 90, 90, NULL, 54, 54, 28, NULL, 46, 46, NULL, 37, 46, NULL, 37, 80, 28, 90, 22, 2, NULL, NULL, NULL, 48, 31, 67, 48, 56, 0, 30, 63, 83, 30, 43, 0, 55, 0, 0, 'Кеттелл на 187 вопросов. Обрабатывал Климов.');

-- 
-- Вывод данных для таблицы recruit_deflect_code
--
INSERT INTO recruit_deflect_code VALUES 
  (1, '2007-03-17 16:34:10', 'отклонён в пользу других кандидатов'),
  (2, '2007-03-17 16:34:10', 'заказ снят'),
  (3, '2011-03-08 15:06:38', 'не откликнулся'),
  (4, '2011-03-08 15:06:39', 'кандидат отказался'),
  (5, '2011-03-08 15:06:39', 'неявка на консультацию'),
  (6, '2011-03-08 15:06:40', 'отклонён после консультации'),
  (7, '2011-03-08 15:06:41', 'отклонен по резюме'),
  (8, '2011-03-08 15:06:42', 'неявка на собеседование с заказчиком'),
  (9, '2011-03-08 15:06:43', 'отклонен после собеседования с заказчиком'),
  (10, '2011-03-08 15:06:45', 'не выдержал испытательный срок'),
  (11, '2011-03-08 15:06:46', 'трудоустроен');

-- 
-- Вывод данных для таблицы region_code
--
INSERT INTO region_code VALUES 
  (1, '2011-03-08 15:07:09', 'центральный');

-- 
-- Вывод данных для таблицы speciality_book
--
INSERT INTO speciality_book VALUES 
  (1, '2011-03-08 15:06:46', '(010000) ФИЗИКО-МАТЕМАТИЧЕСКИЕ НАУКИ', 1000, 1),
  (2, '2011-03-08 15:06:46', '(010100) Математика', 1, 1),
  (3, '2011-03-08 15:06:46', '(010101) Математика', 2, 0),
  (4, '2011-03-08 15:06:46', '(010200) Математика. Прикладная математика', 1, 0),
  (5, '2011-03-08 15:06:46', '(010300) Математика. Компьютерные науки', 1, 0),
  (6, '2011-03-08 15:06:46', '(010400) Информационные технологии', 1, 0),
  (7, '2011-03-08 15:06:46', '(010500) Прикладная математика и информатика', 1, 1),
  (8, '2011-03-08 15:06:46', '(010501) Прикладная математика и информатика', 7, 0),
  (9, '2011-03-08 15:06:46', '(010503) Математическое обеспечение и администрирование информационных систем', 7, 0),
  (10, '2011-03-08 15:06:46', '(010600) Прикладные математика и физика', 1, 0),
  (11, '2011-03-08 15:06:46', '(010700) Физика', 1, 1),
  (12, '2011-03-08 15:06:46', '(010701) Физика', 11, 0),
  (13, '2011-03-08 15:06:46', '(010702) Астрономия', 11, 0),
  (14, '2011-03-08 15:06:46', '(010703) Физика Земли и планет', 11, 0),
  (15, '2011-03-08 15:06:46', '(010704) Физика конденсированного состояния вещества', 11, 0),
  (16, '2011-03-08 15:06:46', '(010705) Физика атомного ядра и частиц', 11, 0),
  (17, '2011-03-08 15:06:46', '(010706) Физика кинетических явлений', 11, 0),
  (18, '2011-03-08 15:06:46', '(010707) Медицинская физика', 11, 0),
  (19, '2011-03-08 15:06:46', '(010708) Биохимическая физика', 11, 0),
  (20, '2011-03-08 15:06:46', '(010710) Физика открытых нелинейных систем', 11, 0),
  (21, '2011-03-08 15:06:46', '(010800) Радиофизика', 1, 1),
  (22, '2011-03-08 15:06:46', '(010801) Радиофизика и электроника', 21, 0),
  (23, '2011-03-08 15:06:46', '(010802) Фундаментальная радиофизика и физическая электроника', 21, 0),
  (24, '2011-03-08 15:06:46', '(010803) Микроэлектроника и полупроводниковые приборы', 21, 0),
  (25, '2011-03-08 15:06:46', '(010900) Механика', 1, 1),
  (26, '2011-03-08 15:06:46', '(010901) Механика', 25, 0),
  (27, '2011-03-08 15:06:46', '(011000) Механика. Прикладная математика', 1, 0),
  (28, '2011-03-08 15:06:46', '(020000) ЕСТЕСТВЕННЫЕ НАУКИ', 1000, 1),
  (29, '2011-03-08 15:06:46', '(020100) Химия', 28, 1),
  (30, '2011-03-08 15:06:46', '(020101) Химия', 29, 0),
  (31, '2011-03-08 15:06:46', '(020200) Биология', 28, 1),
  (32, '2011-03-08 15:06:46', '(020201) Биология', 31, 0),
  (33, '2011-03-08 15:06:46', '(020202) Антропология', 31, 0),
  (34, '2011-03-08 15:06:46', '(020203) Зоология', 31, 0),
  (35, '2011-03-08 15:06:46', '(020204) Ботаника', 31, 0),
  (36, '2011-03-08 15:06:46', '(020205) Физиология', 31, 0),
  (37, '2011-03-08 15:06:46', '(020206) Генетика', 31, 0),
  (38, '2011-03-08 15:06:46', '(020207) Биофизика', 31, 0),
  (39, '2011-03-08 15:06:46', '(020208) Биохимия', 31, 0),
  (40, '2011-03-08 15:06:46', '(020209) Микробиология', 31, 0),
  (41, '2011-03-08 15:06:46', '(020210) Биоинженерия и биоинформатика', 31, 0),
  (42, '2011-03-08 15:06:46', '(020300) Геология', 28, 1),
  (43, '2011-03-08 15:06:46', '(020301) Геология', 42, 0),
  (44, '2011-03-08 15:06:46', '(020302) Геофизика', 42, 0),
  (45, '2011-03-08 15:06:46', '(020303) Геохимия', 42, 0),
  (46, '2011-03-08 15:06:46', '(020304) Гидрогеология и инженерная геология', 42, 0),
  (47, '2011-03-08 15:06:46', '(020305) Геология и геохимия горючих ископаемых', 42, 0),
  (48, '2011-03-08 15:06:46', '(020306) Экологическая геология', 42, 0),
  (49, '2011-03-08 15:06:46', '(020400) География', 28, 1),
  (50, '2011-03-08 15:06:46', '(020401) География', 49, 0),
  (51, '2011-03-08 15:06:46', '(020500) География и картография', 28, 1),
  (52, '2011-03-08 15:06:46', '(020501) Картография', 51, 0),
  (53, '2011-03-08 15:06:46', '(020600) Гидрометеорология', 28, 1),
  (54, '2011-03-08 15:06:46', '(020601) Гидрология', 53, 0),
  (55, '2011-03-08 15:06:46', '(020602) Метеорология', 53, 0),
  (56, '2011-03-08 15:06:46', '(020603) Океанология', 53, 0),
  (57, '2011-03-08 15:06:46', '(020700) Почвоведение', 28, 1),
  (58, '2011-03-08 15:06:46', '(020701) Почвоведение', 57, 0),
  (59, '2011-03-08 15:06:46', '(020800) Экология и природопользование', 28, 1),
  (60, '2011-03-08 15:06:46', '(020801) Экология', 59, 0),
  (61, '2011-03-08 15:06:46', '(020802) Природопользование', 59, 0),
  (62, '2011-03-08 15:06:46', '(020803) Биоэкология', 59, 0),
  (63, '2011-03-08 15:06:46', '(020804) Геоэкология', 59, 0),
  (64, '2011-03-08 15:06:46', '(020900) Химия, физика и механика материалов', 28, 0),
  (65, '2011-03-08 15:06:46', '(030000) ГУМАНИТАРНЫЕ НАУКИ', 1000, 1),
  (66, '2011-03-08 15:06:46', '(030100) Философия', 65, 1),
  (67, '2011-03-08 15:06:46', '(030101) Философия', 66, 0),
  (68, '2011-03-08 15:06:46', '(030200) Политология', 65, 1),
  (69, '2011-03-08 15:06:46', '(030201) Политология', 68, 0),
  (70, '2011-03-08 15:06:46', '(030300) Психология', 65, 1),
  (71, '2011-03-08 15:06:46', '(030301) Психология', 70, 0),
  (72, '2011-03-08 15:06:46', '(030302) Клиническая психология', 70, 0),
  (73, '2011-03-08 15:06:46', '(030400) История', 65, 1),
  (74, '2011-03-08 15:06:46', '(030401) История', 73, 0),
  (75, '2011-03-08 15:06:46', '(030402) Историко-архивоведение', 73, 0),
  (76, '2011-03-08 15:06:46', '(030500) Юриспруденция', 65, 1),
  (77, '2011-03-08 15:06:46', '(030501) Юриспруденция', 76, 0),
  (78, '2011-03-08 15:06:46', '(030502) Судебная экспертиза', 76, 0),
  (79, '2011-03-08 15:06:46', '(030503) Правоведение', 76, 0),
  (80, '2011-03-08 15:06:46', '(030504) Право и организация социального обеспечения', 76, 0),
  (81, '2011-03-08 15:06:46', '(030505) Правоохранительная деятельность', 76, 0),
  (82, '2011-03-08 15:06:46', '(030600) Журналистика', 65, 1),
  (83, '2011-03-08 15:06:46', '(030601) Журналистика', 82, 0),
  (84, '2011-03-08 15:06:46', '(030602) Связи с общественностью', 82, 0),
  (85, '2011-03-08 15:06:46', '(030700) Международные отношения', 65, 1),
  (86, '2011-03-08 15:06:46', '(030701) Международные отношения', 85, 0),
  (87, '2011-03-08 15:06:46', '(030800) Востоковедение, африканистика', 65, 1),
  (88, '2011-03-08 15:06:46', '(030801) Востоковедение, африканистика', 87, 0),
  (89, '2011-03-08 15:06:46', '(030900) Книжное дело', 65, 1),
  (90, '2011-03-08 15:06:46', '(030901) Издательское дело и редактирование', 89, 0),
  (91, '2011-03-08 15:06:46', '(030902) Издательское дело', 89, 0),
  (92, '2011-03-08 15:06:46', '(030903) Книгораспространение', 89, 0),
  (93, '2011-03-08 15:06:46', '(031000) Филология', 65, 1),
  (94, '2011-03-08 15:06:46', '(031001) Филология', 93, 0),
  (95, '2011-03-08 15:06:46', '(031100) Лингвистика', 65, 0),
  (96, '2011-03-08 15:06:46', '(031200) Лингвистика и межкультурная коммуникация', 65, 1),
  (97, '2011-03-08 15:06:46', '(031201) Теория и методика преподавания иностранных языков и культур', 96, 0),
  (98, '2011-03-08 15:06:46', '(031202) Перевод и переводоведение', 96, 0),
  (99, '2011-03-08 15:06:46', '(031203) Теория и практика межкультурной коммуникации', 96, 0),
  (100, '2011-03-08 15:06:46', '(031300) Лингвистика и новые информационные технологии', 65, 1),
  (101, '2011-03-08 15:06:46', '(031301) Теоретическая и прикладная лингвистика', 100, 0),
  (102, '2011-03-08 15:06:46', '(031302) Интеллектуальные системы в гуманитарной сфере', 100, 0),
  (103, '2011-03-08 15:06:46', '(031400) Культурология', 65, 1),
  (104, '2011-03-08 15:06:46', '(031401) Культурология', 103, 0),
  (105, '2011-03-08 15:06:46', '(031500) Искусствоведение (по видам)', 65, 1),
  (106, '2011-03-08 15:06:46', '(031501) Искусствоведение', 105, 0),
  (107, '2011-03-08 15:06:46', '(031502) Музеология', 105, 0),
  (108, '2011-03-08 15:06:46', '(031600) Искусства и гуманитарные науки', 65, 0),
  (109, '2011-03-08 15:06:46', '(031700) Изящные искусства', 65, 0),
  (110, '2011-03-08 15:06:46', '(031800) Религиоведение', 65, 1),
  (111, '2011-03-08 15:06:46', '(031801) Религиоведение', 110, 0),
  (112, '2011-03-08 15:06:46', '(031900) Теология', 65, 1),
  (113, '2011-03-08 15:06:46', '(031901) Теология', 112, 0),
  (114, '2011-03-08 15:06:46', '(032000) Документоведение', 65, 1),
  (115, '2011-03-08 15:06:46', '(032001) Документоведение и документационное обеспечение управления', 114, 0),
  (116, '2011-03-08 15:06:46', '(032002) Документационное обеспечение управления и архивоведение', 114, 0),
  (117, '2011-03-08 15:06:46', '(032100) Физическая культура', 65, 1),
  (118, '2011-03-08 15:06:46', '(032101) Физическая культура и спорт', 117, 0),
  (119, '2011-03-08 15:06:46', '(032102) Физическая культура для лиц с отклонениями в состоянии здоровья (адаптивная физическая культура)', 117, 0),
  (120, '2011-03-08 15:06:46', '(032103) Рекреация и спортивно-оздоровительный туризм', 117, 0),
  (121, '2011-03-08 15:06:46', '(032200) Прикладная этика', 65, 0),
  (122, '2011-03-08 15:06:46', '(032300) Регионоведение', 65, 1),
  (123, '2011-03-08 15:06:46', '(032301) Регионоведение', 122, 0),
  (124, '2011-03-08 15:06:46', '(032400) Реклама', 65, 1),
  (125, '2011-03-08 15:06:46', '(032401) Реклама', 124, 0),
  (126, '2011-03-08 15:06:46', '(040000) СОЦИАЛЬНЫЕ НАУКИ', 1000, 1),
  (127, '2011-03-08 15:06:46', '(040100) Социальная работа', 126, 1),
  (128, '2011-03-08 15:06:46', '(040101) Социальная работа', 127, 0),
  (129, '2011-03-08 15:06:46', '(040102) Социальная антропология', 127, 0),
  (130, '2011-03-08 15:06:46', '(040103) Организация сурдокоммуникации', 127, 0),
  (131, '2011-03-08 15:06:46', '(040104) Организация работы с молодежью', 127, 0),
  (132, '2011-03-08 15:06:46', '(040200) Социология', 126, 1),
  (133, '2011-03-08 15:06:46', '(040201) Социология', 132, 0),
  (134, '2011-03-08 15:06:46', '(040300) Конфликтология', 126, 0),
  (135, '2011-03-08 15:06:46', '(050000) ОБРАЗОВАНИЕ И ПЕДАГОГИКА', 1000, 1),
  (136, '2011-03-08 15:06:46', '(050100) Естественнонаучное образование', 135, 1),
  (137, '2011-03-08 15:06:46', '(050101) Химия', 136, 0),
  (138, '2011-03-08 15:06:46', '(050102) Биология', 136, 0),
  (139, '2011-03-08 15:06:46', '(050103) География', 136, 0),
  (140, '2011-03-08 15:06:46', '(050104) Безопасность жизнедеятельности', 136, 0),
  (141, '2011-03-08 15:06:46', '(050200) Физико-математическое образование', 135, 1),
  (142, '2011-03-08 15:06:46', '(050201) Математика', 141, 0),
  (143, '2011-03-08 15:06:46', '(050202) Информатика', 141, 0),
  (144, '2011-03-08 15:06:46', '(050203) Физика', 141, 0),
  (145, '2011-03-08 15:06:46', '(050300) Филологическое образование', 135, 1),
  (146, '2011-03-08 15:06:46', '(050301) Русский язык и литература', 145, 0),
  (147, '2011-03-08 15:06:46', '(050302) Родной язык и литература', 145, 0),
  (148, '2011-03-08 15:06:46', '(050303) Иностранный язык', 145, 0),
  (149, '2011-03-08 15:06:46', '(050400) Социально-экономическое образование', 135, 1),
  (150, '2011-03-08 15:06:46', '(050401) История', 149, 0),
  (151, '2011-03-08 15:06:46', '(050402) Юриспруденция', 149, 0),
  (152, '2011-03-08 15:06:46', '(050403) Культурология', 149, 0),
  (153, '2011-03-08 15:06:46', '(050500) Технологическое образование', 135, 1),
  (154, '2011-03-08 15:06:46', '(050501) Профессиональное обучение (по отраслям)', 153, 0),
  (155, '2011-03-08 15:06:46', '(050502) Технология и предпринимательство', 153, 0),
  (156, '2011-03-08 15:06:46', '(050503) Технология', 153, 0),
  (157, '2011-03-08 15:06:46', '(050600) Художественное образование', 135, 1),
  (158, '2011-03-08 15:06:46', '(050601) Музыкальное образование', 157, 0),
  (159, '2011-03-08 15:06:46', '(050602) Изобразительное искусство', 157, 0),
  (160, '2011-03-08 15:06:46', '(050603) Изобразительное искусство и черчение', 157, 0),
  (161, '2011-03-08 15:06:46', '(050700) Педагогика', 135, 1),
  (162, '2011-03-08 15:06:46', '(050701) Педагогика', 161, 0),
  (163, '2011-03-08 15:06:46', '(050702) Организация воспитательной деятельности', 161, 0),
  (164, '2011-03-08 15:06:46', '(050703) Дошкольная педагогика и психология', 161, 0),
  (165, '2011-03-08 15:06:46', '(050704) Дошкольное образование', 161, 0),
  (166, '2011-03-08 15:06:46', '(050705) Специальное дошкольное образование', 161, 0),
  (167, '2011-03-08 15:06:46', '(050706) Педагогика и психология', 161, 0),
  (168, '2011-03-08 15:06:46', '(050707) Педагогика и методика дошкольного образования', 161, 0),
  (169, '2011-03-08 15:06:46', '(050708) Педагогика и методика начального образования', 161, 0),
  (170, '2011-03-08 15:06:46', '(050709) Преподавание в начальных классах', 161, 0),
  (171, '2011-03-08 15:06:46', '(050710) Педагогика дополнительного образования', 161, 0),
  (172, '2011-03-08 15:06:46', '(050711) Социальная педагогика', 161, 0),
  (173, '2011-03-08 15:06:46', '(050712) Тифлопедагогика', 161, 0),
  (174, '2011-03-08 15:06:46', '(050713) Сурдопедагогика', 161, 0),
  (175, '2011-03-08 15:06:46', '(050714) Олигофренопедагогика', 161, 0),
  (176, '2011-03-08 15:06:46', '(050715) Логопедия', 161, 0),
  (177, '2011-03-08 15:06:46', '(050716) Специальная психология', 161, 0),
  (178, '2011-03-08 15:06:46', '(050717) Специальная дошкольная педагогика и психология', 161, 0),
  (179, '2011-03-08 15:06:46', '(050718) Специальная педагогика в специальных (коррекционных) образовательных учреждениях', 161, 0),
  (180, '2011-03-08 15:06:46', '(050719) Коррекционная педагогика в начальном образовании', 161, 0),
  (181, '2011-03-08 15:06:46', '(050720) Физическая культура', 161, 0),
  (182, '2011-03-08 15:06:46', '(050721) Адаптивная физическая культура', 161, 0),
  (183, '2011-03-08 15:06:46', '(060000) ЗДРАВООХРАНЕНИЕ', 1000, 1),
  (184, '2011-03-08 15:06:46', '(060100) Здравоохранение', 183, 1),
  (185, '2011-03-08 15:06:46', '(060101) Лечебное дело', 184, 0),
  (186, '2011-03-08 15:06:46', '(060102) Акушерское дело', 184, 0),
  (187, '2011-03-08 15:06:46', '(060103) Педиатрия', 184, 0),
  (188, '2011-03-08 15:06:46', '(060104) Медико-профилактическое дело', 184, 0),
  (189, '2011-03-08 15:06:46', '(060105) Стоматология', 184, 0),
  (190, '2011-03-08 15:06:46', '(060106) Стоматология ортопедическая', 184, 0),
  (191, '2011-03-08 15:06:46', '(060107) Стоматология профилактическая', 184, 0),
  (192, '2011-03-08 15:06:46', '(060108) Фармацея', 184, 0),
  (193, '2011-03-08 15:06:46', '(060109) Сестринское дело', 184, 0),
  (194, '2011-03-08 15:06:46', '(060110) Лабораторная диагностика', 184, 0),
  (195, '2011-03-08 15:06:46', '(060111) Медицинская оптика', 184, 0),
  (196, '2011-03-08 15:06:46', '(060112) Медицинская биохимия', 184, 0),
  (197, '2011-03-08 15:06:46', '(060113) Медицинская биофизика', 184, 0),
  (198, '2011-03-08 15:06:46', '(060114) Медицинская кибернетика', 184, 0),
  (199, '2011-03-08 15:06:46', '(070000) КУЛЬТУРА И ИСКУССТВО', 1000, 1),
  (200, '2011-03-08 15:06:46', '(070100) Музыкальное искусство', 199, 1),
  (201, '2011-03-08 15:06:46', '(070101) Инструментальное исполнительство (по видам инструментов: фортепиано, орган; оркестровые струнные инструменты; оркестровые духовые и ударные инструменты; оркестровые народные инструменты)', 200, 0),
  (202, '2011-03-08 15:06:46', '(070102) Инструментальное исполнительство (по видам инструментов)', 200, 0),
  (203, '2011-03-08 15:06:46', '(070103) Вокальное искусство (по видам вокального искусства: академическое пение; народное пение)', 200, 0),
  (204, '2011-03-08 15:06:46', '(070104) Вокальное искусство', 200, 0),
  (205, '2011-03-08 15:06:46', '(070105) Дирижирование (по видам исполнительских коллективов: дирижирование оперно-симфоническим оркестром; дирижирование академическим хором; дирижирование народным хором; дирижирование военно-духовым оркестром)', 200, 0),
  (206, '2011-03-08 15:06:46', '(070106) Хоровое дирижирование', 200, 0),
  (207, '2011-03-08 15:06:46', '(070107) Композиция', 200, 0),
  (208, '2011-03-08 15:06:46', '(070108) Музыкальное искусство эстрады (по видам эстрадного искусства: инструменты эстрадного оркестра; эстрадно-джазовое пение)', 200, 0),
  (209, '2011-03-08 15:06:46', '(070109) Музыкальное искусство эстрады (по видам)', 200, 0),
  (210, '2011-03-08 15:06:46', '(070110) Музыкальная звукорежиссура', 200, 0),
  (211, '2011-03-08 15:06:46', '(070111) Музыковедение', 200, 0),
  (212, '2011-03-08 15:06:46', '(070112) Этномузыкология', 200, 0),
  (213, '2011-03-08 15:06:46', '(070113) Теория музыки', 200, 0),
  (214, '2011-03-08 15:06:46', '(070200) Театральное искусство', 199, 1),
  (215, '2011-03-08 15:06:46', '(070201) Актерское искусство', 214, 0),
  (216, '2011-03-08 15:06:46', '(070202) Цирковое искусство', 214, 0),
  (217, '2011-03-08 15:06:46', '(070203) Искусство эстрады', 214, 0),
  (218, '2011-03-08 15:06:46', '(070204) Режиссура театра', 214, 0),
  (219, '2011-03-08 15:06:46', '(070205) Технология художественного оформления спектакля', 214, 0),
  (220, '2011-03-08 15:06:46', '(070206) Театрально-декорационное искусство', 214, 0),
  (221, '2011-03-08 15:06:46', '(070207) Сценография', 214, 0),
  (222, '2011-03-08 15:06:46', '(070208) Звукорежиссура театрализованных представлений и праздников', 214, 0),
  (223, '2011-03-08 15:06:46', '(070209) Режиссура театрализованных представлений и праздников', 214, 0),
  (224, '2011-03-08 15:06:46', '(070210) Драматургия', 214, 0),
  (225, '2011-03-08 15:06:46', '(070211) Театроведение', 214, 0),
  (226, '2011-03-08 15:06:46', '(070300) Искусство балета', 199, 1),
  (227, '2011-03-08 15:06:46', '(070301) Хореографическое исполнительство', 226, 0),
  (228, '2011-03-08 15:06:46', '(070302) Хореографическое искусство', 226, 0),
  (229, '2011-03-08 15:06:46', '(070303) Искусство хореографа', 226, 0),
  (230, '2011-03-08 15:06:46', '(070304) Педагогика балета', 226, 0),
  (231, '2011-03-08 15:06:46', '(070305) История и теория хореографического искусства', 226, 0),
  (232, '2011-03-08 15:06:46', '(070400) Светорежиссура', 199, 1),
  (233, '2011-03-08 15:06:46', '(070401) Светорежиссура', 232, 0),
  (234, '2011-03-08 15:06:46', '(070500) Реставрация', 199, 1),
  (235, '2011-03-08 15:06:46', '(070501) Реставрация', 234, 0),
  (236, '2011-03-08 15:06:46', '(070502) Реставрация, консервация и хранение произведений искусства', 234, 0),
  (237, '2011-03-08 15:06:46', '(070503) Музейное дело и охрана памятников', 234, 0),
  (238, '2011-03-08 15:06:46', '(070600) Дизайн', 199, 1),
  (239, '2011-03-08 15:06:46', '(070601) Дизайн', 238, 0),
  (240, '2011-03-08 15:06:46', '(070602) Дизайн (по отраслям)', 238, 0),
  (241, '2011-03-08 15:06:46', '(070603) Искусство интерьера', 238, 0),
  (242, '2011-03-08 15:06:46', '(070800) Декоративно-прикладное искусство и народные промыслы', 199, 1),
  (243, '2011-03-08 15:06:46', '(070801) Декоративно-прикладное искусство', 242, 0),
  (244, '2011-03-08 15:06:46', '(070802) Декоративно-прикладное искусство и народные промыслы', 242, 0),
  (245, '2011-03-08 15:06:46', '(070900) Изобразительное искусство', 199, 1),
  (246, '2011-03-08 15:06:46', '(070901) Живопись', 245, 0),
  (247, '2011-03-08 15:06:46', '(070902) Графика', 245, 0),
  (248, '2011-03-08 15:06:46', '(070903) Скульптура', 245, 0),
  (249, '2011-03-08 15:06:46', '(070904) Монументально-декоративное искусство', 245, 0),
  (250, '2011-03-08 15:06:46', '(070905) Зодчество', 245, 0),
  (251, '2011-03-08 15:06:46', '(070906) История и теория изобразительного искусства', 245, 0),
  (252, '2011-03-08 15:06:46', '(071000) Литературное творчество', 199, 1),
  (253, '2011-03-08 15:06:46', '(071001) Литературное творчество', 252, 0),
  (254, '2011-03-08 15:06:46', '(071100) Киноискусство', 199, 1),
  (255, '2011-03-08 15:06:46', '(071101) Режиссура кино и телевидения', 254, 0),
  (256, '2011-03-08 15:06:46', '(071102) Режиссура мультимедиапрограмм', 254, 0),
  (257, '2011-03-08 15:06:46', '(071103) Продюсерство кино и телевидения', 254, 0),
  (258, '2011-03-08 15:06:46', '(071104) Звукорежиссура кино и телевидения', 254, 0),
  (259, '2011-03-08 15:06:46', '(071105) Кинооператорство', 254, 0),
  (260, '2011-03-08 15:06:46', '(071106) Киноведение', 254, 0),
  (261, '2011-03-08 15:06:46', '(071200) Библиотечно-информационные ресурсы', 199, 1),
  (262, '2011-03-08 15:06:46', '(071201) Библиотечно-информационная деятельность', 261, 0),
  (263, '2011-03-08 15:06:46', '(071202) Библиотековедение', 261, 0),
  (264, '2011-03-08 15:06:46', '(071300) Народная художественная культура', 199, 1),
  (265, '2011-03-08 15:06:46', '(071301) Народное художественное творчество', 264, 0),
  (266, '2011-03-08 15:06:46', '(071302) Социально-культурная деятельность и народное художественное творчество', 264, 0),
  (267, '2011-03-08 15:06:46', '(071400) Социально-культурная деятельность', 199, 1),
  (268, '2011-03-08 15:06:46', '(071401) Социально-культурная деятельность', 267, 0),
  (269, '2011-03-08 15:06:46', '(071500) Художественное проектирование изделий текстильной и легкой промышленности', 199, 1),
  (270, '2011-03-08 15:06:46', '(071501) Художественное проектирование костюма', 269, 0),
  (271, '2011-03-08 15:06:46', '(071502) Художественное проектирование текстильных изделий', 269, 0),
  (272, '2011-03-08 15:06:46', '(071503) Художественное проектирование изделий из кожи', 269, 0),
  (273, '2011-03-08 15:06:46', '(071504) Художественное проектирование ювелирных изделий', 269, 0),
  (274, '2011-03-08 15:06:46', '(071505) Художественное оформление изделий текстильной и легкой промышленности', 269, 0),
  (275, '2011-03-08 15:06:46', '(080000) ЭКОНОМИКА И УПРАВЛЕНИЕ', 1000, 1),
  (276, '2011-03-08 15:06:46', '(080100) Экономика', 275, 1),
  (277, '2011-03-08 15:06:46', '(080101) Экономическая теория', 276, 0),
  (278, '2011-03-08 15:06:46', '(080102) Мировая экономика', 276, 0),
  (279, '2011-03-08 15:06:46', '(080103) Национальная экономика', 276, 0),
  (280, '2011-03-08 15:06:46', '(080104) Экономика труда', 276, 0),
  (281, '2011-03-08 15:06:46', '(080105) Финансы и кредит', 276, 0),
  (282, '2011-03-08 15:06:46', '(080106) Финансы (по отраслям)', 276, 0),
  (283, '2011-03-08 15:06:46', '(080107) Налоги и налогообложение', 276, 0),
  (284, '2011-03-08 15:06:46', '(080108) Банковское дело', 276, 0),
  (285, '2011-03-08 15:06:46', '(080109) Бухгалтерский учет, анализ и аудит', 276, 0),
  (286, '2011-03-08 15:06:46', '(080110) Экономика и бухгалтерский учет (по отраслям)', 276, 0),
  (287, '2011-03-08 15:06:46', '(080111) Маркетинг', 276, 0),
  (288, '2011-03-08 15:06:46', '(080112) Маркетинг (по отраслям)', 276, 0),
  (289, '2011-03-08 15:06:46', '(080113) Страховое дело (по отраслям)', 276, 0),
  (290, '2011-03-08 15:06:46', '(080114) Земельно-имущественные отношения', 276, 0),
  (291, '2011-03-08 15:06:46', '(080115) Таможенное дело', 276, 0),
  (292, '2011-03-08 15:06:46', '(080116) Математические методы в экономике', 276, 0),
  (293, '2011-03-08 15:06:46', '(080300) Коммерция', 275, 1),
  (294, '2011-03-08 15:06:46', '(080301) Коммерция (торговое дело)', 293, 0),
  (295, '2011-03-08 15:06:46', '(080302) Коммерция (по отраслям)', 293, 0),
  (296, '2011-03-08 15:06:46', '(080400) Товароведение', 275, 1),
  (297, '2011-03-08 15:06:46', '(080401) Товароведение и экспертиза товаров (по областям применения)', 296, 0),
  (298, '2011-03-08 15:06:46', '(080402) Товароведение (по группам однородных товаров)', 296, 0),
  (299, '2011-03-08 15:06:46', '(080500) Менеджмент', 275, 1),
  (300, '2011-03-08 15:06:46', '(080501) Менеджмент (по отраслям)', 299, 0),
  (301, '2011-03-08 15:06:46', '(080502) Экономика и управление на предприятии (по отраслям)', 299, 0),
  (302, '2011-03-08 15:06:46', '(080503) Антикризисное управление', 299, 0),
  (303, '2011-03-08 15:06:46', '(080504) Государственное и муниципальное управление', 299, 0),
  (304, '2011-03-08 15:06:46', '(080505) Управление персоналом', 299, 0),
  (305, '2011-03-08 15:06:46', '(080506) Логистика', 299, 0),
  (306, '2011-03-08 15:06:46', '(080507) Менеджмент организации', 299, 0),
  (307, '2011-03-08 15:06:46', '(080600) Статистика', 275, 1),
  (308, '2011-03-08 15:06:46', '(080601) Статистика', 307, 0),
  (309, '2011-03-08 15:06:46', '(080700) Бизнес-информатика', 275, 0),
  (310, '2011-03-08 15:06:46', '(080800) Прикладная информатика', 275, 1),
  (311, '2011-03-08 15:06:46', '(080801) Прикладная информатика (по областям)', 310, 0),
  (312, '2011-03-08 15:06:46', '(080802) Прикладная информатика (по отраслям)', 310, 0),
  (313, '2011-03-08 15:06:46', '(090000) ИНФОРМАЦИОННАЯ БЕЗОПАСНОСТЬ', 1000, 1),
  (314, '2011-03-08 15:06:46', '(090100) Информационная безопасность', 313, 1),
  (315, '2011-03-08 15:06:46', '(090101) Криптография', 314, 0),
  (316, '2011-03-08 15:06:46', '(090102) Компьютерная безопасность', 314, 0),
  (317, '2011-03-08 15:06:46', '(090103) Организация и технология защиты информации', 314, 0),
  (318, '2011-03-08 15:06:46', '(090104) Комплексная защита объектов информатизации', 314, 0),
  (319, '2011-03-08 15:06:46', '(090105) Комплексное обеспечение информационной безопасности автоматизированных систем', 314, 0),
  (320, '2011-03-08 15:06:46', '(090106) Информационная безопасность телекоммуникационных систем', 314, 0),
  (321, '2011-03-08 15:06:46', '(090107) Противодействие техническим разведкам', 314, 0),
  (322, '2011-03-08 15:06:46', '(090108) Информационная безопасность', 314, 0),
  (323, '2011-03-08 15:06:46', '(100000) СФЕРА ОБСЛУЖИВАНИЯ', 1000, 1),
  (324, '2011-03-08 15:06:46', '(100100) Сервис', 323, 1),
  (325, '2011-03-08 15:06:46', '(100101) Сервис', 324, 0),
  (326, '2011-03-08 15:06:46', '(100102) Организация обслуживания в сфере сервиса', 324, 0),
  (327, '2011-03-08 15:06:46', '(100103) Социально-культурный сервис и туризм', 324, 0),
  (328, '2011-03-08 15:06:46', '(100105) Гостиничный сервис', 324, 0),
  (329, '2011-03-08 15:06:46', '(100106) Организация обслуживания в общественном питании', 324, 0),
  (330, '2011-03-08 15:06:46', '(100107) Сервис по химической обработке изделий', 324, 0),
  (331, '2011-03-08 15:06:46', '(100108) Парикмахерское искусство', 324, 0),
  (332, '2011-03-08 15:06:46', '(100109) Косметика и визажное искусство', 324, 0),
  (333, '2011-03-08 15:06:46', '(100110) Домоведение', 324, 0),
  (334, '2011-03-08 15:06:46', '(100111) Техника и искусство фотографии', 324, 0),
  (335, '2011-03-08 15:06:46', '(100112) Сервис на транспорте (по видам транспорта)', 324, 0),
  (336, '2011-03-08 15:06:46', '(100200) Туризм', 323, 1),
  (337, '2011-03-08 15:06:46', '(100201) Туризм', 336, 0),
  (338, '2011-03-08 15:06:46', '(110000) СЕЛЬСКОЕ И РЫБНОЕ ХОЗЯЙСТВО', 1000, 1),
  (339, '2011-03-08 15:06:46', '(110100) Агрохимия и агропочвоведение', 338, 1),
  (340, '2011-03-08 15:06:46', '(110101) Агрохимия и агропочвоведение', 339, 0),
  (341, '2011-03-08 15:06:46', '(110102) Агроэкология', 339, 0),
  (342, '2011-03-08 15:06:46', '(110200) Агрономия', 338, 1),
  (343, '2011-03-08 15:06:46', '(110201) Агрономия', 342, 0),
  (344, '2011-03-08 15:06:46', '(110202) Плодоовощеводство и виноградарство', 342, 0),
  (345, '2011-03-08 15:06:46', '(110203) Защита растений', 342, 0),
  (346, '2011-03-08 15:06:46', '(110204) Селекция и генетика сельскохозяйственных культур', 342, 0),
  (347, '2011-03-08 15:06:46', '(110300) Агроинженерия', 338, 1),
  (348, '2011-03-08 15:06:46', '(110301) Механизация сельского хозяйства', 347, 0),
  (349, '2011-03-08 15:06:46', '(110302) Электрификация и автоматизация сельского хозяйства', 347, 0),
  (350, '2011-03-08 15:06:46', '(110303) Механизация переработки сельскохозяйственной продукции', 347, 0),
  (351, '2011-03-08 15:06:46', '(110304) Технология обслуживания и ремонта машин в агропромышленном комплексе', 347, 0),
  (352, '2011-03-08 15:06:46', '(110305) Технология производства и переработки сельскохозяйственной продукции', 347, 0),
  (353, '2011-03-08 15:06:46', '(110306) Хранение и переработка растениеводческой продукции', 347, 0),
  (354, '2011-03-08 15:06:46', '(110400) Зоотехния', 338, 1),
  (355, '2011-03-08 15:06:46', '(110401) Зоотехния', 354, 0),
  (356, '2011-03-08 15:06:46', '(110500) Ветеринарно-санитарная экспертиза', 338, 1),
  (357, '2011-03-08 15:06:46', '(110501) Ветеринарно-санитарная экспертиза', 356, 0),
  (358, '2011-03-08 15:06:46', '(110600) Пчеловодство', 338, 1),
  (359, '2011-03-08 15:06:46', '(110601) Пчеловодство', 358, 0),
  (360, '2011-03-08 15:06:46', '(110700) Охотоведение и звероводство', 338, 1),
  (361, '2011-03-08 15:06:46', '(110701) Охотоведение и звероводство', 360, 0),
  (362, '2011-03-08 15:06:46', '(110800) Кинология', 338, 1),
  (363, '2011-03-08 15:06:46', '(110801) Кинология', 362, 0),
  (364, '2011-03-08 15:06:46', '(110900) Водные биоресурсы и аквакультура', 338, 1),
  (365, '2011-03-08 15:06:46', '(110901) Водные биоресурсы и аквакультура', 364, 0),
  (366, '2011-03-08 15:06:46', '(110902) Ихтиология и рыбоводство', 364, 0),
  (367, '2011-03-08 15:06:46', '(111000) Рыболовство', 338, 1),
  (368, '2011-03-08 15:06:46', '(111001) Промышленное рыболовство', 367, 0),
  (369, '2011-03-08 15:06:46', '(111100) Организация фермерского хозяйства', 338, 1),
  (370, '2011-03-08 15:06:46', '(111101) Организация фермерского хозяйства', 369, 0),
  (371, '2011-03-08 15:06:46', '(111200) Ветеринария', 338, 1),
  (372, '2011-03-08 15:06:46', '(111201) Ветеринария', 371, 0),
  (373, '2011-03-08 15:06:46', '(120000) ГЕОДЕЗИЯ И ЗЕМЛЕУСТРОЙСТВО', 1000, 1),
  (374, '2011-03-08 15:06:46', '(120100) Геодезия', 373, 1),
  (375, '2011-03-08 15:06:46', '(120101) Прикладная геодезия', 374, 0),
  (376, '2011-03-08 15:06:46', '(120102) Астрономогеодезия', 374, 0),
  (377, '2011-03-08 15:06:46', '(120103) Космическая геодезия', 374, 0),
  (378, '2011-03-08 15:06:46', '(120200) Фотограмметрия и дистанционное зондирование', 373, 1),
  (379, '2011-03-08 15:06:46', '(120201) Исследование природных ресурсов аэрокосмическими средствами', 378, 0),
  (380, '2011-03-08 15:06:46', '(120202) Аэрофотогеодезия', 378, 0),
  (381, '2011-03-08 15:06:46', '(120300) Землеустройство и кадастры', 373, 1),
  (382, '2011-03-08 15:06:46', '(120301) Землеустройство', 381, 0),
  (383, '2011-03-08 15:06:46', '(120302) Земельный кадастр', 381, 0),
  (384, '2011-03-08 15:06:46', '(120303) Городской кадастр', 381, 0),
  (385, '2011-03-08 15:06:46', '(120304) Градостроительный кадастр', 381, 0),
  (386, '2011-03-08 15:06:46', '(130000) ГЕОЛОГИЯ, РАЗВЕДКА И РАЗРАБОТКА ПОЛЕЗНЫХ ИСКОПАЕМЫХ', 1000, 1),
  (387, '2011-03-08 15:06:46', '(130100) Геология и разведка полезных ископаемых', 386, 0),
  (388, '2011-03-08 15:06:46', '(130200) Технологии геологической разведки', 386, 1),
  (389, '2011-03-08 15:06:46', '(130201) Геофизические методы поисков и разведки месторождений полезных ископаемых', 388, 0),
  (390, '2011-03-08 15:06:46', '(130202) Геофизические методы исследования скважин', 388, 0),
  (391, '2011-03-08 15:06:46', '(130203) Технология и техника разведки месторождений полезных ископаемых', 388, 0),
  (392, '2011-03-08 15:06:46', '(130300) Прикладная геология', 386, 1),
  (393, '2011-03-08 15:06:46', '(130301) Геологическая съемка, поиски и разведка месторождений полезных ископаемых', 392, 0),
  (394, '2011-03-08 15:06:46', '(130302) Поиски и разведка подземных вод и инженерно-геологические изыскания', 392, 0),
  (395, '2011-03-08 15:06:46', '(130303) Гидрогеология и инженерная геология', 392, 0),
  (396, '2011-03-08 15:06:46', '(130304) Геология нефти и газа', 392, 0),
  (397, '2011-03-08 15:06:46', '(130305) Геология и разведка нефтяных и газовых месторождений', 392, 0),
  (398, '2011-03-08 15:06:46', '(130306) Прикладная геохимия, петрология, минералогия', 392, 0),
  (399, '2011-03-08 15:06:46', '(130400) Горное дело', 386, 1),
  (400, '2011-03-08 15:06:46', '(130401) Физические процессы горного или нефтегазового производства', 399, 0),
  (401, '2011-03-08 15:06:46', '(130402) Маркшейдерское дело', 399, 0),
  (402, '2011-03-08 15:06:46', '(130403) Открытые горные работы', 399, 0),
  (403, '2011-03-08 15:06:46', '(130404) Подземная разработка месторождений полезных ископаемых', 399, 0),
  (404, '2011-03-08 15:06:46', '(130405) Обогащение полезных ископаемых', 399, 0),
  (405, '2011-03-08 15:06:46', '(130406) Шахтное и подземное строительство', 399, 0),
  (406, '2011-03-08 15:06:46', '(130407) Шахтное строительство', 399, 0),
  (407, '2011-03-08 15:06:46', '(130408) Взрывное дело', 399, 0),
  (408, '2011-03-08 15:06:46', '(130500) Нефтегазовое дело', 386, 1),
  (409, '2011-03-08 15:06:46', '(130501) Проектирование, сооружение и эксплуатация газонефтепроводов и газонефтехранилищ', 408, 0),
  (410, '2011-03-08 15:06:46', '(130502) Сооружение и эксплуатация газонефтепроводов и газонефтехранилищ', 408, 0),
  (411, '2011-03-08 15:06:46', '(130503) Разработка и эксплуатация нефтяных и газовых месторождений', 408, 0),
  (412, '2011-03-08 15:06:46', '(130504) Бурение нефтяных и газовых скважин', 408, 0),
  (413, '2011-03-08 15:06:46', '(130600) Оборудование и агрегаты нефтегазового производства', 386, 1),
  (414, '2011-03-08 15:06:46', '(130601) Морские нефтегазовые сооружения', 413, 0),
  (415, '2011-03-08 15:06:46', '(130602) Машины и оборудование нефтяных и газовых промыслов', 413, 0),
  (416, '2011-03-08 15:06:46', '(130603) Оборудование нефтегазопереработки', 413, 0),
  (417, '2011-03-08 15:06:46', '(140000) ЭНЕРГЕТИКА, ЭНЕРГЕТИЧЕСКОЕ МАШИНОСТРОЕНИЕ И ЭЛЕКТРОТЕХНИКА', 1000, 1),
  (418, '2011-03-08 15:06:46', '(140100) Теплоэнергетика', 417, 1),
  (419, '2011-03-08 15:06:46', '(140101) Тепловые электрические станции', 418, 0),
  (420, '2011-03-08 15:06:46', '(140102) Теплоснабжение и теплотехническое оборудование', 418, 0),
  (421, '2011-03-08 15:06:46', '(140103) Технология воды и топлива на тепловых и атомных электрических станциях', 418, 0),
  (422, '2011-03-08 15:06:46', '(140104) Промышленная теплоэнергетика', 418, 0),
  (423, '2011-03-08 15:06:46', '(140105) Энергетика теплотехнологий', 418, 0),
  (424, '2011-03-08 15:06:46', '(140106) Энергообеспечение предприятий', 418, 0),
  (425, '2011-03-08 15:06:46', '(140200) Электроэнергетика', 417, 1),
  (426, '2011-03-08 15:06:46', '(140201) Высоковольтная электроэнергетика и электротехника', 425, 0),
  (427, '2011-03-08 15:06:46', '(140202) Нетрадиционные и возобновляемые источники энергии', 425, 0),
  (428, '2011-03-08 15:06:46', '(140203) Релейная защита и автоматизация электроэнергетических систем', 425, 0),
  (429, '2011-03-08 15:06:46', '(140204) Электрические станции', 425, 0),
  (430, '2011-03-08 15:06:46', '(140205) Электроэнергетические системы и сети', 425, 0),
  (431, '2011-03-08 15:06:46', '(140206) Электрические станции, сети и системы', 425, 0),
  (432, '2011-03-08 15:06:46', '(140207) Технология воды, топлива и смазочных материалов на электрических станциях', 425, 0),
  (433, '2011-03-08 15:06:46', '(140208) Монтаж и эксплуатация линий электропередачи', 425, 0),
  (434, '2011-03-08 15:06:46', '(140209) Гидроэлектростанции', 425, 0),
  (435, '2011-03-08 15:06:46', '(140210) Гидроэлектроэнергетические установки', 425, 0),
  (436, '2011-03-08 15:06:46', '(140211) Электроснабжение', 425, 0),
  (437, '2011-03-08 15:06:46', '(140212) Электроснабжение (по отраслям)', 425, 0),
  (438, '2011-03-08 15:06:46', '(140300) Ядерные физика и технологии', 417, 1),
  (439, '2011-03-08 15:06:46', '(140301) Физика конденсированного состояния вещества', 438, 0),
  (440, '2011-03-08 15:06:46', '(140302) Физика атомного ядра и частиц', 438, 0),
  (441, '2011-03-08 15:06:46', '(140303) Физика кинетических явлений', 438, 0),
  (442, '2011-03-08 15:06:46', '(140304) Физика пучков заряженных частиц и ускорительная техника', 438, 0),
  (443, '2011-03-08 15:06:46', '(140305) Ядерные реакторы и энергетические установки', 438, 0),
  (444, '2011-03-08 15:06:46', '(140306) Электроника и автоматика физических установок', 438, 0),
  (445, '2011-03-08 15:06:46', '(140307) Радиационная безопасность человека и окружающей среды', 438, 0),
  (446, '2011-03-08 15:06:46', '(140308) Радиационная безопасность', 438, 0),
  (447, '2011-03-08 15:06:46', '(140309) Безопасность и нераспространение ядерных материалов', 438, 0),
  (448, '2011-03-08 15:06:46', '(140400) Техническая физика', 417, 1),
  (449, '2011-03-08 15:06:46', '(140401) Техника и физика низких температур', 448, 0),
  (450, '2011-03-08 15:06:46', '(140402) Теплофизика', 448, 0),
  (451, '2011-03-08 15:06:46', '(140403) Техническая физика термоядерных реакторов и плазменных установок', 448, 0),
  (452, '2011-03-08 15:06:46', '(140404) Атомные электрические станции и установки', 448, 0),
  (453, '2011-03-08 15:06:46', '(140500) Энергомашиностроение', 417, 1),
  (454, '2011-03-08 15:06:46', '(140501) Двигатели внутреннего сгорания', 453, 0),
  (455, '2011-03-08 15:06:46', '(140502) Котлои реакторостроение', 453, 0),
  (456, '2011-03-08 15:06:46', '(140503) Газотурбинные, паротурбинные установки и двигатели', 453, 0),
  (457, '2011-03-08 15:06:46', '(140504) Холодильная, криогенная техника и кондиционирование', 453, 0),
  (458, '2011-03-08 15:06:46', '(140505) Плазменные энергетические установки', 453, 0),
  (459, '2011-03-08 15:06:46', '(140600) Электротехника, электромеханика и электротехнологии', 417, 1),
  (460, '2011-03-08 15:06:46', '(140601) Электромеханика', 459, 0),
  (461, '2011-03-08 15:06:46', '(140602) Электрические и электронные аппараты', 459, 0),
  (462, '2011-03-08 15:06:46', '(140603) Электрические машины и аппараты', 459, 0),
  (463, '2011-03-08 15:06:46', '(140604) Электропривод и автоматика промышленных установок и технологических комплексов', 459, 0),
  (464, '2011-03-08 15:06:46', '(140605) Электротехнологические установки и системы', 459, 0),
  (465, '2011-03-08 15:06:46', '(140606) Электрический транспорт', 459, 0),
  (466, '2011-03-08 15:06:46', '(140607) Электрооборудование автомобилей и тракторов', 459, 0),
  (467, '2011-03-08 15:06:46', '(140608) Электрооборудование и автоматика судов', 459, 0),
  (468, '2011-03-08 15:06:46', '(140609) Электрооборудование летательных аппаратов', 459, 0),
  (469, '2011-03-08 15:06:46', '(140610) Электрооборудование и электрохозяйство предприятий, организаций и учреждений', 459, 0),
  (470, '2011-03-08 15:06:46', '(140611) Электроизоляционная, кабельная и конденсаторная техника', 459, 0),
  (471, '2011-03-08 15:06:46', '(140612) Электротехнические устройства', 459, 0),
  (472, '2011-03-08 15:06:46', '(140613) Техническая эксплуатация и обслуживание электрического и электромеханического оборудования (по отраслям)', 459, 0),
  (473, '2011-03-08 15:06:46', '(150000) МЕТАЛЛУРГИЯ, МАШИНОСТРОЕНИЕ И МАТЕРИАЛООБРАБОТКА', 1000, 1),
  (474, '2011-03-08 15:06:46', '(150100) Металлургия', 473, 1),
  (475, '2011-03-08 15:06:46', '(150101) Металлургия черных металлов', 474, 0),
  (476, '2011-03-08 15:06:46', '(150102) Металлургия цветных металлов', 474, 0),
  (477, '2011-03-08 15:06:46', '(150103) Теплофизика, автоматизация и экология промышленных печей', 474, 0),
  (478, '2011-03-08 15:06:46', '(150104) Литейное производство черных и цветных металлов', 474, 0),
  (479, '2011-03-08 15:06:46', '(150105) Металловедение и термическая обработка металлов', 474, 0),
  (480, '2011-03-08 15:06:46', '(150106) Обработка металлов давлением', 474, 0),
  (481, '2011-03-08 15:06:46', '(150107) Металлургия сварочного производства', 474, 0),
  (482, '2011-03-08 15:06:46', '(150108) Порошковая металлургия, композиционные материалы, покрытия', 474, 0),
  (483, '2011-03-08 15:06:46', '(150109) Металлургия техногенных и вторичных ресурсов', 474, 0),
  (484, '2011-03-08 15:06:46', '(150110) Контроль качества металлов и сварных соединений', 474, 0),
  (485, '2011-03-08 15:06:46', '(150200) Машиностроительные технологии и оборудование', 473, 1),
  (486, '2011-03-08 15:06:46', '(150201) Машины и технология обработки металлов давлением', 485, 0),
  (487, '2011-03-08 15:06:46', '(150202) Оборудование и технология сварочного производства', 485, 0),
  (488, '2011-03-08 15:06:46', '(150203) Сварочное производство', 485, 0),
  (489, '2011-03-08 15:06:46', '(150204) Машины и технология литейного производства', 485, 0),
  (490, '2011-03-08 15:06:46', '(150205) Оборудование и технология повышения износостойкости и восстановление деталей машин и аппаратов', 485, 0),
  (491, '2011-03-08 15:06:46', '(150206) Машины и технология высокоэффективных процессов обработки материалов', 485, 0),
  (492, '2011-03-08 15:06:46', '(150207) Реновация средств и объектов материального производства в машиностроении', 485, 0),
  (493, '2011-03-08 15:06:46', '(150300) Прикладная механика', 473, 1),
  (494, '2011-03-08 15:06:46', '(150301) Динамика и прочность машин', 493, 0),
  (495, '2011-03-08 15:06:46', '(150302) Триботехника', 493, 0),
  (496, '2011-03-08 15:06:46', '(150400) Технологические машины и оборудование', 473, 1),
  (497, '2011-03-08 15:06:46', '(150401) Проектирование технических и технологических комплексов', 496, 0),
  (498, '2011-03-08 15:06:46', '(150402) Горные машины и оборудование', 496, 0),
  (499, '2011-03-08 15:06:46', '(150403) Технологические машины и оборудование для разработки торфяных месторождений', 496, 0),
  (500, '2011-03-08 15:06:46', '(150404) Металлургические машины и оборудование', 496, 0),
  (501, '2011-03-08 15:06:46', '(150405) Машины и оборудование лесного комплекса', 496, 0),
  (502, '2011-03-08 15:06:46', '(150406) Машины и аппараты текстильной и легкой промышленности', 496, 0),
  (503, '2011-03-08 15:06:46', '(150407) Полиграфические машины и автоматизированные комплексы', 496, 0),
  (504, '2011-03-08 15:06:46', '(150408) Бытовые машины и приборы', 496, 0),
  (505, '2011-03-08 15:06:46', '(150409) Специальные машины и устройства', 496, 0),
  (506, '2011-03-08 15:06:46', '(150410) Производство изделий на автоматических роторных и роторно-конвейерных линиях', 496, 0),
  (507, '2011-03-08 15:06:46', '(150411) Монтаж и техническая эксплуатация промышленного оборудования (по отраслям)', 496, 0),
  (508, '2011-03-08 15:06:46', '(150412) Техническая эксплуатация оборудования для производства электронной техники', 496, 0),
  (509, '2011-03-08 15:06:46', '(150413) Техническая эксплуатация оборудования в торговле и общественном питании', 496, 0),
  (510, '2011-03-08 15:06:46', '(150414) Монтаж и техническая эксплуатация холодильно-компрессорных машин и установок', 496, 0),
  (511, '2011-03-08 15:06:46', '(150500) Материаловедение, технология материалов и покрытий', 473, 1),
  (512, '2011-03-08 15:06:46', '(150501) Материаловедение в машиностроении', 511, 0),
  (513, '2011-03-08 15:06:46', '(150502) Конструирование и производство изделий из композиционных материалов', 511, 0),
  (514, '2011-03-08 15:06:46', '(150600) Материаловедение и технология новых материалов', 473, 1),
  (515, '2011-03-08 15:06:46', '(150601) Материаловедение и технология новых материалов', 514, 0),
  (516, '2011-03-08 15:06:46', '(150700) Физическое материаловедение', 473, 1),
  (517, '2011-03-08 15:06:46', '(150701) Физико-химия процессов и материалов', 516, 0),
  (518, '2011-03-08 15:06:46', '(150702) Физика металлов', 516, 0),
  (519, '2011-03-08 15:06:46', '(150800) Гидравлическая, вакуумная и компрессорная техника', 473, 1),
  (520, '2011-03-08 15:06:46', '(150801) Вакуумная и компрессорная техника физических установок', 519, 0),
  (521, '2011-03-08 15:06:46', '(150802) Гидравлические машины, гидроприводы и гидропневмоавтоматика', 519, 0),
  (522, '2011-03-08 15:06:46', '(150803) Техническая эксплуатация гидравлических машин, гидроприводов и гидропневмоавтоматики', 519, 0),
  (523, '2011-03-08 15:06:46', '(150900) Технология, оборудование и автоматизация машиностроительных производств', 473, 0),
  (524, '2011-03-08 15:06:46', '(151000) Конструкторско-технологическое обеспечение автоматизированных машиностроительных производств', 473, 1),
  (525, '2011-03-08 15:06:46', '(151001) Технология машиностроения', 524, 0),
  (526, '2011-03-08 15:06:46', '(151002) Металлообрабатывающие станки и комплексы', 524, 0),
  (527, '2011-03-08 15:06:46', '(151003) Инструментальные системы машиностроительных производств', 524, 0),
  (528, '2011-03-08 15:06:46', '(160000) АВИАЦИОННАЯ И РАКЕТНО-КОСМИЧЕСКАЯ ТЕХНИКА', 1000, 1),
  (529, '2011-03-08 15:06:46', '(160100) Авиаи ракетостроение', 528, 0),
  (530, '2011-03-08 15:06:46', '(160200) Авиастроение', 528, 1),
  (531, '2011-03-08 15:06:46', '(160201) Самолетои вертолетостроение', 530, 0),
  (532, '2011-03-08 15:06:46', '(160202) Системы жизнеобеспечения оборудования летательных аппаратов', 530, 0),
  (533, '2011-03-08 15:06:46', '(160203) Производство летательных аппаратов', 530, 0),
  (534, '2011-03-08 15:06:46', '(160300) Двигатели летательных аппаратов', 528, 1),
  (535, '2011-03-08 15:06:46', '(160301) Авиационные двигатели и энергетические установки', 534, 0),
  (536, '2011-03-08 15:06:46', '(160302) Ракетные двигатели', 534, 0),
  (537, '2011-03-08 15:06:46', '(160303) Электроракетные двигатели и энергетические установки', 534, 0),
  (538, '2011-03-08 15:06:46', '(160304) Авиационная и ракетно-космическая теплотехника', 534, 0),
  (539, '2011-03-08 15:06:46', '(160305) Производство авиационных двигателей', 534, 0),
  (540, '2011-03-08 15:06:46', '(160400) Системы управления движением и навигация', 528, 1),
  (541, '2011-03-08 15:06:46', '(160401) Управляющие, пилотажно-навигационные и электроэнергетические комплексы летательных аппаратов', 540, 0),
  (542, '2011-03-08 15:06:46', '(160402) Приборы и системы ориентации, стабилизации и навигации', 540, 0),
  (543, '2011-03-08 15:06:46', '(160403) Системы управления летательными аппаратами', 540, 0),
  (544, '2011-03-08 15:06:46', '(160500) Аэронавигация', 528, 1),
  (545, '2011-03-08 15:06:46', '(160501) Эксплуатация воздушных судов и организация воздушного движения', 544, 0),
  (546, '2011-03-08 15:06:46', '(160502) Управление движением воздушного транспорта', 544, 0),
  (547, '2011-03-08 15:06:46', '(160503) Летная эксплуатация воздушных судов', 544, 0),
  (548, '2011-03-08 15:06:46', '(160504) Летная эксплуатация летательных аппаратов', 544, 0),
  (549, '2011-03-08 15:06:46', '(160505) Аэронавигационное обслуживание и использование воздушного пространства', 544, 0),
  (550, '2011-03-08 15:06:46', '(160600) Интегрированные системы летательных аппаратов', 528, 1),
  (551, '2011-03-08 15:06:46', '(160601) Прицельно-навигационные системы летательных аппаратов', 550, 0),
  (552, '2011-03-08 15:06:46', '(160602) Автоматизированные системы управления боевыми авиационными комплексами', 550, 0),
  (553, '2011-03-08 15:06:46', '(160603) Системы приводов летательных аппаратов', 550, 0),
  (554, '2011-03-08 15:06:46', '(160604) Робототехнические системы авиационного вооружения', 550, 0),
  (555, '2011-03-08 15:06:46', '(160700) Гидроаэродинамика и динамика полета', 528, 1),
  (556, '2011-03-08 15:06:46', '(160701) Баллистика', 555, 0),
  (557, '2011-03-08 15:06:46', '(160702) Гидроаэродинамика', 555, 0),
  (558, '2011-03-08 15:06:46', '(160703) Динамика полета и управление движением летательных аппаратов', 555, 0),
  (559, '2011-03-08 15:06:46', '(160800) Ракетостроение и космонавтика', 528, 1),
  (560, '2011-03-08 15:06:46', '(160801) Ракетостроение', 559, 0),
  (561, '2011-03-08 15:06:46', '(160802) Космические летательные аппараты и разгонные блоки', 559, 0),
  (562, '2011-03-08 15:06:46', '(160803) Стартовые и технические комплексы ракет и космических аппаратов', 559, 0),
  (563, '2011-03-08 15:06:46', '(160804) Системы жизнеобеспечения и защиты ракетно-космических аппаратов', 559, 0),
  (564, '2011-03-08 15:06:46', '(160900) Эксплуатация и испытания авиационной и космической техники', 528, 1),
  (565, '2011-03-08 15:06:46', '(160901) Техническая эксплуатация летательных аппаратов и двигателей', 564, 0),
  (566, '2011-03-08 15:06:46', '(160902) Обслуживание летательных аппаратов горюче-смазочными материалами', 564, 0),
  (567, '2011-03-08 15:06:46', '(160903) Техническая эксплуатация авиационных электросистем и пилотажно-навигационных комплексов', 564, 0),
  (568, '2011-03-08 15:06:46', '(160904) Техническая эксплуатация электрифицированных и пилотажно-навигационных комплексов', 564, 0),
  (569, '2011-03-08 15:06:46', '(160905) Техническая эксплуатация транспортного радиооборудования', 564, 0),
  (570, '2011-03-08 15:06:46', '(160906) Испытание летательных аппаратов', 564, 0),
  (571, '2011-03-08 15:06:46', '(170000) ОРУЖИЕ И СИСТЕМЫ ВООРУЖЕНИЯ', 1000, 1),
  (572, '2011-03-08 15:06:46', '(170100) Оружие и системы вооружения', 571, 1),
  (573, '2011-03-08 15:06:46', '(170101) Испытание и эксплуатация техники (по областям и видам)', 572, 0),
  (574, '2011-03-08 15:06:46', '(170102) Стрелково-пушечное, артиллерийское и ракетное оружие', 572, 0),
  (575, '2011-03-08 15:06:46', '(170103) Средства поражения и боеприпасы', 572, 0),
  (576, '2011-03-08 15:06:46', '(170104) Высокоэнергетические устройства автоматических систем', 572, 0),
  (577, '2011-03-08 15:06:46', '(170105) Взрыватели и системы управления средствами поражения', 572, 0),
  (578, '2011-03-08 15:06:46', '(180000) МОРСКАЯ ТЕХНИКА', 1000, 1),
  (579, '2011-03-08 15:06:46', '(180100) Кораблестроение и океанотехника', 578, 1),
  (580, '2011-03-08 15:06:46', '(180101) Кораблестроение', 579, 0),
  (581, '2011-03-08 15:06:46', '(180102) Судостроение', 579, 0),
  (582, '2011-03-08 15:06:46', '(180103) Судовые энергетические установки', 579, 0),
  (583, '2011-03-08 15:06:46', '(180104) Судовое оборудование', 579, 0),
  (584, '2011-03-08 15:06:46', '(180105) Техническая эксплуатация судов и судового оборудования', 579, 0),
  (585, '2011-03-08 15:06:46', '(180106) Океанотехника', 579, 0),
  (586, '2011-03-08 15:06:46', '(180200) Системы объектов морской инфраструктуры', 578, 1),
  (587, '2011-03-08 15:06:46', '(180201) Системы электроэнергетики и автоматизации судов', 586, 0),
  (588, '2011-03-08 15:06:46', '(180202) Системотехника объектов морской инфраструктуры', 586, 0),
  (589, '2011-03-08 15:06:46', '(180300) Корабельное вооружение', 578, 1),
  (590, '2011-03-08 15:06:46', '(180301) Морская акустика и гидрофизика', 589, 0),
  (591, '2011-03-08 15:06:46', '(180302) Подводная техника', 589, 0),
  (592, '2011-03-08 15:06:46', '(180303) Автоматические системы управления морской техникой', 589, 0),
  (593, '2011-03-08 15:06:46', '(180304) Морские информационные системы и оборудование', 589, 0),
  (594, '2011-03-08 15:06:46', '(180305) Корабельные автоматизированные комплексы и информационно-управляющие системы', 589, 0),
  (595, '2011-03-08 15:06:46', '(180400) Эксплуатация водного транспорта и транспортного оборудования', 578, 1),
  (596, '2011-03-08 15:06:46', '(180401) Гидрография и навигационное обеспечение судоходства', 595, 0),
  (597, '2011-03-08 15:06:46', '(180402) Судовождение', 595, 0),
  (598, '2011-03-08 15:06:46', '(180403) Эксплуатация судовых энергетических установок', 595, 0),
  (599, '2011-03-08 15:06:46', '(180404) Эксплуатация судового электрооборудования и средств автоматики', 595, 0),
  (600, '2011-03-08 15:06:46', '(180405) Монтаж и техническое обслуживание судовых машин и механизмов', 595, 0),
  (601, '2011-03-08 15:06:46', '(180406) Морское судовождение', 595, 0),
  (602, '2011-03-08 15:06:46', '(180407) Судовождение и эксплуатация технического флота', 595, 0),
  (603, '2011-03-08 15:06:46', '(180408) Судовождение на внутренних водных путях и в прибрежном плавании', 595, 0),
  (604, '2011-03-08 15:06:46', '(180409) Эксплуатация внутренних водных путей', 595, 0),
  (605, '2011-03-08 15:06:46', '(190000) ТРАНСПОРТНЫЕ СРЕДСТВА', 1000, 1),
  (606, '2011-03-08 15:06:46', '(190100) Наземные транспортные системы', 605, 0),
  (607, '2011-03-08 15:06:46', '(190200) Транспортные машины и транспортно-технологические комплексы', 605, 1),
  (608, '2011-03-08 15:06:46', '(190201) Автомобилеи тракторостроение', 607, 0),
  (609, '2011-03-08 15:06:46', '(190202) Многоцелевые гусеничные и колесные машины', 607, 0),
  (610, '2011-03-08 15:06:46', '(190203) Транспортные комплексы ракетной техники', 607, 0),
  (611, '2011-03-08 15:06:46', '(190204) Средства аэродромно-технического обеспечения полетов авиации', 607, 0),
  (612, '2011-03-08 15:06:46', '(190205) Подъемно-транспортные, строительные, дорожные машины и оборудование', 607, 0),
  (613, '2011-03-08 15:06:46', '(190206) Сельскохозяйственные машины и оборудование', 607, 0),
  (614, '2011-03-08 15:06:46', '(190207) Машины и оборудование природообустройства и защиты окружающей среды', 607, 0),
  (615, '2011-03-08 15:06:46', '(190300) Подвижной состав железных дорог', 605, 1),
  (616, '2011-03-08 15:06:46', '(190301) Локомотивы', 615, 0),
  (617, '2011-03-08 15:06:46', '(190302) Вагоны', 615, 0),
  (618, '2011-03-08 15:06:46', '(190303) Электрический транспорт железных дорог', 615, 0),
  (619, '2011-03-08 15:06:46', '(190304) Техническая эксплуатация подвижного состава железных дорог', 615, 0),
  (620, '2011-03-08 15:06:46', '(190400) Системы обеспечения движения поездов', 605, 1),
  (621, '2011-03-08 15:06:46', '(190401) Электроснабжение железных дорог', 620, 0),
  (622, '2011-03-08 15:06:46', '(190402) Автоматика, телемеханика и связь на железнодорожном транспорте', 620, 0),
  (623, '2011-03-08 15:06:46', '(190500) Эксплуатация транспортных средств', 605, 1),
  (624, '2011-03-08 15:06:46', '(190501) Эксплуатация транспортного электрооборудования и автоматики (по видам транспорта)', 623, 0),
  (625, '2011-03-08 15:06:46', '(190502) Эксплуатация транспортных энергетических установок (по видам транспорта)', 623, 0),
  (626, '2011-03-08 15:06:46', '(190600) Эксплуатация наземного транспорта и транспортного оборудования', 605, 1),
  (627, '2011-03-08 15:06:46', '(190601) Автомобили и автомобильное хозяйство', 626, 0),
  (628, '2011-03-08 15:06:46', '(190602) Эксплуатация перегрузочного оборудования портов и транспортных терминалов', 626, 0),
  (629, '2011-03-08 15:06:46', '(190603) Сервис транспортных и технологических машин и оборудования (по отраслям)', 626, 0),
  (630, '2011-03-08 15:06:46', '(190604) Техническое обслуживание и ремонт автомобильного транспорта', 626, 0),
  (631, '2011-03-08 15:06:46', '(190605) Техническая эксплуатация подъемно-транспортных, строительных, дорожных машин и оборудования (по отраслям)', 626, 0),
  (632, '2011-03-08 15:06:46', '(190700) Организация перевозок и управление на транспорте', 605, 1),
  (633, '2011-03-08 15:06:46', '(190701) Организация перевозок и управление на транспорте (по видам)', 632, 0),
  (634, '2011-03-08 15:06:46', '(190702) Организация и безопасность движения', 632, 0),
  (635, '2011-03-08 15:06:46', '(200000) ПРИБОРОСТРОЕНИЕ И ОПТОТЕХНИКА', 1000, 1),
  (636, '2011-03-08 15:06:46', '(200100) Приборостроение', 635, 1),
  (637, '2011-03-08 15:06:46', '(200101) Приборостроение', 636, 0),
  (638, '2011-03-08 15:06:46', '(200102) Приборы и методы контроля качества и диагностики', 636, 0),
  (639, '2011-03-08 15:06:46', '(200103) Авиационные приборы и измерительно-вычислительные комплексы', 636, 0),
  (640, '2011-03-08 15:06:46', '(200104) Авиационные приборы и комплексы', 636, 0),
  (641, '2011-03-08 15:06:46', '(200105) Акустические приборы и системы', 636, 0),
  (642, '2011-03-08 15:06:46', '(200106) Информационно-измерительная техника и технологии', 636, 0),
  (643, '2011-03-08 15:06:46', '(200107) Технология приборостроения', 636, 0),
  (644, '2011-03-08 15:06:46', '(200108) Радиоэлектронные приборные устройства', 636, 0),
  (645, '2011-03-08 15:06:46', '(200109) Электромеханические приборные устройства', 636, 0),
  (646, '2011-03-08 15:06:46', '(200200) Оптотехника', 635, 1),
  (647, '2011-03-08 15:06:46', '(200201) Лазерная техника и лазерные технологии', 646, 0),
  (648, '2011-03-08 15:06:46', '(200202) Лазерные системы в ракетной технике и космонавтике', 646, 0),
  (649, '2011-03-08 15:06:46', '(200203) Оптико-электронные приборы и системы', 646, 0),
  (650, '2011-03-08 15:06:46', '(200204) Оптические технологии и материалы', 646, 0),
  (651, '2011-03-08 15:06:46', '(200205) Оптические и оптико-электронные приборы и системы', 646, 0),
  (652, '2011-03-08 15:06:46', '(200206) Приборы и системы лучевой энергетики', 646, 0),
  (653, '2011-03-08 15:06:46', '(200300) Биомедицинская инженерия', 635, 0),
  (654, '2011-03-08 15:06:46', '(200400) Биомедицинская техника', 635, 1),
  (655, '2011-03-08 15:06:46', '(200401) Биотехнические и медицинские аппараты и системы', 654, 0),
  (656, '2011-03-08 15:06:46', '(200402) Инженерное дело в медико-биологической практике', 654, 0),
  (657, '2011-03-08 15:06:46', '(200403) Монтаж, техническое обслуживание и ремонт медицинской техники', 654, 0),
  (658, '2011-03-08 15:06:46', '(200404) Протезно-ортопедическая и реабилитационная техника', 654, 0),
  (659, '2011-03-08 15:06:46', '(200500) Метрология, стандартизация и сертификация', 635, 1),
  (660, '2011-03-08 15:06:46', '(200501) Метрология и метрологическое обеспечение', 659, 0),
  (661, '2011-03-08 15:06:46', '(200502) Метрология', 659, 0),
  (662, '2011-03-08 15:06:46', '(200503) Стандартизация и сертификация', 659, 0),
  (663, '2011-03-08 15:06:46', '(200504) Стандартизация и сертификация продукции (по отраслям)', 659, 0),
  (664, '2011-03-08 15:06:46', '(200600) Фотоника и оптоинформатика', 635, 0),
  (665, '2011-03-08 15:06:46', '(210000) ЭЛЕКТРОННАЯ ТЕХНИКА, РАДИОТЕХНИКА И СВЯЗЬ', 1000, 1),
  (666, '2011-03-08 15:06:46', '(210100) Электроника и микроэлектроника', 665, 1),
  (667, '2011-03-08 15:06:46', '(210101) Физическая электроника', 666, 0),
  (668, '2011-03-08 15:06:46', '(210102) Светотехника и источники света', 666, 0),
  (669, '2011-03-08 15:06:46', '(210103) Квантовая и оптическая электроника', 666, 0),
  (670, '2011-03-08 15:06:46', '(210104) Микроэлектроника и твердотельная электроника', 666, 0),
  (671, '2011-03-08 15:06:46', '(210105) Электронные приборы и устройства', 666, 0),
  (672, '2011-03-08 15:06:46', '(210106) Промышленная электроника', 666, 0),
  (673, '2011-03-08 15:06:46', '(210107) Электронное машиностроение', 666, 0),
  (674, '2011-03-08 15:06:46', '(210108) Микросистемная техника', 666, 0),
  (675, '2011-03-08 15:06:46', '(210200) Проектирование и технология электронных средств', 665, 1),
  (676, '2011-03-08 15:06:46', '(210201) Проектирование и технология радиоэлектронных средств', 675, 0),
  (677, '2011-03-08 15:06:46', '(210202) Проектирование и технология электронно-вычислительных средств', 675, 0),
  (678, '2011-03-08 15:06:46', '(210300) Радиотехника', 665, 1),
  (679, '2011-03-08 15:06:46', '(210301) Радиофизика и электроника', 678, 0),
  (680, '2011-03-08 15:06:46', '(210302) Радиотехника', 678, 0),
  (681, '2011-03-08 15:06:46', '(210303) Бытовая радиоэлектронная аппаратура', 678, 0),
  (682, '2011-03-08 15:06:46', '(210304) Радиоэлектронные системы', 678, 0),
  (683, '2011-03-08 15:06:46', '(210305) Средства радиоэлектронной борьбы', 678, 0),
  (684, '2011-03-08 15:06:46', '(210306) Радиоаппаратостроение', 678, 0),
  (685, '2011-03-08 15:06:46', '(210307) Эксплуатация метеорологических радиотехнических систем', 678, 0),
  (686, '2011-03-08 15:06:46', '(210308) Техническое обслуживание и ремонт радиоэлектронной техники (по отраслям)', 678, 0),
  (687, '2011-03-08 15:06:46', '(210309) Эксплуатация оборудования радиосвязи и электрорадионавигации судов', 678, 0),
  (688, '2011-03-08 15:06:46', '(210310) Радиотехнические комплексы и системы управления космических летательных аппаратов', 678, 0),
  (689, '2011-03-08 15:06:46', '(210311) Техническая эксплуатация транспортного радиоэлектронного оборудования (по видам транспорта)', 678, 0),
  (690, '2011-03-08 15:06:46', '(210312) Аудиовизуальная техника', 678, 0),
  (691, '2011-03-08 15:06:46', '(210313) Аудиовизуальная техника и звукотехническое обеспечение аудиовизуальных программ', 678, 0),
  (692, '2011-03-08 15:06:46', '(210400) Телекоммуникации', 665, 1),
  (693, '2011-03-08 15:06:46', '(210401) Физика и техника оптической связи', 692, 0),
  (694, '2011-03-08 15:06:46', '(210402) Средства связи с подвижными объектами', 692, 0),
  (695, '2011-03-08 15:06:46', '(210403) Защищенные системы связи', 692, 0),
  (696, '2011-03-08 15:06:46', '(210404) Многоканальные телекоммуникационные системы', 692, 0),
  (697, '2011-03-08 15:06:46', '(210405) Радиосвязь, радиовещание и телевидение', 692, 0),
  (698, '2011-03-08 15:06:46', '(210406) Сети связи и системы коммутации', 692, 0),
  (699, '2011-03-08 15:06:46', '(210407) Эксплуатация средств связи', 692, 0),
  (700, '2011-03-08 15:06:46', '(210500) Почтовая связь', 665, 1),
  (701, '2011-03-08 15:06:46', '(210501) Почтовая связь', 700, 0),
  (702, '2011-03-08 15:06:46', '(210600) Нанотехнология', 665, 1),
  (703, '2011-03-08 15:06:46', '(210601) Нанотехнология в электронике', 702, 0),
  (704, '2011-03-08 15:06:46', '(210602) Наноматериалы', 702, 0),
  (705, '2011-03-08 15:06:46', '(220000) АВТОМАТИКА И УПРАВЛЕНИЕ', 1000, 1),
  (706, '2011-03-08 15:06:46', '(220100) Системный анализ и управление', 705, 1),
  (707, '2011-03-08 15:06:46', '(220101) Эргономика', 706, 0),
  (708, '2011-03-08 15:06:46', '(220200) Автоматизация и управление', 705, 1),
  (709, '2011-03-08 15:06:46', '(220201) Управление и информатика в технических системах', 708, 0),
  (710, '2011-03-08 15:06:46', '(220202) Корабельные системы управления', 708, 0),
  (711, '2011-03-08 15:06:46', '(220203) Автономные информационные и управляющие системы', 708, 0),
  (712, '2011-03-08 15:06:46', '(220204) Автоматика и телемеханика на транспорте (по видам транспорта)', 708, 0),
  (713, '2011-03-08 15:06:46', '(220205) Автоматические системы управления', 708, 0),
  (714, '2011-03-08 15:06:46', '(220300) Автоматизированные технологии и производства', 705, 1),
  (715, '2011-03-08 15:06:46', '(220301) Автоматизация технологических процессов и производств (по отраслям)', 714, 0),
  (716, '2011-03-08 15:06:46', '(220302) Автоматизация технологических процессов на тепловых электрических станциях', 714, 0),
  (717, '2011-03-08 15:06:46', '(220303) Средства механизации и автоматизации (по отраслям)', 714, 0),
  (718, '2011-03-08 15:06:46', '(220304) Системы и средства диспетчерского управления в электроэнергетике', 714, 0),
  (719, '2011-03-08 15:06:46', '(220305) Автоматизированное управление жизненным циклом продукции', 714, 0),
  (720, '2011-03-08 15:06:46', '(220306) Компьютерные системы управления качеством для автоматизированных производств', 714, 0),
  (721, '2011-03-08 15:06:46', '(220400) Мехатроника и робототехника', 705, 1),
  (722, '2011-03-08 15:06:46', '(220401) Мехатроника', 721, 0),
  (723, '2011-03-08 15:06:46', '(220402) Роботы и робототехнические системы', 721, 0),
  (724, '2011-03-08 15:06:46', '(220500) Управление качеством', 705, 1),
  (725, '2011-03-08 15:06:46', '(220501) Управление качеством', 724, 0),
  (726, '2011-03-08 15:06:46', '(220600) Инноватика', 705, 1),
  (727, '2011-03-08 15:06:46', '(220601) Управление инновациями', 726, 0),
  (728, '2011-03-08 15:06:46', '(220700) Организация и управление наукоемкими производствами', 705, 1),
  (729, '2011-03-08 15:06:46', '(220701) Менеджмент высоких технологий', 728, 0),
  (730, '2011-03-08 15:06:46', '(230000) ИНФОРМАТИКА И ВЫЧИСЛИТЕЛЬНАЯ ТЕХНИКА', 1000, 1),
  (731, '2011-03-08 15:06:46', '(230100) Информатика и вычислительная техника', 730, 1),
  (732, '2011-03-08 15:06:46', '(230101) Вычислительные машины, комплексы, системы и сети', 731, 0),
  (733, '2011-03-08 15:06:46', '(230102) Автоматизированные системы обработки информации и управления', 731, 0),
  (734, '2011-03-08 15:06:46', '(230103) Автоматизированные системы обработки информации и управления (по отраслям)', 731, 0),
  (735, '2011-03-08 15:06:46', '(230104) Системы автоматизированного проектирования', 731, 0),
  (736, '2011-03-08 15:06:46', '(230105) Программное обеспечение вычислительной техники и автоматизированных систем', 731, 0),
  (737, '2011-03-08 15:06:46', '(230106) Техническое обслуживание средств вычислительной техники и компьютерных сетей', 731, 0),
  (738, '2011-03-08 15:06:46', '(230200) Информационные системы', 730, 1),
  (739, '2011-03-08 15:06:46', '(230201) Информационные системы и технологии', 738, 0),
  (740, '2011-03-08 15:06:46', '(230202) Информационные технологии в образовании', 738, 0),
  (741, '2011-03-08 15:06:46', '(230203) Информационные технологии в дизайне', 738, 0),
  (742, '2011-03-08 15:06:46', '(230204) Информационные технологии в медиаиндустрии', 738, 0),
  (743, '2011-03-08 15:06:46', '(230300) Организационно-технические системы', 730, 1),
  (744, '2011-03-08 15:06:46', '(230301) Моделирование и исследование операций в организационно-технических системах', 743, 0),
  (745, '2011-03-08 15:06:46', '(230400) Прикладная математика', 730, 1),
  (746, '2011-03-08 15:06:46', '(230401) Прикладная математика', 745, 0),
  (747, '2011-03-08 15:06:46', '(240000) ХИМИЧЕСКАЯ И БИОТЕХНОЛОГИИ', 1000, 1),
  (748, '2011-03-08 15:06:46', '(240100) Химическая технология и биотехнология', 747, 0),
  (749, '2011-03-08 15:06:46', '(240200) Химическая технология полимерных волокон и текстильных материалов', 747, 1),
  (750, '2011-03-08 15:06:46', '(240201) Технология и оборудование производства химических волокон и композиционных материалов на их основе', 749, 0),
  (751, '2011-03-08 15:06:46', '(240202) Химическая технология и оборудование отделочного производства', 749, 0),
  (752, '2011-03-08 15:06:46', '(240203) Химическая технология отделочного производства', 749, 0),
  (753, '2011-03-08 15:06:46', '(240300) Химическая технология неорганических веществ и материалов', 747, 1),
  (754, '2011-03-08 15:06:46', '(240301) Химическая технология неорганических веществ', 753, 0),
  (755, '2011-03-08 15:06:46', '(240302) Технология электрохимических производств', 753, 0),
  (756, '2011-03-08 15:06:46', '(240303) Электрохимическое производство', 753, 0),
  (757, '2011-03-08 15:06:46', '(240304) Химическая технология тугоплавких неметаллических и силикатных материалов', 753, 0),
  (758, '2011-03-08 15:06:46', '(240305) Производство тугоплавких неметаллических и силикатных материалов и изделий', 753, 0),
  (759, '2011-03-08 15:06:46', '(240306) Химическая технология монокристаллов, материалов и изделий электронной техники', 753, 0),
  (760, '2011-03-08 15:06:46', '(240307) Технология средств химической защиты', 753, 0),
  (761, '2011-03-08 15:06:46', '(240308) Аналитический контроль качества химических соединений', 753, 0),
  (762, '2011-03-08 15:06:46', '(240400) Химическая технология органических веществ и топлива', 747, 1),
  (763, '2011-03-08 15:06:46', '(240401) Химическая технология органических веществ', 762, 0),
  (764, '2011-03-08 15:06:46', '(240402) Химическая технология синтетических биологических активных веществ', 762, 0),
  (765, '2011-03-08 15:06:46', '(240403) Химическая технология природных энергоносителей и углеродных материалов', 762, 0),
  (766, '2011-03-08 15:06:46', '(240404) Переработка нефти и газа', 762, 0),
  (767, '2011-03-08 15:06:46', '(240405) Коксохимическое производство', 762, 0),
  (768, '2011-03-08 15:06:46', '(240406) Технология химической переработки древесины', 762, 0),
  (769, '2011-03-08 15:06:46', '(240500) Химическая технология высокомолекулярных соединений и полимерных материалов', 747, 1),
  (770, '2011-03-08 15:06:46', '(240501) Химическая технология высокомолекулярных соединений', 769, 0),
  (771, '2011-03-08 15:06:46', '(240502) Технология переработки пластических масс и эластомеров', 769, 0),
  (772, '2011-03-08 15:06:46', '(240503) Производство изделий и покрытий из полимерных материалов', 769, 0),
  (773, '2011-03-08 15:06:46', '(240504) Технология кинофотоматериалов и магнитных носителей', 769, 0),
  (774, '2011-03-08 15:06:46', '(240505) Технология высокомолекулярных и высокоэффективных соединений и устройств', 769, 0),
  (775, '2011-03-08 15:06:46', '(240600) Химическая технология материалов современной энергетики', 747, 1),
  (776, '2011-03-08 15:06:46', '(240601) Химическая технология материалов современной энергетики', 775, 0),
  (777, '2011-03-08 15:06:46', '(240602) Технология разделения изотопов', 775, 0),
  (778, '2011-03-08 15:06:46', '(240603) Химическая технология редких элементов и материалов на их основе', 775, 0),
  (779, '2011-03-08 15:06:46', '(240700) Химическая технология энергонасыщенных материалов и изделий', 747, 1),
  (780, '2011-03-08 15:06:46', '(240701) Химическая технология органических соединений азота', 779, 0),
  (781, '2011-03-08 15:06:46', '(240702) Химическая технология полимерных композиций, порохов и твердых ракетных топлив', 779, 0),
  (782, '2011-03-08 15:06:46', '(240703) Технология энергонасыщенных материалов и изделий', 779, 0),
  (783, '2011-03-08 15:06:46', '(240704) Технология пиротехнических средств', 779, 0),
  (784, '2011-03-08 15:06:46', '(240705) Технология пиротехнических составов и изделий', 779, 0),
  (785, '2011-03-08 15:06:46', '(240706) Автоматизированное производство химических предприятий', 779, 0),
  (786, '2011-03-08 15:06:46', '(240800) Энергои ресурсосберегающие процессы в химической технологии, нефтехимии и биотехнологии', 747, 1),
  (787, '2011-03-08 15:06:46', '(240801) Машины и аппараты химических производств', 786, 0),
  (788, '2011-03-08 15:06:46', '(240802) Основные процессы химических производств и химическая кибернетика', 786, 0),
  (789, '2011-03-08 15:06:46', '(240803) Рациональное использование материальных и энергетических ресурсов', 786, 0),
  (790, '2011-03-08 15:06:46', '(240900) Биотехнология', 747, 1),
  (791, '2011-03-08 15:06:46', '(240901) Биотехнология', 790, 0),
  (792, '2011-03-08 15:06:46', '(240902) Пищевая биотехнология', 790, 0),
  (793, '2011-03-08 15:06:46', '(240903) Биохимическое производство', 790, 0),
  (794, '2011-03-08 15:06:46', '(250000) ВОСПРОИЗВОДСТВО И ПЕРЕРАБОТКА ЛЕСНЫХ РЕСУРСОВ', 1000, 1),
  (795, '2011-03-08 15:06:46', '(250100) Лесное дело', 794, 0),
  (796, '2011-03-08 15:06:46', '(250200) Лесное хозяйство и ландшафтное строительство', 794, 1),
  (797, '2011-03-08 15:06:46', '(250201) Лесное хозяйство', 796, 0),
  (798, '2011-03-08 15:06:46', '(250202) Лесное и лесопарковое хозяйство', 796, 0),
  (799, '2011-03-08 15:06:46', '(250203) Садово-парковое и ландшафтное строительство', 796, 0),
  (800, '2011-03-08 15:06:46', '(250300) Технология и оборудование лесозаготовительных и деревообрабатывающих производств', 794, 0),
  (801, '2011-03-08 15:06:46', '(250400) Технология лесозаготовительных и деревоперерабатывающих производств', 794, 1),
  (802, '2011-03-08 15:06:46', '(250401) Лесоинженерное дело', 801, 0),
  (803, '2011-03-08 15:06:46', '(250402) Технология лесозаготовок', 801, 0),
  (804, '2011-03-08 15:06:46', '(250403) Технология деревообработки', 801, 0),
  (805, '2011-03-08 15:06:46', '(250404) Технология переработки древесины', 801, 0),
  (806, '2011-03-08 15:06:46', '(260000) ТЕХНОЛОГИЯ ПРОДОВОЛЬСТВЕННЫХ ПРОДУКТОВ И ПОТРЕБИТЕЛЬСКИХ ТОВАРОВ', 1000, 1),
  (807, '2011-03-08 15:06:46', '(260100) Технология продуктов питания', 806, 0),
  (808, '2011-03-08 15:06:46', '(260200) Производство продуктов питания из растительного сырья', 806, 1),
  (809, '2011-03-08 15:06:46', '(260201) Технология хранения и переработки зерна', 808, 0),
  (810, '2011-03-08 15:06:46', '(260202) Технология хлеба, кондитерских и макаронных изделий', 808, 0),
  (811, '2011-03-08 15:06:46', '(260203) Технология сахаристых продуктов', 808, 0),
  (812, '2011-03-08 15:06:46', '(260204) Технология бродильных производств и виноделие', 808, 0),
  (813, '2011-03-08 15:06:46', '(260300) Технология сырья и продуктов животного происхождения', 806, 1),
  (814, '2011-03-08 15:06:46', '(260301) Технология мяса и мясных продуктов', 813, 0),
  (815, '2011-03-08 15:06:46', '(260302) Технология рыбы и рыбных продуктов', 813, 0),
  (816, '2011-03-08 15:06:46', '(260303) Технология молока и молочных продуктов', 813, 0),
  (817, '2011-03-08 15:06:46', '(260400) Технология жиров', 806, 1),
  (818, '2011-03-08 15:06:46', '(260401) Технология жиров, эфирных масел и парфюмерно-косметических продуктов', 817, 0),
  (819, '2011-03-08 15:06:46', '(260402) Технология жиров и жирозаменителей', 817, 0),
  (820, '2011-03-08 15:06:46', '(260500) Технология продовольственных продуктов специального назначения и общественного питания', 806, 1),
  (821, '2011-03-08 15:06:46', '(260501) Технология продуктов общественного питания', 820, 0),
  (822, '2011-03-08 15:06:46', '(260502) Технология продукции общественного питания', 820, 0),
  (823, '2011-03-08 15:06:46', '(260503) Технология субтропических и пищевкусовых продуктов', 820, 0),
  (824, '2011-03-08 15:06:46', '(260504) Технология консервов и пищеконцентратов', 820, 0),
  (825, '2011-03-08 15:06:46', '(260505) Технология детского и функционального питания', 820, 0),
  (826, '2011-03-08 15:06:46', '(260600) Пищевая инженерия', 806, 1),
  (827, '2011-03-08 15:06:46', '(260601) Машины и аппараты пищевых производств', 826, 0),
  (828, '2011-03-08 15:06:46', '(260602) Пищевая инженерия малых предприятий', 826, 0),
  (829, '2011-03-08 15:06:46', '(260700) Технология и проектирование текстильных изделий', 806, 1),
  (830, '2011-03-08 15:06:46', '(260701) Технология и оборудование производства натуральных волокон', 829, 0),
  (831, '2011-03-08 15:06:46', '(260702) Первичная обработка волокнистых материалов', 829, 0),
  (832, '2011-03-08 15:06:46', '(260703) Проектирование текстильных изделий', 829, 0),
  (833, '2011-03-08 15:06:46', '(260704) Технология текстильных изделий', 829, 0),
  (834, '2011-03-08 15:06:46', '(260800) Технология, конструирование изделий и материалы легкой промышленности', 806, 0),
  (835, '2011-03-08 15:06:46', '(260900) Технология и конструирование изделий легкой промышленности', 806, 1),
  (836, '2011-03-08 15:06:46', '(260901) Технология швейных изделий', 835, 0),
  (837, '2011-03-08 15:06:46', '(260902) Конструирование швейных изделий', 835, 0),
  (838, '2011-03-08 15:06:46', '(260903) Моделирование и конструирование швейных изделий', 835, 0),
  (839, '2011-03-08 15:06:46', '(260904) Технология кожи и меха', 835, 0),
  (840, '2011-03-08 15:06:46', '(260905) Технология изделий из кожи', 835, 0),
  (841, '2011-03-08 15:06:46', '(260906) Конструирование изделий из кожи', 835, 0),
  (842, '2011-03-08 15:06:46', '(260907) Моделирование и конструирование изделий из кожи', 835, 0),
  (843, '2011-03-08 15:06:46', '(260908) Производство меховых и овчинно-шубных изделий', 835, 0),
  (844, '2011-03-08 15:06:46', '(260909) Моделирование и конструирование изделий из меха', 835, 0),
  (845, '2011-03-08 15:06:46', '(260910) Производство изделий из бумаги и картона', 835, 0),
  (846, '2011-03-08 15:06:46', '(261000) Технология художественной обработки материалов', 806, 1),
  (847, '2011-03-08 15:06:46', '(261001) Технология художественной обработки материалов', 846, 0),
  (848, '2011-03-08 15:06:46', '(261002) Технология обработки драгоценных камней и металлов', 846, 0),
  (849, '2011-03-08 15:06:46', '(261100) Полиграфия', 806, 0),
  (850, '2011-03-08 15:06:46', '(261200) Технология полиграфического и упаковочного производства', 806, 1),
  (851, '2011-03-08 15:06:46', '(261201) Технология и дизайн упаковочного производства', 850, 0),
  (852, '2011-03-08 15:06:46', '(261202) Технология полиграфического производства', 850, 0),
  (853, '2011-03-08 15:06:46', '(261203) Полиграфическое производство', 850, 0),
  (854, '2011-03-08 15:06:46', '(261300) Экспертиза качества потребительских товаров', 806, 1),
  (855, '2011-03-08 15:06:46', '(261301) Экспертиза качества потребительских товаров', 854, 0),
  (856, '2011-03-08 15:06:46', '(270000) АРХИТЕКТУРА И СТРОИТЕЛЬСТВО', 1000, 1),
  (857, '2011-03-08 15:06:46', '(270100) Строительство', 856, 1),
  (858, '2011-03-08 15:06:46', '(270101) Механическое оборудование и технологические комплексы предприятий строительных материалов, изделий и конструкций', 857, 0),
  (859, '2011-03-08 15:06:46', '(270102) Промышленное и гражданское строительство', 857, 0),
  (860, '2011-03-08 15:06:46', '(270103) Строительство и эксплуатация зданий и сооружений', 857, 0),
  (861, '2011-03-08 15:06:46', '(270104) Гидротехническое строительство', 857, 0),
  (862, '2011-03-08 15:06:46', '(270105) Городское строительство и хозяйство', 857, 0),
  (863, '2011-03-08 15:06:46', '(270106) Производство строительных материалов, изделий и конструкций', 857, 0),
  (864, '2011-03-08 15:06:46', '(270107) Производство неметаллических строительных изделий и конструкций', 857, 0),
  (865, '2011-03-08 15:06:46', '(270108) Изготовление металлических конструкций', 857, 0),
  (866, '2011-03-08 15:06:46', '(270109) Теплогазоснабжение и вентиляция', 857, 0),
  (867, '2011-03-08 15:06:46', '(270110) Монтаж и эксплуатация внутренних сантехнических устройств и вентиляции', 857, 0),
  (868, '2011-03-08 15:06:46', '(270111) Монтаж и эксплуатация оборудования и систем газоснабжения', 857, 0),
  (869, '2011-03-08 15:06:46', '(270112) Водоснабжение и водоотведение', 857, 0),
  (870, '2011-03-08 15:06:46', '(270113) Механизация и автоматизация строительства', 857, 0),
  (871, '2011-03-08 15:06:46', '(270114) Проектирование зданий', 857, 0),
  (872, '2011-03-08 15:06:46', '(270115) Экспертиза и управление недвижимостью', 857, 0),
  (873, '2011-03-08 15:06:46', '(270116) Монтаж, наладка и эксплуатация электрооборудования промышленных и гражданских зданий', 857, 0),
  (874, '2011-03-08 15:06:46', '(270200) Транспортное строительство', 856, 1),
  (875, '2011-03-08 15:06:46', '(270201) Мосты и транспортные тоннели', 874, 0),
  (876, '2011-03-08 15:06:46', '(270202) Строительство мостов', 874, 0),
  (877, '2011-03-08 15:06:46', '(270203) Строительство тоннелей и метрополитенов', 874, 0),
  (878, '2011-03-08 15:06:46', '(270204) Строительство железных дорог, путь и путевое хозяйство', 874, 0),
  (879, '2011-03-08 15:06:46', '(270205) Автомобильные дороги и аэродромы', 874, 0),
  (880, '2011-03-08 15:06:46', '(270206) Строительство и эксплуатация автомобильных дорог и аэродромов', 874, 0),
  (881, '2011-03-08 15:06:46', '(270207) Строительство и эксплуатация городских путей сообщения', 874, 0),
  (882, '2011-03-08 15:06:46', '(270300) Архитектура', 856, 1),
  (883, '2011-03-08 15:06:46', '(270301) Архитектура', 882, 0),
  (884, '2011-03-08 15:06:46', '(270302) Дизайн архитектурной среды', 882, 0),
  (885, '2011-03-08 15:06:46', '(270303) Реставрация и реконструкция архитектурного наследия', 882, 0),
  (886, '2011-03-08 15:06:46', '(280000) БЕЗОПАСНОСТЬ ЖИЗНЕДЕЯТЕЛЬНОСТИ, ПРИРОДООБУСТРОЙСТВО И ЗАЩИТА ОКРУЖАЮЩЕЙ СРЕДЫ', 1000, 1),
  (887, '2011-03-08 15:06:46', '(280100) Безопасность жизнедеятельности', 886, 1),
  (888, '2011-03-08 15:06:46', '(280101) Безопасность жизнедеятельности в техносфере', 887, 0),
  (889, '2011-03-08 15:06:46', '(280102) Безопасность технологических процессов и производств', 887, 0),
  (890, '2011-03-08 15:06:46', '(280103) Защита в чрезвычайных ситуациях', 887, 0),
  (891, '2011-03-08 15:06:46', '(280104) Пожарная безопасность', 887, 0),
  (892, '2011-03-08 15:06:46', '(280200) Защита окружающей среды', 886, 1),
  (893, '2011-03-08 15:06:46', '(280201) Охрана окружающей среды и рациональное использование природных ресурсов', 892, 0),
  (894, '2011-03-08 15:06:46', '(280202) Инженерная защита окружающей среды', 892, 0),
  (895, '2011-03-08 15:06:46', '(280300) Водные ресурсы и водопользование', 886, 1),
  (896, '2011-03-08 15:06:46', '(280301) Инженерные системы сельскохозяйственного водоснабжения, обводнения и водоотведения', 895, 0),
  (897, '2011-03-08 15:06:46', '(280302) Комплексное использование и охрана водных ресурсов', 895, 0),
  (898, '2011-03-08 15:06:46', '(280400) Природообустройство', 886, 1),
  (899, '2011-03-08 15:06:46', '(280401) Мелиорация, рекультивация и охрана земель', 898, 0),
  (900, '2011-03-08 15:06:46', '(280402) Природоохранное обустройство территорий', 898, 0),
  (1000, '2011-03-08 15:06:46', 'СПЕЦИАЛЬНОСТИ', 0, 1);

-- 
-- Вывод данных для таблицы tomas_query
--
INSERT INTO tomas_query VALUES 
  (1, 'Иногда я предоставляю другим возможность взять на себя ответственность за решение спорного вопроса.', 4, 'Я стараюсь обратить внимание на то, в чем мы оба согласны, а не обсуждать то, в чем мы расходимся.', 5, 4, NULL),
  (2, 'Я стараюсь найти компромиссное решение.', 3, 'Я пытаюсь уладить дела с учетом всех интересов другого и моих собственных.', 2, 2, NULL),
  (3, 'Обычно я настойчиво стремлюсь добиться своего.', 1, 'Я стараюсь успокоить другого и таким образом сохранить наши отношения.', 5, 1, NULL),
  (4, 'Я стараюсь найти компромиссное решение.', 3, 'Иногда я жертвую своими собственными интересами ради интересов другого человека.', 5, 5, NULL),
  (5, 'Улаживая спорную ситуацию, я все время стараюсь найти поддержку у другого.', 2, 'Я стараюсь сделать все, чтобы избежать бесполезной напряженности.', 4, 2, NULL),
  (6, 'Я пытаюсь избежать неприятностей для себя.', 4, 'Я стараюсь добиться своего.', 1, 1, NULL),
  (7, 'Я стараюсь отложить решение спорного вопроса с тем, чтобы со временем решить его окончательно.', 4, 'Я пытаюсь прийти к компромиссу.', 3, 4, NULL),
  (8, 'Обычно, я настойчиво стремлюсь добиться своего.', 1, 'Я первым делом стараюсь ясно определить то, в чем состоят интересы сторон и спорные вопросы', 2, 2, NULL),
  (9, 'Думаю, что не всегда стоит волноваться из-за каких-то возникающих разногласий.', 4, 'Я предпринимаю усилия, чтобы добиться своего.', 1, 4, NULL),
  (10, 'Я твердо стремлюсь достичь своего.', 1, 'Я пытаюсь найти компромиссное решение.', 3, 3, NULL),
  (11, 'Первым делом я стараюсь определить, в чем состоят интересы сторон и спорные вопросы.', 2, 'Я стараюсь успокоить другого и таким образом сохранить наши отношения.', 5, 2, NULL),
  (12, 'Зачастую я избегаю занимать позицию, которая может вызвать споры.', 4, 'Я даю возможность другому в чем-то остаться при своем мнении, если он также идет навстречу мне.', 3, 3, NULL),
  (13, 'Я предлагаю среднюю позицию.', 3, 'Я настаиваю, чтобы было сделано по-моему.', 1, 3, NULL),
  (14, 'Я сообщаю другому свою точку зрения и спрашиваю о его взглядах.', 2, 'Я пытаюсь показать другому логику и преимущества моих взглядов.', 1, 1, NULL),
  (15, 'Я стараюсь успокоить другого и таким образом сохранить наши отношения.', 5, 'Я стараюсь сделать все необходимое, чтобы избежать напряженности.', 4, 5, NULL),
  (16, 'Я стараюсь не задеть чувств другого.', 5, 'Я пытаюсь убедить другого в преимуществах моей позиции.', 1, 1, NULL),
  (17, 'Обычно, я настойчиво стремлюсь добиться своего', 1, 'Я стараюсь сделать все, чтобы избежать бесполезной напряженности', 4, 1, NULL),
  (18, 'Если это сделает другого счастливым, я дам ему возможность настоять на своем.', 5, 'Я даю возможность другому в чем-то остаться при своем мнении, если он также идет мне навстречу.', 3, 3, NULL),
  (19, 'Первым делом я стараюсь ясно определить, в чем состоят все затронутые и спорные вопросы.', 2, 'Я стараюсь отложить решение спорного вопроса с тем, чтобы со временем решить его окончательно.', 4, 2, NULL),
  (20, 'Я пытаюсь немедленно преодолеть наши разногласия.', 2, 'Я стараюсь найти наилучшее сочетания выгод и потерь для нас обоих.', 3, 3, NULL),
  (21, 'Ведя переговоры, я стараюсь быть внимательным к желаниям другого.', 5, 'Я всегда склоняюсь к прямому обсуждению проблемы.', 2, 5, NULL),
  (22, 'Я пытаюсь найти позицию, которая находится посередине между моей позицией и точкой зрения другого человека.', 3, 'Я отстаиваю свои желания', 1, 1, NULL),
  (23, 'Как правило, я озабочен тем, чтобы удовлетворить желания каждого из нас.', 2, 'Иногда я предоставляю другим возможность взять на себя ответственность за решение спорного вопроса.', 4, 2, NULL),
  (24, 'Если позиция другого кажется ему очень важной, я постараюсь пойти навстречу его желаниям.', 5, 'Я стараюсь убедить другого прийти к компромиссу.', 3, 3, NULL),
  (25, 'Я пытаюсь показать другому логику и преимущества моих взглядов.', 1, 'Ведя переговоры, я стараюсь быть внимательным к желаниям другого.', 5, 1, NULL),
  (26, 'Я предлагаю среднюю позицию.', 3, 'Я почти всегда озабочен тем, чтобы удовлетворить желания каждого из нас.', 2, 2, NULL),
  (27, 'Зачастую я избегаю занимать позицию, которая может вызвать споры.', 4, 'Если это сделает другого счастливым, я дам ему возможность настоять на своем.', 5, 4, NULL),
  (28, 'Обычно, я настойчиво стремлюсь достичь своего.', 1, 'Улаживая ситуацию, я обычно стараюсь найти поддержку у другого.', 2, 2, NULL),
  (29, ' Я предлагаю среднюю позицию.', 3, 'Думаю, что не всегда стоит волноваться из-за каких-то возникающих разногласий.', 4, 3, NULL),
  (30, 'Я стараюсь не задевать чувств другого.', 5, 'Я всегда занимаю такую позицию в спорном вопросе, чтобы совместно с другим заинтересованным человеком мы могли добиться успеха.', 2, 2, NULL);

-- 
-- Вывод данных для таблицы user
--
INSERT INTO user VALUES 
  (1, '2011-01-30 10:44:45', 'Администратор', 'Имя', 'Отчество', 'доступ', 2, 0, 0),
  (2, '2011-01-30 10:08:13', 'Консультант', 'Имя', 'Отчество', 'доступ', 1, 0, 0),
  (3, '2010-12-21 22:07:49', 'Соискатель', 'Имя', 'Отчество', 'доступ', 0, 0, 0);

-- 
-- Вывод данных для таблицы applicant
--
INSERT INTO applicant VALUES 
  (1, '2011-03-07 18:00:34', 'Семёнова', 'Ирина', 'Владимировна', '1974-04-29 00:00:00', 2, '2002-02-20 00:00:00', 1, '2010-12-28 00:00:00', x'FFD8FFE000104A46494600010100000100010000FFDB00840009060614121115141314161515141818171818181715181A181718171817151A1717171D261E171C241C17151F2F202327292C2C2C171E3135302A35262B2C2901090A0A0E0C0E1A0F0F1A291C1F1D292C2C2C2C292929292929292C29292C292C292929292929292C292C2C292C2C2C292C292C29292C2C2C2C292C292C2C2C2CFFC0001108010800BF03012200021101031101FFC4001C0000020203010100000000000000000000040503060002070108FFC400411000010302020707030204040407000000010002110321043105061241516171228191A1B1C1F01332D142E1075272F114628292232433B215161725A2B3C2FFC400190100030101010000000000000000000000010203040005FFC4002711000202020201040300030100000000000001021103211231410413225132617142529114FFDA000C03010002110311003F00B3B978BD3BD642995302C0BD85E85C718B3BD605EAE38C0564A1719A4E9D212F70E99A498BD7368076693F917081D6334AE490EA0D965958A815B596A3CF69EE13B8003CC031DEB4A78C6BBEE713D5D1FDD4DE5FD15582FB65EABE94A6CFB9E3C67D108759296EDB3D1A7DE127D1F4D92362A3C720E907CC94DA868CDB9FD76CE04F980495279E5E0A2C115D9E55D666813B150F8799BA8D9AD8D3FA1DFEE0B4C668E78B9045FEED9701F8F35B61304D708965F333371C8DC1E63DE10F7661F6A037C0E27EA0060807BCF8053991BFBD24AD51D4B29802016F6AC3883EA32E485A3ACE41ECBA470CE0EFD93EC8ACB215E18F82CB7EE5ECA5387D6BA7203EC0C418F6E1F2C9D536B5EDDA610472397C17568E44C8CB1B89195E4FC95E910BC552464AC9590B100985CBD69BAC858D0B8E222BD85842F765101AC2D9AB004934BEB453A208676DF95B20799F64ADA5D8D18B97436C4E29B4DB2E7068E7BFA2ACE90D682E31485B89CC7CE85573138D7D6792F25C784C00BC75A458E7612246FB0EECD46536FA34C31A5D8C1D5F6812E20F13311CCB8FECA1A75E96F3B4783439DEF096B039E62E67219007BD34C3E8E233735A778198CB829355D96BFA2518563ECD6BB883C788CC04355D155263E8E7BF79F037EE4E2855A2D89739C775C67D3209AE1F194E2052278C9919F0688F54B7417129EED095809D9CB3B388F2748F05BD1A959846CB80DF01D5803DEF042B49D60A0C3DA686F50E201E765B0D66C29C9B4DC731199EE8E48DFE85AFA20D1FAC9896097523B31983238588F974C0691A757EEA6F1949D90ECB8C19F0509D67C2C7FD302F78B5F9913E893E331D4890EA553E999B6D34474DB69178DCE1BEC95AB3931962B044C9A2E0E3BDA0BB6BBC1ED791555D2182713B4C8DB6E6200718BFE9FBBD46F117598FD35569BFFE2343DA0FDCC905BDDBADBC79E68B188FACC153EF07278FBDA465241BA78A71EC0DA90B0E91FA8D3B43B42E47AF7E454BA075B2A616ADCCD33980601079659EEE281D214483B63EE1BC58380F4398296FDD71D0F9C4F8157514D107268ED8CA81E1AE61B3BC37E5E192DA55275074D18FA24C5DA5B7B89073E176EF576AD8A11B519E7C3C3766108C9AD304A2BB47A5AB163321F37AF4E6AC468CD95EB42C0BD19A2023705AD4A81AD2E240004926D0A53BE725CEB5CF5A4543F498E0290264FF00311EA0256E878C6C235835D76C965124372DADE4FB0DCAAC317B5C632DA19F76EFEC80FF001137E394F0E417B4F105F02600F7E8A74DED964D2D21952A9195B9E67A939153D227324BAFBF2FD9066D99E5CC9DDFDD4FB36971ECF80EEDE7CBA29B4553A087E2DC6DB57E026FE12BD7D17012FA818DF9C528AFA6436D4C75B71F193D50AE156B19B8FF0031DDD06EF54CA00793C2D8E5BA528D375A0F3A937E8DDE134C369FA6EB7D5609DC29363966C33E2A9F55B4E8EE0E79E327C85FC4A5F5F4AB8C886C70D93F94FED2645E568BCE96692D982E1C40204F369968EE554AF89D875EEDDE0E627E6EB25B87D2D5699963C8E2DDDE06CA4AF8EFAB12365DCB23F8E89E30711259148654B173DAA6F8237126E3F9798F9D0FC36936BC47DA72324411CE6D1BB874CD559AD20C85387937F83AF11CD17115499636E2E1D03764C2448CA7609BF3D836CE14B85D2028D4DA6110FBECDC027970F6E8AB8E7122F96EEECAFC96C2B174876FCF9F07723C78A5E23722E58A2C23EAB7FE9BFEE06DB0F1C7F94E6D8E5C84575F5765E41E307BBFB0F143E1F14E682D996BE011CC5E7AC78A8EA3E4BB68E5BFA5BF284634194AD161D0F88D8C417491D90ECEFF00713E92AE788D32461039D9B8DB2FD246E39DADDCB9F31E410F1BC0FDD1FA474DFD5764035A365AD19345E48F9B94E50B765232D17CC2E9B7C80EB9CC86E6DDAED01CCC494DE8E3844B8113DF12A8FA25825B125C44C0E302E78AB461AA914E5D07641CFAC4B8E40657E5014FDCE2E8778F92D0F1856E02AC61B580977DF6376F6441EECC0CFC558B0F88DACC67C15E13E4679C3894ED7CD69FA60D161ED1FBA3819B2E6D3B44B9C6C2D3EC38FECB7C557756A8F7BCCC9937CEF97B21AA3C9B0C858260F48F5F5768DB21C3393EF9A6383A5B0DDC22E4EE0A0C1E180B9197AFF65BE2313BCD80BFCE695EF4878EB6C906221D6697BCE4387BFCBA84B6A55313B47791F68E40FE3C51582D1C5C36AA4B5A6FB1FA9F3BDE7F483C37A615AAB69B25C1AD0326C40EAEE3E7E374BD7436DAD8BE968F6521B4F209FCF0F9DE82C4696930C197CB7EC86C4E2DF887C098E1EE530A1A0C81DB81BEE40F13B82A255F9126EF511356A8F266767DFBB351B30EF76EDAEA0FAAB1D0D0CD71BE5B8346CB7ACE6535C368D6B7A753DC39AE79123A38DBECA952D0751DFA0F723305AB0F76E3DE3D5749D0DA183AF000E8382B361742B0EEF25179D9A23E9D76CE5D4B506A11923A97F0DAA5ACBABD3C1B46414C30FD54FDC91458E08E4A7F878F1983D408F28841E27529C04804F715DA7E8285D851C177B920F087D1C25FA0C89045FE420748E897B775B3F182BB9693D014EA6E83C6127ABAB2DD9889F964EB357623C09F471EC3633B30EDC0475F93E2A4A1DA70920099E903C95935A3524B769F4B75CB7F10A99F560C1DDBBA2BC64A6B4659C65074CB7E8DD2A0581B6FCA481C7E4754C713AC25CD8DDDF16CA1A7EE22D1B82A761B17222D6DD36EF399F24C69D59B97C9E51E03729CB1ABB2B1C8EA828E91DA78D92FE163727BFBB82E83AB18FF00AB4A2F2D88990608DFD0CF82E72DC509FB20EEB083967DAB7701B95BB55EAB43CB439B97122E2771CB343A03DA39C39BB86E27BCF1EE5986A7397CCE254B519EB1E727F1DCA7A54761B95FD27DD51B0256CD498B7C278FCDCA5C3616E09ED3A640CEF9831F9F25250C240DA71001F13C9A3DD7B89D24D0365961FF00C9DD4EFE997549FC1FAEC27138A6D26DEEE399CFB8713CFD922AE2A620CC43278D8FE54A1A0BA5E7B86406E9E039EF4E29627E98EC340718DC06796E2E3D023F88AFE5FC34D19A11C40007417B75205D3CA3A31ACCDA5C775AD336FB85FCCA0E956C439B2FA840E46046FB0CC0E99F4256D87C75473B65951DB3604B8DBCB2537C98EA9051C20E44F0111F81DE53CD05A283CCBB219906DD2C82D1B8212241793C8DF9804F99570D1F43298B64D045BAC6F5393F05920AC2E10465038262CA2BDA0D53B5A9520391AB58A56D35E00A56AA242364669A8DF4D14E513C2E680981B98A0AD4D16F6A85EA7245A2C518AC1820885CCB5CF54209A8CB6F7723C575AAC128D25850E69B6E5D0938B1A71538D3385B29B98E21D98B7308AC3E38B5C2D6DF73F94CF587476C5570DE2E39B4FB8B251545EDFB2DB768F3DC78BA2CD84632A46D02081982332401BA46453DD0F8622A0DA02A06CC1BED650248BC676CD54B413E5E06F11038DF2EEF65D0F42B76AA6D802CD323ABA04EE1704A956CA7839DE170DB44BB734C7537F4F75ED5A8D619CCE7FBF32A6C6E3037B22C0580F59EA9156A8E79B4CF1E1EC3D514B90CDA8A37C6E9024C4C93BF80F6E8A10366F37E2786ECF25986C2C660F127CCF54DF456837D521CE680D37120FA13E653B6A2896E4C8B475179200924E42DE374F2B53149BDAED3B7819027F99DF09E48B152961C111723997389F6F0E8AB58BD24EACEEC83B2379FB4730040F5C9495C9FE8ABF8A25AB897D57413D9DC06400E5B8221B8C01C1AC82472B0E27D878A498BC496F645A73E31DCA5D1752F399E072EF5571D1352D9D174353244C88112770EA6DEEAE1A38340036A7A0CFE71547D5F6B9E413DAE1B566B7FA5A3257ED1D4846EEE591F66BF032A4110D2A26354CC45226CF405B85E00B65410C51BDCA42B4705CC281DCA17221E140E5265620D54203142C98D4081C532C919689CEB5E709D915066DB1FE936F58547A7DA11E05758D39811518F61FD4D23C725C79A4B5E5A6C4120F5056AC2ED51933AA97F46D8125AE0778B0F6F9C9750D55A5B41C78807B89272F9995CC1B527741807C26E3BA7C5752D40AA0D1E731DC048F54FE493FC4E518E6C9BE53D493FE51BFAE416D470D6868F2B789CF994555786497124998009CBF9472E319FA93A270A6A92EA990B91B80DC27D820DD21EB615A1746B5A0D47007838DE4DA60BB7717770051D8BC6DA475E04F099C845F8F72D2AE2F6C803ED0443471FD3F3A943631C7EC6DDEFE3040DE491BA0004CDB7652A3DBD945F140388AAEA87E9B664FDC492201FE63BA786E1CC95A3A8B69B4BAFB2D133CCEFE12720370BEE4651C1402D17FD4F71DF379337F1BA55A4B16D71B93F4D86C37BCEF279AA27E1136BCB14FF008575425CEB49B73E93EAADDABFA9751E0173761BC0E7DEA7D4BD13F5DFF55EDB37ED1B8776F2BA5E1A880972656B4571625DB16E88D5AFA712E566C2D200428E9B512D505B29264CC5300A00E5AD7C7329897B83473202AA25419B2B6480EB850FD2E9E80A2686B0D27476DBD253DA178486C428DCD5AD3C635D9381EF585E0AE74049913D42E0A7A8544549944C86A041D76A3DE10B55A91A291620C7D3CD71ED66C3EC62EA0E276877807DD767C7812B94EBBD3FF9A3CDADF489F256C3A627A8FC45B87AD2D195ACAF7FC3CD27B0E7309B448BF5C87CC973FA4CE71C477AB1E85C47D3A8D7436C082371913EB05564E8CE9582E0F026B38BDE7339C6E9B06F2E7BE132A8F006C32CD172786E93C49E0B2BD4370040F003C733B9694694DE4679EE0549BB342544D45840F903973E719E5BAF2D3C3449169CDE63FB0E9D2672429C68195CE536B729361E694E92D32E79D8A72E394893E6828B6C12925D92E9DD2ED637E9B2FC6F99E67E1E9BAB74A6AD400DD4989A3B16CDEECCF01C911A06876A72139F3E5F95A52518999B7391D4B5370BB34FA580E0237F356FA14D57F55E8C531CD59A8B1607B67A0B4895AC5E9A9B2257B0A1A8889D90D5AB55F66F6071893DDC168DD5EA44ED54ED9DE4C4F8E6A3C56966D3692480067B923C4EB7907730717920FF00B05FC6132FFA3D3FE0EF19AB38722C0B77D88FC2AD695D59A801D9787B679B5C3D415875C980C3AB80795307D6A26185C7BEA09A5528D61C2EC7778BA2F97D0235F655E88AF42CD738117E33D39F2FD958F40EB4D4716B6A5F713922410EFB9A5AE19B4E63A6E23985AD1C133681813C92397D94A2D4DAB2BD250F40D96D52A426B2147B56A0090E90D62A74E64E482D63D3DB2D2D65DC6CA84FC1BAA38FD4A8072916452BEC6E863A675EE4FF00C3137E6AA9A73489AD5054220ECB5A785A655DB47686C3B1BF6B5DCCC1556D787B1B59A1B03B009038C903CA1561C6E911CAA556C0B0B46434CD8D8F23C3BD1F853027F96C7A6EFC20F4212EECBB222475364E69B48870B9B82398F928CC5821654D2E038EC0DAE66CD17F1728AAE35CECEE770893DC0CC0F045E0B430265C7BA6F9F3C8734754686081F49A39BE4F3243267BDCBB4BA395F9118A0F79BF7EF81CE2C16E1CD60EC90633D9C86EBBB28E5EB92D748620BAC5C5CDE0D6ECB7C1040B8D8586600CA78F329D21190E90AD9346FB93CB9FE3A23B420DA7B464D17EA4C7AD820EB605DFAB33F324EF5528875668E17F0984D27F10422F92B3AAE80A1B2C03C7AAB0D16D927C0B400026F877AF3D337CD047D39416370E60C2674D7AFA40AA71B20A54CE4DAE14F10C12D6CC1B1836E626C4F71556C3EAE54AD47EABEA3FEF01C2FD969B4926E6F0BBAE3B4536A082124C5E8501CD7416ECE45BCD5232704192593B672FC1EAF1834AA61A90A6CB9C487F6C80E791001CCC869B64D0AFBFFA714C50A552897E1AB863497309D92E81F730F9C46F46D5C182E9961333269B2446570012B6AD51CE10EAAE37C85AD1C8A6799138E069F62BC0692A84FD1C480DACCFD40F65E3716F027827783C2937E0A0A1A1E9920964C6F327CCAB0E0E84322202CEF6CD32924B46D86C3D92FD315361AE76E013AC21894AB58E8CD370E3E9299AF8D928BB91CD6A06B9ED354B9CFA849651611B4F00492492035A00249240B21F0FA62BBAABA8D1C13185BB7671612760C3C024ECB88E48FC5EA00A86A39F5368BE0CDC3816EE0EDC237648ED07816616A33686CB2935C1B1B4E25CEB38B9C475F1558B85092F71BD14FC5E9C3F5436A52FA152786C7FB80B10AAFA6B17F52BBEA1362E86FF004B6CDF20AF3AF34E9E25FB4D693B0C79ECC8B8122491C464B9ABAB9882AF04BB44724A4B521F685A971E07A1F656A6512C226E0EFE9C79F3549D14FB8E20ABA612B075300CD8F78E51E0A3916CA63DA29634EBCB8E66E7EE33FB29307A5DF50969396ECEDCA7825941B2F3D4FBA1B0F882C7870CC1F1E4B4F14665369A6CB2D4C2B891379C88BA919852C7B41B026DB930C116D5636A30DB78E077AB0D5D1546BD38782C77F30B80772CEE75A66E8E352DA16D6D18364C3403177171713D245947AA3848ACE31948F34EE8D10D632987ED168D92E817119DD4DA2B4506127E4C49EF952E7A68AF0F9265A30B52C98E1EAA47867426342B2CECAD687B46A22DB925342B26142AEE558332CE34110BC34C15E85EAB1102AD8169CC0507F8068C8262F5AECA57143A9307A3860882D80B60B5A8F429240BB67987CD0FA4A96D35C14B44C15E575DFE2325F21253A41CCE697E330AFDC67AA6586105C3812A4789532EB453717802EA7501172D70F1690B8B345D7D1B5F0A335C0B4AE07E9626AD3FE4A8F1DD263CA169C2FB465F50BA66F821055A688801C2F31206F906E239855DD1AD933133D9F291E89EE19E4401C7CA247AA698B0E8AAE0D9DB3C4CFBA59519729FE0284D723FA8780FD92BC5D18A8795FDD5E2F66692D1A68CD28FA0FDA61EA0E44730BAD6ABE99A588A25ED10408733320F0E7C971DAEC82AC7FC3DD1F56B62C328D46B25AE2E2ECB6622767F510482232CD265C6A4ACA60CCE0E9F4755D2DA3DAC635CD0368104F453D1643473BF79549AF8EC536BBA9BDCD78A6435FB371610E876F8337CACAE7837CB5BD02C32547A919296C2698BA9DB9ACA6D5B9628B281946A23E8D5DC96305915457262C90E28D54434A5F45E8C6BD698B31CD1BB98A3256CEA887A8F4CDD0228D2AD785A35C625418930D24F7F8ADDB8A696A8DFD95E3A25A75148EB8495FA6A9ED6CB6A30BBF97684F84A27FF00178CD329219E37D9952943E788F30B67B50671FB6F006EB9F4479364A160589C9710D6FC37FEE15A32DA69EF2C6AED78DA962B8BE9DABB58CAEEDDB647FB7B3ECAB87B25997C50250A65BF378FD8A73833064FE903C4DBD1021BDAE57F084C706C9F2F20AB22285581A31581DDB4478984A74B53FF009978FF00316F95958594246D7193DE3FB253AC9436710E7459D0FF001009F6F1548BD929AD08EB9B0E27D91FAAF8DFA58CC3D46025EDAB4E1A1C5BB5DA0236C6533085C6B3B7C9D70BA0FF000BF51F0989A6DA989DA2E7D573298DBD96CD20C710606676B7D8C2ADE8CF5B0BD1CDD9C46258F825956A0379FD477EFCC2B0E8A74B1BD113A7B56F0D4595B134410EFB9CE2F243807358E25AEB4906641B9BEF42684FB42C195533D5C33B43CA214A69AD68B512D6281A2C882969AF7616BB28502C3A8D54435E973114D794F164A4825F556B4DBB5D140D75D194DEA8B623D1B9C3820822C6D091E3754595010E738B0FE9923CC669E17AF0D51C533498B1949745374AEA9D0A34C16520488EA93E2B1B541FB4DF2DADCAFB8F20907E70C92DD2B836B9A0802CA4D6CD319BAD8B3433086C9BB8DC94F5AFB24B4FB3646BF11010F273D8169BC78A74DEF393017780B79C2E3549DB52E399249EA4DD5C7F887A6ECDA2D3771DA77F48FB4779BF72A9E185BFD4078AD38E351BFB326595CABE82F6723CBD91F811F3E77A0AB102983C651982323B87E4FB2E6F405D91E86A9B5B43819FF767E72A0D64C1934C1FD4C116E197E145A2EA455047EADA69EA6E3D0A6BA400735C3F99A7C620FA4A76E98B5CA251F1C0398D72E97FC25D77C361B07528D6AACA4FFAA5ED2F920873582DD922C5A4E7C2C6573A78EC10371F5BFE52B2331CD5FB4647A3BBEB3FF10B0D53075E8B6BD3A8E7B4EC7D325C492E11B4761A38926D97441683C4CB1BD1720D16D25CBA668DA9B01A788F35973A36FA565E683AC8C6949B47E2E42674DEB21B5852DB66CA36BD480A229AB429D856817A17740642F7384968DA3C26252CFF00CD2E61D97D32C7037DACBB88B14FE91842E90C107EEFDFAF14523A0E375242B76B4939B80E91EF742BB5836BF579A93FC0B01ED31B9FF28FC291B85A6E049005B801B93766F8C31A569029C59899B7820717A560DCCF7A2F11A3DA63D891BF80E486ADA2298B9682789BF994A5B8AF00D83D2FB4F0D9907E5935C6D60C61738D8093D00BA5BA3308D0F71688CBE04B7F883A57669B290CEA1BFF004B609F131E69D2E5248F333CB8B6CA3E92C5BAAD47D5766F331C06407700B76D99FEA9F05E54A36EF23D14756AC5303891EE16B3CD5F6195DF2C037033DD9A71A2E8CC740ABAEA92CF003E772B7EAFD298F0F23F8519E8BC4A8E0FEE70E1978DBE734ECD5913D0FE4244DA9B2F9DC67C09CBE704CE8BACE6E7F83FBA798B8FE85B8FC2C124653EB7955DC4D3D97387CCD5A71649612336FA037948B4CD1EDB8B72263A119AAE36432C69866AFE165DDE0AE8D85C26D5320662E154B5330BD807893EA5741D1546CB2E796CDBE9E351B16E0B165860A7D84C7D90B8ED17BC6FF54ACBDD4CDC28766B45C68D79088654559C1E941C536A38D077A1D01C46AD2A46141D2AE8AA6F45326D04B42F4B168D729A9B93A22F42EC560B6BAA498CA4F67E92472FC2B73E9A86AE1C1DCBB896C799C0A3FF00E32D06E083FD27F0A0ADA4FEA18682799055C711A2E99FD212EADA31A321083468FF00D0DF427C1B7647CEF5CC75934D7D7C4B9E0F658765BFD2264F7992BA06B9E33E8616A96FDC46C37ABADE92B9053741BAD3863E4F33D44EDD165C39969DFBFE7925B8A3E47DE7DD4DA3AB5872F7B7A85155B0772365525E0928BB21B87CB7CDEAF1AB0C25C00CC13E8467DE55130AEEDB46E904F5272E7FBABD6AE3E1A0F374E7BF2F9CD4721486D144C61868E01C7D536A3F73798FEC976906F61DCDD23DFDD1F4DBD9A7FD2DF46AA4BA161D9216C8EF1E70ABD896769ED3F693E1BC15676986B9DC1286E1CD6C430713DAFF0049067BC4210743658DD172D52D1A5B4DA08BC2B668FA104850685C2404D68D3872C3395B36A8F1544EDA0084063345870C939A6C5B3A9243948A06334716190A3A3A4DCDFB8778FC2B9637000EE55DC668A84F77D944C2B03A5C1DE9CD0C683F02A4D5C21170A5C3E927D3CEE3CD771FA39AB3A051AE112DAA153705AC4DE31D7D939A3A5DA46699326E03C6D65B3AAA4C349B78AD6A69468DE9F909ED8C6B5441622A0840BB4A0E293E9BD666D36924CF00332792EEC6D45154FE2769090CA60E44BCFA37FF00D2A03B7273A5F146B39EF7664F96400E41272CFB7E6F5B31AA8D1E764772B0BC13BC14D58D9C7E6487A077789F55254B81F382E02E89301F7B795FE78ABDEAC1DA6961DED917DF2152702C833C95CB544CD56F7FFD854B26CB43F12A38D12D6819991E2E1F929A8A7768DCDF688F9C9034DBB4F6F1049EF394F4B94F70986BC9CA33F9C492574DD21B1C6DD8BF49CB69753E97FC263AA3A2A5FB47801DC001EA0AD6B600D6A81BB867C24E627C078AB9687D1FB0214273A8D1A230B95B1BE028C045EC415B61E9C053962CA51B37A6149B0BCA42CB721509360F5A9F04B719854E08426218831E2CACE2B0895E230AACD88A29756A0114CA95E7D14263315F4DAE74901A09B724EF134154B5C2AECD07FF009A1A3BCDFC82B4172744B23E316CAC8D75C58248ACE8E0434FA844375E3171F7B7FD8D55B014D4864BD0708FD1E54734FF00D996376B4625D03EA44F06B47B295CF2E0DDA2498993726799F964B594FED3C04A654848E823D94DA4BA2CA4DF6C1EBD3EC77A06AD28D9E9F94D2B0B37BCF9A12BB6038EF5C80D02ED64070BFE14BB871327D87A28E8529846D4A5DB03F9401DFBD736048969086AB56A73BFE619DFFF00D6E5597372567D4E8FAED2774FFD8E516592D0AF4760AE4BB8F80E1D4A7546839DF6FCE67E7058B14A6CD105E07980D1FB2040560C151B64B162C92340C98C536C2C58B91166EC6AD9C162C54421A10A0AAC58B1730A17D76A06AD358B12A2C2FC5B2C5730D7EC6CBDB4C6EED1EA6CDF293DEB162D7E995C8CBEA9FC0A98089C3B2EB162DEFA3CC88DEA361A3BFC02369D9996F03DD62C5166989BECCBB2FB47CF325098AC8F8FE162C410EFA35C061EE273F93E5EAA660979319AC58830AE826B320F8C79427FA9ED9AC045A1C7C047BAC5891F439FFFD9', 165, 56, 0, 'в норме', 'Тольятти, Ленина, 75, , кв.38', 1, 1, 2, 'Автозаводский РУВД г. Тольятти , 07.10.2002, 36 02 563482', 0, '32-34-98', '63-51-85', '89171322888', 'ira999@mail.ru', 'ira-semenova', '456-198-456', 3, 0, 1, 0, 0, 0, 'нет', NULL, 0, 'смена места жительства', 'место работы в другом районе при наличии служебного транспорта', 20000, 25000, '2004-12-23 00:00:00', 8000, 1, 1, 1, 1, 1, '2010-12-28 00:00:00', 1294, '2010-12-28 00:00:00', NULL, 'Тестовая запись.', '2007-02-02 00:00:00', '2004-12-23 00:00:00', '2007-05-11 00:00:00', 'чтение книг, журналов, шитье', 102, 46, 58, 81, 37, 28, 10, 46, 46, 28, 37, 81, 46, 54, 54, 63, 19, 30, 19, 37, 22, 34, 'ИНТЕЛЛЕКТУАЛЬНЫЕ ОСОБЕННОСТИ\r\n\r\nУ этого работника скорее конкретное, чем абстрактное мышление. Многое воспринимает буквально. Может испытывать трудности при овладении теоретическим материалом\r\nДанный работник старается быть практичным, пунктуальным, строить реальные планы. В условиях четкого графика работы ему это нередко удается.\r\nТщательно взвешивает новые идеи, относится к ним с осторожностью. Однако вера в правильность традиций борется с пониманием необходимости нововведений, поэтому данный работник в зависимости от ситуации может выступать и как новатор и как консерватор.\r\n\r\n\r\nЭМОЦИОНАЛЬНО - ВОЛЕВЫЕ ОСОБЕННОСТИ\r\n\r\nДанный работник довольно устойчив к стрессам, может действовать в неблагоприятных жизненных обстоятельствах, когда они не слишком тяжелы.\r\nОриентирован на собственные желания, игнорирует общепринятые правила и нормы поведения.\r\nВ зависимости от ситуации и обстоятельств может проявлять себя и как не склонный к сентиментальности реалист, и как мечтатель.\r\nПолосы уверенности в себе периодически сменяются у данного работника полосами сомнений во всем, и в это время ему свойственны ощущения тревоги, беспокойства, пессимистические предчувствия.\r\nПериоды соблюдения социальных требований сменяются у данного работника периодами ослабления самоконтроля, хотя он пытается заботиться о своей общественной репутации.\r\nДанный работник - человек без излишней внутренней напряженности; как правило, спокоен, временами несколько\r\nрасслаблен.\r\n\r\n\r\nКОММУНИКАТИВНЫЕ СВОЙСТВА И ОСОБЕННОСТИ МЕЖЛИЧНОСТНОГО ВЗАИМОДЕЙСТВИЯ\r\n\r\nЭпизодически предпочитает работать в одиночестве. В благоприятных обстоятельствах может ладить с людьми. Излишняя эмоциональность для данного работника не характерна.\r\nДанный работник часто серьезен, периодами склонен к самоанализу. У него нередко бывают состояния беспричинной озабоченности, хотя такие состояния, как правило, не длятся очень долго.\r\nДовольно чувствителен к опасности. Предпочитает не расширять круг общения.\r\nДовольно доверчив, практически свободен от зависти.\r\nЭтот работник проницателен, умудрен опытом, хорошо разбирается в людях.\r\nЭтот работник отличается некоторой покорностью, пассивностью. Нередко он ждет одобрения окружающих.\r\nДанный работник может сам принимать решения, однако, предварительно посоветовавшись с окружающими. Иногда поступает вопреки общественному мнению, хотя все же заинтересован в поддержке окружающих.\r\nСуществует тенденция к недооценке своих качеств.\r\n\r\n\r\nЛОКУС КОНТРОЛЯ\r\n\r\nДанный работник отличается сбалансированным локусом контроля. Такие люди считают, что все происходящее с ними зависит в равной степени, как от них самих, так и от внешних обстоятельств.\r\n\r\n', 'ИНТЕЛЛЕКТУАЛЬНЫЕ ОСОБЕННОСТИ\r\n\r\nСоответствует норме.\r\n\r\nЭМОЦИОНАЛЬНО - ВОЛЕВЫЕ ОСОБЕННОСТИ\r\n\r\nДанный работник вынослив в напряженных критических ситуациях. Эффективен в работе, связанной с эпизодическим преодолением внешних трудностей, когда такое преодоление не вызывает повышенных нервных нагрузок.\r\nМожет быть рекомендована лишь такая работа, ход и результаты которой можно постоянно контролировать. При этом за качество выполнения этой работы все равно нельзя поручиться.\r\nЭффективен в профессиональной деятельности, где эпизодически может потребоваться самообладание, когда такая деятельность протекает спокойно, без "авралов".\r\n\r\n\r\nКОММУНИКАТИВНЫЕ СВОЙСТВА И ОСОБЕННОСТИ МЕЖЛИЧНОСТНОГО ВЗАИМОДЕЙСТВИЯ\r\n\r\nРекомендуется профессиональная деятельность, не требующая постоянного активного общения с другими работниками.\r\nМожет быть эффективен в профессиональной деятельности, требующей компетентности в сфере человеческих отношений. Однако данный работник порой излишне полагается на свой предыдущий опыт в этом вопросе и это мешает ему использовать в деловом общении нестандартные стратегии поведения.\r\n\r\n\r\nЛОКУС КОНТРОЛЯ\r\n\r\nСоответствует норме.\r\n', 'ИНТЕЛЛЕКТУАЛЬНЫЕ ОСОБЕННОСТИ\r\n\r\nСоответствует норме.\r\n\r\nЭМОЦИОНАЛЬНО - ВОЛЕВЫЕ ОСОБЕННОСТИ\r\n\r\nВам необходимо серьезнее и с большей отдачей выполнять свои профессиональные и другие обязанности. Кроме того, преследуя собственные интересы, не следует забывать интересы окружающих.\r\n\r\n\r\nКОММУНИКАТИВНЫЕ СВОЙСТВА И ОСОБЕННОСТИ МЕЖЛИЧНОСТНОГО ВЗАИМОДЕЙСТВИЯ\r\n\r\nВаша склонность к самоанализу на фоне периодически возникающих состояний пессимизма может приводить подчас к "зацикливанию" на своих проблемах.\r\n\r\n\r\nЛОКУС КОНТРОЛЯ\r\n\r\nСоответствует норме.\r\n', 50, 48, 40, 46, 65, 30, 70, 63, 37, 50, NULL, NULL, NULL, NULL, 'Делопроизводство, машинопись, ведение телефонных переговоров.\r\nИсполняла обязанности инспектора отдела кадров - регистрация и заполнение трудовых книжек, оформление приказов по приему , переводу, увольнению сотрудников.\r\nСбор рекламы для газет "Комсомольская правда", "Ваш выбор". Работа с прайс-листами. Ведение переговоров с руководителями.\r\nРабота с электронной почтой, знание офисной орг.техники\r\nРегистрация входящей и исходящей документации, подготовка документов,составление договоров.\r\nОпыт ведения прямых продаж (2,5 года). Консультирование клиентов по подбору косметики, подбор и оформление подарков.\r\nОпыт работы секретарем - 7 лет.\r\nЛегко обучаюсь, добросовестная , быстро устанавливаю контакт с людьми\r\nОформление учебных и очередных отпусков, листков нетрудоспособности.\r\nОбеспечение офиса канстоварами и хозтоварами\r\nПроведение конвертаций в пенсионном фонде РФ\r\nЗнание кадрового делопроизводства', NULL, '2 мес.;7 лет;14 лет;');

-- 
-- Вывод данных для таблицы criterion_query
--
INSERT INTO criterion_query VALUES 
  (1, '2011-02-25 22:02:22', 1, 'Бывает ли так, что вы устаете от работы? Как вы в таких случаях восстанавливаете свои силы?', 'Выявление работоспособности', NULL),
  (2, '2007-03-17 16:34:11', 1, 'Было ли в вашей работе что-то, что вы считали трудным для себя? Как вы с этим справлялись?', 'Выяснить, способы решения проблем.', NULL),
  (3, '2007-03-17 16:34:11', 1, 'В каких мероприятиях Вы участвовали?', 'Насколько активен? Носили ли его действия целенаправленный характер? Был ли он лидером, ладил ли с людьми?', NULL),
  (4, '2007-03-17 16:34:11', 1, 'В каких проектах (мероприятиях) Вы участвовали?', 'Насколько активен? Носили ли его действия целенаправленный характер? Был ли он лидером, ладил ли с людьми?', NULL),
  (5, '2007-03-17 16:34:11', 1, 'В каких работах вы участвовали сверх своих обычных должностных обязанностей?', 'Определить готовность к сотрудничеству и активность.', NULL),
  (6, '2007-03-17 16:34:11', 1, 'В какой степени изменения в работе, которые произошли за время вашей работы в данной организации, зависели от вас?', 'Определить степень инициативности и самостоятельность.', NULL),
  (7, '2007-03-17 16:34:11', 1, 'Есть ли у Вас опыт  руководства персоналом', '', NULL),
  (8, '2007-03-17 16:34:11', 1, 'Как вы оцениваете состояние своего здоровья и на чем основываются ваши оценки?', 'Состояние здоровья', NULL),
  (9, '2008-07-28 17:46:46', 1, 'Как вы получили работу в данной организации?', 'Ответ на этот вопрос может показать степень инициативности или готовность к поиску неиспользованных резервов. В каких проектах (мероприятиях) Вы участвовали?', NULL),
  (10, '2007-03-17 16:34:11', 1, 'Как Вы преодолевали производственные проблемы?', 'Определения способов решения проблем.(самостоятельность, руководящие и организаторские способности, предприимчивость, находчивость)', NULL),
  (11, '2007-03-17 16:34:11', 1, 'Как вы провели последние выходные дни? Как вы провели отпуск? Чем занимались?', '', NULL),
  (12, '2007-03-17 16:34:11', 1, 'Как вы умеете распределять свое время?', 'Насколько кандидат умеет планировать собственное время.', NULL),
  (13, '2007-03-17 16:34:11', 1, 'Как и почему вы получили предыдущую работу?', 'Насколько человек инициативен и активен в поиске работы.', NULL),
  (14, '2007-03-17 16:34:11', 1, 'Какие обязанности Вы выполняли на последнем месте работы?', 'Продемонстрировал самостоятельность, постоянство интересов? Требовала ли работа энергичности и профессионализма?', NULL),
  (15, '2007-03-17 16:34:11', 1, 'Приходилось ли вам бывать в командировках? Если да, то что вам в этом нравилось и что не нравилось?', '', NULL),
  (16, '2007-03-17 16:34:11', 1, 'приходилось ли вам работать сверхурочно и как вы к этому относитесь?', 'отношение к работе', NULL),
  (17, '2007-03-17 16:34:11', 1, 'Сколько часов в день Вы обычно работали?', 'Показатель активности. Способен ли претендент работать не считаясь со временем?', NULL),
  (18, '2007-03-17 16:34:11', 1, 'Чем Вы занимались в промежутке между данной и предшествующей работой?', 'Обеспечивает ли претендент себя сам. Стремится ли к постоянной занятости. Нет ли указаний на не лояльность.', NULL),
  (19, '2007-03-17 16:34:11', 1, 'Что делает встречу эффективной?', 'Понимание кандидата важного момента ( четкое расписание, соблюдение этого расписания на встрече, четко сформулированный итог этой встречи).', NULL),
  (20, '2007-03-17 16:34:11', 2, 'За последние 5 лет что из ваших ожиданий реально сбылось?', 'Выяснить, способен достигать намеченной цели. Установить, какие значимые события произошли в его жизни за последние годы.', NULL),
  (21, '2007-03-17 16:34:11', 2, 'За последние год-два  что из ваших ожиданий реально сбылось?', 'Выяснить, способен достигать намеченной цели. Установить, какие значимые события произошли в его жизни за последние годы.', NULL),
  (22, '2007-03-17 16:34:11', 2, 'Каковы ваши основные достижения в работе?', 'Определить, ориентирован ли на достижения', NULL),
  (23, '2007-03-17 16:34:11', 2, 'Каковы ваши основные достижения в работе? Интересуется ли новыми информационными технологиями.', 'Определить, ориентирован ли на достижения', NULL),
  (24, '2007-03-17 16:34:11', 2, 'Каковы ваши основные достижения в работе? Интересуется ли новыми компьютерными технологиями.', 'Определить, ориентирован ли на достижения', NULL),
  (25, '2007-03-17 16:34:11', 3, ' Приницпиален ли для вас вопрос в какой сфере бизнеса работать?', 'Представление о профессии.', NULL),
  (26, '2007-03-17 16:34:11', 3, 'А Ваши слабые стороны?', 'Самооценка, самокритика', NULL),
  (27, '2007-03-17 16:34:11', 3, 'Были ли какие-то ошибки, разочарования или вещи, которые получались не очень удачно? Расскажите о них.', 'Выяснить, готов принимать на себя ответственность за свои неудачи.', NULL),
  (28, '2007-03-17 16:34:11', 3, 'В какой мере Вы могли использовать свои суждения и инициативу?', 'Активно ли искал ответственности.', NULL),
  (29, '2007-03-17 16:34:11', 3, 'Ваш успешно начатый проект проваливается. Ваши действия?', 'Умение оценить ситуацию и принять ответственное решение', NULL),
  (30, '2007-03-17 16:34:11', 3, 'Ваши слабые стороны', 'самооценка, самокритика', NULL),
  (31, '2007-03-17 16:34:11', 3, 'Есть ли для Вас приниципиальный вопрос в какой сфере бизнеса работать?', 'Представление о профессии.', NULL),
  (32, '2007-03-17 16:34:11', 3, 'Есть ли для Вас приницпиальный вопрос в какой сфере бизнеса работать?', 'Представление о профессии.', NULL),
  (33, '2007-03-17 16:34:11', 3, 'К кому вы обращаетесь за помощью в процессе принятия решений?', 'Самостоятельность в принятии решений.', NULL),
  (34, '2007-03-17 16:34:11', 3, 'Как вы относитесь к неудачам?', 'Умение анализировать удачи и неудачи.', NULL),
  (35, '2007-03-17 16:34:11', 3, 'Как вы представляете работу маркетолога?', 'Представление о профессии.', NULL),
  (36, '2007-03-17 16:34:11', 3, 'Как вы представляете работу начальника отдела продаж?', 'Представление о профессии. Знание должностных обязанностей.', NULL),
  (37, '2007-03-17 16:34:11', 3, 'Как вы представляете работу начальника производства? В чем заключабтся обязанности зам. начальника производства?', 'Представление о профессии. Знание должностных обязанностей.', NULL),
  (38, '2007-03-17 16:34:11', 3, 'Как вы представляете работу офис-менеджера?', '', NULL),
  (39, '2007-03-17 16:34:11', 3, 'какими качествами на ваш взгляд должен обладать администратор? Какими качествами обладаете вы и чего вам не хватает?', 'Анализ и самооценка кандидата', NULL),
  (40, '2007-03-17 16:34:11', 3, 'какими качествами на ваш взгляд должен обладать бухгалтер? Какими качествами обладаете вы и чего вам не хватает', 'Анализ и самооценка кандидата', NULL),
  (41, '2007-03-17 16:34:11', 3, 'Какими качествами на ваш взгляд должен обладать бухгалтер? Какими качествами обладаете вы и чего вам не хватает?', 'Анализ и самооценка кандидата', NULL),
  (42, '2007-03-17 16:34:11', 3, 'Какими качествами на ваш взгляд должен обладать заместитель директора по экономике? Какими качествами обладаете вы и чего вам не хватает?', 'Анализ и самооценка кандидата', NULL),
  (43, '2007-03-17 16:34:11', 3, 'Какими качествами на ваш взгляд должен обладать руководитель? Какими качествами обладаете вы и чего вам не хватает?', 'Анализ и самооценка кандидата', NULL),
  (45, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности  бухгалтера?', '', NULL),
  (46, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности гл. бухгалтера', '', NULL),
  (47, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности заместителя гл. бухгалтера', '', NULL),
  (48, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности кладовщика', '', NULL),
  (49, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности менежера', '', NULL),
  (50, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности менежера отдела продаж', '', NULL),
  (51, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности офис-менеджера', '', NULL),
  (52, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности продавца', '', NULL),
  (53, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности продавца консультанта', '', NULL),
  (54, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности продавца-консультанта', 'Как кандидат оценивает свои возможности', NULL),
  (55, '2007-03-17 16:34:11', 3, 'Опишите в чем заключаются обязанности товароведа', '', NULL),
  (56, '2007-03-17 16:34:11', 3, 'Опишите ваши представления о работе офис-менеджера?', 'Знание должностных обязанностей?', NULL),
  (57, '2007-03-17 16:34:11', 3, 'Опишите, в чем заключаются обязанности бухгалтера?', 'Представление о профессии.', NULL),
  (58, '2007-03-17 16:34:11', 3, 'Опишите, как вы себе представляете работу заведующего складом?', 'Как кандидат оценивает свои возможности', NULL),
  (59, '2007-03-17 16:34:11', 3, 'опишите, как вы себе представляете работу м енджера', 'Как кандидат оценивает свои возможности', NULL),
  (60, '2007-03-17 16:34:11', 3, 'Опишите, как вы себе представляете работу менджера', 'Как кандидат оценивает свои возможности', NULL),
  (61, '2007-03-17 16:34:11', 3, 'Опишите, как вы себе представляете работу менеджера по продажам?', 'Как кандидат оценивает свои возможности', NULL),
  (62, '2007-03-17 16:34:11', 3, 'Опишите, как вы себе представляете работу продавца кансультанта?', 'Как кандидат оценивает свои возможности', NULL),
  (63, '2007-03-17 16:34:11', 3, 'опишите, как вы себе представляете работу ресерчера', 'Как кандидат оценивает свои возможности', NULL),
  (64, '2007-03-17 16:34:11', 3, 'Опишите, как вы себе представляете работу торгового представителя?', 'Как кандидат оценивает свои возможности', NULL),
  (65, '2007-03-17 16:34:11', 3, 'Ответственный ли вы человек? Расскажите пример, где вы проявили это качество', 'умение анализировать ситуацию и свои действия в ней', NULL),
  (66, '2007-03-17 16:34:11', 3, 'Ответственный ли вы человек? Расскажите пример, где вы проявили это качество.', 'умение анализировать ситуацию и свои действия в ней', NULL),
  (67, '2007-03-17 16:34:11', 3, 'оцените себя как специалиста по 10-бальной шкале', 'умение оценить свой профессионализм', NULL),
  (68, '2007-03-17 16:34:11', 3, 'Почему на эту должность должны выбрать именно вас?', '', NULL),
  (69, '2007-03-17 16:34:11', 3, 'С какими трудностями вы сталкивались на предыдущем месте работы? Как вы решали эти проблемы', 'Выяснить, готов принимать на себя ответственность за свои неудачи.', NULL),
  (70, '2007-03-17 16:34:11', 3, 'С какими трудностями вы сталкивались на предыдущем месте работы? Как вы решали эти проблемы?', 'Выяснить, готов принимать на себя ответственность за свои неудачи.', NULL),
  (71, '2007-03-17 16:34:11', 3, 'Считаете ли вы себя ответственным человеком? Приведите примеры в чем это проявляется.', 'Как человек оценивает свои силы в принятии решений.', NULL),
  (72, '2007-03-17 16:34:11', 3, 'Чем Вы занимались в промежутке между данной и предшествующей работой?', 'Обеспечивает ли претендент себя сам. Стремится ли к постоянной занятости. Нет ли указаний на не лояльность.', NULL),
  (73, '2007-03-17 16:34:11', 3, 'Чем отличаются обязанности офис-менеджера от обязанностей серетаря?', 'Профессионализм.', NULL),
  (74, '2007-03-17 16:34:11', 3, 'что вы делаете если вас постигает неудача', 'умение анализировать удачи и неудачи', NULL),
  (75, '2007-03-17 16:34:11', 3, 'Что вы делаете если вас постигает неудача?', 'Умение анализировать удачи и неудачи.', NULL),
  (76, '2007-03-17 16:34:11', 3, 'что вы считаете своими сильными сторонами?', 'способность к самооценке и самоанализу, готовность к серьезной ответственной работе', NULL),
  (77, '2007-03-17 16:34:11', 4, 'Если бы вы начинали все с начала, как бы вы изменили свою жизнь и карьеру?', 'Выяснить, что не устраивает в себе сегодня, как он хотел бы изменить свою рабочую ситуацию.', NULL),
  (78, '2007-03-17 16:34:11', 4, 'Как бы вы описали ваши достижения за время учебы в институте (или другом высшем учебном заведении)?', 'Выяснить, с чем ассоциируются основные успехи. Это успехи в приобретении знаний и навыков, социальные  успехи, командные  или лидерские?', NULL),
  (79, '2007-03-17 16:34:11', 4, 'Как Вы относитесь к тому, что Вашу работу тщательно контролируют?', 'положительно', NULL),
  (80, '2007-03-17 16:34:11', 4, 'Какая ситуация на протяжении всей Вашей карьеры оказалась для Вас самой болезненной и неприятной?', 'Ответ на этот вопрос показывает, что ему не нравится, указывая на слабые стороны человека. Оправданы ли претензии. Склонен ли быть критичным То, как он ведет себя, отвечая на это вопрос, выявляет степень его откровенности.', NULL),
  (81, '2007-03-17 16:34:11', 4, 'Какие бы Вы могли назвать самые серьезные достижения на последнем месте работы?', 'Выяснить, что  нравится, что является его сильными сторонами Привлекает ли сама работа или, что-то др', NULL),
  (82, '2007-03-17 16:34:11', 4, 'каким должен быть коллектив, в катором вам приятнее всего было бы работать?', 'а)доброжелательным; б)небольшим; в)профессиональным - выяснение потребности кандидата в окружении', NULL),
  (83, '2007-03-17 16:34:11', 4, 'каким должен быть коллектив, в котором вам приятнее всего было бы работать?', 'а)доброжелательным; б)небольшим; в)профессиональным - выяснение потребности кандидата в окружении', NULL),
  (84, '2007-03-17 16:34:11', 4, 'Расскажите, пожайлуста, о том, какие отношения сложились у Вас с последним руководителем?', 'Выявить взаимоотношения с руководством, слонность к конфликтам.', NULL),
  (85, '2007-03-17 16:34:11', 4, 'С какими людьми вам приятно / неприятно иметь дело на работе или поддерживать деловые отношения?', 'Определить деловые ценности и установки в деловом общении', NULL),
  (86, '2007-03-17 16:34:11', 4, 'Что вам больше всего нравилось (нравится) в вашей работе?', 'Выяснить, что  нравится, что является его сильными сторонами Привлекает ли сама работа или, что-то др', NULL),
  (87, '2007-03-17 16:34:11', 4, 'Что вам меньше всего нравилось (нравится) в вашей работе?', 'Ответ на этот вопрос показывает, что ему не нравится, указывая на слабые стороны человека. Оправданы ли претензии. Склонен ли быть критичным То, как он ведет себя, отвечая на это вопрос, выявляет степень его откровенности.', NULL),
  (88, '2007-03-17 16:34:11', 5, 'Как бы вы описали ваши достижения за время учебы в институте (или другом высшем учебном заведении)?', 'Выяснить, насколько в значимо в процессе учёбы было само приобретение знаний и навыков?', NULL),
  (89, '2007-03-17 16:34:11', 5, 'Каковы ваши долгосрочные цели и задачи?', 'Определить готовность к обучению и развитию, склонность планировать свое будущее.', NULL),
  (90, '2007-03-17 16:34:11', 5, 'Какой прогресс был достигнут вами за время работы в данной организации?', 'Определить способность к росту, к развитию.', NULL),
  (91, '2007-03-17 16:34:11', 5, 'Расскажите о достижениях на работе?', 'Определить способность к росту, к развитию.', NULL),
  (92, '2007-03-17 16:34:11', 5, 'Что было самым значительным опытом в процессе обучения?', 'Каковы его базовые установки по отношению к обучению?', NULL),
  (93, '2007-03-17 16:34:11', 5, 'Что вы получили от работы в вашей прежней  организации?', 'Выяснить, чему  смог научиться за время работы. Оценить способность осваивать новое. Выявление склонности к позитивному мышлению, к способности находить положительные стороны в любой ситуации.', NULL),
  (94, '2007-03-17 16:34:11', 5, 'Что вы получили от работы в вашей прежней (нынешней) организации?', 'Выяснить, чему  смог научиться за время работы. Оценить способность осваивать новое. Выявление склонности к позитивному мышлению, к способности находить положительные стороны в любой ситуации.', NULL),
  (95, '2007-03-17 16:34:11', 5, 'Что вы предпринимаете для того, чтобы повысить свою квалификацию?', 'выяснить желание профессионально развиваться, инициативность в обучении', NULL),
  (96, '2007-03-17 16:34:11', 6, 'В какой должности вы видите себя через 5 лет?', 'Определение карьерных планов, уровня притязаний и самооценки.', NULL),
  (97, '2007-03-17 16:34:11', 6, 'Как вы думаете, что мог бы сказать о вас ваш прошлый (настоящий) руководитель?', 'Выяснить, нет ли конфликта с руководством? Определение самооценки.', NULL),
  (98, '2007-03-17 16:34:11', 6, 'Опишите себя в общих словах.', 'Выяснить представление о самом себе.', NULL),
  (99, '2007-03-17 16:34:11', 6, 'Укажите, в чем вы превосходите других людей.', 'Определить, насколько уверен в своих навыках, знаниях, квалификации.', NULL),
  (100, '2007-03-17 16:34:11', 6, 'Что вы думаете о своих недостатках и какие качества вам следует развивать в первую очередь?', 'Установить, насколько реалистично оценивает себя. В чем состоят его основные неиспользованные резервы.', NULL),
  (102, '2007-03-17 16:34:11', 7, 'Ваше отношение к руководству', 'Степень лояльности', NULL),
  (103, '2007-03-17 16:34:11', 7, 'Как вы думаете, что мог бы сказать о вас ваш прошлый (настоящий) руководитель?', 'Выяснить, нет ли конфликта с руководством', NULL),
  (104, '2007-03-17 16:34:11', 7, 'Какая у Вас совместимость с начальством (высокая / низкая) Почему?', 'Проявление лояльности / враждебности к руководству.', NULL),
  (105, '2007-03-17 16:34:11', 7, 'Какие черты или качества вам нравятся в вашем непосредственном руководителе?', 'Выяснить как кандидат относится к своему руководителю, готовность к сотрудничеству с руководством, какие качества руководителя имеют для него важное значение.', NULL),
  (106, '2007-07-29 13:16:25', 7, 'Каким должен быть ваш начальник?', '', NULL),
  (107, '2007-03-17 16:34:11', 7, 'С каким руководителем вы бы не хотели работать?', '', NULL),
  (108, '2007-03-17 16:34:11', 7, 'Что из себя представляет Ваш начальник? Какой он?', 'Как у кандидата сложились отношения с начальством.', NULL),
  (109, '2007-03-17 16:34:11', 8, 'Каковы причины вашего увольнения с предыдущего места работы (или почему вы намерены оставить вашу настоящую работу)?', 'Выяснить обоснованность аргументов, отношение кандидата к работе, к товарищам по работе и руководству.', NULL),
  (110, '2007-03-17 16:34:11', 8, 'Причины увольнения и почему именно в это время.', 'Адекватность и реалистичность причин увольнения . Откровенность претендента. Не спасовал ли перед трудностями..', NULL),
  (111, '2007-03-17 16:34:11', 8, 'Причины увольнения с прежних мест работы?', 'Можно ли считать причины адекватными и реалистичными. Не спасовал ли перед трудностями.', NULL),
  (112, '2007-03-17 16:34:11', 9, 'Вы как продавец должны хорошо разбираться в людях. Вы хорошо разбираетесь в людях? Тогда охарактеризуйте меня как клиента (как я буду принимать решения, что будет подходящим стилем общения и т.д.)', 'Проверяет стресоустойчивость и умение быстро составлять правильное первое впечальное о клиенте. Оценка наблюдательности кандидата и умение выделять конкретные особенности человека.', NULL),
  (115, '2007-03-17 16:34:11', 9, 'Документооборот, как правильно закрепить. Амортизация основных средств (применение  коэффициента ускоренной амортизации)', 'Коэффициент равен 3, знание налогового кодекса.', NULL),
  (116, '2007-03-17 16:34:11', 9, 'Знание рынка ОАО АВТОВАЗ', 'Каким образом осуществляеться выстраивание отношение с  автогигантом', NULL),
  (117, '2007-03-17 16:34:11', 9, 'как вы будете действовать в ситуации, когда клиент предъявляет претензию по срокам поставок(они реально были нарушены), но вы за эти сроки ответсвенности не несете?', 'проф. навыки. Прав. Схема действий: беру на себя коорд. Ситуации, говорю клиенту, что мне очень жаль, что сложилась такая ситуация, и что прямо сейчас постааюсь в ней разобраться и уладить. Оговариваю общее временные рамки и алгоритм дальнейших переговоро', NULL),
  (118, '2007-03-17 16:34:11', 9, 'Как вы искали клиентов для расширения базы?', 'Выяснение навыков поиска клиентов', NULL),
  (119, '2007-03-17 16:34:11', 9, 'как вы планируете свой рабочий день?', 'умение организовывать и планировать свою работу. Самоконтроль', NULL),
  (120, '2007-03-17 16:34:11', 9, 'Как вы представляете  себе хорошего администратора?', '', NULL),
  (121, '2007-03-17 16:34:11', 9, 'Как вы представляете  себе хорошего программиста?', '', NULL),
  (122, '2007-03-17 16:34:11', 9, 'Как вы представляете себе обязанности  заведующего производством?', 'Кандидат должен отчетливо представлять требования к работе.', NULL),
  (123, '2007-03-17 16:34:11', 9, 'Как вы представляете себе обязанности администратора?', 'Кандидат должен отчетливо представлять требования к работе.', NULL),
  (124, '2007-03-17 16:34:11', 9, 'Как вы себе представляете обязанности кладовщика?', 'Кандидат должен отчетливо представлять требования к работе.', NULL),
  (125, '2007-03-17 16:34:11', 9, 'Как долго вы работали менеджером по продажам? Какой товар (продукт) реализовывали?', 'Выяснение опыта работы', NULL),
  (126, '2007-03-17 16:34:11', 9, 'Как начисляется заработная плата?', 'уровень квалификации', NULL),
  (127, '2007-03-17 16:34:11', 9, 'Как происходит процедура закрытия авансовых платежей? (счета 62.2 и 62.1)', '', NULL),
  (128, '2007-03-17 16:34:11', 9, 'как формируется затратная часть по прибыли', '', NULL),
  (129, '2007-03-17 16:34:11', 9, 'Какие ассоциации у вас возникают с понятием "управление складскими запасами" ? Овет: учет сырья, учет готовой продукции, учет поступелния и выбытия, учет брака.', 'квалификация', NULL),
  (130, '2007-03-17 16:34:11', 9, 'Какие Вы испытывали проблемы (затруднения) на предыдущем месте работы?', 'Постоянно преследующие проблемы.', NULL),
  (131, '2007-03-17 16:34:11', 9, 'Какие Вы испытывали проблемы (затруднения) на производстве?', 'Постоянно преследующие проблемы.', NULL),
  (132, '2007-03-17 16:34:11', 9, 'Какие изменения произошли в плане НДС за 2006 год.', '', NULL),
  (133, '2007-03-17 16:34:11', 9, 'Какие обязанности у менеджера по продажам?', 'Представление о должности. Знание своих собственных обязаннотей, опыта', NULL),
  (134, '2007-03-17 16:34:11', 9, 'Какие обязанности у менеджера по продажам? Чем он занимается?', 'Представление о должности. Знание своих собственных обязаннотей, опыта', NULL),
  (135, '2007-03-17 16:34:11', 9, 'Какие основные счета и планы счетов вы знаете?(01,10,20,26,50,51,60,62,41).', 'Знание бухгалтерии.', NULL),
  (136, '2007-03-17 16:34:11', 9, 'Каким образом Вы можете получить обратную связь от клиента? Какой путь самый достоверный?', 'Ответы клиента на вопросы. Анализ речи и реплик клиента. Наблюдение за невербальным поведением. Вопросы самого клиента. Предложение по дальнейшему сотрудничеству.', NULL),
  (137, '2007-03-17 16:34:11', 9, 'Каким образом докумментально оформляется выбытие со склада? Ответ: один комплект документов обязательно остается на складе.', 'квалификация', NULL),
  (138, '2007-03-17 16:34:11', 9, 'Какими компьютерными программами вы владеете? Сколько времени вам потребуется для освоения новой программы?', 'Умение работать с орг. техникой.', NULL),
  (139, '2007-03-17 16:34:11', 9, 'Каковы ваши рабочие обязанности в настоящее время? Все ли вас устраивает?', 'Позволяет уточнить сферу компетенции,', NULL),
  (140, '2007-03-17 16:34:11', 9, 'Какое достижение на прежних работах Вы считаете самым важным?', 'Может ли это достижение быть полезным на новой работе?', NULL),
  (141, '2007-03-17 16:34:11', 9, 'Клиент говорит "это догорого". Почему он это говорит? Назовите как много больше вариантов.', 'Креативность, умение видеть различные версии, понимание специфики бизнеса.', NULL),
  (142, '2007-03-17 16:34:11', 9, 'Минимальная конфигурация складского учёта (компоненты оперативного учёта)? Отв: Создание приходных - расходных документов и в модулях проведения этих документов отразить движение регистров.', 'Уровень квалификации.', NULL),
  (143, '2007-03-17 16:34:11', 9, 'Назовите как можно больше способов позиционирования высокой цены как преимущества', 'профессиональные навыки. правильными ответами м/б :престижность товара, все включено, высокая степень надежности, подтверждение подлинности происхождения, соответсвие высокому уровню покупателя', NULL),
  (144, '2007-03-17 16:34:11', 9, 'Назовите как можно больше способов позиционирования высокой цены как преимущества.', 'Профессиональные навыки.  высокая степень надежности, подтверждение подлинности происхождения, соответсвие высокому .', NULL),
  (145, '2007-03-17 16:34:11', 9, 'Назовите коды бюджетных классификаций по плтежам налогов по заработной плате?', 'уровень квалификации', NULL),
  (146, '2007-03-17 16:34:11', 9, 'Назовите основные понятия раздельного учета', 'Формируется по видам деятельности( лизинг, реализация ценных бумаг (акции, векселя', NULL),
  (147, '2007-03-17 16:34:11', 9, 'назовите счета, с которыми чаще всего работает бухгалтер-материалист', 'общие знания', NULL),
  (148, '2007-03-17 16:34:11', 9, 'назовите счета, с которыми чаще всего работает бухгалтер-материалист (10)', 'общие знания', NULL),
  (149, '2007-03-17 16:34:11', 9, 'Насколько хорошо вы знаете орг.технику?', '', NULL),
  (150, '2007-03-17 16:34:11', 9, 'Насколько хорошо вы знаете ПК', '', NULL),
  (151, '2007-03-17 16:34:11', 9, 'Опишите подробно ваш рабочий день?', 'выяснение достоверности информации', NULL),
  (152, '2007-03-17 16:34:11', 9, 'Определите целевую группу для Вашего товара.', 'логика и умение отличать целевую группу от случайных потребителей.', NULL),
  (153, '2007-03-17 16:34:11', 9, 'Почему вы хотите работать именно администратором?', 'Оценить подготовленность кандидата к собеседованию. Выявить, соответствует ли кандидат данной должности, знает ли функциональные обязанности.', NULL),
  (154, '2007-03-17 16:34:11', 9, 'приведите пример, когда вам не удавалось выполнить что-либо выполнять в намеченный срок. Каковы были ваши действия?', 'умение организовывать и планировать свою работу.', NULL),
  (155, '2007-03-17 16:34:11', 9, 'Продайте мне…', 'Грамотный продавец начнет со стадии установления контакта и представления, а потом задавать вопросы для выявления потребностей клиента. Если начинает продажу с презентации, то его знания недостаточны.', NULL),
  (156, '2007-03-17 16:34:11', 9, 'Производство черепицы', 'условия изготовления', NULL),
  (157, '2007-03-17 16:34:11', 9, 'Работа с оперативными данными: 1. Как подсчитать остаток по банку, по кассе?', 'профессионализм экономиста.', NULL),
  (158, '2007-03-17 16:34:11', 9, 'Работали ли вы с авансовыми платежами?', '', NULL),
  (159, '2007-03-17 16:34:11', 9, 'Расскажите мне о вашей последней (настоящей работе). Опишите Ваши обязанности', 'Продемонстрировал ли самостоятельность? Требовала ли работа энергии и профессионализма?', NULL),
  (160, '2007-03-17 16:34:11', 9, 'Расскажите о вашем профессиональном опыте?', 'Опыт работы.', NULL),
  (161, '2007-03-17 16:34:11', 9, 'Расчитать себистоимость готовой продукции (указать проводки)', 'профессионализм бухгалтера.', NULL),
  (162, '2007-03-17 16:34:11', 9, 'Реализация какой группы товара вам наиболее интересна? С какими товарами вы хотели бы работать?', 'Выяснение интересов кандидата', NULL),
  (163, '2007-03-17 16:34:11', 9, 'С какими конфигурациями вы работали, названия.', 'Опыт работы.', NULL),
  (164, '2007-03-17 16:34:11', 9, 'Сформулируйте и обоснуйте структуру переговоров', '1.Установление контактов, 2.уточнение потребностей. 3. презентация или предложение решения проблемы. 4. закрепление договоренности. 5. договоренность о дальнейшем сотрудничестве.', NULL),
  (165, '2007-03-17 16:34:11', 9, 'Что важнее при общении: вербальное или невербальное восприятие?', 'Однозначно отдать предпочтение тем или средствам общения нельзя.', NULL),
  (166, '2007-03-17 16:34:11', 9, 'Что вам больше всего нравится в профессии менеджер по продажам?', 'Положительные стороны и отношение кандидата к работе', NULL),
  (167, '2007-03-17 16:34:11', 9, 'Что вам больше всего нравится в профессии менеджер по работе с клиентами?', 'Положительные стороны и отношение кандидата к работе', NULL),
  (168, '2007-03-17 16:34:11', 9, 'Что вам не нравится в профессии менеджер по продажам?', 'Отрицательные стороны в работе и отношение к работе', NULL),
  (169, '2007-03-17 16:34:11', 9, 'Что Вы понимаете под опытным пользователем программы 1С.', 'Уровень квалификации.', NULL),
  (170, '2007-03-17 16:34:11', 9, 'Что Вы понимаете под опытным пользователем программы 1С:Предприятие', 'Уровень квалификации.', NULL),
  (171, '2007-03-17 16:34:11', 9, 'Что Вы понимаете под профессиональным пользователем программы 1С.', 'Уровень квалификации.', NULL),
  (172, '2007-03-17 16:34:11', 9, 'Что Вы понимаете под профессиональным пользователем программы 1С:Зарплата и Кадры', 'Уровень квалификации.', NULL),
  (173, '2007-03-17 16:34:11', 9, 'Что вы предпринимали для повышения уровня своего профессионализма?', 'Стремление к профессиональному росту', NULL),
  (174, '2007-03-17 16:34:11', 9, 'Что значит "продвижение товара на рынке"? Как это осуществляется?', 'Выяснение опыта работы?', NULL),
  (175, '2007-03-17 16:34:11', 9, 'Что такое инструкции П-6/П-7', 'квалификация', NULL),
  (176, '2007-03-17 16:34:11', 9, 'Что такое КБК?', 'проверка общих знаний', NULL),
  (177, '2007-03-17 16:34:11', 9, 'Что, по вашему мнению, внесло основной вклад в ваши профессиональные успехи к настоящему моменту?', 'Уточнить биографические данные и получить дополнительные сведения относительно профессиональных качеств.', NULL),
  (178, '2007-03-17 16:34:11', 10, 'Как Вы понимаете обязанности менеджера по персоналу?', 'Правильно ли представляет себе ответственность и круг обязанностей.', NULL),
  (179, '2007-03-17 16:34:11', 10, 'Как Вы понимаете обязанности работника в этой должности.?', 'Правильно ли представляет себе ответственность и круг обязанностей.', NULL),
  (180, '2007-03-17 16:34:11', 10, 'Какие у Вас есть основания считать, что Вы справитесь с этой должностью?', 'Уверен ли в своих силах, соответствует ли квалификация предлагаемой должности?', NULL),
  (181, '2007-03-17 16:34:11', 10, 'Какие у Вас есть основания считать, что Вы справитесь с этой работой?', 'Уверен ли в своих силах, соответствует ли квалификация предлагаемой должности?', NULL),
  (182, '2007-03-17 16:34:11', 10, 'Какими видами деятельности Вы предпочли бы заниматься?', 'Включает ли рассматриваемая должность эти виды деятельности?', NULL),
  (183, '2007-03-17 16:34:11', 10, 'какой отдых вы предпочтете: общение с друзьями или общение по интернету?', '', NULL),
  (184, '2007-03-17 16:34:11', 10, 'С какими документами работает кладовщик?', 'Представление о сопроводительных документах на товар.', NULL),
  (185, '2007-03-17 16:34:11', 10, 'С какими компьютерными программами Вы работали?', 'Quark, PageMaker, Mdisegr.', NULL),
  (186, '2007-03-17 16:34:11', 10, 'Умеет ли писать в режиме PDF?', 'Навыки.', NULL),
  (187, '2007-03-17 16:34:11', 10, 'Что входит в обязанности кладовщика?', 'Правильно ли представляет себе ответственность и круг обязанностей.', NULL),
  (188, '2007-03-17 16:34:11', 11, 'Имеете ли Вы желание продлжить свое професиональное обучение?', 'Выяснить, желает ли человек развиваться профессионально', NULL),
  (189, '2007-03-17 16:34:11', 11, 'Имеете ли Вы желание продолжить свое професиональное обучение?', 'Выяснить, желает ли человек развиваться профессионально', NULL),
  (190, '2007-03-17 16:34:11', 11, 'К каком объеме владеете английским языком?', 'Уровень знания?', NULL),
  (191, '2007-03-17 16:34:11', 11, 'Как Вы преодолевали проблемы в учебном процессе?', 'Определения способов решения проблем.(самостоятельность, руководящие и организаторские способности, предприимчивость, находчивость)', NULL),
  (192, '2007-03-17 16:34:11', 11, 'Как Вы преодолевали производственные проблемы?', 'Определения способов решения проблем.(самостоятельность, руководящие и организаторские способности, предприимчивость, находчивость)', NULL),
  (193, '2007-03-17 16:34:11', 11, 'Как определить эффективность работы менеджеров по продажам?', 'Выяснение знания обязанностей менеджеров, опыт руководства отделом', NULL),
  (194, '2007-03-17 16:34:11', 11, 'Как определить эффективность работы менеджеров по сбыту?', 'Выяснение знания обязанностей менеджеров, опыт руководства отделом', NULL),
  (195, '2007-03-17 16:34:11', 11, 'Как определить эффективность работы специалистов-технологов?', 'Выяснение знания обязанностей трехнологов, опыт руководства отделом', NULL),
  (196, '2007-03-17 16:34:11', 11, 'Какие виды договоров вы оформляли?', 'Выяснить уровень знаний договоров', NULL),
  (197, '2007-03-17 16:34:11', 11, 'Какие общественные посты Вы занимали?', 'Избирали ли его др. для руководства ими? Готов дли претендент к принятию ответственности?', NULL),
  (198, '2007-03-17 16:34:11', 11, 'Какие проблемы у Вас возникали в процессе работы и как Вы их решали?', 'К какому типу руководителя относится претендент?  (жёсткий / мягкий)', NULL),
  (199, '2007-03-17 16:34:11', 11, 'Какие формы документов ведутся в кадровом делопроизводстве?', 'Выяснить уровень знаний кадрового делопроизводства.', NULL),
  (200, '2007-03-17 16:34:11', 11, 'Какую работу необходимо провести, чтобы составить рассписание занятий?', 'Выяснить уровень знаний с специфике составления расписаний', NULL),
  (201, '2007-03-17 16:34:11', 11, 'Приходилось ли Вам подготавливать документы для аккредитации (лицензирования)?', 'Выяснить, есть ли опыт работы с гос.органами.', NULL),
  (202, '2007-03-17 16:34:11', 11, 'С какими гос.оганами Вы работалии какие вопросы решали?', 'Выяснить, есть ли опыт работы с гос.органами.', NULL),
  (203, '2007-03-17 16:34:11', 11, 'С какими документами Вы работали?', 'Выяснение уровень знаний делопроизводства', NULL),
  (204, '2007-03-17 16:34:11', 11, 'Сколько людей у Вас было в подчинении?', '', NULL),
  (205, '2007-03-17 16:34:11', 12, '1. Как вы можете охарактеризовать своего нынешнего (или последнего) работодателя?', 'Критика прежнего руководителя отрицательно характеризует этические принципы соискателя.', NULL),
  (206, '2007-03-17 16:34:11', 12, '2. Можете ли вы привести примеры, когда ваши работодатели вели себя неправильно по отношению к сотрудникам?', 'Готовность "вынести сор из избы"  отрицательно характеризует этические принципы соискателя.', NULL),
  (207, '2007-03-17 16:34:11', 12, '3. Если вы решите перейти на новую работу, как это скажется на подразделении и компании?', 'Безразличное отношение к прежней компании отрицательно характеризует этические принципы соискателя.', NULL),
  (208, '2007-03-17 16:34:11', 12, '4. Как скоро вы сможете перейти на новую работу, если получите устраивающее вас предложение? Почему именно в такие сроки?', 'Готовность в любую минуту бросить прежнюю компанию отрицательно характеризует этические принципы соискателя.', NULL),
  (209, '2007-03-17 16:34:11', 12, '5. Какую полезную информацию, связи, контакты вы сможете принести с собой на новую работу?', 'Готовность выдать коммерческую тайну и переманить клиентов прежней компании отрицательно характеризует этические принципы соискателя.', NULL),
  (210, '2007-03-17 16:34:11', 12, '6. Так, чтобы все было хорошо, практически никогда не бывает. Расскажите, пожалуйста, о недостатках в организации работы компании на вашем последнем месте.', 'Критика прежней компании отрицательно характеризует этические принципы соискателя.', NULL),
  (211, '2007-03-17 16:34:11', 12, '7. Каков был ваш среднемесячный доход в последние два года? В какой мере он позволял вам удовлетворять свои материальные потребности?', 'Соответствует ли доход уровню ЗП или были ещё какие-то доходы. Сможет ли ЗП на новом месте удовлетворять запросы или будет провоцировать к воровству.', NULL),
  (212, '2007-03-17 16:34:11', 12, '8. Это несколько деликатная тема, но, если не возражаете, каковы были ваши самые крупные единовременные расходы в последние два года?', 'Отказ от ответа, уклончивый ответ или расходы превышающие суммарный заработок говорят о  нетрудовых доходах.', NULL),
  (213, '2007-03-17 16:34:11', 12, '9. К кому из ваших прежних руководителей, коллег или деловых партнеров мы могли бы обратиться за отзывами о вас и вашей работе?', 'Длинный список говорит об уверенности в своей репутации.', NULL),
  (214, '2007-03-17 16:34:11', 12, 'А как насчет того, чтобы привести с собой клиентов?', 'При положительном ответе, после увольнения будет опасен для компании. (уведёт клиентов)', NULL),
  (215, '2007-03-17 16:34:11', 12, 'Как вы думаете, сможете ли вы привести с собой кого-нибудь из своих работников?', 'При положительном ответе, после увольнения будет опасен для компании, будет переманивать работников.', NULL),
  (216, '2007-03-17 16:34:12', 13, ' 1. Как проводится презентация товара (услуг)? Опишите технику продаж.', 'Выяснение навыков продаж', NULL),
  (217, '2007-03-17 16:34:12', 13, ' 1. Как проводится презентация товара? Опишите технику продаж.', 'Выяснение навыков продаж', NULL),
  (218, '2007-03-17 16:34:12', 13, '2. Назовите пожалуйста три основных функции или обязанности, по выполнению которых оценивалась успешность вашей деятельности?', 'Самооценка своих способностей. Выявление опыта работы, нужных навыков', NULL),
  (219, '2007-03-17 16:34:12', 13, '3. Назовите три функции или обязанности, которые доставляют вам наибольшее удовольствие? Почему?', 'Выявление отношения к предыдущей (нынещшней) работе, положительным моментам, настроения кандидата', NULL),
  (220, '2007-03-17 16:34:12', 13, '4. Назовите, пожалуйста три функции или обязанности, необходимость выполнения которых для вас неприятна или доставляет наименьшее удовольствие? Почему?', 'Выявление отношения к предыдущей работе, негативным моментам, определение настроения кандидата', NULL),
  (221, '2007-03-17 16:34:12', 13, '5. Расскажите о неудачной презентации. Что было плохо? Почему это случилось?', 'слабые стороны кандидата.', NULL),
  (222, '2007-03-17 16:34:12', 13, '6. Расскажите о самой успешной презентации, которую вы сделали? Где проводилась? Как вы к ней готовились?', '', NULL),
  (223, '2007-03-17 16:34:12', 13, '7. С каким товаром работали , опишите его достоинства и недостатки', 'уточнить знание рынка', NULL),
  (224, '2007-03-17 16:34:12', 13, '7. С каким товаром работали работали, опишите его достоинства и недостатки', 'уточнить знание рынка', NULL),
  (225, '2007-03-17 16:34:12', 13, '8.С какими клиентами работали, опишите их достоинства и недостатки', 'уточнить знание рынка', NULL),
  (226, '2007-03-17 16:34:12', 13, '9.Считаете ли ваш опыт достаточным для того, чтобы успешно выполнить рассматриваемую нами работу? Почему?', 'Оценка кандидатом своего опыта, своих способностей', NULL),
  (227, '2007-03-17 16:34:12', 13, 'В каких профессиональных вопросах вы считаете себя наиболее опытным?', '', NULL),
  (228, '2007-03-17 16:34:12', 13, 'ваш самый лучший договор?', 'уточнить заслуги менеджера', NULL),
  (229, '2007-03-17 16:34:12', 13, 'ваша неудача', 'проверить способность анализировать ситуацию, проверить насколько человек спообен отвечать за свои действия', NULL),
  (230, '2007-03-17 16:34:12', 13, 'Как проводится презентация товара? Опишите технику продаж.', 'Выяснение навыков продаж', NULL),
  (231, '2007-03-17 16:34:12', 13, 'Назовите пожалуйста три основных функции или обязанности, по выполнению которых оценивалась успешность вашей деятельности?', 'Самооценка своих способностей. Выявление опыта работы, нужных навыков', NULL),
  (232, '2007-03-17 16:34:12', 13, 'Назовите три функции или обязанности, которые доставляют вам наибольшее удовольствие? Почему?', 'Выявление отношения к предыдущей (нынещшней) работе, положительным моментам, настроения кандидата', NULL),
  (233, '2007-03-17 16:34:12', 13, 'Назовите, пожалуйста три функции или обязанности, необходимость выполнения которых для вас неприятна или доставляет наименьшее удовольствие? Почему?', 'Выявление отношения к предыдущей работе, негативным моментам, определение настроения кандидата', NULL),
  (234, '2007-03-17 16:34:12', 13, 'Расскажите о неудачной презентации. Что было плохо? Почему это случилось?', '', NULL),
  (235, '2007-03-17 16:34:12', 13, 'расскажите о самой успешной презентации, которую вы сделали? Где проводилась? Как вы к ней готовились?', '', NULL),
  (236, '2007-03-17 16:34:12', 13, 'с каким товаром работали работали, опишите его достоинства и недостатки', 'уточнить знание рынка', NULL),
  (237, '2007-03-17 16:34:12', 13, 'с каким товаром работали работали, опишите их достоинства', 'уточнить знание рынка', NULL),
  (238, '2007-03-17 16:34:12', 13, 'с какими клиентами работали, опишите их достоинства и недостатки', 'уточнить знание рынка', NULL),
  (239, '2007-03-17 16:34:12', 13, 'с какими операторами работали, опишите их достоинства', 'уточнить знание рынка', NULL),
  (240, '2007-03-17 16:34:12', 13, 'Считаете ли ваш опыт достаточным для того, чтобы успешно выполнить рассматриваемую нами работу? Почему?', 'Оценка кандидатом своего опыта, своих способностей', NULL),
  (241, '2007-03-17 16:34:12', 13, 'Что вам нравилось на предыдущей работе (нравится на нынешней работе)? Почему?', '', NULL),
  (242, '2007-03-17 16:34:12', 13, 'Что из вашего предыдущего опыта работы может быть особенно ценным для выполнения работы, о которой мы говорим?', 'Оценка кандидатом своих сил', NULL),
  (243, '2007-03-17 16:34:12', 14, 'Аксессуары', 'Соответствие колличества, стиля.', NULL),
  (244, '2007-03-17 16:34:12', 14, 'Если бы ваша организация предоставляла бесплатное медицинское обслуживание, какие услуги вы бы выбрали?', 'Состояние здоровья', NULL),
  (245, '2007-03-17 16:34:12', 14, 'Макияж', 'Умеет ли пользоваться косметикой', NULL),
  (246, '2007-03-17 16:34:12', 14, 'Обувь', 'Стиль обуви, частота', NULL),
  (247, '2007-03-17 16:34:12', 14, 'Прическа', 'Аккуратно уложенные волосы', NULL),
  (248, '2007-03-17 16:34:12', 14, 'Руки', 'Маникюр.', NULL),
  (249, '2007-03-17 16:34:12', 14, 'Стиль одежды', 'Деловой стиль', NULL),
  (250, '2007-03-17 16:34:12', 15, 'Делопроизводство', 'Документооборот', NULL),
  (251, '2007-03-17 16:34:12', 15, 'Знание кадрового делопроизводства?', '', NULL),
  (252, '2007-03-17 16:34:12', 15, 'Знание компьютера', 'Как поставить оглавление и указатели.', NULL),
  (253, '2007-03-17 16:34:12', 15, 'Знание языка', 'Разговорный английский язык - знакомы ли  экономические термины.', NULL),
  (254, '2007-03-17 16:34:12', 15, 'Иностранные языки', 'Рассказ на итальянском. Как будет звучать фраза- имеются ли у Вас в уборной женские гигиенические средства. Извините', NULL),
  (255, '2007-03-17 16:34:12', 15, 'Как поставить оглавления и указатели в программе Word.', 'На сколько владеет компьютерными программами.', NULL),
  (256, '2007-03-17 16:34:12', 15, 'Какие формы документов Вы знаете в кадровом делопроизводстве?', 'На сколько владеет знаниями в кадрах', NULL),
  (257, '2007-03-17 16:34:12', 15, 'Какую статью пишем при увольнении по собственному желанию?', '', NULL),
  (258, '2007-03-17 16:34:12', 15, 'Напишите диктант', 'проверка грамоттности', NULL),
  (259, '2007-03-17 16:34:12', 15, 'Телефонный этикет', 'Сколько времени удерживает на линии. Вежливость. Манера общения (официальная, корректная).', NULL),
  (260, '2007-03-17 16:34:12', 15, 'Что такое Bat? Как с ним работать?', 'знание программы', NULL),
  (261, '2007-03-17 16:34:12', 15, 'Что такое Word? Exel? Чем эти программы отличаются друг от друга? Как с ними можно работать?', 'знание программ', NULL),
  (262, '2007-03-17 16:34:12', 15, 'Что такое Word? Exel? Чем эти программы отличаются друг от друга? Кака с ними можно работать?', 'знание программ', NULL),
  (263, '2007-03-17 16:34:12', 16, 'В чем обязанности программиста', '', NULL),
  (264, '2007-03-17 16:34:12', 16, 'Есть ли опыт превода технической документации на итальянском языке.', 'Уровень профессионализма.', NULL),
  (265, '2007-03-17 16:34:12', 16, 'Есть ли опыт работы на ПК, с оргтехникой', 'Уровень профессионализма.', NULL),
  (266, '2007-03-17 16:34:12', 16, 'Есть ли опыт работы на станках с ЧПУ ,  металлорежущих станках ,на установке ХЕБР-1а.', 'Уровень профессионализма.', NULL),
  (267, '2007-03-17 16:34:12', 16, 'Знание английского языка', 'Знание язака', NULL),
  (268, '2007-03-17 16:34:12', 16, 'Знание итальянского языка', 'Знание язака', NULL),
  (269, '2007-03-17 16:34:12', 16, 'какие программы вы знаете? На каком уровне', 'знание программ', NULL),
  (270, '2007-03-17 16:34:12', 16, 'Опыт работы в автомобильной фирме', 'Какие знание по автобухгалтерии.', NULL),
  (271, '2007-03-17 16:34:12', 16, 'Проходили ли вы специальное обучение по специфике продаж, выкладке товара и т.д. ?', '', NULL),
  (272, '2007-03-17 16:34:12', 16, 'Что входит в обязанности торгового представителя?', '', NULL),
  (273, '2007-03-17 16:34:12', 16, 'Что такое Word и что такое Exel?чем они различаются', 'уровень знаний программ', NULL),
  (274, '2007-03-17 16:34:12', 17, 'В чем заключается понятие инновационный менеджмент', 'Выяснить профессиональные знания', NULL),
  (275, '2007-03-17 16:34:12', 17, 'В чем заключается понятие стратегический менеджмент', 'Выяснить профессиональные знания', NULL),
  (276, '2007-03-17 16:34:12', 17, 'Как Вы планируете строить работу с подчиненными, формировать отдел.', 'Выявить стиль руководства, лидерские способности, акценты в работе.', NULL),
  (277, '2007-03-17 16:34:12', 17, 'Каковы основные функции работы супревайзера', 'Выяснить знание профессии', NULL),
  (278, '2007-03-17 16:34:12', 17, 'Что вы будете делать, когда станете супервайзером', 'Выяснить знание профессии. Конкретный механизм работы.', NULL),
  (279, '2007-03-17 16:34:12', 18, 'В чем особенности кредитования юридических и физических лиц?', 'Представление о профессии', NULL),
  (280, '2007-03-17 16:34:12', 18, 'В чем особенности продажи кредитных услуг?', 'Представление о профессии', NULL),
  (281, '2007-03-17 16:34:12', 18, 'Какие кредитные услуги находят наибольший спрос у физических и юридических лиц?', 'Представление о профессии', NULL),
  (282, '2007-03-17 16:34:12', 18, 'Предложите мне воспользоваться Вашими кредитными услугами?', 'Профессионализм продавца кредитов', NULL),
  (283, '2007-03-17 16:34:12', 18, 'Расскажите о ключевых игроках, оказывающих кредитные услуги на территории нашего рынка?', 'Знание розничного банковского сектора РФ', NULL),
  (284, '2007-03-17 16:34:12', 19, 'были ли в вашей работе конфликтные ситуации? Расскажите как вы их решали', 'умение кандидата разрешать конфликты позитивно', NULL),
  (285, '2007-03-17 16:34:12', 19, 'Как вы будете вести себя, если на вас будут "давить" коллеги?', 'умение кандидата сотрудничать, идти на компромисс', NULL),
  (286, '2007-03-17 16:34:12', 19, 'как вы ладите с различными типами людей?', 'проверить понимание кандидатом смысла команды', NULL),
  (287, '2007-03-17 16:34:12', 19, 'как вы умеете работать в коллективе', 'проверка кандидата на коммуникабельность и доброжелательность', NULL),
  (288, '2007-03-17 16:34:12', 19, 'можете ли вы описать, в каких случаях вам лучше работать в одиночку, а когда в команде?', 'как кандидат понимает работу в команде', NULL),
  (289, '2007-03-17 16:34:12', 19, 'обратить внимание на речь, стиль общения кандидата на собеседовании, как отвечает на шоковые вопросы, поведение в стрессовых ситуациях', '', NULL),
  (290, '2007-03-17 16:34:12', 19, 'Опишите мне ваш бывший коллектив? Кокие люди вам больше нравятся', 'проверка кандидата на коммуникабельность и доброжелательность', NULL),
  (291, '2007-03-17 16:34:12', 19, 'Расскажите мне о трудных ситуациях в работе, как вы с ними справлялись?', 'умение кандидата разрешать конфликты позитивно', NULL),
  (292, '2007-03-17 16:34:12', 19, 'что больше всего вас раздражает в работе?', 'отношение к поведению коллег и клиентов', NULL),
  (293, '2007-03-17 16:34:12', 19, 'Что вы будете делать, если на вас будет "давить" руководитель или коллеги по работе?', 'стрессоустойчивость кандидата,', NULL),
  (294, '2007-03-17 16:34:12', 19, 'Что вы будете делать, если на вас будет "давить"руководитель,', 'стрессоустойчивость кандидата,', NULL),
  (295, '2007-03-17 16:34:12', 20, 'Вы готовы оставаться сверхурочно, если это необходимо для компании?', 'мотивация к труду, материальная заинтересованность', NULL),
  (296, '2007-03-17 16:34:12', 20, 'Готовы ли Вы переехать в дгугой город?', '', NULL),
  (297, '2007-03-17 16:34:12', 20, 'Готовы ли Вы переехать в другой город?', '', NULL),
  (298, '2007-03-17 16:34:12', 20, 'Как вы поймете, что предложенная вам вакансия подходит?', 'Выявить суть принятия решения, подтвердить результаты теста мотивации.', NULL),
  (299, '2007-03-17 16:34:12', 20, 'Какие у Вас профессиональные планы на 3-5 лет?', 'Целеустремленность', NULL),
  (300, '2007-03-17 16:34:12', 20, 'Какой доход Вы планируете получать?', 'Самооценка', NULL),
  (301, '2007-03-17 16:34:12', 20, 'Кем вы видите себя через 1 год', 'Целеустремленность', NULL),
  (302, '2007-03-17 16:34:12', 20, 'кем вы видите себя через 3 мес., 1 год, 3 года?', 'Целеустремленность', NULL),
  (303, '2007-03-17 16:34:12', 20, 'кем вы видите себя через 5 лет?', 'Целеустремленность', NULL),
  (304, '2007-03-17 16:34:12', 20, 'На какой стартовый уровень з/п Вы рассчитываете?', 'Самооценка', NULL),
  (305, '2007-03-17 16:34:12', 20, 'На какой стартовый уровень з/п Вы расчитываете?', 'Самооценка', NULL),
  (306, '2007-03-17 16:34:12', 20, 'почему вы ищите работу?', 'претензии к характеру прежней работы, к условиям труда, размеру оплаты и бывшему руководителю', NULL),
  (307, '2007-03-17 16:34:12', 20, 'Почему Вы хотите получить эту работу?', 'Выяснить, что привлекает в данном предложении', NULL),
  (308, '2007-03-17 16:34:12', 20, 'Почему вы хотите сменить работу?', '', NULL),
  (309, '2007-03-17 16:34:12', 20, 'Что заинтересовало вас в данной вакансии?', 'Узнать у кандидата, на что он расчитывает', NULL),
  (310, '2007-03-17 16:34:12', 20, 'Что нужно, чтобы ваши планы осуществились?', '', NULL),
  (311, '2007-03-17 16:34:12', 21, 'Знание технологии приготовления блюд, калькуляции.', 'Профессионализм', NULL),
  (312, '2007-03-17 16:34:12', 21, 'как вы воспринимаете критику в свой адрес? Приведите пример критики. Которая оказалась для вас полезной', 'стрессоустойчивость', NULL),
  (313, '2007-03-17 16:34:12', 21, 'как вы оцениваете успешность своей жизни и карьеры? Почему ваши оценки таковы? На чем они основываются?', '', NULL),
  (314, '2007-03-17 16:34:12', 21, 'какие качества вы хотели бы в себе развить или улучшить', 'желание к саморазвитию', NULL),
  (315, '2007-03-17 16:34:12', 21, 'Каким образом организовывался рабочий процесс коллектива?', 'Организаторские способности', NULL),
  (316, '2007-03-17 16:34:12', 21, 'Опишите идеального подчиненного, которого вы бы хотели иметь?', '', NULL),
  (317, '2007-03-17 16:34:12', 21, 'Опишите идеального руководителя, которому вы бы с удовольствием подчинялись. как он должен выглядеть, какими качествами обладать?', '', NULL),
  (318, '2007-03-17 16:34:12', 21, 'приведите три примера, когда вас критиковали и за что?', 'отношение к критике', NULL),
  (319, '2007-03-17 16:34:12', 21, 'расскажите о какой-нибудь конфликтной ситуации, в которую вы были вовлечены. Каковы были ваши действия?', 'умение разрешать конфликты', NULL),
  (320, '2007-03-17 16:34:12', 21, 'Самокритичный ли вы человек? Приведите пример на вашу самооценку.', '', NULL),
  (321, '2007-03-17 16:34:12', 21, 'Умение составлять меню, технологических карт.', 'Профессионализм', NULL),
  (322, '2007-03-17 16:34:12', 21, 'что такое "хороший коллектив", каковы его основные признаки? Приходилось ли вам работать в хорошем коллективе?', 'представление о хорошем коллективе', NULL),
  (323, '2007-03-17 16:34:12', 22, 'Знание составления меню, технологических карт.', 'Профессионализм', NULL),
  (324, '2007-03-17 16:34:12', 22, 'Знание технологии приготовления блюд, знание калькуляции.', 'Профессионализм', NULL),
  (337, '2007-03-17 16:34:12', 24, 'В чем заключается работа контролера ОТК?', 'сличение параметров продукции с показателями, указанными в ГОСТах, чертежах, технологической документации', NULL),
  (338, '2007-03-17 16:34:12', 24, 'Какими качествами на ваш взгляд должен обладать контролер ОТК', 'внимательность, требовательность, принципиальность, добросовестность, аккуратность, неторопливость, педантичность, развитой памятью, хорошее зрение, устойчивую зрительную работоспособность, помехоустойчивость, собранность', NULL),
  (339, '2007-03-17 16:34:12', 24, 'Какими приборами проверяются изделия?', 'контрольно-измерительные приборы: микрометр, штангенциркуль, калибры, лупы, микроскоп, электроизмерительные приборы и др', NULL),
  (340, '2007-03-17 16:34:12', 24, 'Назовите причины производства некачественной продукции (брака)?', 'неотлаженное оборудование, некачественный материал, дефекты заготовок; неквалифицированность, небрежность, невнимательность рабочих', NULL),
  (341, '2007-03-17 16:34:12', 24, 'Опишите основные функции котролера ОТК', 'проверка изделия, проставление клейма-свидетельства контроля, оформление сопроводительной документации, дефектных ведомостей, выявление брака и его причин.', NULL),
  (342, '2007-03-17 16:34:12', 24, 'Опишите рабочее место контролера ОТК. Каким на ваш взгляд оно должно быть?', 'хорошее освещение, специально оборудованное', NULL),
  (343, '2007-03-17 16:34:12', 24, 'Что должен знать контролер ОТК', 'технологию производства, процесс работы, чтение чертежей, использование контрольно-измерительных инструментов', NULL),
  (344, '2007-03-17 16:34:12', 25, 'Какие виды отчетов вы знаете.', 'Профессионализм.', NULL),
  (345, '2007-03-17 16:34:12', 25, 'Какие нормативные акты вам как специалисту по страхованию необходимо знать.', 'Профессионализм.', NULL),
  (346, '2007-03-17 16:34:12', 25, 'Каким образом вы будете осуществлять поиск и превлечение клиентов.', 'Профессионализм.', NULL),
  (347, '2007-03-17 16:34:12', 25, 'Каким образом производится расчет тарифов.', 'Профессионализм.', NULL),
  (348, '2007-03-17 16:34:12', 25, 'Объясните что такое пролонгация.', 'Профессионализм.', NULL),
  (349, '2007-03-17 16:34:12', 25, 'Опишите порядок заключения и оформления договоров страхования.', 'Профессионализм.', NULL),
  (350, '2007-03-17 16:34:12', 25, 'Расскажите правила "Обязательного страхования гражданской ответственности владельцев транспортных средств".', 'Профессионализм.', NULL),
  (351, '2007-03-17 16:34:12', 27, 'Для чего необходимо осуществлять акты сверки?', 'Чтобы организация сверила свою дебиторскую и кредиторскую задолженность.', NULL),
  (352, '2007-03-17 16:34:12', 27, 'Если денежные средства поступили в организацию, но товар не отгружен, в какую книгу вносится запись полученной суммы?', 'В книгу покупок.', NULL),
  (353, '2007-03-17 16:34:12', 27, 'Если организация закупает товар, укажите проводки по бухгалтерскому учету.', '', NULL),
  (354, '2007-03-17 16:34:12', 27, 'Какая проводка осуществляется при продаже товара?', '', NULL),
  (355, '2007-03-17 16:34:12', 27, 'Укажите проводку по НДС (налог на добавленную стоимость).', 'Дебет: 68 (расчет по НДС), Кредит: 19 (Налог на добавленную стоимость)', NULL),
  (356, '2007-03-17 16:34:12', 28, 'Как определяется оценка имущества, приобретенного за оплату?', 'Путем суммирования фактически произведенных затрат на его покупку.', NULL),
  (357, '2007-03-17 16:34:12', 28, 'Как определяется полная фактическая себестоимость раелизаванной продукции?', 'Вычитанием из производственной себестоимости остатков незавершенного производства.', NULL),
  (358, '2007-03-17 16:34:12', 28, 'Какой способ оценки материаловв большей степени уменьшит прибыль в период инфляции?', 'ЛИФО.', NULL),
  (359, '2007-03-17 16:34:12', 28, 'Назовите основные виды лизинга.', 'Финансовый лизинг, возвратный лизинг, оперативный лизинг.', NULL),
  (360, '2007-03-17 16:34:12', 28, 'При осуществлении финансового лизинга, на каком балансе учитывается предмет лизинга?', 'Учитывается на балансе лизингодателя или лиз-ингополучателя по соглашению сторон.', NULL),
  (361, '2007-03-17 16:34:12', 28, 'Что включает в себя себестоимость готовой продукции?', '1. Затраты связанные с производством и реализацией продукцией. 2. Затраты на обеспечение предприятия рабочей силой. 3. Отчисления в различные фонды и бюджеты. 4. Затраты на содержание, обслуживание и управление предприятием.', NULL),
  (362, '2007-03-17 16:34:12', 28, 'Эффект операционного рычага определяется отношением:', 'Маржинального дохода к прибыли.', NULL),
  (363, '2007-03-17 16:34:12', 29, 'Где учитывается поступления и выдачи наличных денег?', 'Учитываются в кассовой книге.', NULL),
  (364, '2007-03-17 16:34:12', 29, 'Как часто заполняется справка-отчет кассира-операциониста?', 'Каждый день.', NULL),
  (365, '2007-03-17 16:34:12', 29, 'Каким документом установлен порядок хранения, расходования и учета денежных средств в кассе?', '', NULL),
  (366, '2007-03-17 16:34:12', 29, 'Кто должен вести журнал кассира-операциониста?', 'Кассир-операционист.', NULL),
  (367, '2007-03-17 16:34:12', 29, 'Кто устанавливает для предприятия лимит денежных средств в кассе?', '', NULL),
  (368, '2007-03-17 16:34:12', 29, 'Может ли кассовая книга вестись автоматизированным способом?', 'Да, допускается', NULL),
  (369, '2007-03-17 16:34:12', 29, 'Можно ли делать исправления в приходных и расходных кассовых ордерах? А в кассовой книге?', 'Нет ни в коем случае, это уголовная ответственность.', NULL),
  (370, '2007-03-17 16:34:12', 29, 'На кого возлагается контроль за правильным ведение кассовой книги?', 'Возлагается на главного бухгалтера.', NULL),
  (371, '2007-03-17 16:34:12', 29, 'На кого возлагается обязанность оборудовать кассу в целях обеспечения сохранности денег в помещении кассы?', 'Возлагается на руководителя организации.', NULL);

-- 
-- Вывод данных для таблицы customer
--
INSERT INTO customer VALUES 
  (1, '2011-02-27 20:03:50', '2009-06-23 00:00:00', NULL, 2, NULL, 'газета "Работа для ВАС"', 'ООО газета "Работа для ВАС"', '2001-10-12 00:00:00', 'выпуск газеты вакансий', NULL, '8482', '8-17, перерыв 12-13, выходной: суббота, воскресенье.', '38-15-00 администратор Светлана', '38-15-00 доп 132', '89834982810', 'rdw@mail.ru', 'rabota.ru', '7602864', 'rdw-gazeta', '445030, Тольятти, Цветной б-р, 33', '');

-- 
-- Вывод данных для таблицы profile
--
-- Таблица не содержит данных

-- 
-- Вывод данных для таблицы career
--
INSERT INTO career VALUES 
  (1, '2010-12-29 22:02:35', 1, '1990-11-27 00:00:00', '1992-02-25 00:00:00', 'ВАЗ', NULL, '', 'машинистка 1 категории', 'перевод', '', '', '', '', NULL, 0),
  (2, '2007-03-17 16:58:44', 1, '1992-02-26 00:00:00', '1992-08-27 00:00:00', 'СП "Лада-Лонро-Корпорейшн"', NULL, '', 'секретарь-машинистка', 'истечение срока договора', '', '', '', '', NULL, 0),
  (3, '2007-03-17 16:58:44', 1, '1992-09-04 00:00:00', '1995-10-12 00:00:00', 'ТОО "Терра"', NULL, '', 'секретарь-делопроизводитель', 'неудобство в работе из-за отсутствия компьютера', 'Богуш П.С.', '', '', '', NULL, 0),
  (4, '2007-03-17 16:58:44', 1, '1995-10-17 00:00:00', '1996-03-19 00:00:00', 'Рекламное агентство "Компрэл"', NULL, '', 'менеджер по рекламе', 'низкая з/пл', 'Пестов О.П.', '', '', '', NULL, 0),
  (5, '2011-02-10 21:24:02', 1, '1998-02-12 00:00:00', '2003-03-14 00:00:00', 'ТОО аудиторская фирма "Аккурат"', NULL, 'Аудиторский учет', 'секретарь-референт', 'собственное желание', 'Свиридов Ю.М.', 'генеральный директор', '45-36-81', 'C:\\coding\\SuperSTAFF\\Delphi\\Recruit\\Склад\\Базовое.gif', 'Оформление учебных и очередных отпусков, листков нетрудоспособности.\r\nОбеспечение офиса канстоварами и хозтоварами. Проведение конвертаций в пенсионном фонде РФ Оформление учебных и очередных отпусков, листков нетрудоспособности.', 1),
  (6, '2007-03-17 16:58:44', 1, '2003-03-17 00:00:00', NULL, 'ООО "Поллукс"', NULL, '', 'инспектор по кадрам', '', 'Подольский Николай Антонович', 'директор', '635185', '', NULL, 0);

-- 
-- Вывод данных для таблицы children
--
-- Таблица не содержит данных

-- 
-- Вывод данных для таблицы education_add
--
-- Таблица не содержит данных

-- 
-- Вывод данных для таблицы education_base
--
INSERT INTO education_base VALUES 
  (1, '2011-03-08 17:17:40', 1, 1990, 1994, 'Самарский институт управления', 'Самара', 1, 20, 'Управление городским хозяйством'),
  (2, '2011-03-08 17:02:19', 1, 1997, 1998, 'Финансово-экономический техникум', 'Самара', 3, 545, 'Расчет заработной платы муниципальных служащих'),
  (4, '2011-03-08 17:02:02', 1, 2003, 2004, 'Международный Институт Рынка', 'Тольятти', 3, 27, 'экономист- менеджер');

-- 
-- Вывод данных для таблицы language
--
INSERT INTO language VALUES 
  (1, '2011-03-08 14:56:09', 1, 2, 2),
  (2, '2011-03-08 14:56:10', 1, 3, 2),
  (3, '2011-03-08 14:56:12', 1, 1, 1);

-- 
-- Вывод данных для таблицы marketing
--
INSERT INTO marketing VALUES 
  (1, '2011-03-08 14:57:56', 1, '2003-02-26 00:00:00', 7, 2, 2, 'Иванов Иван Иванович', 'получен заказ'),
  (2, '2011-03-08 14:57:57', 1, '2003-02-26 00:00:00', 4, NULL, 1, NULL, '');

-- 
-- Вывод данных для таблицы personnel
--
INSERT INTO personnel VALUES 
  (1, '2011-03-08 19:26:03', 1, 'Семёнова', 'Ирина', 'Владимировна', NULL, 'администратор базы данных', NULL, NULL, NULL, NULL, NULL, NULL);

-- 
-- Вывод данных для таблицы placement
--
INSERT INTO placement VALUES 
  (1, '2011-03-08 20:25:40', 1, '2011-03-08 00:00:00', 'Нету вакансии', 1, '12345', '2011-03-08 00:00:00', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '<Region></Region><Family></Family><Formation></Formation><Language></Language><Profession></Profession><Speciality></Speciality><Program></Program><AgeMin>0</AgeMin><AgeMax>0</AgeMax><Salary>0</Salary><Sex>0</Sex><A>0</A><B>0</B><C>0</C><D>0</D><E>0</E><Overtime>0</Overtime><Smoking>0</Smoking><UseCar>0</UseCar><Trip>0</Trip>');

-- 
-- Вывод данных для таблицы profession
--
INSERT INTO profession VALUES 
  (1, '2011-03-08 15:02:48', 1, 4),
  (2, '2011-03-08 15:02:49', 1, 16),
  (3, '2011-03-08 15:02:50', 1, 76);

-- 
-- Вывод данных для таблицы program
--
INSERT INTO program VALUES 
  (1, '2011-03-08 15:03:45', 1, 1, 1),
  (2, '2011-03-08 15:03:46', 1, 2, 1),
  (3, '2011-03-08 15:03:46', 1, 727, 1),
  (4, '2011-03-08 15:03:47', 1, 771, 2),
  (5, '2011-03-08 15:03:48', 1, 804, 2);

-- 
-- Вывод данных для таблицы review
--
INSERT INTO review VALUES 
  (1, '2011-03-08 15:07:29', 1, '2007-03-13 00:00:00', 1, 'ООО фирма "СТАФФ"', 'Тюстина Елена Валентиновна', 'консультант по подбору персонала', '38-57-33', 'Умница! Учились вместе в иституте. Умеет слушать, внимательная, ответственная, внимательная. Семья порядочная: отец - бывший военный, мама- администратор стадиона "Торпедо".', ''),
  (2, '2011-03-08 15:07:30', 1, '2006-12-21 00:00:00', 1, 'ООО "Торговый Дом ТЕНОРЕ"', 'Попов Андрей', 'супервайзер', '89277774434', 'Отличный специалист, организатор, высокий уровень компетенции. Душа компании, отзывчивый на помощь, проявляет лояльность к компании. Заслуживает повышение в должности.', ''),
  (3, '2011-03-08 15:07:31', 1, '2006-08-18 00:00:00', 1, 'ООО "Средняя Волга"', 'Малецкая Ирина', 'главный бухгалтер', '20-60-40', 'В целом с работой справлялась хорошо.', 'В последнее время работала без энтузиазма.'),
  (4, '2011-03-08 15:07:32', 1, '2006-11-27 00:00:00', NULL, 'Раберман', 'Сафонов Вячеслав', 'ген.директор', '43-74-30', 'Профессионально граммотная, четко расставляла задачи перед персоналом, граммотная, энергичная, притензий к работе не было.', 'притензии личного характера.'),
  (5, '2011-03-08 15:07:33', 1, '2006-08-14 00:00:00', 1, 'ООО "ПРЕМЬЕРА"', 'Сипко Владимир Владимирович', 'главный бухгалтер', '351-990', 'хороший профессионал, с обязанностями справлялась, с коллективом ладила', 'обидчива'),
  (6, '2011-03-08 15:07:33', 1, '2007-03-21 00:00:00', 1, 'ООО газета "Работа для Вас"', 'Лёушкин', 'гл.редактор', NULL, 'Достаточно хорошее представление об управлении продажами.', 'Не знакома с нашей спецификой.');

-- 
-- Вывод данных для таблицы criterion
--
-- Таблица не содержит данных

-- 
-- Вывод данных для таблицы history
--
-- Таблица не содержит данных

-- 
-- Включение внешних ключей
-- 
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
SET foreign_key_checks = 1
