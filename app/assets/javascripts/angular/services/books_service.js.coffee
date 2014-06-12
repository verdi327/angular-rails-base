AngulaRails.factory "Book", ($http, $q) ->
  self = {}

  self.getBooksWithPromises = () ->
    deferred = $q.defer()
    $http({method: 'GET', url: "/books"})
      .success (response) ->
        deferred.resolve(response.books)

    deferred.promise

  self