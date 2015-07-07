MyCut.Views.NavbarShop = Backbone.CompositeView.extend({
  template: JST['navbar/navbar_shop'],

  intialize: function(options){
    this.mod_id = options.mod_id;
    this.cityStateZip = options.cityStateZip;
  },

  render: function(){
    var renderedContent = this.template({
      shop: this.model,
      mod_id: this.mod_id,
      cityStateZip: this.cityStateZip
    });
    window.$('.navbar-banner').append(renderedContent);
    return this;
  }
});
