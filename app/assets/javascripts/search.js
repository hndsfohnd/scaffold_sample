$(function(){
  var search_list = $("#result");
  function appenddata(data){
    var html = `
    <div class="searched__all">
    <table border="2">
      <td class="result__first"><a href="/searches/${data.id}">${data.id}</a></td>
      <td class="result__second">${data.amadeus}</td>
      <td class="result__third">${data.description}</td>
      <td class="result__fours">${data.axess}</td>
      <td class="result__five">${data.infini}</td>
    </tr>
  </tbody></table></div>`;
      search_list.append(html);
  };
  function appenNodata(nosearch){
    var html = `<p id="result"></p>
    <div class="nosearch">
    <p class="color">${ nosearch }</p></div>`
      search_list.append(html);
  };
  function editElement(element) {
    var result = "^" + element;
    // mapで回ってきた配列の各要素の前に^を付け加える
    return result;
      }
  $("#keyword").on("keyup", function() {
    var input = $("#keyword").val();
    var inputs = input.split(" ").filter(function(e) { return e; });
    var newInputs = inputs.map(editElement);
    var word = newInputs.join("|");
    var reg = RegExp(word);
    
    $.ajax({
      type: 'GET',
      url: '/searches/result',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(datas){
      $("#result").empty();
      $('div').removeClass("result__zero");
      if (datas.length !== 0 ) { 
        $.each(datas, function(i, data) {
            // 配列fruitsがreg(正規化オブジェクト)とマッチしていたらappendListする
          appenddata(data);
        });
      }
      else {
        appenNodata("一致する検索はありません");
      }

    })
    .fail(function(){
      alert('検索に失敗しました');
    })
  });
});