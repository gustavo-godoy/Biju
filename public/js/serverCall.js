"use strict;"

callHandler = {
    caller: function(service) {
        return function _caller(...args){

            // Argumentos       
            if (args.length < 1) {
                throw "Exception: Pelo menos um argumento (callback) é necessário."
            }

            callback = args.pop()
            
            if ( !(callback instanceof Function) ){
                throw "Exception: Ultimo argumento precisa ser uma função para callback"
            }

            // Função auxíliar para JSON.stringify
            function stringifyReplacer(key, value) {
                if (value == null || value == ""){
                    return undefined;
                }
                return value;
            }

            response = fetch('/run/'+service, {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({'_args': args}, stringifyReplacer)
            }).then(response => response.json()).then(callback)

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
