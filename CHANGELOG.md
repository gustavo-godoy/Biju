# Changelog
Todas as mudanças significativas no projeto serão documentadas neste arquivo.

O formato é baseado no projeto [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
mas NÃO adere ao Semantic Versioning.

## [Versão Futura]

## [1.2.1] 2021-04-09

### Adicionado
 - Changelog
 - Opções de configuração (titulo, versão e porta)

## [1.2.0] 2021-04-09

### Adicionado
 - Resposta do servidor inclui status de erro
 - Resposta do servidor inclui mensagem de erro
 
### Removido
 - Resposta do servidor não tem mais parametro "tudoCerto",
   agora obsoleto graças ao status.
 
## [1.1.0] 2021-04-02

### Alterado
 - Usuário não lida mais diretamente com Promises, apenas passa
   uma opção de callback como último argumento.
   
## [1.0.0] 2021-04-02

Primeira versão funcional do projeto
