---
title: Databases for programmers - Part 3 🗂️
layout: post
subtitle: Combining selection and sorting and constraints of results
date: '2021-12-20 12:10:39'
background: "/img/AmAZUHZ.webp"
categories: SQL Tech Translated
lang: en
lang-ref: sql3
image: /img/posts/Database3/DB.png
description: Combining selection and sorting and constraints of results
---
In this post, I want to show the connection of the sample results vertically and show some examples of sorting and limiting the sample results. I urge you to repeat all the commands I have given in the examples and modify them to suit your needs. This way you will better understand and assimilate the material. Let's start without words. Enjoy reading 👋!

<center>
<img src="/img/posts/Database3/DB.png" alt="Network" class="responsive" style="width: 65%; height: auto;">
</center>

***

### Combining results vertically
Let's learn to work with samples as sets and learn to combine them. To do this, we need a function that will help us know which elements are in the set.
Let's start with the fact that we, for example, need to know what are the unique values for the column with the appropriate ratio, that is, for the table. Find out how many unique senders we have.
{% highlight sql %}
select distinct user_from_id from user_private_message;
{% endhighlight %}

And we get a result whose value is not repeated. In this case, we use `distinct` simply as a keyword, but it can be used as a function - passing it some value. Now, moving on to our task, let's find out the number of unique senders. To do this, we will use the already familiar function `count`.
{% highlight sql %}
select count(distinct user_from_id) from user_private_message; 
{% endhighlight %}
And we get the number in numerical form.
Here we take our table and take each column from it, select the `user_from_id` field and accumulate some hash set with `district`. Then, we transfer the accumulated value to our aggregation function `count`. Thus, we counted the number of unique values.

 | select count(distinct user_from_id)  | 
 |:------------------------------------:|
 | 177                                  |  
 {: .table .table-responsive }

We can test our sample. Namely, check whether the unique values are really output. We can implement this with the help of `if`. It is worth recalling that in the last request, we received all the unique `ID` from `user_from_id`.
{% highlight sql %}
select count
(distinct if(user_from_id = 8609, 8592, user_from_id))
from user_private_message;
{% endhighlight %}
And we get the following result:

 | count(distinct if(user_from_id = 8609, 8592, user_from_id))  | 
 |:------------------------------------:|
 | 176                                  |  
 {: .table .table-responsive }

We take the last number - 8609, and replace it with 8592. That is, the full query `IF` sounds like this, if the column `user_from_id` is 8609, then replace it with 8592, but if not - just return its value `if (user_from_id = 8609, 8592, user_from_id)`.
Looking at the table above, we see that the number of users decreased by one, respectively, the replacement worked and the sampling test passed as we expected.

It is also worth returning to `distinct` because it can work as a function and a keyword.
Now we can set the task - to get unique pairs of sender and recipient.
{% highlight sql %}
 select distinct
 user_from_id, user_to_id 
 from user_private_message;
{% endhighlight %}
And we will get unique couples who talked to each other. Now in order to count, you just need to use `count`.

Now count the number of unique users who send and receive messages. (There are users who have never received or written messages) And we need to count how many unique users we have in private discussions. We have already written queries about senders and recipients, but we can combine two queries into one using union.
{% highlight sql %}
select user_from_id 
from user_private_message
union select user_to_id 
from user_private_message; 
{% endhighlight %}
`Union` - works as a combination of two sets of results. That is, it first finds all the unique values and then combines them into some result set. Thus, it is not necessary to write `distinct` for each request. That is, the SQL engine sees that we have two queries and we need to combine their results. So get only unique value results.
Also, if we need to merge tapes without any filtering. To do this, we need to write `all` after  
`Union`.
{% highlight sql %}
select user_from_id from user_private_message
union all select user_to_id
from user_private_message; 
{% endhighlight %}
After that, we will display data with duplicates.

***

### Sorting and limiting sampling results
Very often it is used to organize page-by-page output of results. For example, the first query we reviewed the first ten results and the next query we want to select the next 10 results (ie already skip the first ten results).
Sorting is not something complicated, it's just a flexible tool.

We can sort the result of any sample by the value of a field or several fields. We can also sort in ascending or descending order. Of course, we can sort this way only by the fields in which there is a comparison operation (ie more or less). But because we know MySQL, including relational databases, they have the ability to predictably convert the values ​​of various fields so that we can use these operations (more or less). Used in aggregate functions, or in the sortings I will be using now.

