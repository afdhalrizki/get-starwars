angular.module("starwars.films", ['restangular'])

.factory "FilmsService", (Restangular) ->
    films = Restangular.one 'films'

    return {

        get: (id) ->
            console.log id
            films.one(id.toString()).get().then (response) ->
                return response

        getList: () ->
            films.get().then (response) ->
                return response

        getSchema: () ->
            people.one("schema").then (response) ->
                return response

    }

.controller "FilmsCtrl", ['$scope', 'FilmsService', ($scope, FilmsService) ->
    $scope.films = []

    FilmsService.getList().then ((success) ->
        $scope.films = success.results.map (film) ->
            urlSplit = film.url.split "/" 
            film.id = urlSplit[5]
            return film
    ), (error) ->
        console.log error
]

.controller "FilmDetailCtrl", ['$scope', 'FilmsService', '$stateParams', ($scope, FilmsService, $stateParams) ->
    $scope.film = []

    FilmsService.get($stateParams.filmId).then ((success) ->
        $scope.film = success
    ), (error) ->
        console.log error
]