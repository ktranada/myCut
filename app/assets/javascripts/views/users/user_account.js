MyCut.Views.UserAccount = Backbone.CompositeView.extend({
  template: JST['users/user_account'],
  classname: "container-fluid user-account",

  events: {
    "click .edit-account": "openAccountModal",
    "click .delete-account": "deleteConfirmal"
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
    this.collection.each(this.addShopSubview);
    this.listenTo(this.collection, "add", this.addShopSubview);
    this.listenTo(this.collection, "remove", this.removeModelSubview);
    this.addDeleteModal();
  },

  addShopSubview: function(shop){
    debugger
    var shopSubview = new MyCut.Views.ShopItem({ model: shop });
    this.addSubview('.managed-shops', shopSubview);
  },

  deleteAccount: function(){
    this.deleteModal.remove();
    debugger
    this.model.destroy({
      success: function(model, response){
        humane.log("Come back~");
        $.ajax({
          url: '/sessions/new',
          type: "GET",
          success: function(result){
            humane.log("You have successfully deleted your account.");
          }
        })
      }
    });
  },

  addDeleteModal: function(){
    this.deleteModal = new MyCut.Views.UserDelete({ view: this });
    debugger
    $('body').append(this.deleteModal.render().$el);
  },

  deleteConfirmal: function(){
    debugger
    this.deleteModal.$el.show();
  },

  removeShopSubview: function(shop){
    this.removeModelSubview('.managed-shops', shop);
  },

  openAccountModal: function(){
    this.accountModal = new MyCut.Views
  },

  render: function(){
    var renderedContent = this.template({
      user: this.model
    })
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  }
})
