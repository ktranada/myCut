MyCut.Collections.Barbers = Backbone.Collection.extend({
  model: MyCut.Models.Barber,
  url: '/api/barbers',

  getOrFetch: function (id) {
    var barbers = this;
    var barber = barbers.get(id);
    if (barber) {
      barber.fetch();
    } else {
      barber = new MyCut.Models.Barber( { id: id } );
      barber.fetch({
        success: function() {
          barbers.add(barber);
        }
      });
    }
    return barber;
  }
});
