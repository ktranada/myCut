MyCut.Views.BarberShow = Backbone.CompositeView.extend({
  template: JST['barbers/barber_show'],

  initialize: function(){
    this.listenTo(this.model, "sync change", this.render);
  },

  renderGrid: function(){
    $("#photos-grid").gridalicious({
      animate: true,
      selector: '.grid-item-image',
      animationOptions: {
        queue: false,
        speed: 200,
        duration: 300,
        effect: 'fadeInOnAppear',
      }
    });
  },

  render: function(){
    var barberShowView = this.template({
      barber: this.model,
      images: this.collection
    });
    this.$el.html(barberShowView);
    this.renderGrid();
    return this;
  }
});
