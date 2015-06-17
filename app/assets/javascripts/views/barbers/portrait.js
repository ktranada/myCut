MyCut.Views.BarberList = Backbone.CompositeView.extend({

  intialize: function(){
    this.listenTo(this.collection, "sync", this.render)
  },


  render: function(){
    var renderedBarberList = this.template({
      barbers: this.collection
    })
    this.$el.html(renderedBarberList);
    return this;
  }
})
