$(document).on('turbolinks:load', function() {
  $('.chat__main__footer__area__send-button').on('click', function(e) {
    e.preventDefault();
    var url = window.location.href;
    var groupId = url.match(/\/(\d+)\//)[1];
    var body = $('.chat__main__footer__area__body').val();
    $.ajax ({
      type: "POST",
      url: "/groups/" + groupId + "/messages",
      data: {
        message:{
          body: body,
          groupId: groupId
        },
      },
      dataType:"json",
      success: function(data) {
        $('.chat__main__footer__area__body').val("");
        if (data.body) {
          $('.chat__main__body').append('<div class="chat__main__content">' +
              '<div class="chat__main__content__massage-haeder">' +
                '<h5 class="chat__main__content__username">' + data.user.name + '</h5>' +
                  '<span class="post__date">' + data.created_at + '</span>' +
                '</div>' +
                '<p class="chat__main__content__text">' + data.body + '</p>' +
              '</div>');
        } else {
          $('body').prepend('<div class="flash">' + '<div class=alert>' + "テキストを入力してください" + '</div>' + '</div>');
        }
      },
      error: function(data) {
        alert(data);
      }
    })
  })
});