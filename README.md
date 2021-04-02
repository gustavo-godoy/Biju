# Biju

Biju é um projeto simples baseado na plataforma Sinatra com o objetivo
de criar uma micro-webApp para usar como interface para uma estrutura
de scripts locais, de maneira fácil e simples, mas flexivel e potente.

O projeto é parcialmente inspirado no Python Eel, mas não tenta
fazer a mesma coisa.

O nome "Biju" remete à bijuterias. Muitos projetos baseados em Ruby
usam nomes relacionados a joias. O nome reflete a simplicidade e
acessibilidade do projeto.

## Instalação

O projeto foi criado em Linux, mas deve ser fácil adaptar para Windows

É preciso ter Ruby versão 2.7 e Bundle instalados. O projeto assume
que o Ruby está em seu PATH.

Basta clonar o projeto e usar `bundle install` para instalar as
dependencias.

## Uso

O uso do projeto é simples, mas permite uma enorme flexibilidade.
O projeto vem com um exemplo "oi-mundo".   
Podemos dividir o processo em 3 etapas:

### Etapa 1: expor os executáveis.

Para isto basta incluir os executáveis desejados na pasta `run/`.  
Como exemplo vamos considerar o arquivo `run/fazAlgo`.


### Etapa 2: criando a interface

**Modificando ou criando um arquivo**
Para criar ou modificar um arquivo na pasta `views/`.

O arquivo `layout.erb` fornece o template principal e todos os
demais arquivos são renderizados dentro da tag `<body>` do layout.
É preciso cuidado ao modificar este arquivo, já que o funcionamento
correto de todo projeto depende dele

O arquivo `index.erb` é a frontpage do WebApp, então é um bom ponto
de partida.

Se desejar adicionar um novo arquivo, então o mais fácil é adicionar
à pasta `views/auto/`. Os arquivos nesta página são automaticamente
roteados pelo servidor (se preferir incluir na pasta `views/` vai
precisar manualmente incluir a rota no arquivo `server.rb`.).  
Assim, por exemplo, o arquivo `views/auto/painel.erb` será 
automaticamente disponibilizado em `http://localhost:4567/painel`.

Todos os arquivos devem estar com a extensão`.erb`, mas pode-se usar
HTML5 normalmente no seu arquivo. Para rodar códigos server-side,
basta usar a sintaxe `<%= código em Ruby >` e o Sinatra irá rodar
o código enquanto renderiza a página.

**Acessando um executável**

Os executáveis podem ser acessados pela interface via JavaScript,
como uma função do objeto `Biju`. Usando o exemplo de um executável
`run/fazAlgo`, podemos chamar `Biju.fazAlgo("argumentos", "aqui")`.  
O script retorna um objeto Promise e o servidor irá executar:

        `run/fazAlgo argumentos aqui`

Então basta definir os callbacks para a Promise retornada, que serão
executados quando o servidor terminar de rodar o código. O retorno é
um JSON contendo a propriedade `tudoCerto`, que indica se o código
rodou corretamente (provavelmente só será `false` se o executável
não for localizado na pasta `run/`) e a propriedade `resposta`, que
contem a saída do script rodado.


### Etapa 3: rodar o servidor

Basta rodar o executável `server.rb`.

## Contribuindo

Se quiser contribuir com o projeto fique a vontade para criar um Issue
ou enviar uma Pull Request! Também sinta-se a vontade para criar um
fork se desejar. 

## Licença

É permitido, gratuítamente, à qualquer índividuo obter uma cópia total
ou parcial do código e documentação aqui presentes (o "Projeto"),
utilizando o sem restrições ou limitações de direito, incluindo,
mas não se limitando, copiar, modificar,  publicar, distribuir e/ou
vender e permitir que outros façam o mesmo, desde que as seguintes 
condições se apliquem:

Este aviso deve ser incluso em qualquer porção substancial do Projeto.

O Projeto não tem nenhuma forma de garantia, expressa ou ímplicita.
Ao utilizar qualquer porção substancial do código deve se assumir
a responsabilidade. Em nenhuma situação o autor ou os colaboradores
deverão ser considerados responsáveis pelo funcionamento adequado
do Projeto para qualquer propósito, nem responsabilizados por qualquer
dano ou qualquer outro problema que possa surgir devido seu uso, seja 
por seu uso total ou parcial, diretamente ou indiretamente. Qualquer 
consequência decorrente do uso do Projeto ou de qualquer outro código 
conectado à ele não deverá ser responsabilidade do autor ou dos 
demais colaboradores do Projeto.
