MyCut.Views.UserDelete = Backbone.CompositeView.extend({
  template: JST['users/user_delete'],
  className: "modal-form delete-modal",

  events: {
    "click .cancel-delete": "cancelDelete",
    "click .confirm-delete": "promptPassword",
    "submit form": "confirmDelete"
  },

  initialize: function(options){
    this.userView = options.view;

  },

  cancelDelete: function(){
    this.$el.hide();
  },

  promptPassword: function(){
    this.$('.options').hide();
    this.$('.password-req').show();
  },

  confirmDelete: function(event){
    event.preventDefault();
    
    var password = $(event.currentTarget).serializeJSON();

    this.userView.deleteAccount(password);
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.$('.password-req').hide();
    this.$el.hide();
    return this;
  }

});
