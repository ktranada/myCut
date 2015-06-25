MyCut.Views.ShowShop = Backbone.CompositeView.extend({
  template: JST['shops/show_shop'],

  initialize: function(){
    this.listenTo(this.model, "sync change", this.render);
    this.listenTo(this.model.reviews(), "add", this.addReviewSubview);
    this.listenTo(this.model.reviews(), "remove", this.removeReviewSubview);
    this.model.reviews().each(this.addReviewSubview.bind(this));
  },

  addReviewSubview: function(review) {
    var reviewSubview = new MyCut.Views.ReviewIndexItem({
      model: review
    })
    this.addSubview('.review-items',reviewSubview);
  },

  removeReviewSubview: function(review) {
    this.removeModelSubview('.review-items', review);
  },
  render: function(){
    var barbers = this.model.barbers();
    var cityStateZip = this.model.get('city') + ", " +
                       this.model.get("state") + " " +
                       this.model.get("zip");

    var renderedContent = this.template({
      mod_id: window.id,
      shop: this.model,
      barbers: barbers,
      cityStateZip: cityStateZip
    });
    this.$el.html(renderedContent)
    this.attachSubviews();
    this.$el.find('.shop.rating').raty({
      score: this.model.attributes.average_rating,
      path: 'assets/raty'
      })
    return this;
  }
});
