---
title: Databases for programmers - Part 1🗂️
layout: post
subtitle: In this post, we will look at simple server requests SQL
date: '2021-12-02 17:10:39'
background: "/img/AmAZUHZ.webp"
categories: SQL Tech Translated
lang: en
lang-ref: sql
image: /img/posts/Database/imageDatabase.jpg
description: In this post, we will look at simple server requests SQL
---
<a href="https://dev.mysql.com/doc/"><img src="/img/posts/Database/SQL.png" style="width:128px;max-width:100%;" align="right"></a>
I recently started studying databases, namely SQL🤓. Based on this, I want to share with you the information I learned during my studies. I will continue to write about this topic, as it is impossible to describe everything in one post. I would also like to say in advance that I view databases from a programmer and how to use them for a programmer👨‍💻. This will not be a technical guide that will help you learn SQL, but I hope that I can interest people who know nothing about databases and perhaps show something new to people who work with them.

<img src="/img/posts/Database/imageDatabase.webp" alt="Network" class="responsive" style="width: 100%; height: auto;">

***

### A little theory 🥱

To begin with, as always, you need to understand the terminology. Unfortunately, no way without it. So, first of all, it is necessary to define what a database is? <br>
 A `database` is a data that is organized according to certain rules and which can be managed following certain rules.

A common example of a database is the folder hierarchy on your hard drive. You usually organize these folders according to your own rules, such as photo folders that are neatly packaged by year in your operating system.

This example will help us understand what a DBMS is. After all, a database management system, we can imagine as your operating system, which contains folders with photos.<br>
 A <mark>database management system (DBMS)</mark> is a software tool that allows you to create and use a database. Finally, it's time to define SQL. It is a declarative language of structured queries, which is used to manage data in relational databases. SQL databases are built on a relational model, ie data can be stored in tables that are logically related to each other through common values, so there is no need for additional information to link them together. One of the most important features of SQL databases is that they are normalized. This means that there are at least two tables in each SQL database that should be combined if possible, as this reduces redundancy and simplifies data entry. 

*** 

### Commands to interact with the server 💾

So, to work with databases, I installed a docker with an SQL server. Instructions for installing and configuring this program can
<a href="https://docs.docker.com/get-started/"><img src="/img/posts/Database/docker.png" style="width:128px;max-width:100%;" align="right"></a> be found online. It will also not be difficult to find a test database, which you can download to your Docker server. 
If you downloaded Docker, but do not know how to start a container with a MySQL server, just enter the command in the terminal - `docker pull mysql`.  Then, to start the container with the image and parameters, write in the terminal - `docker run --name example-mysql -e MYSQL_ROOT_PASSWORD = pass -d mysql`. You can enter any name instead of "example". In the future, to connect to our database you will need to enter the command - `docker exec -it example-mysql mysql -uroot -ppass`. <br>
Now here are some commands to interact with our server:
- View databases on the server - (`show databases;`)
- Switch to the database - (`use nameDatabase;`)
- View tables in the database - (`show tables;`)
- View columns - (`describe Example;`)

Next, if you find a test database on the Internet, to import a new dump, use the command - `docker exec -i example-mysql mysql -uroot -ppass <example.sql`. In this case, example.sql is the file name of our dump. And we enter the same command to import data by changing the file name. Of course, you can find another way to install SQL Server without Docker. I'm just demonstrating how I installed the server SQL.

*** 

### Simple SELECT query 🌪️

It is also worth remembering that SQL is a declarative language, meaning that we do not give a command to the compiler or interpreter of the language, but we describe the desired result we want to get.

Of course, my first query to the database was the well-known Select. It looked something like this - `select * from table_name;`. I don't know if I need to explain this query, but it may be interesting for someone who doesn't know SQL at all. Asterisk <mark>"*"</mark> means that we get all the data entered in the table, well, respectively, <mark>"From"</mark> means from which table.

 We can also retrieve data from multiple columns by renaming them at once. It should be noted that these requests do not make any changes to the server. Entering such a command on the server <br>
`SELECT name NewName, example as NewID FROM example;`<br>
We will get about this result in the terminal.

  |----------+-------|
  |  NewName | NewID |
  |----------+-------|
  | Value 1  | 0     |
  |----------+-------|
  | Value 2  | 1     |
  |----------+-------|
  {: .table .table-responsive}

