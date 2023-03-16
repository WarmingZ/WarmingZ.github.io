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

#myDIV {
  width: 100%;
	display:none;
}

/* Modal */

#myImg {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
}

/* Caption of Modal Image */
#caption {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  height: 150px;
}

/* Add Animation */
.modal-content, #caption {  
  -webkit-animation-name: zoom;
  -webkit-animation-duration: 0.6s;
  animation-name: zoom;
  animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)} 
  to {-webkit-transform:scale(1)}
}

@keyframes zoom {
  from {transform:scale(0)} 
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}

/* End Modal */

</style>
<p><img alt="Me" id="myImg" src="/img/me.jpeg" class="responsive" style="float:right; margin-left:40px; margin-right:40px; height:290px; width:300px; max-width:600px;" /></p>
<div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div>

<p>I`m Soloviov Ivan (&nbsp;Ukrainian: Соловйов Іван ) a programmer without commercial experience,&nbsp;but&nbsp;with a great technical outlook.&nbsp;</p>
<p>I am a programmer, I write mostly in С#, but also in PHP, and quite a bit on&nbsp;JavaScript.&nbsp;
    I often use ASP.Net Core to create web applications <strong><a href="https://github.com/WarmingZ" target="_blank"> 
        (watch my github)</a>&nbsp;</strong>for this I use MySQL and a EntityFramework.</p>

<p>I was a student of Lviv Polytechnic. Where he received a bachelor&#39;s degree.</p>

<p>For a long time he was engaged in the maintenance of computer systems and complexes.&nbsp;I was one of the founders of the company SavePC -&nbsp;&nbsp;repair and maintenance of computer systems.&nbsp;Then &nbsp;worked in a small company Helper where he wos a&nbsp;system administrator.</p>

<p>My hobby is mobile and analog photography.&nbsp;I like technology and gadgets.</p>

<strong>🔥[View]({{ site.baseurl }}{% link Summary.html %})</strong> or <strong>💡[download]({{ site.baseurl }}/img/download/Ivan_Soloviov_CV.pdf)</strong> summary.

<p>
  Do you want to contact me? Fill out the form below to send me a message and I will get back to you as soon as possible! 
	</p>
<button class="btn btn-primary" title="Double click pls" onclick="myFunction()">Contact me 📞</button>
<div id="myDIV">
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
</div>

<script>
function myFunction() {
  var x = document.getElementById("myDIV");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}

// Get the modal
var modal = document.getElementById("myModal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById("myImg");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
  modal.style.display = "none";
}
</script>