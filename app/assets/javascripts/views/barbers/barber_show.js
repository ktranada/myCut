MyCut.Views.BarberShow = Backbone.CompositeView.extend({
  template: JST['barbers/barber_show'],

  initialize: function(){
    this.listenTo(this.model, "sync change", this.render);
  },

  renderGrid: function(){
    if (this.$('.photos-grid')){
      this.$(".photos-grid").gridalicious({
        animate: true,
        width: 100,
        gutter: 40,
        selector: '.grid-items',
        animationOptions: {
          queue: false,
          speed: 200,
          duration: 300,
          effect: 'fadeInOnAppear',
        }
      })
      this.$('.grid-item-image').css('display', 'inline-block');
    }


  },
  unsliderRender: function(){
    if (this.$('banner')){
      this.$('.banner').unslider();
    }
  },

  render: function(){
    var barberShowView = this.template({
      barber: this.model,
      images: this.collection
    });
    this.$el.html(barberShowView);
    return this;
  }
});
