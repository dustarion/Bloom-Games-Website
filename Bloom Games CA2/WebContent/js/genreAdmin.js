
// Show Modal when Clicking Edit Button

$('#editModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var genreData = button.data('whatever') // Extract info from data-* attributes (genreID##Name)

  // Format of genreData is "genreID##Name"
  var dataArray = genreData.split("##");
  var genreID = dataArray[0]
  var genreName = dataArray[1]

  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('Edit ' + genreName)
  modal.find("#genre-id").val(genreID);
  modal.find("#genre-title").val(genreName);

})