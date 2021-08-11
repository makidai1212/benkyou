$('#first-step-btn').on('click', function() {
  var first_name = $('#first_name').val();
  var family_name = $('#family_name').val();
  var nickname = $('#nickname').val();
  var phone_number = $('#phone_number').val();
  var btn = $(this)
    $.ajax({
      type: 'POST',
      url: '/first_step',
      data: { registrations: { first_name: first_name, family_name: family_name, nickname: nickname, phone_number: phone_number} },
      dataType: 'json'
    })
    .done(function(message) {
      if(message.length != 0) {
        $('#nickname_input > p').remove();
        $('#phone_number_input > p').remove();
        alert_first_step_error(message)
        console.log('bad')
      } else {
        $('.registration-form').css({
          'transform': 'translate(-480px)',
          'transition-duration': '1s'
        })
      }
    })
  }
)