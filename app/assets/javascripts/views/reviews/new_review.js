MyCut.Views.NewReview = Backbone.CompositeView.extend({
  template: JST['reviews/new'],

  events: {
    "submit form": "createReview"
  },

  createReview: function(event) {
    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON();
    var newReview = new MyCut.Models.Review

  },

  render: function() {
    var newReviewForm = this.template();
    this.$el.html(newReviewForm);
    return this;

  }
});
