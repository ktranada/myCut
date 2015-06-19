MyCut.Views.NavBar = Backbone.CompositeView.extend({
  template: JST['navbar/navbar'],
  tagName: "nav",

  events: {
    'click .dropdown-toggle, .dropdown-menu': "dropMenu",
    'click .log-out':                         "logOut",
    'submit form':                            "newSearch"
  },


  initialize: function(options){
    this.router = options.router;
  },

  dropMenu: function() {
    $(".dropdown-menu").toggle();
  },

  newSearch: function(event){
    event.preventDefault();
    debugger
    var formData = $(event.currentTarget).serializeJSON();
    Backbone.history.navigate("/shops/search?des="+ formData.des + "&loc=" + formData.loc, {trigger: true})


  },

  render: function() {
    var renderedNav = this.template();
    this.$el.html(renderedNav);
    return this;
  }

});
