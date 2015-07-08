MyCut.Views.ShopForm = Backbone.CompositeView.extend({
  template: JST['shops/shop_form'],
  events: {
    "submit form": "shopForm",
    "click .upload-button": "upload",
    "click a.confirm": "shopDelete",
  },

  initialize: function(options){
    this._new = this.model.isNew()
    this.listenTo(this.model, "sync add", this.render)

  },
  initBSTAgs: function(){
    $('#shop-tags').tagsinput('add', this.model);
  },

  shopForm: function(event){
    event.preventDefault();
    debugger
    this._formData = $(event.currentTarget).serializeJSON()['shop'];
    if (this._new) {
      this.generateCoordinates();
    } else {
      this.shopUpdate();
    }
  },

  shopCreate: function() {
    var that = this
    this.model.save(this._formData, {
      success: function() {
        humane.log("Your shop has been created!", {timeoutAfterMove: 2000});
        Backbone.history.navigate("", { trigger: true});
      },
      error: function(model, response) {
        var errors = $.parseJSON(response.responseText).join("<br>")
        var $container = that.$('.errors-container');
        $container.html(errors)
      }
    })
  },

  shopDelete: function(e){
    var that = this;
    bootbox.confirm("Are you sure you want to delete your shop?", function(result){
      if (result == true){
        that.model.destroy();
        humane.log("Your shop has been deleted.")
        Backbone.history.navigate("", {trigger: true});
      }
    });
  },

  shopUpdate: function() {
    var that = this

    this.model.save(this._formData, {
      success: function(){
        humane.log("Your shop has been updated.", { timeoutAfterMove: 2000});
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
    var that = this;
    debugger
    var geocoder = L.mapbox.geocoder('mapbox.places-v1');
    geocoder.query(fullAddress, showMap);

    function showMap(err, data) {
        if (data.lbounds) {
            that._formData.latitude = data.latlng[0];
            that._formData.longitude = data.latlng[1];
            that.shopCreate();
        }
    }
    this.shopCreate();
  },

  render: function() {
    var newShopForm = this.template({
      shop: this.model
    });
    this.$el.html(newShopForm);
    // this.initFilepicker();
    this.initBSTAgs();
    return this;
  },

  upload: function(e){

    var that = this;
    e.preventDefault();
    cloudinary.openUploadWidget(SHOP_CLOUD, function(error, result){
      if (!error) {
        var photo_url =  result[0].eager[0].url;
        that.model.set('photo_url', photo_url);
        that.$('img').attr('src', photo_url)
      }
    });
  }
});
