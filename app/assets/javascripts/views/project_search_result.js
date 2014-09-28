Discover.Views.SearchResult = Backbone.CompositeView.extend({
  template: JST['discover/search_result'],

  initialize: function(options){
    this.originalCollection = options.originalCollection;
    this.collection = options.collection;
    this.listenTo(this.collection, "sync add request all", this.render);
    this.listenTo(this.originalCollection, "sync", this.render);
  },

  render: function(){
    var partial = this.template({ results: this.collection});
    this.$el.html(partial);
    return this;
  },
});
