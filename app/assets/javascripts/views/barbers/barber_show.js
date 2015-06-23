MyCut.Views.ShopBarberView = Backbone.CompositeView.extend({
  template: JST['barbers/barber_profile'],
  tagName: "li",
  className:  "barber-list-item",

  attributes: function(){
    return {
      'data-id': this.model.get('id')
    };
  },
  events: {
    "click .barber-portfolio-modal": "openBarberPortfolioModal"
  },

  initialize: function(){
    this.listenTo(this.model, "sync", this.render);
  },


  openBarberPortfolioModal: function(event){
    var el = $(event.currentTarget)
    this.portfolioModal = new MyCut.Views.BarberPortfolioModal({
      model: this.model,
      collection: this.model.portfolio_pictures()
    })
    $('body').append(this.portfolioModal.render().$el);
    this.portfolioModal.$el.show();
  },

  render: function(){
    var renderedContent = this.template({
      barber: this.model
    })
    this.$el.html(renderedContent)
    return this;
  }


});
