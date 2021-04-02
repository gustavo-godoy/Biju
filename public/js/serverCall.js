"use strict;"

callHandler = {
    caller: function(service) {
        return function _caller(...args){
            response = fetch('/run/'+service, {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({'_args': args})
            });

            return response;
        }
    }
}

proxyHandler = {
    get: function (target, property) {
        return target.caller(property);
    }
}

Biju = new Proxy(callHandler, proxyHandler);
