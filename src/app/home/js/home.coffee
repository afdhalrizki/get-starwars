angular.module("starwars.home", [])

.controller "HomeCtrl", ['$scope', ($scope) ->
	$scope.films = []
	$scope.people = []
	$scope.planets = []	
]