Having analyzed this query, you can understand the logic of almost all SQL queries. The query sounds something like this - select data from the name column (<mark>NewName</mark> in this case is not an explicit renaming of the column in the output), and the example column (where the keyword <mark>as</mark> means explicitly renaming the example column to <mark>NewID</mark>), from the example table.
We can also perform mathematical operations on numbers on the server (I do not know who needs it, but it interestingly demonstrates the capabilities of MySQL). For example, write the following query: <br>
 `select 5/3 as result;` <br>
 and get the result of the division which is displayed in the column <mark>"result"</mark>.
 
  | result |
  |--------|
  | 1.6667 |
  {: .table .table-responsive}

It does not sound very complicated, because it is a simple request to the server to obtain information from the database. In my practice, I have noticed that most SQL database server queries are simple select queries without using aggregate functions. But there are times when you need to write specific queries to get data that can be filtered right away or something.

***

### Filter results with WHERE 💡

I selected a user table to filter the results. This will demonstrate the operation of the where parameter. For example, I have a table with the names and details of users of a site. Let's say I want to get single-user data. My query will look like this: <br>
`select * from user where first_name = 'Madelle';`<br>
 Here we select everything from the user table and then use the <mark>"where"</mark> keyword wherein the <mark>first_name</mark> column we look for the name Madelle. Now we have not received all the information about the user but simply filtered it among all users. We can also get the information we need about this user - <br> `select first_name, last_name, user_id from user where first_name = 'Madelle';` <br>
  Where we create a request to the server to get the user <mark>ID</mark> in the system, <mark>name</mark>, and <mark>surname</mark>. And this is the result we get.


  |------------+-----------+---------|
  | first_name | last_name | user_id |
  |------------+-----------+---------|
  | Madelle    | Jonathan  | 8209    |
  |------------+-----------+---------|
  {: .table .table-responsive}
  

If you remove this condition, we can display the name, surname, and id of all users of the site, which are entered into the database - `select first_name, last_name, user_id from user;`. <br>
In general, <mark>“where”</mark> is a very flexible tool. It can meet almost any data filtering need. I will not list all the possibilities of the parameter, but I will demonstrate the most interesting in my opinion, which can be applied in real life. 

Imagine we have a database of users who have given us their email address and we need to filter it by domain. We will display all users who have a domain zone e-mail "gmail.com".
I will enter the following query: <br>
 `Select email, user_id from user where email like '%@gmail.com';`. <br>
The keyword here is <mark>"like"</mark> and the symbol <mark>"%"</mark> means that before the beginning of the tape (ie up to %) we can have as many characters as we want. This is the conclusion we will get in the terminal.

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

Also, for a better understanding of the <mark>%</mark> sign, I would like to give a few small examples. We will also filter users. Let's list the users whose name starts with the letter <mark>"A"</mark> <br>
 `select first_name, last_name, user_id from user where first_name like 'A%';` <br>
  Here we see that the <mark>%</mark> sign is located after the letter, and it means that after the beginning of the line we can have as many characters as we want. Another small example where we filter users at the beginning and end of the feed is <br>
  `select first_name, last_name, user_id from user where first_name like 'A% e';`. 

Here I think it is clear that the tape should start on <mark>"A"</mark> and end on <mark>"e"</mark>. We can also filter users by id in which the id is less than 8000:<br>
`select email, user_id from user where user_id <8000;`. <br>
We can also filter users by registration date, in ranges of specific calendar dates. My user table records the date the user registered.<br>
 `(select email, registration_time from user where registration_time between '2019-01-31' and '2020-01-01';)`<br>
  The keywords here are <mark>"between"</mark> and <mark>"and"</mark>. And we get all the users who have been registered in this period.

I have a cell `in_active` which stores a variable of type `int`. It holds the values ​​"1" and "0". We can derive all values ​​where the variable is a unit value.<br>
This is what my request to the server looks like: <br>
 `select user_id, is_active from user where is_active = true;`. <br>
 It should be explained that SQL is smart enough to understand that the so-called `true` flag is one and the `false` flag is zero.

Finally, I would like to demonstrate the work of the query, where we can combine several conditions. The query will look like this: <br>
```select first_name, is_active from user where (is_active = true and first_name like 'A%') or (is_active = false and last_name like '% n');``` <br>
And we will receive such an answer to the request.

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
  {: .table .table-responsive}

Now scroll through this query in your head, and think about why we received such data.😇

***

So, in this post, which is the first in a series of posts about SQL for a programmer, I shared with you my knowledge of building queries on the server and some theoretical knowledge😉. My article should not be taken as an educational one. After all, I would not like to take on such a responsibility😏. In any case, I advise you to use Google! In the next post, I will try to tell you about the use of simple and aggregate functions. See you in the next post👋!

