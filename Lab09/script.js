function fib(n){
    if (n===1) return 1
    if (n===2) return 1
    return fib(n - 1) + fib(n - 2)
}

WorkerScript.onMessage = function(message) {
    WorkerScript.sendMessage({"result": fib(message.n).toString()})
}