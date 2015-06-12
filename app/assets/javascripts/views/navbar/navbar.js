MyCut.Views.NavBar = Backbone.View.extend({
  tagName: "nav",
  className: "navbar navbar-default navbar-fixed-top",
  template: JST['navbar/nav'],

  events: {
  },

  render: function() {
    var renderedNav = this.template();
    this.$el.html(renderedNav);
    return this;
  }

});
