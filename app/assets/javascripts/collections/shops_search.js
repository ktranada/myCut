MyCut.Collections.SearchResult = Backbone.Collection.extend({
  model: MyCut.Models.Shop,
  url: '/api/shops/search',

  initialize: function(options){
    this.search_query = options.search_query || {
      description: "haircuts",
      location: "San Francisco, CA 94102"
    }
  },

  fetchShops: function(){
    debugger
    this.fetch({
        data: {search_query: this.search_query}
    })
  }

});
