Discover.Views.SearchResult = Backbone.CompositeView.extend({
  template: JST['discover/search_result'],

  initialize: function(options){
    this.collection = options.collection;
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function(){
    var partial = this.template({ results: this.collection});
    this.$el.html(partial);
    this.$('.search-result').mixItUp();  
    return this;
  },
});
