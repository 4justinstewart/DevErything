$(function() {
  $('.auth_button').on('click', function(){
    $('.authenticate').toggle(600);
    $('.auth_button').toggle();
  });

   // $('#signup').on('submit', function(e) {

   //  var email =  $('input[name="user[email]"]').val();
   //  var password = $('input[name="user[password]"]').val();

  $('#signup').on('submit', function(e) {
    var firstName = $('input[name="user[first_name]"]').val();
    var lastName = $('input[name="user[last_name]"]').val();
    var email =  $('input[name="user[email]"]').val();
    var password = $('input[name="user[password]"]').val();
    var passwordConfirm = $('input[name="confirm_password]"]').val();

    given_name = new Name(firstName, lastName);

    if (given_name.checkPresence() === false){
      e.preventDefault();
      $('#errors').append("<li>First and Last Name are required</li>");
    }

    given_email = new Email(email);

    if (given_email.checkValid() === false){
      e.preventDefault();
      $('#errors').append("<li>Invalid Email</li>");
    }

    given_password = new Password(password);

    if (given_password.checkLength() === false){
      e.preventDefault();
      $('#errors').append("<li>Password must be 8 characters long</li>");
    }

    if (given_password.checkCapitalLetter() === false){
      e.preventDefault();
      $('#errors').append("<li>Password must have at least 1 capital letter</li>").fadeIn();
    }

    if (given_password.checkNumericPresence() === false){
      e.preventDefault();
      $('#errors').append("<li>Password must have at least 1 number</li>");
    }

    $('#errors').toggle(800);

  });

  $('input').on('keyup', function(e){
    if (e.keyCode != 13) {
      $('#errors').empty().toggle(400);
    }
  });

// -------------------------------LOGIC----------------------------------
  
  function Name(firstname, lastname){
    this.first = firstname;
    this.last = lastname;
  }

  firstName.prototype.checkPresence = function() {
    if ((this.first === "") || (this.last === "")) {
      return false;
    }
  };

  function Email(email){
    this.email = email;
  }

  Email.prototype.checkValid = function(){
    if ((this.email).match(/^\S+@[A-z0-9]+\.[A-z]{2,}$/) === null){
      return false;
    }
  };

  function Password(password) {
    this.password = password;
  }

  Password.prototype.checkLength = function() {
    return this.checker(/\S{8,}/);
  };

  Password.prototype.checkCapitalLetter = function() {
    return this.checker(/[A-Z]+/);
  };

  Password.prototype.checkNumericPresence = function() {
    return this.checker(/[0-9]+/);
  };

  Password.prototype.checker = function(regex){
    if (this.password.match(regex) === null) {
      return false;
    }
  };

});