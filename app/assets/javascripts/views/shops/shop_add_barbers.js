MyCut.Views.ShopAddBarbers = Backbone.CompositeView.extend({
  template: JST['shops/shop_edit_barbers'],

  events: {
    "click .new-barber-button": "addBarberModal"
  },

  initialize: function(options){
    debugger
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.collection, "add", this.addBarberSubview)
    this.listenTo(this.collection, "remove", this.removeBarberSubview);
    this.collection.each(this.addBarberSubview.bind(this));
  },

  addBarberModal: function(){
    debugger
    var barberForm = new MyCut.Views.BarberFormModal({
      shop: this.model,
      collection: this.collection
    });
    $('body').append(barberForm.render().$el);
  },

  addBarberSubview: function(barber){
    debugger
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
    this.attachSubviews();
    return this;
  }

});
