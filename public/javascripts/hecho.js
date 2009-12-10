$(document).ready(function() {
  bind_triggers();
});

function bind_triggers() {
  $("form#new_uso_servicio select#uso_servicio_rubro_id").unbind("change");
  $("form#new_uso_servicio select#uso_servicio_rubro_id").change(function() {
    var rubro_elegido = $(this).attr("value");
    var servicios = variable[rubro_elegido];
    $("#uso_servicio_servicio_id option").remove();
    if (servicios.length > 0) {
      for (i = 0; i < servicios.length; i++) {
        $("#uso_servicio_servicio_id").append("<option value=\"" + servicios[i][0] + "\">" + servicios[i][1] + "</option>");
      }
    }
  });

  $("form#new_entrega select#entrega_revista_id").unbind("change");
  $("form#new_entrega select#entrega_revista_id").change(function() {
    var revista = $(this).attr("value");
    var cantidad = parseInt($("input#entrega_cantidad_pagas").attr("value"));
    valor_pago(revista, cantidad);
  });

  $("form#new_entrega input#entrega_cantidad_pagas").unbind("change");
  $("form#new_entrega input#entrega_cantidad_pagas").change(function() {
    var revista = $("select#entrega_revista_id").attr("value");
    var cantidad = parseInt($(this).attr("value"));
    valor_pago(revista, cantidad);
  });
}

function popup_sumar_stock(revista) {
  var valor = prompt('Cantidad de revistas a sumar');
  control_stock(revista, valor);
}

function popup_restar_stock(revista) {
  var valor = prompt('Cantidad de revistas a restar');
  control_stock(revista, -valor);
}

function control_stock(revista, variacion) {
  if (!isNaN(variacion) && variacion != null) {
    if (typeof(AUTH_TOKEN) == "undefined") return;
    $.ajax({
      type: "POST",
      url: "/revistas/" + revista + "/control_stock",
      data: "authenticity_token=" + encodeURIComponent(AUTH_TOKEN)+"&cantidad="+variacion,
      dataType: "script",
      async: false,
      success: function fn(result) {
        $("table#revistas tr[value='" + revista + "'] td.stock").html(result);
        return false;
      }
    });
  } else {
    if (variacion != null) {
      alert("'" + variacion + "' no es un numero valido.");
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

function valor_pago(revista, cantidad) {
  //var revista = $(this).attr("value");
  //var cantidad = parseInt($("input#entrega_cantidad_pagas").attr("value"));

  if (typeof(AUTH_TOKEN) == "undefined") return;
  $.ajax({
    type: "GET",
    url: "/revistas/" + revista + "/costo",
    data: "authenticity_token=" + encodeURIComponent(AUTH_TOKEN)+"&cantidad="+cantidad,
    dataType: "script",
    async: false,
    success: function fn(result) {
      $("#entrega_pago").attr("value", result);
      return false;
    }
  });
}