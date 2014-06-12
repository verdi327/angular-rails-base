AngulaRails.factory "BookResource", ($resource) ->
  $resource("/books/:id", {id: "@id"}, {
    update: {method: "PUT"}
    })