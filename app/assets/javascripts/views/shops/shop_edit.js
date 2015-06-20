MyCut.Views.ShopEditView = Backbone.View.extend({
  template: JST['shops/shop_new'],

  events: {
    "submit form": "edit"
  },

  edit: function(event){
    event.preventDefault();
    var that = this;
    var formData = $(event.currentTarget).serializeJSON()['shop'];
    debugger
    this.model.save(formData, {
      success: function(){
        humane.log("Your shop has been updated");
        Backbone.history.navigate("shops/" + that.model.get('id'), { trigger: true } )
      },
      error: function(model, response) {
        var errors = $.parseJSON(response.responseText).join("<br>")
        var $container = that.$('.errors-container');
        $container.html(errors)
      }
    })
  },

  render: function(){
    var renderedForm = this.template({
      shop: this.model
    });
    this.$el.html(renderedForm)
    return this;
  }
});
