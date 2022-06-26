
$(window).ready(function () {
    window.addEventListener("message", function (event) {
        let data = event.data;

        if (data.showMenu) {
            $("#container").fadeIn();

        } else if (data.hideAll) {
            $("#container").fadeOut();
        }
    });

    $("#container").hide();

    $(".taxi").click(function (event) {
        $.post('http://koala-cityhall/taxi', {});
    })



    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post("https://koala-cityhall/escape", "{}");
        }
    };
});