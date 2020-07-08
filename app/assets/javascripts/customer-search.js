document.addEventListener("turbolinks:load", function() {
$(function() {
  var search_list = $(".customers-table");
  var ItemsHtml = "" ;
  var CustomersHtml = "";
  
  function appendCustomer(customer) {
    function appendItem(item) {
      var ItemHtml = `<div class="item-box">
                        <a href="items/${item.id}">
                          <p><nobr>${item.name}</nobr></p>
                        </a>
                        <div class="item-image-box">
                        <img src="${item.image.url}">
                        </div>
                      </div>`;
      return ItemHtml
    }

    customer.items.forEach(function(item){
      ItemsHtml += appendItem(item);
    });
    var CustomerHtml = `<tr>
                          <th>
                            <div class="customer-deteil-box">
                              <a href="customers/${customer.id}">       
                                <p>
                                  ${customer.name}
                                </p>
                              </a>
                            </div>
                          </th>
                          <td>
                            <div class="customer-items-box">
                              ${ItemsHtml}
                            </div>
                          </td>
                        </tr>`;
    return CustomerHtml
  }
  function appendErrMsgToHTML(msg) {
    var html = `<div class='listview__element--right-icon'>${ msg }</div>`;
    search_list.append(html);
  }

  $(".customer-search__query").on("keyup", function() {
      var input = $(".customer-search__query").val();
      $.ajax({
      type: 'GET',
      url: 'search',
      data: { keyword: input },
      dataType: 'json'
      })
      .done(function(customers) {
        $('.customers-table').empty();
        CustomersHtml = "";
        if (customers.length !== 0) {
          customers.forEach(function(customer){
            CustomersHtml += appendCustomer(customer);
            ItemsHtml = "";
          });
          var html = `<table class="t-line">
                        <tr class="customer-table-tittle-content">
                          <th class="customer-name-tittle">顧客の名前</th>
                          <th class="customer-item-tittle">ご購入商品</th>
                        </tr>
                        ${CustomersHtml}
                      </table> `
          search_list.append(html);
        }
        else {
          appendErrMsgToHTML("一致する顧客がいません");
        }
      })
      .fail(function() {
        alert('顧客の検索に失敗しました');
      })
    });
  });
});