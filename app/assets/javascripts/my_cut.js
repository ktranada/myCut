window.MyCut = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    var MyCut.shops = new MyCut.Collections.Shops();

  }
};

$(document).ready(function(){
  MyCut.initialize();
});
