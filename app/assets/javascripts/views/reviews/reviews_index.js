MyCut.Views.ReviewsIndex = Backbone.CompositeView.extend({
  template: JST['reviews/index'],
  className: "col-xs-12 col-md-12",
  initialize: function(){
    this.listenTo(this.collection, "sync", this.render);
    this.listenTo(this.collection, "add", this.addReviewSubview);
    this.listenTo(this.colection, "remove", this.removeReviewSubview);
    this.collection.each(this.addReviewSubview.bind(this));
  },

  addReviewSubview: function(review) {
    var reviewSubview = new MyCut.Views.ReviewIndexItem({
      model: review
    })
    this.addSubview(reviewSubview);
  },


  render: function(){
    var reviewIndexView = this.template();
    this.$el.html(reviewIndexView);
    this.attachSubviews();
    return this;
  }


});
