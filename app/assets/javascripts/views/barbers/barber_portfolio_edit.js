MyCut.Views.BarberPortfolioModal = Backbone.CompositeView.extend({
  template: JST['barbers/barber_portfolio_edit'],
  className: "modal-form barber-portfolio-edit",

  initialize: function(){

  },
  render: function() {
    var renderedContent = this.template({
      pictures: this.collection

    });
    this.$el.html(renderedContent);
    return this;
  }

});
