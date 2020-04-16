$(function(){
  function buildHTML(question){

    var html = `<form id="form" action="/books/${question.id}/check" accept-charset="UTF-8" data-remote="true" method="get"><input name="utf8" type="hidden" value="✓">
    <p id="yomi">問題</p>
    <div>${question.question}</div>
    <input val="text" id="text" placeholder="スペースは入れないでください！" type="text" name="answer">

    <div id="mondai">
      <input type="submit" value="回答する" id="sending" class="submit__question">
      <div><p id="char-2" class="text default">答えを見る</p>
      <p id="char-1" class="answer">${question.answer}</p> </div></form>`

    return html;
  }
  $("#send").on("click", function(e){
    e.preventDefault()
    var input = $("#text").val();
    var url = $("form").attr('action');
    var char = $('#char-1').text();
    if (input === char){
    $.ajax({
      url: url,
      type: "GET",
      data: {answer: input},
      dataType: 'json',
    })
    .done(function(data){
      var html = buildHTML(data);
      $('#content').html(html);
      $('form')[0].reset();
      $("#send").prop("disabled", false);
      $(".form__submit").attr('disabled', false);
      $(".form__submit").removeAttr('disabled'); 
    })}
    else{
      alert("間違っています！！！") ;
      $('form')[0].reset();
      $("#send").prop("disabled", false);
    }
  })
  $(document).on("click","#sending", function (e) {
    e.preventDefault()
    var url = $("form").attr('action')
    var input = $("#text").val();
    var $target = $('#char-1');
    var char = $target.text();
  if (input === char){
    $.ajax({
      url: url,
      type: "GET",
      data: {answer: input},
      dataType: 'json',
    })
    .done(function(data){
      var html = buildHTML(data);
      $('#content').html(html);
      $('form')[0].reset();
      $("#send").prop("disabled", false);
      $(".form__submit").attr('disabled', false);
      $(".form__submit").removeAttr('disabled'); 
    })}
    else{
      alert("間違っています！！！") ;
      $('form')[0].reset();
      $("#send").prop("disabled", false);
    }
  });
  $("form").on("#char-2", function(e){
    e.preventDefault();
    $("#char-1").toggle();
  });
  $(document).on("click","#char-2", function (e) {
    e.preventDefault();
    $("#char-1").toggle();
  });
})
