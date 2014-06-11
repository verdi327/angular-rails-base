AngulaRails.controller "GitHttpController", ($scope, $http) ->
  $scope.search = () ->
    $scope.gifs = []
    $scope.loading = true
    url = "http://api.giphy.com/v1/gifs/search?q=#{$scope.query}&api_key=dc6zaTOxFJmzC"
    $http({method: 'GET', url: url})
      .success (data) ->
        $scope.loading = false
        $scope.gifs = data.data
