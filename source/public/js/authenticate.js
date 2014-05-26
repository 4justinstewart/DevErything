$(function() {
  $('.auth_button').on('click', function(){
    $('.authenticate').toggle(600);
    $('.auth_button').toggle();
  });

  $('form').on('submit', function(e) {
    e.preventDefault();
    var firstName = $('input[name="user[first_name]"]').val();
    var lastName = $('input[name="user[last_name]"]').val();
    var email =  $('input[name="user[email]"]').val();
    var password = $('input[name="user[password]"]').val();
    var passwordConfirm = $('input[name="user[password]"]').val();


    given_email = new Email(email);
    if (given_email.checkValid() === false){
      $('#errors').append("<li>Email invalid</li>");
    }

    given_password = new Password(password);

    if (given_password.checkLength() === false){
      $('#errors').append("<li>Password must be 8 characters long</li>");
    }

    if (given_password.checkCapitalLetter() === false){
      $('#errors').append("<li>Password must have at least 1 capital letter</li>");
    }

    if (given_password.checkNumericPresence() === false){
      $('#errors').append("<li>Password must have at least 1 number</li>");
    }

  });

  $('input').on('keyup', function(e){
    if (e.keyCode != 13) {
      $('#errors').empty();
    }
  });

// -------------------------------LOGIC----------------------------------

  function Email(email){
    this.email = email;
  };

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