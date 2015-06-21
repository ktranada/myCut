MyCut.Views.ShopForm = Backbone.CompositeView.extend({
  template: JST['shops/shop_form'],
  events: {
    "submit form": "shopForm",
    "click .file-upload": "upload"
  },

  initialize: function(options){
    debugger
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

  shopForm: function(event){
    event.preventDefault();
    this._formData = $(event.currentTarget).serializeJSON()['shop'];
    if (this._new) {
      this.generateCoordinates();
    } else {
      this.updateShop();
    }
  },

  createShop: function() {
    var that = this
    this.model.save(this._formData, {
      success: function() {
        humane.log("Your shop has been created!");
        that.collection.add(that.model);
        Backbone.history.navigate("", { trigger: true});
      },
      error: function(model, response) {
        var errors = $.parseJSON(response.responseText).join("<br>")
        var $container = that.$('.errors-container');
        $container.html(errors)
      }
    })

  },

  updateShop: function() {
    var that = this
    this.model.save(this._formData, {
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

  generateCoordinates: function(){
    var fullAddress = this._formData.address +
                      ', ' + this._formData.city +
                      ', ' + this._formData.state;

    var geocoder = new google.maps.Geocoder();
    debugger
    var that = this;
    geocoder.geocode({'address': fullAddress }, function(result, status){
      if (status == google.maps.GeocoderStatus.OK) {
        var coord = result[0].geometry.location;
        that._formData.latitude = coord.A;
        that._formData.longitude = coord.F;
        that.createShop(coord);
      } else {
        that.$('.errors-container').html("Invalid business location.");
      }
    });
  },

  render: function() {
    var newShopForm = this.template({
      shop: this.model
    });
    debugger
    this.$el.html(newShopForm);
    this.initFilepicker();
    return this;
  },

  upload: function () {
    var that = this;
    filepicker.pick(function(blob) {
      var newImage = new MyCut.Models.Picture({
        imageable_type: "Shop",
        photo_url: blob.url
      });
      newImage.save({}, {
        success: function () {
        }
      })
    });
  }
});
