// Generated by CoffeeScript 1.8.0
var AppFactories;

AppFactories = angular.module("AppFactories", ["ngResource"]);

AppFactories.factory("Whisky", [
  "$resource", function($resource) {
    return $resource("/whiskies/:id.json");
  }
]);

AppFactories.factory("Producer", [
  "$resource", function($resource) {
    return $resource("/producers/:id.json");
  }
]);

AppFactories.factory("Region", [
  "$resource", function($resource) {
    return $resource("/regions/:id.json");
  }
]);

AppFactories.factory("RegionsWhiskies", [
  "$resource", function($resource) {
    return $resource("/regions/:id/whiskies.json");
  }
]);

AppFactories.factory("RegionsProducers", [
  "$resource", function($resource) {
    return $resource("/regions/:region_id/producers/:id.json");
  }
]);

AppFactories.factory("RegionsProducersWhiskies", [
  "$resource", function($resource) {
    return $resource("/regions/:region_id/producers/:producer_id/whiskies/:id.json");
  }
]);
