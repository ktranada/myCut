MyCut.Views.NewShop = Backbone.CompositeView.extend({
  template: JST['shops/shop_new'],
  events: {
    "click .file-upload": "upload",
    "submit form": "createShop"
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
    var newShop = new MyCut.Models.Shop(newShopData);
    debugger
    var that = this;
    newShop.save({}, {
      success: function() {
        MyCut.shops.add(newShop);
        Backbone.history.navigate("#", { trigger: true});
      },
      error: function(model, response) {
        var errors = $.parseJSON(response.responseText).join("<br>")
        var $container = that.$('.errors-container');
        $container.html(errors)
      }
    })
  },

  render: function() {
    var newShopForm = this.template();
    this.$el.html(newShopForm);
    this.initFilepicker();
    return this;
  }

});
