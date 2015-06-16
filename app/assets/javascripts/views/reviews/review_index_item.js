MyCut.Views.ReviewIndexItem = Backbone.CompositeView.extend({
  template: JST['reviews/show'],
  className: "col-md-8 col-md-offset-2"
  initialize: function() {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function(){
    var reviewSView = this.template({ review: this.model });
    this.$el.html(reviewSubview)
    return this;
  }

});
