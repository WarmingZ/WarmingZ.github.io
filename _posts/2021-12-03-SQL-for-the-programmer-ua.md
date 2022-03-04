---
title: Бази даних для програмістів - Частина 1🗂️
layout: post
subtitle: Розглядаємо прості серверні запити SQL
date: '2021-12-02 17:10:39'
background: "/img/AmAZUHZ.webp"
categories: SQL Tech Translated
lang: ua
lang-ref: sql
image: /img/posts/Database/imageDatabase.jpg
description: Розглядаємо прості серверні запити SQL
---
<a href="https://dev.mysql.com/doc/"><img src="/img/posts/Database/SQL.png" style="width:128px;max-width:100%;" align="right"></a>
Недавно я почав вивчати бази даних, а саме SQL🤓. На основі цього, я хочу поділитись з вами інформацією, яку я засвоїв під час мого навчання. Я буду продовжувати писати про дану тему, бо описати все в одному пості неможливо. Також заздалегідь хотілось би сказати що я розглядаю бази даних з боку програміста і як ними користуватись програмісту👨‍💻. Це не буде технічним посібником, завдяки якому ви зможете вивчити SQL, але я сподіваюсь, що я зможу зацікавити людей, які нічого не знають про бази даних і можливо показати щось нове людям які з цим працюють.

<img src="/img/posts/Database/imageDatabase.webp" alt="Network" class="responsive" style="width: 100%; height: auto;">

***

### A little theory 🥱

Для початку, як завжди, необхідно розібратись з термінологією. На жаль без цього ніяк. Отже, насамперед необхідно дати визначення, що взагалі таке база даних?<br>
`База даних` — це дані, які організовані по деякім правилам і якими можна керувати дотримуючись певних правил.

Звичайним прикладом бази даних є ієрархія папок на вашому жорсткому диску. Ці папки ви зазвичай організовуєте за своїми правилами, наприклад папки з фотографіями, які акуратно розфасовані по роках у своїй операційній системі.

Цей приклад допоможе нам зрозуміти що таке СУБД. Адже систему управління базами даних, ми можемо уявити собі як вашу операційну систему, в якій розташовані папки з фотографіями.<br>
`Система управління базами даних` ( СУБД ) - це програмний засіб, який дозволяє забезпечити створення і використання бази даних.
І нарешті пора дати визначення SQL. Це декларативна мова структурованих запитів, яка залучається для керування даними в реляційних базах даних. Бази даних SQL побудовані на реляційній моделі, тобто дані можуть зберігатися в таблицях, які логічно пов'язані один з одним через загальні значення, тому немає потреби в додатковій інформації, щоб зв'язати їх разом. Одна з найважливіших особливостей баз даних SQL - те, що вони нормалізовані. Це означає, що в кожній базі даних SQL є як мінімум дві таблиці, які, по можливості, слід об'єднувати разом, оскільки це знижує надмірність і спрощує введення даних.

*** 

### Команди для взаємодії з сервером SQL 💾

Отже, для того, аби попрацювати з базами даних я встановив докер з SQL сервером. Інструкцію зі встановлення та налаштування цієї програми ви можете <a href="https://docs.docker.com/get-started/"><img src="/img/posts/Database/docker.png" style="width:128px;max-width:100%;" align="right"></a>
 знайти в інтернеті. Також не складе важкості знайти для себе тестову базу даних, дамп якої, ви можете завантажити на свій сервер Docker.
  Якщо ви завантажили Docker, але не знаєте як запустити контейнер з сервером MySQL просто введіть команду в термінал- “docker pull mysql”.
Далі для того аби запустити контейнер з образом та параметрами напишіть в терміналі - “docker run --name example-mysql -e MYSQL_ROOT_PASSWORD=pass -d mysql”. Замість “example” можете ввести будь-яку назву. Надалі для того аби під'єднатися до нашого СУБД потрібно буде ввести команду - “docker exec -it example-mysql mysql -uroot -ppass”.<br>
Тепер для взаємодії з нашим сервером ось декілька команд:

- Перегляд баз даних на сервері - ( `show databases;` )
- Перемикнутися на базу даних - ( `use nameDatabase;` )
- Перегляд таблиць в базі даних - ( `show tables;` )
- Перегляд колонок - ( `describe Example;` )

