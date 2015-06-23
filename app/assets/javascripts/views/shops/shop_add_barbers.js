MyCut.Views.ShopAddBarbers = Backbone.CompositeView.extend({
  template: JST['shops/shop_edit_barbers'],

  events: {
    "click .new-barber-button": "addBarberModal",
    "click li.barber-list-item": "selectBarber",

    "click .delete-barber-button": "openDeleteModal",

    "dblclick li.barber-list-item": "openBarberPortfolio"
  },

  initialize: function(options){
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.collection, "add", this.addBarberSubview)
    this.listenTo(this.collection, "remove", this.removeBarberSubview);
    this.collection.each(this.addBarberSubview.bind(this));
    this.selectedBarbers = [];
    this.addDeleteModal();
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

  addDeleteModal: function(){
    this.deleteModal = new MyCut.Views.BarberDelete({
      collection: this.selectedBarbers,
      view: this
    });
    $('body').append(this.deleteModal.render().$el);
  },

  openBarberPortfolio: function(event){
    var el = $(event.currentTarget)
    var barber = this.collection.get(el.data('id'));
    var portfolioModal = new MyCut.Views.BarberPortfolioModal({
      model: barber,
      collection: barber.portfolio_pictures();
    })
    $('body').append(portfolioModal.render().$el);
  },

  openDeleteModal: function(){
    this.deleteModal.$el.show();
  },

  removeBarberSubview: function(barber){
    this.removeModelSubview('.barber-photos', barber);
  },

  removeSelectedBarbers: function(){
    this.selectedBarbers.forEach(function(barber){
      this.removeBarberSubview(barber);
      barber.destroy();
    }.bind(this));
  },

  selectBarber: function(event) {
    var el = $(event.currentTarget)
    var barber = this.collection.get(el.data('id'));
    var index = this.selectedBarbers.indexOf(barber);

    var barbers = this.selectedBarbers;
    if (index == -1 && !el.hasClass('selected')) {
       el.addClass('selected');
      this.selectedBarbers.push(this.collection.get(barber));
    } else {
      el.removeClass('selected');
      this.selectedBarbers = barbers.slice(index, index);
    }
  },


  render: function(){
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  }

});
