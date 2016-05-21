angular.module("starwars", ["ui.router", "starwars.config", "restangular", "starwars.home", "starwars.films", "starwars.people", "starwars.planets"])

.config ($stateProvider, $urlRouterProvider, RestangularProvider, CONFIG) ->
  # ## RESTANGULAR
  RestangularProvider.setBaseUrl CONFIG.SERVER_URL
  RestangularProvider.setRequestSuffix '/'

  $urlRouterProvider.otherwise "/"

  $stateProvider
    ## HOME ##
    .state 'index',
      url: "/"
      templateUrl: "/app/home/home.html"      
      controller: "HomeCtrl"
      pageTitle: "Homepage"

    .state 'list',
      url: "/list"
      templateUrl: "/app/list/list.html"      
      controller: "ListCtrl"
      pageTitle: "List of starwars"

    .state 'films',
      url: "/list/films"
      templateUrl: "/app/films/films.html"      
      controller: "FilmsCtrl"
      pageTitle: "List of starwars films"

    # .state 'film-detail',
    #   url: "/list/films/{filmId:int}"
    #   templateUrl: "/app/films/html/detail.html"      
    #   controller: "FilmDetailCtrl"
    #   pageTitle: "Detail of starwars film"

    .state 'people',
      url: "/list/people"
      templateUrl: "/app/people/people.html"      
      controller: "PeopleCtrl"
      pageTitle: "List of starwars people"

    # .state 'person-detail',
    #   url: "/list/person/{personId:int}"
    #   templateUrl: "/app/people/html/detail.html"      
    #   controller: "PersonDetailCtrl"
    #   pageTitle: "Detail of starwars person"
    
    .state 'planets',
      url: "/list/planets"
      templateUrl: "/app/planets/planets.html"      
      controller: "PlanetsCtrl"
      pageTitle: "List of starwars planets"

    # .state 'planet-detail',
    #   url: "/list/planet/{planetId:int}"
    #   templateUrl: "/app/planets/html/detail.html"      
    #   controller: "PlanetDetailCtrl"
    #   pageTitle: "Detail of starwars planet"
      
