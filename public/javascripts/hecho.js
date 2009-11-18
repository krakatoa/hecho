$(document).ready(function() {
  bind_links();
});

function bind_links() {
  $("#uso_servicio_rubro_id").unbind("click");
  $("#uso_servicio_rubro_id").change(function() {
    var rubro_elegido = $("#uso_servicio_rubro_id").attr("value");
    var servicios = variable[rubro_elegido];
    $("#uso_servicio_servicio_id option").remove();
    if (servicios.length > 0) {
      for (i = 0; i < servicios.length; i++) {
        $("#uso_servicio_servicio_id").append("<option value=\"" + servicios[i][0] + "\">" + servicios[i][1] + "</option>");
      }
    }
  });
}