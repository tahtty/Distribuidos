$(document).ready(function () {
    cargarImagenes()
});

var cargarImagenes = () => {

    var data = {
        "top": 5
    }

    $.getJSON("./imageController.php", data,
        function (response, textStatus, jqXHR) {
            var $TOP = $("#top-imagenes");
            $.each(response, function (i, imagen) {

                var $COLUMN = $('<div></div>');
                $COLUMN.addClass("col-lg-3 col-md-6 mb-4");
                
                $CARD = cargarCarta(imagen);

                $COLUMN.append($CARD);
                $TOP.append($COLUMN);
            });
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
    $CARD_TITLE.append(imagen.cantidad_vistas + " voto(s)");

    var $CARD_TEXT = $('<p></p>');
    $CARD_TEXT.addClass('card-text');
    $CARD_TEXT.append(imagen.descripcion);

    $CARD_BODY.append($CARD_TITLE);
    $CARD_BODY.append($CARD_TEXT);

    $CARD.append($CARD_IMG);
    $CARD.append($CARD_BODY);
    
    return $CARD;
}