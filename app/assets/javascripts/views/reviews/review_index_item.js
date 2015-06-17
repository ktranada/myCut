MyCut.Views.ReviewIndexItem = Backbone.CompositeView.extend({
  template: JST['reviews/show'],
  className: "review-index-item col-md-9 col-md-offset-1",
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    debugger
    var reviewSubview = this.template({ review: this.model });
    this.$el.html(reviewSubview)
    return this;
  }

});
