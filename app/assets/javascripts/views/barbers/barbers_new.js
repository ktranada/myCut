MyCut.Views.BarberNew = BackBone.CompositeView.extend({
  template: JST['barbers/barber_new'];
  class: "modal-form",

  events: {
    "submit form": "createBarber",
  },

  createBarber: function(event){
    event.preventDefault();
    var that = this;
    var formData = $(event.currentTarget).serializeJSON();
    var newBarber = new MyCut.Models.Barber()

  },

  render: function(){
    var renderedContent = this.template();
    this.$el.html(content);
    return this;
  }
});
