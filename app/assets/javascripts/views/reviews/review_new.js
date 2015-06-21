MyCut.Views.NewReviewForm = Backbone.CompositeView.extend({
  template: JST['reviews/new'],

  events: {
    "submit form": "createReview",
    "click .file-upload": "upload"

  },

  initialize: function(options){
    this._reviews = options.collection;
    this._barbers = options.barbers
    this.listenTo(this.model, "sync", this.render);

  },

  createReview: function(event) {
    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON();
    debugger
    debugger
    var photos = formData.pictures


    var newReview = new MyCut.Models.Review(formData['review']);
    var shop = this;
    newReview.save({}, {
      success: function(){
        shop._reviews.add(newReview);
        Backbone.history.navigate("shops/" + newReview.get('shop_id'), {trigger: true});
      },
      error: function(model, response) {
        var errors = $.parseJSON(response.responseText).join("<br>")
        var $container = shop.$('.errors-container');
        $container.html(errors)
      }
    });
  },

  initFilepicker: function(){
    var $filePickerInput = this.$('input[type=filepicker]');
    filepicker.constructWidget($filePickerInput[0]);
  },



  render: function() {
    var newReviewForm = this.template({
      shop: this.model,
      barbers: this._barbers
      });
    this.$el.html(newReviewForm);
    this.initFilepicker();
    return this;

  },

  upload: function () {
    var review = this;
    filepicker.pick(function(blob) {
      debugger
      var newImage = new MyCut.Models.Picture({
        photo_url: blob.url
      });
      newImage.save({}, {
        success: function () {
        }
      })
    });
  }
});
