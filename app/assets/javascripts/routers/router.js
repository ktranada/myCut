MyCut.Routers.Router = Backbone.Router.extend({
  routes: {
    "": "frontPage"
  },

  initialize: function(options) {
    this.$main = options.$main;
  },


  _swapView: function(newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    this.$main.html(newView.render().$el);
  }


});
