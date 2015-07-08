MyCut.Views.UserAccount = Backbone.CompositeView.extend({
  template: JST['users/user_account'],
  classname: "container-fluid user-account",

  events: {
    "click .edit-account": "openEditModal",
    "click .delete-account": "openDeleteModal",
  },

  initialize: function(){

    window.$('.modal-form').remove();
    this.listenTo(this.model, "sync change", this.render);
    this.collection.each(this.addShopSubview);
    this.listenTo(this.collection, "add", this.addShopSubview);
    this.listenTo(this.collection, "remove", this.removeModelSubview);

    this.addDeleteModal();
    this.addEditModal();
  },

  addShopSubview: function(shop){
    var shopSubview = new MyCut.Views.ShopItem({ model: shop });
    this.addSubview('.managed-shops', shopSubview);
  },

  deleteAccount: function(password){
    var that = this;
    $.ajax({
      url: "/api/users/" + window.id,
      type: 'DELETE',
      dataType: "json",
      data: password,
      success: function(model, response){
        $.ajax({
          url: '/session/new',
          type: 'get',
          success: function() {
            that.deleteModal.remove();
            window.location = "/welcome";
          }
        });
      },
      error: function(model, response) {
        humane.log("You must input the correct password.");
      }
    });
  },

  addDeleteModal: function(){
    this.deleteModal = new MyCut.Views.UserDelete({ view: this });
    $('body').append(this.deleteModal.render().$el);
  },

  openDeleteModal: function(){

    this.deleteModal.$el.show();
  },


  addEditModal: function(){
    this.accountModal = new MyCut.Views.UserAccountEditModal({
      model: this.model,
      view: this
    })
    $('body').append(this.accountModal.render().$el);
  },

  openEditModal: function(){
    this.accountModal.$el.show();
  },

  removeShopSubview: function(shop){
    this.removeModelSubview('.managed-shops', shop);
  },


  render: function(){
    var renderedContent = this.template({
      user: this.model
    })
    this.$el.html(renderedContent);
    this.attachSubviews();
    this.$el.find('.tag_list').hide();
    return this;
  }
})
