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
    Backbone.history.start();
  }
};

$(document).ready(function(){
  MyCut.initialize();
});
