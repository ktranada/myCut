MyCut.Views.NewShop = Backbone.CompositeView.extend({
  template: JST['shops/shop_form'],
  events: {
    "submit form": "createShop"
  },


  initialize: function(options){
    this.model = options.model;
    this._new = this.model.isNew()

  },

  upload: function () {
    filepicker.pick(function(blob) {
      var newImage = new MyCut.Models.Picture({
        photo_url: blob.url
      });
      newImage.save({}, {
        success: function () {
          alert('Image uploaded!');
        }
      })
    });
  },

  initFilepicker: function(){
    var $filePickerInput = this.$('input[type=filepicker]');
    filepicker.constructWidget($filePickerInput[0]);
  },


  createShop: function(event){
    event.preventDefault();
    var newShopData = $(event.currentTarget).serializeJSON();
    var that = this;
    this.model.save(newShopData, {
      success: function() {
        that.add(newShop);
        Backbone.history.navigate("#", { trigger: true});
      },
      error: function(model, response) {
        var errors = $.parseJSON(response.responseText).join("<br>")
        var $container = that.$('.errors-container');
        $container.html(errors)
      }
    })
  },

  errorsShow: function(model, response){

  },

  render: function() {
    var shop = new MyCut.Models.Shop();
    var newShopForm = this.template({
      shop: shop
    });
    this.$el.html(newShopForm);
    this.initFilepicker();
    return this;
  }

});
