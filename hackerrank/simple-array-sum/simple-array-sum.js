process.stdin.resume();
process.stdin.setEncoding('ascii');

var input_stdin = "";
var input_stdin_array = "";
var input_currentline = 0;

process.stdin.on('data', function (data) {
    input_stdin += data;
});

process.stdin.on('end', function () {
    input_stdin_array = input_stdin.split("\n");
    main();
});

function readLine() {
    return input_stdin_array[input_currentline++];
}

/////////////// ignore above this line ////////////////////

var reduce = function (arr, func, acc) {
    if (typeof acc === 'undefined') {
        acc = arr[0];
    }
    for (var i = 0; i < arr.length; i++) {
        acc = func(arr[i], acc);
    }
    return acc;
};

function main() {
    var n = parseInt(readLine());
    if (n !== 0) {
        arr = readLine().split(' ');
        arr = arr.map(Number);
        var sum = reduce(arr, function (k, acc) {
            return k + acc;
        }, 0);
        console.log(sum);
    } else {
        console.log(0);
    }
}
