AngulaRails.controller "BooksController", ($scope, $http, Book) ->
  $scope.formHeader = "Add a New Book"

  $scope.getBooks = () ->
    Book.getBooksWithPromises()
      .then (books) ->
        $scope.books = books

  $scope.save = () ->
    if $scope.book.id?
      $http({method: "PUT", url: $scope.book.url, data: $scope.book})
        .success (response) ->
          $scope.books[$scope.book.index] = response.book
          $scope.book = {}
    else
      $http({method: "POST", url: $scope.urls.books, data: $scope.book})
        .success (response) ->
          $scope.book = {}
          $scope.books.push(response.book)

    $scope.formHeader = "Add a New Book"

  $scope.delete = (book, index) ->
    $http({method: "DELETE", url: book.url})
      .success (response) ->
        $scope.books.splice(index, 1)

  $scope.edit = (book, index) ->
    $scope.formHeader = "Edit an Existing Book"
    $scope.book =
      id:     book.id
      title:  book.title
      author: book.author
      url:    book.url
      index:  index

