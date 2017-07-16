
function toggleDone() {
  $(this).parent().parent().toggleClass("success");
  updateCounters();
}

function updateCounters() {
  $("#total-count").html($(".song").size());
  $("#completed-count").html($(".success").size());
  $("#song-count").html($(".song").size() - $(".success").size());
}

function nextSongId() {
  return $(".song").size() + 1;
}

function createSong(title) {
  var checkboxId = "song-" + nextSongId();

  var label = $('<label></label>')
    .attr('for', checkboxId)
    .html(title);

  var checkbox = $('<input type="checkbox" value="1" />')
    .attr('id', checkboxId)
    .bind('change', toggleDone);

  var tableRow = $('<tr class="song"></td>')
    .append($('<td>').append(checkbox))
    .append($('<td>').append(label));

  $("#songList").append( tableRow );

  updateCounters();
  var newSong = { title: title};
  $.ajax({
    type: "POST",
    url: artist_songs_path(@artist.id) + ".json",
    data: JSON.stringify({
        song: newSong
    }),
    contentType: "application/json",
    dataType: "json"
  });
}

function submitSong(event) {
  event.preventDefault();
  createSong($("#song_title").val());
  $("#song_title").val(null);
  updateCounters();

}

function cleanUpDoneSongs(event) {
  event.preventDefault();
  $.when($(".success").remove())
    .then(updateCounters);
}

$(document).ready(function() {
  $("input[type=checkbox]").bind('change', toggleDone);
  $("form").bind('submit', submitSong);
  $("#clean-up").bind('click', cleanUpDoneSongs);
  updateCounters();
});
