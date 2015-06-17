MyCut.Views.ReviewIndexItem = Backbone.CompositeView.extend({
  template: JST['reviews/show'],
  tagName: "li",
  // review-index-item col-md-9 col-md-offset-1
  initialize: function(options) {
    this.author = options.author;
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    var reviewSubview = this.template({
      review: this.model,
      author: this.author
    });
    this.$el.html(reviewSubview)
    return this;
  }

});
