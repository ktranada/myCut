MyCut.Views.ShopAddBarbers = Backbone.CompositeView.extend({
  template: JST['shops/shop_edit_barbers'],
  className: "shop-barbers-edit",
  events: {
    "click .new-barber-button": "openBarberModal",
    "click .delete-barber-button": "removeSelectedBarbers",

    "dblclick li.barber-list-item": "barberPortfolio",

    "click .delete-barber-button": "openDeleteModal"
    // "dblclick li.barber-list-item": "openBarberPortfolio"
  },

  initialize: function(options){
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.collection, "add", this.addBarberSubview)
    this.listenTo(this.collection, "remove", this.removeBarberSubview);
    this.collection.each(this.addBarberSubview.bind(this));
    MyCut.selectedBarbers = [];
    this.addBarberModal();
    this.addDeleteModal();
  },

  addBarberModal: function(){
     this.barberModal = new MyCut.Views.BarberFormModal({
      shop: this.model,
      collection: this.collection
    });
    $('body').append(barberForm.render().$el);
  },


  addBarberSubview: function(barber){
    var shopBarber = new MyCut.Views.ShopBarberView({
       model: barber,
       collection: this.collection

    });
    this.addSubview('.barber-photos', shopBarber);
  },

  addDeleteModal: function(){
    this.deleteModal = new MyCut.Views.BarberDelete({
      collection: MyCut.selectedBarbers,
      view: this
    });
    $('body').append(this.deleteModal.render().$el);
  },

  openBarberModal: function(){
    this.barberModal.$el.show();
  },

  openDeleteModal: function(){
    this.deleteModal.$el.show();
  },

  removeBarberSubview: function(barber){
    this.removeModelSubview('.barber-photos', barber);
  },

  removeSelectedBarbers: function(){
    MyCut.selectedBarbers.forEach(function(barber){
      this.removeBarberSubview(barber);
      barber.destroy();
    }.bind(this));
  },


  render: function(){
    var renderedContent = this.template({
      shop: this.model
    });
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  }

});
