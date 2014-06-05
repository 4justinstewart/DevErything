$(function() {
  $('.auth_button').on('click', function(){
    $('.authenticate').toggle(600);
    $('.auth_button').toggle();
  });



  $('#create_account').on('submit', function(e) {
    
    if ($(this).attr('id') === "signup") {

      var firstName = $('input[name="user[first_name]"]').val();
      var lastName = $('input[name="user[last_name]"]').val();
      var email =  $('input[name="user[email]"]').val();
      var password = $('input[name="user[password]"]').val();
      var passwordConfirm = $('input[name="confirm_password]"]').val();
      var given_name = new Name(firstName, lastName);
      var given_email = new Email(email);
      var given_password = new Password(password, passwordConfirm);
    }

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

    if (given_password.checkReliability() === false){
      e.preventDefault();
      $('#errors').append("<li>Passwords must match one another</li>");
    }
    
    if (given_name.checkPresence() === false){
      e.preventDefault();
      $('#errors').append("<li>First and Last Name are required</li>");
    }
    
    if (given_email.checkValid() === false){
      e.preventDefault();
      $('#errors').append("<li>Invalid Email</li>");
    }
  });

//     // if ($(this).attr('id') === 'signin') {
//     //   var email =  $('input[name="email"]').val();
//     //   var password = $('input[name="password"]').val();
//     //   var given_email = new Email(email);
//       // var given_password = new Password(password);

//     // }


//     // if (given_password.checkPresence() === false){
//     //   e.preventDefault();
//     //   $('#errors').append("<li>Password field is required</li>");
//     // }


//   $('input').on('keyup', function(e){
//     if (e.keyCode != 13) {
//       $('#errors').empty().hide();
//     }
//   });

// // -------------------------------LOGIC----------------------------------
  
  function Name(firstname, lastname){
    this.first = firstname;
    this.last = lastname;
  }

  Name.prototype.checkPresence = function() {
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

  function Password(password, confirmpw) {
    this.password = password;
    this.confirm = confirmpw;
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

  Password.prototype.checkReliability = function() {
    if (this.password != this.confirm) {
      return false;
    }
  };
});

//   Password.prototype.checker = function(regex){
//     if (this.password.match(regex) === null) {
//       return false;
//     }
//   };
//   Password.prototype.checkPresence = function() {
//     if (this.password === "") {
//       return false;
//     }
//   };
