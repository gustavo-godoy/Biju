callHandler = {
    caller: function(service) {
        return function _caller(...args){
            console.log("[Debug] Serviço: "+service)
            console.log("[Debug] Parametros: "+args.join())
        }
    }
}

proxyHandler = {
    get: function (target, property) {
        return target.caller(property)
    }
}

Server = new Proxy(callHandler, proxyHandler)
