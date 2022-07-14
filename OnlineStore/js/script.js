let count = 0;

$(".counter--minus").click(function() {
    if (count > 0) {
        count--;
        $(".counter--count").html(count);
    }

    if (count == 0) {
        $(".counter--minus").css({
            'color': 'gainsboro'
        });
    }
});

$(".counter--plus").click(function() {
    count++;

    if (count == 1)
        $(".counter--minus").css({
            'color': 'black'
        });

    $(".counter--count").html(count);
});

$("#buy").click(function() {
    if (count > 0) {
        $.notify('В корзину добавлено ' + count + ' товаров', "success")
        count = 0;
        $(".counter--count").html(count);
        $(".counter--minus").css({
            'color': 'gainsboro'
        });
    } else
        $.notify('Добавьте количество товаров', "warn")
});
