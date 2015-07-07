MyCut.Views.BarberShow = Backbone.CompositeView.extend({
  template: JST['barbers/barber_show'],
  className: "barber-public",

  initialize: function(){
    this.listenTo(this.model, "sync change", this.render);
    this.listenTo(this.model.reviews(), "add", this.addReviewSubview)
    this.listenTo(this.model.reviews(), "remove", this.removeReviewSubview)
    this.model.reviews().each(this.addReviewSubview.bind(this))
  },

  addReviewSubview: function(review) {
    var review = new MyCut.Views.ReviewIndexItem({
      model: review,
      author: review.author
    })
    this.addSubview('.barber-reviews', review, false)
  },

  removeReviewSubview: function(review) {
    this.removeModelSubview('.barber-reviews', review);
  },

  render: function(){
    var barberShowView = this.template({
      barber: this.model,
      images: this.collection
    });
    this.$el.html(barberShowView);
    this.attachSubviews();
    return this;
  }
});
