MyCut.Views.NewReviewForm = Backbone.CompositeView.extend({
  template: JST['reviews/new'],

  events: {
    "submit form": "createReview",
    "click .upload-button": "upload"

  },

  initialize: function(options){
    this._reviews = options.collection;
    this._barbers = options.barbers
    this.listenTo(this.model, "sync", this.render);
    this.review = new MyCut.Models.Review();
    
    this.reviewPictures = this.review.pictures();
    this.listenTo(this.reviewPictures, "add", this.addPreviewSubview);
    this.listenTo(this.reviewPictures, "remove", this.removePreviewSubview);
  },

  createReview: function(event) {
    event.preventDefault();
    var formData = $(event.currentTarget).serializeJSON();
    
    this.review.set(formData['review']);
    var shop = this;
    this.review.save({}, {
      success: function(){
        shop._reviews.add(shop.review);
        shop.persistPhotos();
        humane.log("You've successfully written a review!");
        Backbone.history.navigate("shops/" + shop.review.get('shop_id'), {trigger: true});
      },
      error: function(model, response) {
        var errors = $.parseJSON(response.responseText).join("<br>")
        var $container = shop.$('.errors-container');
        $container.html(errors)
      }
    });
  },

  addPreviewSubview: function(picture){
    var picture = new MyCut.Views.ReviewNewPicture({ model: picture });
    this.addSubview('.preview-collection', picture)
  },

  removePreviewSubview: function(picture){
    this.removeModelSubview('.preview-collection', picture);
  },

  render: function() {
    var newReviewForm = this.template({
      shop: this.model,
      barbers: this._barbers
      });
    this.$el.html(newReviewForm);
    return this;

  },

  upload: function() {
    var that = this;
    
    cloudinary.openUploadWidget(USER_CLOUDINARY, function(error, result){
      if (!error) {
        that.createPhotos(result);
      }
    })
  },

  createPhotos: function(result){
    var self = this;
    result.forEach(function(photo){
      
      if (self.reviewPictures.length < 3) {
        var picture = new MyCut.Models.Picture();
        var photo_url = photo.eager[1].url;
        picture.set({
          photo_url: photo_url,
        })
        self.reviewPictures.add(picture);
      } else {
        humane.log("You can only upload a max of 3 pictures.");
      }
    });
  },

  persistPhotos: function(){
    var that = this;
    this.reviewPictures.forEach(function(picture) {
      picture.set({
        imageable_id: that.review.get('id'),
        imageable_type: "Review"
      })
      picture.save();
    })
  }

});
