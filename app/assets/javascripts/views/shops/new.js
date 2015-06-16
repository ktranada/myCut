MyCut.Views.NewShop = Backbone.CompositeView.extend({
  template: JST['shops/new'],
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

  createShop: function(event){
    event.preventDefault();
    var newShopData = $(event.currentTarget).serializeJSON();
    var newShop = new MyCut.Models.Shop(newShopData);
    debugger
    newShop.save({}, {
      success: function() {
        MyCut.shops.add(newShop);
        Backbone.history.navigate("#", { trigger: true});
      },
      error: function(response) {

      }
    })
  },

  render: function() {
    var newShopForm = this.template();
    this.$el.html(newShopForm);
    var $filePickerInput = this.$('input[type=filepicker]');
    // Convert from jquerify object into the widget so it doens't break upon
    // rerendering
    filepicker.constructWidget($filePickerInput[0]);
    return this;
  }

});
