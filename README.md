# Biju

Biju é um projeto simples baseado na plataforma [Sinatra](http://sinatrarb.com/)
que permite criar micro-webApps como interface para scripts locais, de uma forma
fácil e simples, mas flexivel e potente (tomara!).

O nome "Biju" remete à bijuterias. Muitos projetos baseados em Ruby
usam nomes relacionados a joias, por isso o nome.

## Instalação

O projeto foi criado em Linux, mas em breve deverá ser adaptado para
Windows também.

É preciso ter Ruby versão 2.7 e Bundle instalados.

Basta clonar o projeto e usar `bundle install` para instalar as
dependencias.

Note que o exemplo incluso no projeto assume que Ruby está
instalado em seu PATH.

## Uso

### Etapa 1: expor os executáveis.

Para isto basta incluir os executáveis desejados na pasta `run/`.

Como exemplo vamos considerar o arquivo `run/oiMundo`.

### Etapa 2: criando a interface

**Criando ou modificando uma página**

O arquivo `views/index.erb` é a frontpage do WebApp, então é um bom ponto
de partida. Não se preocupe com a extensão `.erb` - ela é apenas HTML5
extendido por Ruby, mas qualquer código HTML5 puro é um erb válido.

Note que as páginas incluem apenas o conteúdo da tag `<body>` pois
tudo é encapsulado dentro do layout disponível em `views/layout.erb`.

Para uma nova página crie um arquivo na pasta `views/auto/`
Os arquivos nesta página são automaticamente roteados pelo servidor
Assim, por exemplo, o arquivo `views/auto/oiMundo.erb` será 
automaticamente disponibilizado em `http://localhost:4567/oiMundo`.

O projeto já vem com [MVP.css](https://andybrewer.github.io/mvp/) 
para permitir que o desenvolvimento se inicie o quanto antes.

**Acessando um executável por JavaScript**

Os executáveis podem ser chamados direto na página por JavaScript,
como uma função do objeto `Biju`.Pode-se passar quantos argumentos
quiser, mas o último argumento deverá ser sempre uma função de 
callback. Usando o exemplo de `run/oiMundo`, podemos chamar
`Biju.oiMundo(console.log)` e teremos "Oi, Mundo!" no console.

Os argumentos são passados diretamente na linha de comando. Ou seja,
`Biju.oiMundo('Fulana', 'Ciclano', console.log)` irá ser processada
no servidor como `./run/oiMundo "Fulana" "Ciclano"`.

O servidor retorna um JSON de resposta, contendo:

 - `status`: Deverá ser 0 se tudo ocorrer bem.
 - `mensagem`: A mensagem de saída do sistema
 - `erro`: Saída do STDERR
 
Com estas informações é possível processar o callback

### Etapa 3: rodar o servidor

Basta executar o arquivo `server.rb` e acessar `http:/localhost:4567/`

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
