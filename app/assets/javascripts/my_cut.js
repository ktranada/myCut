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
       "/assets/tatted_barber.jpg",
       "/assets/purple.jpg",
       "/assets/background1.jpg",
       "/assets/salon1.jpg",
       "/assets/short_hair.jpg",
      //  "https://res.cloudinary.com/mycut/image/upload/v1436217958/backdrop/tumblr_nqkggbFYpR1uyuikbo1_500.jpg"
     ], {duration: 12000, fade: 1000});

  }
};

// $(document).ready(function(){
//   window.id = $('div#main').data('user-id')
//   MyCut.initialize();
// });
