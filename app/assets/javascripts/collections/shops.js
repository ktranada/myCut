MyCut.Collections.Shops = Backbone.Collection.extend({
  url: '/api/shops',

  getOrFetch: function(id){
    var shops = this;
    var shop = shops.get('id');
    if (shop){
      shop.fetch();
    } else {
      shop = new MyCut.Models.Picture( { id: id } );
      shop.fetch({
        success: function() {
          shops.add(shop);
        }
      });
    }
    return shop;
  }

});
