$(document).ready(function(){
  $('.message').on('submit', postMessage);
  $('.log-form').on('submit', logIn);

});

var logIn = function(event){
  event.preventDefault();
  $target = $(event.target);

  $.ajax({
    url: $target.attr('action'),
    method: 'post',
    data: $target.serialize(),
    dataType: 'html'
  }).done(function(response){
    $('.log').html(response);
  }).fail(function(error){
    console.log(error);
  });
};

var getMessages = function(){
  $.ajax({
    url: '/messages',
    method: 'get'
  }).done(function(response){
    $('.chat').html(response);
    $(".chat").animate({ scrollTop: $('.chat')[0].scrollHeight }, "slow");
  }).fail(function(error){
    console.log(error);
  });
};

setInterval(getMessages, 5000);

var postMessage = function(event){
  event.preventDefault();
  $target = $(event.target);

  $.ajax({
    url: '/messages',
    method: 'post',
    data: $target.serialize()
  }).done(function(response){
    $('.chat-box').val('')
    getMessages();
  }).fail(function(error){
    console.log(error);
  });
};
