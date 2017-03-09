$(function() {
  var list = $("#user-search-result");

  function appendList(name) {
    var item = $('<li class="list">' + name + '</li>');
    list.append(item);
  }

  $('#keyword').on('keyup', function() {
    var preWord;
    var input = $('#keyword').val();
    if ( input != preWord ) {
      searchUser(input);
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
      console.log(data)
      $.each(data, function(i , name) {
        var user_name = name.nickname
        var html = appendList(user_name)
        $('.users').append(html);
      });
    })
    .fail(function() {
      alert('error');
    });
  };
});
