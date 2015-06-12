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
    var navBar = new MyCut.Views.NavBar({
      router: router
    });
    Backbone.history.start()
    $("#navbar").html(navBar.render().$el);
  }
};
