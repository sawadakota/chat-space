$(document).on('turbolinks:load', function() {
  var $user_field = $("#user_name")
  var $user_results = $("#user-search-result");
  var $user_chat_members = $("#user-chat-member");

  function searchUser(id, name){
    $user_results.append(
      `<div class="chat-group-user clearfix" id=user_${id}>
         <p class="chat-group-user__name"> ${name} </p>
         <a class="user-add chat-group-user__btn chat-group-user__btn--add" data-id=${id} data-name=${name}>追加</a>
       </div>`)
  };

  function addChatMember(id, name){
    $user_chat_members.append(
      `<div class="chat-group-user clearfix" id=user_${id}>
         <input name="group[user_ids][]" type="hidden" value=${id}>
         <p class="chat-group-user__name"> ${name} </p>
         <a class="user-remove chat-group-user__btn chat-group-user__btn--remove" data-id=${id} data-name=${name}>削除</a>
       </div>`
    )
  }

  $user_field.keyup(function(){
    if ($user_field.val()) {
      $.ajax({
        type:"get",
        url: "/users/search/" + $user_field.val(),
        dataType: "json"
      })
      .done(function(data){
        $user_results.empty();
        var members = [];
        $.each(data, function( key, value ){
          searchUser(value.id, value.name)
        })
      })
    }
  })

  $user_results.on('click', ".user-add", function(){
    addChatMember($(this).attr('data-id'), $(this).attr('data-name'))
    $("#user_" + $(this).attr('data-id')).remove();
  })

  $user_chat_members.on('click', '.user-remove', function(){
    $("#user_" + $(this).attr('data-id')).remove();
  })

})
