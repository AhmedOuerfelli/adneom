function showKeyCode(e) {
    // debugger;
    var keycode;
    if (window.event)
        keycode = window.event.keyCode;
    else if (e)
        keycode = e.which;

    // Mozilla firefox
    if ($.browser.mozilla) {
        if (keycode == 116 || (e.ctrlKey && keycode == 82)) {
            if (e.preventDefault) {
                e.preventDefault();
                e.stopPropagation();

            }
        }
    }
        // IE
    else if ($.browser.msie) {
        if (keycode == 116 || (window.event.ctrlKey && keycode == 82)) {
            window.event.returnValue = false;
            window.event.keyCode = 0;
            window.status = "Refresh is disabled";
        }
    }
    else {
        switch (e.keyCode) {

            case 116: // 'F5'
                event.returnValue = false;
                event.keyCode = 0;
                window.status = "Refresh is disabled";
                break;

        }
    }
}
function disableF5(e) {
    if ((e.which || e.keyCode) == 116 || (e.which || e.keyCode) == 82) e.preventDefault();

};

$(document).ready(function () {
    $(document).on("keydown", disableF5);
}); history.forward()













//this code handles the F5/Ctrl+F5/Ctrl+R
document.onkeydown = checkKeycode
function checkKeycode(e) {
    var keycode;
    if (window.event)
        keycode = window.event.keyCode;
    else if (e)
        keycode = e.which;

    // Mozilla firefox
    if ($.browser.mozilla) {
        if (keycode == 116 || (e.ctrlKey && keycode == 82)) {
            if (e.preventDefault) {
                e.preventDefault();
                e.stopPropagation();
            }
        }
    }
        // IE
    else if ($.browser.msie) {
        if (keycode == 116 || (window.event.ctrlKey && keycode == 82)) {
            window.event.returnValue = false;
            window.event.keyCode = 0;
            window.status = "Refresh is disabled";
        }
    }
}




