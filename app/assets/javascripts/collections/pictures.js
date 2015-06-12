MyCut.Collections.Pictures = Backbone.Collection.extend({
  model: MyCut.Models.Picture,
  url: '/api/pictures',

  getOrFetch: function(id){
    var pictures = this;
    var picture = pictures.get('id');
    if (picture){
      picture.fetch();
    } else {
      picture = new MyCut.Models.Picture( { id: id } );
      picture.fetch({
        success: function() {
          pictures.add(picture);
        }
      });
    }
    return picture;
  }

});
