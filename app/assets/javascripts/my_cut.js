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
       "https://dl.dropboxusercontent.com/s/u0g6entuipw2o2l/tatted_barber.jpg",
       "https://res.cloudinary.com/mycut/image/upload/v1436295721/undercut-hairstyle-bleach-white-purple-hair-680x478_zdi8hc.jpg",
       "https://dl.dropboxusercontent.com/s/dlrufec4t0q2kfg/background1.jpg",
       "https://dl.dropboxusercontent.com/s/kymuc918k7indue/salon1.jpg",
       "https://dl.dropboxusercontent.com/s/ivri3dnusq3y2f5/short_hair.jpg",
      //  "https://res.cloudinary.com/mycut/image/upload/v1436217958/backdrop/tumblr_nqkggbFYpR1uyuikbo1_500.jpg"
     ], {duration: 12000, fade: 1000});

  }
};

// $(document).ready(function(){
//   window.id = $('div#main').data('user-id')
//   MyCut.initialize();
// });
