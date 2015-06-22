MyCut.Views.ShopAddBarbers = Backbone.CompositeView.extend({
  template: JST['shops/shop_edit_barbers'],

  events: {
    "click .new-barber-button": "addBarberModal"
  },

  initialize: function(options){
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.collection, "add", this.addBarber)
    this.listenTo(this.collection, "remove", this.removeBarber);
    this.collection.each(this.addBarber)
  },

  addBarberModal: function(){
    var barberForm = new MyCut.Views.BarberFormModal({
      shop: this.model,
      collection: this.collection
    });
    $('body').append(barberForm.render().$el);
  },

  addBarberSubview: function(barber){
    var shopBarber = new MyCut.Views.ShopBarberView({
       model: barber
    });
    this.addSubview('.barber-photos', shopBarber);
  },

  removeBarberSubview: function(barber){
    this.removeModelSubview('.barber-photos', barber);
  },



  render: function(){
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  }

});
