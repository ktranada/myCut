window.MyCut = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    MyCut.shops = new MyCut.Collections.Shops();
    MyCut.shops.fetch();
    new MyCut.Routers.Router({
      $main: $("#main")
    });
    Backbone.history.start();
    $.backstretch([
         "https://dl.dropbox.com/s/dlrufec4t0q2kfg/background1.jpg?dl=0",
         "https://dl.dropbox.com/s/02r6ccf0836l7v8/nice_shop.jpg?dl=0",
         "https://dl.dropbox.com/s/u0g6entuipw2o2l/tatted_barber.jpg?dl=0",
         "https://dl.dropbox.com/s/9swff9ea9nxs4i6/background2.jpg?dl=0",
         "https://dl.dropbox.com/s/kymuc918k7indue/salon1.jpg?dl=0"

     ], {duration: 12000, fade: 1000});
  }
};

$(document).ready(function(){
  MyCut.initialize();
});
