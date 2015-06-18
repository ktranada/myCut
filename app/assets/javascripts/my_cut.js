window.MyCut = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    MyCut.shops = new MyCut.Collections.Shops();
    MyCut.shops.fetch();

    var router = new MyCut.Routers.Router({
      $main: $("#main"),
      collection: MyCut.shops
    });

    var navbar = new MyCut.Views.NavBar({
      router: router,
      collection: MyCut.shops
    })

    $('#nav').html(navbar.render().$el);
    Backbone.history.start();

    $.backstretch([
       "https://dl.dropbox.com/s/u0g6entuipw2o2l/tatted_barber.jpg",
       "https://dl.dropbox.com/s/048vpusq0xstxah/short_red.jpg",
       "https://dl.dropbox.com/s/dlrufec4t0q2kfg/background1.jpg",
       "https://dl.dropbox.com/s/9kwji0uox1ay98e/silver_hair.jpg",
       "https://dl.dropbox.com/s/02r6ccf0836l7v8/nice_shop.jpg",
       "https://dl.dropbox.com/s/840dud3g78id5qj/silver2.jpg",
       "https://dl.dropbox.com/s/kymuc918k7indue/salon1.jpg",
       "https://dl.dropbox.com/s/ivri3dnusq3y2f5/short_hair.jpg"
     ], {duration: 12000, fade: 1000});
  }
};

// $(document).ready(function(){
//   window.id = $('div#main').data('user-id')
//   MyCut.initialize();
// });
