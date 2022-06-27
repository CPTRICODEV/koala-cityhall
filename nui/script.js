
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

    $(".postbtn").click(function (event) {
        $.post('https://koala-cityhall/deli', "{}");
        $.post("https://koala-cityhall/escape", "{}");
    })

    $(".trashbtn").click(function (event) {
        $.post('https://koala-cityhall/trash', "{}");
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


function LeftArrow1() {
    document.getElementById('postnord').style.visibility = 'hidden'
    document.getElementById('job').style.visibility = 'visible'
}

function RightArrow1() {
    document.getElementById('job').style.visibility = 'hidden'
    document.getElementById('postnord').style.visibility = 'visible'
}


function LeftArrow2() {
    document.getElementById('postnord').style.visibility = 'hidden'
    document.getElementById('job').style.visibility = 'visible'
}

function RightArrow2() {
    document.getElementById('job').style.visibility = 'hidden'
    document.getElementById('trash').style.visibility = 'visible'
}

function LeftArrow3() {
    document.getElementById('trash').style.visibility = 'hidden'
    document.getElementById('postnord').style.visibility = 'visible'
}

function RightArrow3() {
    document.getElementById('job').style.visibility = 'hidden'
    document.getElementById('trash').style.visibility = 'visible'
}