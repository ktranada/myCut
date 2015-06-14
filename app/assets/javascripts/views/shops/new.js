MyCut.Views.NewShop = Backbone.View.extend({
  template: JST['shops/new'],
  events: {
    "submit form": "createShop"
  },

  tagName: "div",

  className: "row new-shop-form",

  createShop: function(event){
    event.preventDefault();
    var newShopData = $(event.currentTarget).serializeJSON();
    var newShop = new MyCut.Models.Shop(newShopData);
    newShop.save({}, {
      success: function() {
        MyCut.shops.add(newShop);
        backbone.history.navigate("#", { trigger: true});
      }
    })
  },

  render: function() {
    var newShopForm = this.template();
    this.$el.html(newShopForm);
    return this;
  }

});
