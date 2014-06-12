AngulaRails.controller "BooksController", ($scope, $http, BookResource) ->
  $scope.formHeader = "Add a New Book"

  $scope.getBooks = () ->
    $scope.books = BookResource.query()

  $scope.save = () ->
    if $scope.book.id?
      BookResource.update($scope.book).$promise
        .then (response) ->
          $scope.books[$scope.book.index] = response.book
          $scope.book = {}
    else
      BookResource.save($scope.book).$promise
        .then (response) ->
          $scope.book = {}
          $scope.books.push(response.book)

  $scope.edit = (book, index) ->
    BookResource.get({id: book.id}).$promise
      .then (response) ->
        $scope.book = response
        $scope.book.index = index

  $scope.delete = (book, index) ->
    BookResource.remove({id: book.id}).$promise
      .then (response) ->
        $scope.books.splice(index, 1)

  # $scope.save = () ->
  #   if $scope.book.id?
  #     $http({method: "PUT", url: $scope.book.url, data: $scope.book})
  #       .success (response) ->
  #         $scope.books[$scope.book.index] = response.book
  #         $scope.book = {}
  #   else
  #     $http({method: "POST", url: $scope.urls.books, data: $scope.book})
  #       .success (response) ->
  #         $scope.book = {}
  #         $scope.books.push(response.book)

  #   $scope.formHeader = "Add a New Book"

  # $scope.delete = (book, index) ->
  #   $http({method: "DELETE", url: book.url})
  #     .success (response) ->
  #       $scope.books.splice(index, 1)

  # $scope.edit = (book, index) ->
  #   $scope.formHeader = "Edit an Existing Book"
  #   $scope.book =
  #     id:     book.id
  #     title:  book.title
  #     author: book.author
  #     url:    book.url
  #     index:  index

