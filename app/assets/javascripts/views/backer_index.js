BigStart.Views.BackersIndex = Backbone.CompositeView.extend({
  template: JST['projects/backers_index'],
  
  initialize: function(){
    this.listenTo(this.collection, "add", this.render);
  },

  render: function(){
    var partial = this.template({ backers: this.collection});
    this.$el.html(partial);
    return this;
  },
});
