$(function() {
  var list = $("#user-search-result");
  function appendList(user_info) {
    var name = user_info.nickname;
    var user_id = user_info.id;
    var item = $('<li class="list">' + '<a class = "addition">' + '追加' + '</a>' + '<p id = user data-user_id = ' + user_id + ' data-user_name = ' + name + '>' + name + '</p>' + '</li>');
    list.append(item);
  }

  $("#user-search-result").on('click', ".list",".addition",function(){
    $(this).remove();
    var user = $("#user");
    var name = user.data('user_name');
    var user_id = user.data('user_id');
    var name = $('<li class= "chat-group-user">' + name + '</li>');
    $('<input>').attr({
        type: 'hidden',
        value: user_id
    }).appendTo('.field-input');

    $('.field-input').append(name);
  });

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

});
