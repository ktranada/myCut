MyCut.Collections.Users = Backbone.Collection.extend({
  model: MyCut.Models.User,
  url: "/api/users",

  getOrFetch: function(id){
    var users = this;
    var user = users.get(id);
    if (user) {
      user.fetch();
    } else {
      user = new MyCut.Models.User({id: id});
      user.fetch({
        success: function(){
          users.add(user)
        }
      });
    }
    return user;
  }
});
