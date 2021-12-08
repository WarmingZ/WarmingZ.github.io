---
title: Databases for programmers - Part 2🗂️
layout: post
subtitle: Consider simple and aggregate functions
date: '2021-12-08 13:10:39'
background: "/img/AmAZUHZ.webp"
categories: SQL Tech Translated
lang: en
lang-ref: sql2
image: /img/posts/Database2/DB.png
description: Consider simple and aggregate functions
---
In the last post, I described the work of simple server requests to the database. A minimal set of theories for understanding what we are dealing with was also described. Considered simple SELECT queries where we filtered data using WHERE. In this post, I would like to demonstrate the use of simple and aggregate functions. Maybe now it seems to you that everything is very easy, but so it is. It is true that we have not yet made any changes to our tables and created new ones, but this is just the beginning 😊.

<center>
<img src="/img/posts/Database2/DB.png" alt="Network" class="responsive" style="width: 65%; height: auto;">
</center>

***

### Using simple functions

First of all, I would like to say that SQL has many built-in functions to perform various tasks. I would like to demonstrate the most commonly used functions. Also, if you need to write a specific request and you do not have enough features to be covered in this article, you can always visit the official documentation.
Also, because there are so many examples to choose from, I chose only the most interesting ones, in my opinion, to move faster and not overload with information. Maybe I can't write short yet, but I'm learning 🙄.

#### `IF` function⚙️

So, in the table `discussion_group` we have a cell` approve_required`, which stores user registration confirmations in the form of zeros and ones. And we need to get users out. To do this, we will use the operator `if`.
{% highlight sql %}
select if(approve_required, 'required', ''), 
approve_required from discussion_group;
{% endhighlight %}
Here is the result of the query:

 | if(approve_required, 'required', '') | approve_required from |
 |:------------------------------------:|-----------------------|
 | required                             | 1                     |
 |                                      | 0                     |
 | required                             | 1                     |
 | required                             | 1                     |
 |                                      | 0                     |
 {: .table .table-responsive }
 
 We see that our function is displayed in the column name. We can change this to normal with the `as` operator.

 Also, in the next example, we will go to the column `disscusion_group`, where we will define the old and new groups. The query will look like this: <br>
{% highlight sql %}
 select group_id as ID , creation_time as CreationData ,
  if(creation_time > '2020-01-01', 'new', 'old')
  as Type from discussion_group;
{% endhighlight %}

If the creation date is greater than `2020.01.01` it is new, otherwise - old. Here is the result:

 | ID     |     CreationData    | Type |
 |--------|:-------------------:|:----:|
 | 570779 | 2018-12-21 00:39:04 |  old |
 | 570890 | 2019-12-25 00:40:09 |  old |
 | 570853 | 2019-12-29 00:39:04 |  old |
 | 570863 | 2020-05-17 00:39:05 |  new |
 | 570922 | 2021-01-13 00:39:04 |  new |
 | 570888 | 2021-03-02 00:39:04 |  new |
 {: .table .table-responsive}
 As you can see from the request, we renamed our cells to normal.

#### `COALESCE` function⚙️

 The SQL language has functions such as `COALESCE` and` ISNULL`, which check the input parameters of `NULL`.

  We receive messages from the table `user_private_message`, which were read after a certain date. But not all messages have a read date, so we will use the reference date for unread messages and will use this date in the condition. Here we can use the `coalesce` function in` where` conditions.

{% highlight sql %}
 Select message_id, user_from_id,
  user_to_id from user_private_message
  where coalesce(read_time, send_time) > '2020-10-20';
{% endhighlight %}

Here is the result of the query:

  | message_id | user_from_id | user_to_id |
  |:-------:|:----:|:-----:|
  | 6521171 | 8425 |  7838 |
  | 6521181 | 8144 |  8328 |
  | 6521186 | 7614 |  7720 |
  | 6521190 | 7960 |  7817 |
  | 6521200 | 7683 |  8163 |
  | 6521207 | 7490 |  8533 |
  {: .table .table-responsive}
I think everything is clear here. Let's move on to the CONCAT functions.

#### `CONCAT` function⚙️

This feature helps to glue cells. For example, we can glue the cell `firstname` and` lastname` - creating the following query:
{% highlight sql %}
 select concat(first_name, ' ', last_name) as Name from user; 
{% endhighlight %}
And get the following result:

  |  Name  |
  |:------:|
  | Carla Mariet |
  | Sophy Brags  |
  | Ivan Soloviov|
  | Doug Anne marie |
  {: .table .table-responsive}

I think everything is clear here and we can move on to our aggregate functions.

***

## Aggregate SQL functions

First of all, SQL aggregate functions act on column values in order to obtain a single resulting value.
Consider aggregate functions on the example of `COUNT`.

#### `COUNT` function🔩

In this example, let's count how many messages we have sent and how many of them have been read. We will do this with the following query:
{% highlight sql %}
 select count(*) from user_private_message 
  where read_time is not null ;
{% endhighlight %}

Here we have counted how many messages have been sent and read. That is, we counted only those columns in which there is no `null`, in the table` user_private_message`. First we send the cell `from user_private_message` and then we filter it (` where read_time is not null`) and send it to our `count (*)`.
In this case, when we use an asterisk, we select all the cells and load them into memory.
Now if we pass instead of an asterisk, a parameter, the request will look like this:
{% highlight sql %}
 select count(read_time) from user_private_message;
{% endhighlight %}

That is, we can estimate how much more compact our request has become. <br>
💡 **Also worth remembering! Many programmers use such an optimization "chip", passing in `count (1)` unit. That is, when choosing from a table, we do not use intermediate memory, just for each cell we perform a function `count (1)`, which does not require any values (it just adds +1 to some aggregate value). Thus, we do not use the buffer to store values that we are not even going to return from the database.**

There are also such functions as: `Average`,` Min`, `Max`,` Sum`. I will not describe these functions, because their name is clear. You can easily find them online. I apologize for this, but if we paint each function, we will never go to the most interesting and complex functions😉.

#### `CAST` function🔩

And finally, let's consider just an interesting function `CAST`. This function allows you to convert an expression from one data type to another and it is not aggregate. Click on me [`CAST`](https://docs.microsoft.com/ru-ru/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15), if you want to know more about the function and the arguments it can take.

In many old databases, the year was written in only two digits. With the help of cast, we can convert that data into a new format.
{% highlight sql %}
 mysql> select cast("21"as year);
{% endhighlight %} 

And get the following answer to our request:

  |  cast("21"as year)  |
  |:-------------------:|
  |        2021         |
  {: .table .table-responsive}

So far, we have considered only one aggregate function, which I found quite interesting. If you want to know more about them, follow this [link](https://www.sqlservertutorial.net/sql-server-aggregate-functions/).

***

So, this post may seem a bit confusing, but I advise you to reproduce all the queries that have been made in this post. This will help you better understand how these queries work. Experiment and use the documentation, but be careful. Because if you installed SQL Server according to my example ([from the previous article](https://www.soloviov.fun/sql/tech/translated/SQL-for-the-programmer/)), you can break the server since we work as a `root` user with unlimited access rights on the server. See you in the next post👋😉.