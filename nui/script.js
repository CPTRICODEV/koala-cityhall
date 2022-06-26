
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

    $(".taxibtn").click(function (event) {
        $.post('https://koala-cityhall/taxi', "{}");
        $.post("https://koala-cityhall/escape", "{}");
    })
    
    $(".close").click(function (data) {
        $.post("https://koala-cityhall/escape", "{}");
    })


    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post("https://koala-cityhall/escape", "{}");
        }
    };
});