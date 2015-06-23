MyCut.Views.BarberDelete = Backbone.CompositeView.extend({
  template: JST['barbers/barber_delete'],
  className: "modal-form delete-modal",

  events: {
    "click .cancel-delete": "cancelDelete"
  },

  initialize: function(){
    this._delete = false;
  },

  cancelDelete: function(){
    this.$el.hide();
  },



  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.$el.hide();
    return this;
  }

});
