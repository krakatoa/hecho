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

function popup_sumar_stock(revista) {
  var valor = prompt('Cantidad de revistas a sumar');
  if (!isNaN(valor) && valor != null) {
    if (typeof(AUTH_TOKEN) == "undefined") return;
    $.ajax({
      type: "POST",
      url: "/revistas/" + revista + "/sumar_stock",
      data: "authenticity_token=" + encodeURIComponent(AUTH_TOKEN)+"&cantidad="+valor,
      dataType: "script",
      async: false,
      success: function fn(result) {
        $("table#revistas tr[value='" + revista + "'] td.stock").html(result);
        return false;
      }
    });
  } else {
    if (valor != null) {
      alert("'" + valor + "' no es un numero valido.");
    };
  }
}

function popup_agregar_promo(promocion) {
  var valor = prompt('Cantidad de promociones a sumar');
  if (!isNaN(valor) && valor != null) {
    if (typeof(AUTH_TOKEN) == "undefined") return;
    $.ajax({
      type: "POST",
      url: "/promociones/" + promocion + "/sumar_cantidad",
      data: "authenticity_token=" + encodeURIComponent(AUTH_TOKEN)+"&cantidad="+valor,
      dataType: "script",
      async: false,
      success: function fn(result) {
        $("table#promociones tr[value='" + promocion + "'] td.cantidad").html(result);
        return false;
      }
    });
  } else {
    if (valor != null) {
      alert("'" + valor + "' no es un numero valido.");
    };
  }
}