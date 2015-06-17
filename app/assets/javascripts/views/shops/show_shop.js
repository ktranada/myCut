MyCut.Views.ShowShop = Backbone.CompositeView.extend({
  template: JST['shops/show_shop'],

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
    var reviewsIndexSubview = new MyCut.Views.ReviewsIndex({
      collection: this.model.reviews(),
    });
    this.addSubview('.reviews-index', reviewsIndexSubview);
  },

  render: function(){
    var barbers = this.model.barbers();
    var renderedContent = this.template({
      shop: this.model,
      barbers: barbers
    });

    this.$el.html(renderedContent)
    this.attachSubviews();
    return this;
  }
});
