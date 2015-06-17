MyCut.Views.NewReviewForm = Backbone.CompositeView.extend({
  template: JST['reviews/new'],

  events: {
    "submit form": "createReview"
  },

  initialize: function(options){
    this.barbers = options.barbers
  },

  createReview: function(event) {
    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON();
    var newReview = new MyCut.Models.Review
  },

  render: function() {
    var newReviewForm = this.template({
      shop: this.model,
      barbers: this.barbers
      });
    this.$el.html(newReviewForm);
    return this;

  }
});
