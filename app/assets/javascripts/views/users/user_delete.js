MyCut.Views.UserDelete = Backbone.CompositeView.extend({
  template: JST['barbers/barber_delete'],
  className: "modal-form delete-modal",

  events: {
    "click .cancel-delete": "cancelDelete",
    "click .confirm-delete": "confirmDelete"
  },

  initialize: function(options){
    this.userView = options.view;

  },

  cancelDelete: function(){
    this.$el.hide();
  },

  confirmDelete: function(){
    debugger
    this.userView.deleteAccount();
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.$el.hide();
    return this;
  }

});
