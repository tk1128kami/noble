document.addEventListener("turbolinks:load", function() {
$(function(){
  var search_list = $(".items-box");

  function appendItem(item) {
    var html = `<div class="item-box">
                  <div class="item-image-box">
                    <img src="${item.image.url}">
                  </div>
                  <div class="item-detail-box">
                    <div>
                      ${item.name}
                    </div>
                    <div>
                      <span>¥</span>${item.price}
                    </div>
                  </div>
                </div>`
      search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='listview__element--right-icon'>${ msg }</div>`;
    search_list.append(html);
  }
  $(".item-search__query").on("keyup", function(){
    var input = $(".item-search__query").val();
    $.ajax({
      type : 'GET',
      url : 'items-search',
      data: {keyword: input},
      dataType: 'json'
    })
    .done(function(items){
      $(".items-box").empty();
      console.log(items)
      if (items.length !== 0) {
        items.forEach(function(item){
          appendItem(item);
        })
      }
      else {
        appendErrMsgToHTML("一致する商品がありません");
      }
    })
    .fail(function(){
      alert('商品の検索に失敗しました')
    })
  })
});
});