function OnOffBlock(newSection) {
  $(".tabblock").not("#" + newSection).hide();
  $("#" + newSection).show();
}

function TabToggle(newSection) {
  $(".tabnav").hide();
  $(".tabnavoff").show();
  $("#" + newSection).show();
  $("#" + newSection + "-off").hide();
}
