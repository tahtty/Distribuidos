$(document).ready(function () {
    cargarImagenes();
    
    $("#opcion-cache").on('change', cargarImagenes);
});

var cargarImagenes = () => {

    var data = {
        "noCache": parseInt($("#opcion-cache").val()),
        "top": 1
    }
    
    var $TOP = $("#top-imagenes");
    $TOP.html("");

    $.getJSON("./imageController.php", data,
        function (response, textStatus, jqXHR) {
            
            if (!response.hasOwnProperty('codigo')) {
                
                $.each(response, function (i, imagen) {
                    var $COLUMN = $('<div></div>');
                    $COLUMN.addClass("col-lg-3 col-md-6 mb-4");
                    
                    $CARD = cargarCarta(imagen);
    
                    $COLUMN.append($CARD);
                    $TOP.append($COLUMN);
                });
            }
            else {
                var $COLUMN = $('<div></div>');
                $COLUMN.addClass("col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-4");
                
                var $ALERTA = $('<div></div>');
                $ALERTA.addClass("alert alert-danger");
                $ALERTA.append("No se ha podido obtener las imágenes más visitadas");
                $COLUMN.append($ALERTA);    
                
                $TOP.append($COLUMN);
            }
        }
    );

}

var cargarCarta = (imagen) => {
    var $CARD = $('<div></div>');
    $CARD.addClass("card");
    
    var $CARD_IMG = $('<img/>');
    $CARD_IMG.addClass('card-img-top');
    //$CARD_IMG.attr("src","data:image/;base64," + imagen.imagen);
    $CARD_IMG.attr("src", imagen.imagen);
    var $CARD_BODY = $('<div></div>');
    $CARD_BODY.addClass('card-body');
    
    var $CARD_TITLE = $('<h4></h4>');
    $CARD_TITLE.addClass('card-title');
    $CARD_TITLE.append(imagen.cantidad_vistas + " visitas(s)");

    var $CARD_TEXT = $('<p></p>');
    $CARD_TEXT.addClass('card-text');
    $CARD_TEXT.append(imagen.descripcion);

    $CARD_BODY.append($CARD_TITLE);
    $CARD_BODY.append($CARD_TEXT);

    $CARD.append($CARD_IMG);
    $CARD.append($CARD_BODY);
    
    return $CARD;
}