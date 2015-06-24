MyCut.Views.BarberPortfolioModal = Backbone.CompositeView.extend({
  template: JST['barbers/barber_portfolio_edit'],
  className: "modal-form barber-portfolio-edit",

  events: {
     "click .upload-button": "upload",
     "click .cancel-button": "closeModal",
   },
   initialize: function(){
     this.listenTo(this.model, "sync", this.render);
     this.listenTo(this.collection, "add", this.addBarberPortPictureSubview);
     this.listenTo(this.collection, "remove", this.removeBarberPortPictureSubview);
     this.collection.each(this.addBarberPortPictureSubview.bind(this));
   },

  addBarberPortPictureSubview: function(photo){
    var pictureSubview = new MyCut.Views.PortfolioPicture({ model: photo });
    this.addSubview('.barber-portfolio-collection', pictureSubview);
  },
  removeBarberPortPictureSubview: function(photo){
    this.removeModelSubview('.barber-portfolio-collection', photo);
  },

   closeModal: function(){
     this.$el.hide();
     this.remove();
   },


  render: function() {
    var renderedContent = this.template({
      barber: this.model,
      pictures: this.collection

    });
    this.$el.html(renderedContent);
    this.attachSubviews();
    this.$el.hide();
    return this;
  },

  upload: function(e){
    e.preventDefault();
    var that = this;
    cloudinary.openUploadWidget(BARBER_PORT_CLOUDINARY, function(error, result){
      if (!error) {
        that.parsePhotos(result);
      }
    });
  },

  parsePhotos: function(photos){
    var that = this;
    photos.forEach(function(photo){
      var picture = new MyCut.Models.Picture();
      picture.set({
        photo_url: photo.eager[0].url,
        imageable_id: that.model.get('id'),
        imageable_type: "Barber"
      });
      picture.save({}, {
        success: function(){
          that.collection.add(picture);
        }
      });
    });
  }

});
