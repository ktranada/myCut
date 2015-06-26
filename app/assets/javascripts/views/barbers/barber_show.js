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
    "click .barber-portfolio-modal": "openBarberPortfolioModal",
    "click .select-box":  "selectBarber"
  },

  initialize: function(options){
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

  selectBarber: function(event) {
    event.preventDefault();
    var index = MyCut.selectedBarbers.indexOf(this.model);
    var barbers = MyCut.selectedBarbers;
    if (index == -1 && !this.$el.hasClass('selected')) {
       this.$el.addClass('selected');

      MyCut.selectedBarbers.push(this.collection.get(this.model));
      this.$('.select-box').html('<i class="fa fa-check-square-o"></i>');
    } else {
      this.$el.removeClass('selected');
      this.$('.select-box').html('<i class="fa fa-square-o"></i>');
      MyCut.selectedBarbers = barbers.slice(index, index);
    }
  },

  render: function(){
    var renderedContent = this.template({
      barber: this.model
    })
    this.$el.html(renderedContent)
    return this;
  }


});
