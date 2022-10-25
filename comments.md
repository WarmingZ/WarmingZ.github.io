---
layout: page
title: Latest comments
description: Latest comments on the site
---

<h4>The latest comments are sorted by the date of writing (newest first).</h4>
<!-- <p>By the way, only  <b><span class="green">{{ page.disqus.size }}</span></b> comments were written on this site, so I invite you to comment.</p>  -->


{%- include latest_comments.html -%}


<style>
.latest-comments{
	font-size: 22px;
	text-align: left;
	padding: 10px;
}
.dsq-widget-item{
	padding: 20px;
	margin: 20px;
	border-bottom: 1px solid #eee;
	position: relative;
	padding-left: 40px;
}
.dsq-widget-avatar{
	position: absolute;
	left: 0;
}
p.dsq-widget-meta{
margin-top: 5px;
position: relative;
font-size: 17px;
}
a.dsq-widget-user{
	display: block;
	font-weight: normal;
	padding-bottom: 10px;
}

img.dsq-widget-avatar{
	width: 30px;
	height: 30px;
	border-radius: 50%;
	background-size: auto 30px;
	
}

.dsq-widget-avatar{
	
}
</style>	