Let's start with the simplest task, try to sort the values ​in the message cell by date of reading. And at the same time we learn how sorting works with values ​​that are not yet specified, ie `null`. Here is my sort request:
{% highlight sql %}
select message_id, read_time 
from user_private_message 
order by read_time;
{% endhighlight %}
The key word here is `order by`, after this word we indicate which column will be sorted. By default, they are sorted in ascending order. That is, the fields with `null` will be displayed first.

If we want to sort not in ascending order, but in descending order, we will use the `desc` attribute. That is what the query will look like:
{% highlight sql %}
select message_id, read_time
from user_private_message 
order by read_time desc;
{% endhighlight %}
Also after the keyword `order by` we can list some rules by which there will be sorting. For example, we sort users by whether this user is active or not `(is_active)`, and by username. Here is the query:
{% highlight sql %}
select user_id, first_name, is_active 
from user order by is_active, first_name desc;
{% endhighlight %}
So, `select user_id,first_name, is_active` - sort by `user` id, name and field `is_active`. First, we sort by `is_active` and by name `first_name` sort in descending order.

| user_id | first_name | is_active |
|:-------:|:---------: |:---------:|
|    7525 | Zorana     |         0 |
|    8385 | Wilhelmus  |         0 |
|    7498 | Sanjeet    |         0 |
|    8163 | Saige      |         0 |
|    8103 | Zachariah  |         1 |
|    7635 | Zach       |         1 |
|    7883 | Yvet       |         1 |
|    8589 | Yvet       |         1 |
 {: .table .table-responsive }

Here we see our sorting by `is_active`. Our sample was divided into two groups, inactive users (in which the attribute `is_active = 0`) and active. That is, first we sort by `is_active` and already within this group is sorted by name. And the second group, in which `is_active = 1`, usernames are sorted in descending order. If we come across several identical names and want to sort them by adding the appropriate attributes to our query, then sorting for them will take place according to the third rule.

Also, which is quite convenient, we can sort by simply specifying the column numbers.
{% highlight sql %}
select user_id, first_name, is_active 
from user order by 3, 2 desc; 
{% endhighlight %}
Here we sort the 3rd and 2nd columns in descending order.

Let's understand exactly how sorting takes place.
{% highlight sql %}
select user_id, first_name, is_active 
from user order by is_active, first_name desc;
{% endhighlight %}  
And so, our DBMS, selects each tape from `user`, then selects from this tape `user_id, first_name` - those fields which are necessary for sampling, and those fields `order by is_active, first_name` - which are necessary for sorting. And as it is iterated by the results of the sample, it simply sorts these results `order by is_active, first_name` and as the results will be sorted, gives them to the client.

Thus, we can use as a field for sorting, the result of a function.
{% highlight sql %}
select first_name, reverse(first_name) 
from user order by reverse(first_name) desc;
{% endhighlight %}
In this sample, we simply pass our value to the `reverse 'function, followed by sorting.

| first_name | reverse(first_name) |
|:----------:|:-------------------:|
| Jean-guy   | yug-naeJ            |
| Chastity   | ytitsahC            |
| Clarity    | ytiralC             |
| Garry      | yrraG               |
| Jinny      | ynniJ               |
| Elhamy     | ymahlE              |
 {: .table .table-responsive }

We can also limit the result of the sample. Sometimes, we don't need to load the server to give us gigabytes of data. This is done using the command `limit`.
{% highlight sql %}
select user_id, first_name from user 
order by first_name limit 3;
{% endhighlight %}
Here are the results we got:

| user_id | first_name |
|:-------:|:-----------:|
|    7914 | Achamma    |
|    7605 | Addie      |
|    7705 | Adrianna   |
 {: .table .table-responsive }

So what's going on on the DBMS side? MySQL from the `user` table starts selecting all the columns we have, and then starts sorting them using` order by`. And as soon as it sorts all the columns in our table, ie in our query results, it simply takes the first 3 columns from this temporary table and returns them to the client, ie it does not return all the remaining queries.

If we take another example, we will simply output 10 users without sorting. In this case, the database begins to look at all the data stored in the `user` table, but begins to collect results until it rests on our limit, or until the data in the table runs out. This is very useful when we are familiar with a database and we need to review some information to roughly understand what data we have stored.

Also keep in mind that there are two modes to the limit. In the second mode, we can enter two numbers. That is, if we enter a limit of 10, 5, we will skip the first ten results and output five.