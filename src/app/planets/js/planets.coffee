angular.module("starwars.planets", ['restangular'])

.factory "PlanetsService", (Restangular) ->
    planets = Restangular.one 'planets'

    return {
        
        get: (id) ->
            planets.get(id.toString()).then (response) ->
                return response

        getList: () ->
            planets.get().then (response) ->
                return response

        getSchema: () ->
            planets.one("schema").then (response) ->
                return response

    }

.controller "PlanetsCtrl", ['$scope', 'PlanetsService', ($scope, PlanetsService) ->
    PlanetsService.getList().then ((success) ->
        $scope.planets = success.results
        console.log $scope.planets
    ), (error) ->
        console.log error
    
]