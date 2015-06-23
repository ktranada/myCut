MyCut.Views.ReviewNewPicture = Backbone.CompositeView.extend({
  template: JST['barbers/barber_portfolio_edit_photo_item'],
  tagName: "li",
  events: {
    "click .delete-picture": "deletePicture"
  },

  deletePicture: function(){
    this.model.destroy();
  },

  render: function(){
    var renderedContent = this.template({ picture: this.model });
    this.$el.html(renderedContent);
    return this;
  }

});
