Discover.Views.SearchResult = Backbone.CompositeView.extend({
  template: JST['discover/search_result'],

  initialize: function(){
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function(){

    var partial = this.template({ results: this.collection});
    this.$el.html(partial);
    return this;
  },
});
