window.MyCut = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    MyCut.shops = new MyCut.Collections.Shops();

    var router = new MyCut.Routers.Router({
      $main: $("#main")
    });
    var navBar = new MyCut.View.NavBar({
      router: router
    });

    $("#navbar").html(navBar.render().$el);

  }
};