Далі, якщо ви знайшли для себе тестову базу даних в інтернеті, для імпорту нового дампу використовуємо команду - `docker exec -i example-mysql mysql -uroot -ppass <example.sql.`. В цьому випадку example.sql - це назва файлу нашого дампу. І таку саму команду ми вводимо для імпорту даних, змінивши ім’я файлу. Звісно ви можете знайти інший спосіб для встановлення SQL серверу без Docker. Я просто демонструю як варіант використання серверу SQL.

*** 

### Простий запит SELECT 🌪️

Також варто запам’ятати що `Sql` - це декларативна мова, мається на увазі що ми не даємо команди компілятору або інтерпретатору мови, а ми описуємо бажаний результат, який ми хочемо отримати.

Першим моїм запитом до бази даних звісно був усім добре знайомий Select. Виглядав він приблизно так - `select * from table_name;`. Не знаю чи потрібно пояснювати даний запит, але можливо взагалі не знайомій людині з SQL - буде цікаво. Select - означає вибрати, а зірочка “*” означає що ми дістаємо всі дані які внесені в таблицю, ну і відповідно From означає з якої таблиці.

Також ми можемо витягнути дані з декількох колонок, одразу перейменувавши їх. Варто зазначити, що ці запити не вносять ніяких змін на сервер. <br>
 Ввівши таку команду на сервер:<br>
  `SELECT name NewName, example as NewID FROM eaxample;` <br>
   ми отримаємо приблизно такий вивід в термінал.

  |----------+-------|
  |  NewName | NewID |
  |----------+-------|
  | Value 1  | 0     |
  |----------+-------|
  | Value 2  | 1     |
  |----------+-------|
  {: .table .table-responsive}

Розібравши даний запит, можна зрозуміти логіку роботи практично всіх запитів SQL. Звучить запит приблизно так — вибрати дані з колонки name ( `NewName` в цьому випадку — це не явне перейменовування колонки в виводі ) , і колонки example ( де ключове слово as означає явне перейменування колонки example на `NewID` ), з таблиці example.
Також ми можемо проводити математичні операції над числами на сервері ( не знаю кому це потрібно, але це цікаво демонструє можливості MySQL ). Для прикладу напишемо такий запит: <br>
 `select 5 / 3 as result;` <br>
 і отримаємо результат ділення який відображається в колонці `result`.

  | result |
  |--------|
  | 1.6667 |
  {: .table .table-responsive}

Звучить не дуже складно, адже це простий запит на сервер для отримання інформації з бази даних. У своїй практиці, я помітив що більшість запитів на сервер з базою даних SQL відбувається простими select запитами не використовуючи агреговані функції. Але бувають випадки коли необхідно писати специфічні запити, задля отримання даних, які можуть бути одразу відфільтрованими абощо.

***

### Фільтрація результатів за допомогою WHERE 💡

Для фільтрації результатів я вибрав таблицю користувачів. Це наочно продемонструє роботу параметру where.
Для прикладу, в мене є таблиця з іменами та даними користувачів якогось сайту. Допустимо я хочу отримати дані одного користувача. Мій запит буде виглядати наступним чином: <br>
 `select * from user where first_name='Madelle';` <br>
  Тут ми вибираємо все з таблиці `user` і потім використовуємо ключове слово `where`, де в стовпці `first_name` ми шукаємо ім’я Madelle. Зараз ми отримали не всю інформацію про користувача, а просто відфільтрували його серед усіх користувачів. Так само ми можемо вивести потрібну нам інформацію про цього користувача <br> `select first_name, last_name, user_id from user where first_name='Madelle';` <br> Де ми створюємо запит на сервер, аби отримати id користувача в системі, ім’я та фамілію. І ось такий результат ми отримуємо.

  |------------+-----------+---------|
  | first_name | last_name | user_id |
  |------------+-----------+---------|
  | Madelle    | Jonathan  | 8209    |
  |------------+-----------+---------|
  {: .table .table-responsive}

Якщо забрати цю умову, то ми можемо вивести ім’я, прізвище та id всіх користувачів сайту, які внесені в базу даних - `select first_name, last_name, user_id from user;`. <br>
Загалом, where дуже гнучкий інструмент. Він може задовільнити практично будь-які потреби в фільтрації даних. Я не буду перераховувати всі можливості параметру, але продемонструю самі цікаві, на мій погляд, які можна застосувати в реальному житті.

