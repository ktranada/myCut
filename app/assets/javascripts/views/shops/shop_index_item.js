MyCut.Views.ShopItem = Backbone.CompositeView.extend({
  template: JST['shops/shop_index_item'],
  className: "shop-item col-md-12",

  events: {
    'mouseenter': 'startBounce',
    'mouseleave': 'stopBounce'
  },

  initialize: function(options) {
    this.map = options.map;
    this.listenTo(this.model, "sync change", this.render);
    if (this.model.get('tag_list')) {
      this.tagList = this.model.get('tag_list').join(" - ");
    }
  },


    startBounce: function () {
      this.map.startBounce(this.model.get('id'));
    },

    stopBounce: function () {
      this.map.stopBounce(this.model.get('id'));
    },


  render: function() {
    var renderedContent = this.template({
      shop: this.model,
      tag_list: this.tagList
      });
    this.$el.html(renderedContent);
    this.$el.find('.rating').raty({
      score: this.model.attributes.average_rating,
      path: 'assets/raty'
      })
    return this;
  }
});
