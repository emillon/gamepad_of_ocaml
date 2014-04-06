var res = document.getElementById("status");
function runAnimation()
{
    window.requestAnimationFrame(runAnimation);
    var gamepads = navigator.webkitGetGamepads();
    for (var i = 0; i < gamepads.length; ++i)
    {
        var pad = gamepads[i];
        if (pad === undefined) {
            continue;
        }
        res.innerHTML = i + " " + pad.axes + " " + pad.buttons;
    }
}

window.requestAnimationFrame(runAnimation);
