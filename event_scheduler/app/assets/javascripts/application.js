// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//=require_bootstrap
$(document).ready(function () {
$("#signupform").validate({

rules: {
"user[email]": {required: true, email: true, uniqueEmail: true},
"user[password]": {required: true, minlength: 6},
"user[password_confirmation]": {required: true, equalTo: "#user_password"},
"user[firstname]": {required: true},
"user[lastname]": {required: true},
"user[username]": {required: true},
"user[phonenumber]": {required: true}
// submitHandler: function(form) { form.submit();}
}
});
});
$(document).ready(function () {
$("#loginform").validate({

rules: {
"user[email]": {required: true, email: true},
"user[password]": {required: true, minlength: 6}
// submitHandler: function(form) { form.submit();}
}
});
});