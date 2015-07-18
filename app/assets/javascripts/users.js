$(document).ready(function(){
  $('.chat-box').on('keyup', function(event){
    var name = $('.display').val()
    if(event.keyCode == 13){
      $('.chat').append("<div class='message'>" + name + ': ' +  this.value + '</div>');
      this.value = '';
      $(".chat").animate({ scrollTop: $(document).height() }, "slow");
    }
  });
});
