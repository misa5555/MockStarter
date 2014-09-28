Discover.Routers.Router = Backbone.Router.extend({
  initialize: function(projects){
    this.$rootEl = $('.current-result');
    this.projects = projects;
  },

  routes: {
    ':id': 'searchProject' 
  },
  
  searchProject: function(id) {
    this.projects.fetch();
    var categoryCollections = this.projects.filterByCategory(parseInt(id));   
  var resultView = new Discover.Views.SearchResult({
      collection: categoryCollections,
      originalCollection: this.projects 
    });
    this._swapView(resultView);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view; 
    this.$rootEl.html(view.render().$el);
  }

});
