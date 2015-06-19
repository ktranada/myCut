MyCut.Views.NavBar = Backbone.CompositeView.extend({
  template: JST['navbar/navbar'],
  tagName: "nav",

  events: {
    'click .dropdown-toggle, .dropdown-menu': "dropMenu",
    'click .log-out': "logOut"
  },


  initialize: function(options){
    this.router = options.router;
  },

  dropMenu: function() {
    $(".dropdown-menu").toggle();
  },

  render: function() {
    var renderedNav = this.template();
    this.$el.html(renderedNav);
    return this;
  }

});
