$(function() {
  var list = $("#user-search-result");

  function appendList(user_info) {
    var name = user_info.nickname;
    var user_id = user_info.id;
    var item = $('<li class="list" id = user data-user_id = ' + user_id + ' data-user_name = ' + name + '>' + '<a class = "addition">' + '追加' + '</a>' + '<p>' + name + '</p>' + '</li>');
    list.append(item);
  }

  $('#keyword').on('keyup', function() {
    var preWord;
    var input = $('#keyword').val();
    if ( input != preWord ) {
      $(".list").remove();
      if(input.length !== 0) {
        searchUser(input);
      }
    }
  });

  function searchUser(input) {
    $.ajax({
      type: 'GET',
      url: '/users/search' + '.json',
      data: {
        user_name: input
      },
      dataType: 'json'
    })

    .done(function(data) {
      $.each(data, function(i , name) {
        var user_info = name
        var html = appendList(user_info)
        $('.users').append(html);
      });
    })
    .fail(function() {
      alert('error');
    });
  };

  $("#user-search-result").on('click', ".list",".addition",function(){
    $(this).remove();
    var user = $("#user");
    var name = user.data('user_name');
    var user_id = user.data('user_id');
    var item_field = $('<li class= "chat-group-user" id = users-list >' + '<a class= "chat-group-user__btn--remove">' + '削除' + '</a>' + '<p>' + name + '</p>' + '</li>');
    $('<input>').attr({
        type: 'hidden',
        name: 'user_ids',
        id: 'group_user_name',
        value: user_id
    }).appendTo('.field-input');
    $('.field-input').append(item_field);
  });

  $(".field-input").on('click', '#users-list',function(){
    $("#group_user_name").remove();
    $("#users-list").remove();
  });
});
