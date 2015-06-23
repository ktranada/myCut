MyCut.Views.BarberDelete = Backbone.CompositeView.extend({
  template: JST['barbers/barber_delete'],
  className: "modal-form delete-modal",

  events: {
    "click .cancel-delete": "cancelDelete",
    "click .confirm-delete": "confirmDelete"
  },

  initialize: function(options){
    this.barberView = options.view;

  },

  cancelDelete: function(){
    this.$el.hide();
  },

  confirmDelete: function(){
    debugger
    this.barberView.removeSelectedBarbers();
    this.$el.hide();
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.$el.hide();
    return this;
  }

});
