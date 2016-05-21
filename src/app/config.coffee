configs =
  SERVER_URL: "http://swapi.co/api"
 
angular.module "starwars.config", []
  # constant used by run, factories, controllers
  .constant 'CONFIG', configs