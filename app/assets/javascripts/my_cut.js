window.MyCut = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    MyCut.shops = new MyCut.Collections.Shops();
    MyCut.shops.fetch();
    new MyCut.Routers.Router({
      $main: $("#main"),
      collection: MyCut.shops
    });

    Backbone.history.start();

  }
};

// $(document).ready(function(){
//   window.id = $('div#main').data('user-id')
//   MyCut.initialize();
// });
