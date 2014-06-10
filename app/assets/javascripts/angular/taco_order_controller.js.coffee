AngulaRails.controller "TacoOrderController", ($scope) ->
  $scope.tacos = []
  $scope.fillings = ["veggies", "chicken", "beef", "tofu"]
  $scope.extras = [{name: "Sour Cream"}, {name: "Guac"}, {name: "Salsa"}]
  $scope.cheeses = ["No Cheese", "Normal Cheese", "Mucho Queso", "Pepperjack"]

  $scope.clear = () ->
    $scope.taco = {}
    angular.forEach $scope.extras, (extra) ->
      extra.checked = false

  $scope.getExtras = () ->
    extras = []
    angular.forEach $scope.extras, (extra) ->
      if extra.checked == true
        extras.push(extra.name)
    extras

  $scope.addTaco = () ->
    $scope.taco.extras = $scope.getExtras()
    $scope.tacos.push($scope.taco)
    $scope.clear()