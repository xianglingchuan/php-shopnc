
var mimuteSeconds = 60;
var hourSeconds = mimuteSeconds * 60;
var daySeconds = hourSeconds * 24;
//var monthSeconds = daySeconds * 30;
function CountDown(totalSeconds, timespan, callback, endcallback) {
    if (totalSeconds < 0)
        totalSeconds = 0;
    //年月暂时不处理
    var years = 0;
    var months = 0;

    var days = parseInt(totalSeconds / daySeconds);
    var lastSecond = totalSeconds % daySeconds;
    var hours = parseInt(lastSecond / hourSeconds);
    lastSecond %= hourSeconds;
    var mimutes = parseInt(lastSecond / mimuteSeconds);
    lastSecond %= mimuteSeconds;
    var seconds = lastSecond;
    if (callback) {
        callback(years, months, days, hours, mimutes, seconds);
    }
    if (!years && !months && !days && !months && !hours && !mimutes && !seconds) {
        if (endcallback) {
            endcallback();
        }
    }
    else {
        setTimeout(function () {
            CountDown(totalSeconds - timespan, timespan, callback, endcallback);
        }, timespan*1000);
    }
}
