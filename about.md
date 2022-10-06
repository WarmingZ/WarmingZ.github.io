---
layout: page
title: About Me
description: This is what I do.
background: '/img/bg-about.webp'
---
<style>
  .responsive {
  width: 100%;
  height: auto;
}
</style>
<p><img alt="" src="/img/me.jpeg" class="responsive" style="float:right; margin-left:40px; margin-right:40px; height:290px; width:300px" /></p>
<p>I`m Soloviov Ivan (&nbsp;Ukrainian: Соловйов Іван ) a programmer without commercial experience,&nbsp;but&nbsp;with a great technical outlook.&nbsp;</p>
<p>I am a programmer, I write mostly in С#, but also in PHP, and quite a bit on&nbsp;JavaScript.&nbsp;
    I often use ASP.Net Core to create web applications <strong><a href="https://github.com/WarmingZ" target="_blank"> 
        (watch my github)</a>&nbsp;</strong>for this I use MySQL and a EntityFramework.</p>

<p>I was a student of Lviv Polytechnic. Where he received a bachelor&#39;s degree.</p>

<p>For a long time he was engaged in the maintenance of computer systems and complexes.&nbsp;I was one of the founders of the company SavePC -&nbsp;&nbsp;repair and maintenance of computer systems.&nbsp;Then &nbsp;worked in a small company Helper where he wos a&nbsp;system administrator.</p>

<p>My hobby is mobile and analog photography.&nbsp;I like technology and gadgets.</p>

<strong>🔥[View]({{ site.baseurl }}{% link Summary.html %})</strong> or <strong>💡[download]({{ site.baseurl }}/img/download/Summary.pdf)</strong> summary.

### Contact me📞

<p>
  Do you want to contact me? Fill out the form below to send me a message and I will get back to you as soon as possible!</p>
<form id="contactform" name="sentMessage" id="contactForm" action="https://formspree.io/f/xayagdov" method="POST">
  <div class="control-group">
    <div class="form-group floating-label-form-group controls">
      <label>Name</label>
      <input type="text" name="name" class="form-control" placeholder="Name" id="name" required data-validation-required-message="Please enter your name.">
      <p class="help-block text-danger"></p>
    </div>
  </div>
  <div class="control-group">
    <div class="form-group floating-label-form-group controls">
      <label>Who you are?</label>
      <input type="text" name="whoAre" class="form-control" placeholder="Who you are?" id="whoAre" required data-validation-required-message="Please enter who you are or what you do.">
      <p class="help-block text-danger"></p>
    </div>
  </div>
  <div class="control-group">
    <div class="form-group floating-label-form-group controls">
      <label>Email Address</label>
      <input type="email" name="email" class="form-control" placeholder="Email Address" id="email" required data-validation-required-message="Please enter your email address.">
      <p class="help-block text-danger"></p>
    </div>
  </div>
  <div class="control-group">
    <div class="form-group floating-label-form-group controls">
      <label>Message</label>
      <textarea rows="5" class="form-control" placeholder="Message" name="message" id="message" required data-validation-required-message="Please enter a message."></textarea>
      <p class="help-block text-danger"></p>
    </div>
  </div>
    <!--the following are optional fields to customize how submissions are processed-->
    <!--The first sets the subject of Formspree notification emails.-->
    <!--The second catches (some) spambots.-->

  <!-- <input type="hidden" name="_subject" value="Sent from blog Contact form." /> -->
  <!-- <input type="text" name="_gotcha" style="display:none" /> -->

    <!--End of optional fields.-->

  <br>
  <div id="success"></div>
  <div class="form-group">
    <input type="submit" class="btn btn-primary" value="Send">
  </div>
</form>