MyCut.Views.NewReviewForm = Backbone.CompositeView.extend({
  template: JST['reviews/new'],

  events: {
    "submit form": "createReview",
    "click .file-upload": "upload"
  },

  initialize: function(options){
    this._reviews = options.collection;
    this._barbers = options.barbers
  },

  createReview: function(event) {
    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON();
    var newReview = new MyCut.Models.Review(formData['review']);
    var shop = this;
    debugger
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

  render: function() {
    var newReviewForm = this.template({
      shop: this.model,
      barbers: this._barbers
      });
    this.$el.html(newReviewForm);
    var $filePickerInput = this.$('input[type=filepicker]');
    // Convert from jquerify object into the widget so it doens't break upon
    // rerendering
    return this;

  },


  upload: function () {
    var review = this;
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
});
