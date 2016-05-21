angular.module("starwars.people", ['restangular'])

.factory "PeopleService", (Restangular) ->
    people = Restangular.one 'people'

    return {
        
        get: (id) ->
            people.get(id.toString()).then (response) ->
                return response

        getList: () ->
            people.get().then (response) ->
                return response

        getSchema: () ->
            people.one("schema").then (response) ->
                return response

    }

.controller "PeopleCtrl", ['$scope', 'PeopleService', ($scope, PeopleService) ->
    PeopleService.getList().then ((success) ->
        $scope.people = success.results
    ), (error) ->
        console.log error
]