Уявімо собі, ми маємо базу даних користувачів, які надали нам адресу своєї електронної пошти і нам потрібно відфільтрувати її за доменом. Будемо виводити усіх користувачів в яких доменна зона електронної пошти “gmail.com”. Я введу ось такий запит: <br>
`select email, user_id from user where email like '%@gmail.com';` <br>
Ключовим словом тут являється `like` а символ `%` означає що до початку стрічки ( тобто до % ) в нас може бути скільки завгодно символів. Ось такий вивід ми отримаємо в терміналі.

  |------------------------+---------|
  |          email         | user_id |
  |------------------------+---------|
  |  soloviov.ia@gmail.com | 7498    |
  |------------------------+---------|
  | mnda@gmail.com         | 7515    |
  |------------------------+---------|
  | annekey@gmail.com      | 7519    |
  |------------------------+---------|
  | alexey@gmail.com       | 7601    |
  |------------------------+---------|
  | sofi.grabova@gmail.com | 7908    |
  |------------------------+---------|
  {: .table .table-responsive}

Також, для кращого розуміння знаку `%`, я хотів би показати декілька маленьких прикладів. Ми також будемо фільтрувати користувачів. Виведімо користувачів, ім’я яких починається на букву `А`: <br>
 `select first_name, last_name, user_id from user where first_name like 'A%';`. <br>
  Тут ми бачимо, що знак `%` розташований після букви, і означає він, що після початку строки в нас може бути скільки завгодно символів.
  
 Ще один маленький приклад де ми відфільтруємо користувачів по початку і по закінченню стрічки: <br>
`select first_name, last_name, user_id from user where first_name like 'A%e';`. <br>
 Тут я думаю зрозуміло, що стрічка повинна починатись на `А` та закінчуватись на `е`.

 Також можемо відфільтрувати користувачів по id в яких допустимо id менше ніж 8000: <br>
 `select email, user_id from user where user_id < 8000;` <br>
Ми можемо також відфільтрувати користувачів за датою реєстрації, в діапазонів певних календарних дат. В моїй таблиці `user` записується дата реєстрації користувача. <br>
`select email, registration_time from user where registration_time between '2019-01-31' and '2020-01-01';`  <br>
Ключовими словами тут є `between` і `and`. І ми отримуємо всіх користувачів які були зареєстровані в цей проміжок часу.

В мене присутня комірка `in_active` в якій зберігається змінна типу `int`. Вона тримає в собі значення “1” та “0”. Ми можемо вивести всі значення де змінна дорівнює одиниці.
Ось як виглядає мій запит на сервер: <br> `select user_id, is_active from user where is_active=true;` <br> Варто пояснити, що SQL досить розумний аби зрозуміти що так званий прапор `true` — це одиниця, а `false` — це нуль.

І наостанок я хотів би продемонструвати роботу запиту, де ми можемо комбінувати декілька умов. Запит буде виглядати так:
`select first_name, is_active from user where (is_active=true and first_name like 'A%') or (is_active=false and last_name like '%n');` <br> 
І ми отримаємо таку відповідь на запит.

  |------------+-----------|
  | first_name | is_active |
  |------------+-----------|
  | Ammit      | 1         |
  |------------+-----------|
  | Addie      | 1         |
  |------------+-----------|
  | Agnesse    | 1         |
  |------------+-----------|
  | Anna-diane | 0         |
  |------------+-----------|
  | Adrianna   | 0         |
  |------------+-----------|
  | Modesta    | 0         |
  |------------+-----------|
  | Noellyn    | 0         |
  |------------+-----------|
  | Amandi     | 1         |
  |------------+-----------|
  {: .table .table-responsive }

Тепер прокрутіть в голові даний запит, та подумайте чому ми отримали такі дані😇.

***

Отже, в цьому пості, який являється першим в циклі постів про SQL для програміста, я поділився з вами своїми знаннями про побудову запитів на сервер та деякими теоретичними знаннями😉. Не варто сприймати мою статтю як навчальну. Адже, я не хотів би брати на себе таку відповідальність😏. В будь - якому разі, раджу вам користуватися гуглом і навчатися разом зі мною! В наступному пості, я спробую розповісти вам про використання простих та агрегованих функцій👋.