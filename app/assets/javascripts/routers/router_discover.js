Discover.Routers.Router = Backbone.Router.extend({
  initialize: function(projects){
    this.$rootEl = $('.current-result');
    this.$categoryList = $('.category-list');
    this.$newest = $('#newest');
    this.projects = projects;
  },

  routes: {
    ':id': 'searchProject' 
  },
  
  searchProject: function(id) {
    var categoryCollections = this.projects.filterByCategory(parseInt(id-1));  
    var resultView = new Discover.Views.SearchResult({
      collection: categoryCollections,
    });
    this._swapView(resultView, id);
  },

  _swapView: function(view, id) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    
    //toggle navigation bar
    var current_category = this.$categoryList.find('#'+id);
    current_category.siblings().removeClass('active');
    current_category.addClass('active');
    
    this.$rootEl.html(view.render().$el);
    //set initial value to sort bar
    this.$newest.addClass('active');
  }

});
