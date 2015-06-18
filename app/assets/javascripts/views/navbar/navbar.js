MyCut.Views.NavBar = Backbone.CompositeView.extend({
  template: JST['navbar/navbar'],
  tagName: "nav",
  render: function() {
    var renderedNav = this.template();
    this.$el.html(renderedNav);
    return this;
  }

});
