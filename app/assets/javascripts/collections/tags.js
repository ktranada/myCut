MyCut.Collections.Tags = Backbone.Collection.extend({
  model: MyCut.Models.Tag,
  url: '/api/tags',

  getOrFetch: function(id){
    var tags = this;
    var tag = tags.get(id);
    if (tag){
      tag.fetch();
    } else {
      tag = new MyCut.Models.Tag( { id: id } );
      tag.fetch({
        success: function() {
          tags.add(tag);
        }
      });
    }
    return tag;
  }

});
