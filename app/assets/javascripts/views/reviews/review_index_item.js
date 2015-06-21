MyCut.Views.ReviewIndexItem = Backbone.CompositeView.extend({
  template: JST['reviews/show'],
  tagName: "li",
  // review-index-item col-md-9 col-md-offset-1
  initialize: function(options) {
    this.author = options.author;
    this.listenTo(this.model, "sync change", this.render);
  },

  render: function(){
    debugger
    var reviewSubview = this.template({
      review: this.model,
      author: this.author,
      pictures: this.model.pictures()
    });
    this.$el.html(reviewSubview)
    this.$el.find('.review.rating').raty({
      score: this.model.attributes.rating,
      path: 'assets/raty'
      })
    return this;
  }

});
