$(function() {

  function appendList(user) {
    var list = $("#user-search-result");
    var name = user.nickname;
    var user_id = user.id;
    var item = $('<li class="list" data-user_id ='+ user_id +' data-user_name ='+ name +' >'
               + '<a class ="addition">'
               + '追加'
               + '</a>'
               + '<p>'
               + name
               + '</p>'
               + '</li>');
    list.append(item);
  }

  $('#keyword').on('keyup', function() {
    var preWord;
    var input = $('#keyword').val();
    if ( input != preWord ) {
      $('.list').remove();
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

  // 追加ボタン後にチャットメンバー横に名前と削除という文字を表示させる
  $('#user-search-result').on('click', '.list','.addition',function(){
    $(this).remove();
    var name = $(this).data('user_name');
    var user_id = $(this).data('user_id');
    var input = ('<input type = "hidden"  name =' + name + ' value= ' + user_id +'>');
    var item_field = $('<li class="chat-group-user" >'
                     + '<a class="chat-group-user__btn--remove">'
                     + '削除'
                     + '</a>'
                     + '<p>'
                     + name
                     + '</p>'
                     + input
                     + '</li>');
    $('.field-input').append(item_field);
  });

  $('.field-input').on('click','.chat-group-user',function(){
    $(this).remove();
  });
});
