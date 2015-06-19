MyCut.Collections.SearchResult = Backbone.Collection.extend({
  model: MyCut.Models.Shop,
  url: '/api/shops/search',
});
