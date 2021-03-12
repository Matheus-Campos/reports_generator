## ReportsGenerator

Declara um módulo ReportsGenerator com uma única função pública, generate/1, que recebe o caminho para um arquivo csv onde cada linha possui o seguinte formato: `<pessoa>,<horas>,<dia>,<mês>,<ano>` e devolve um map com dados referentes às horas trabalhadas no total, por mês e por ano.

## Como executar

Após clonar o projeto, entre na pasta do projeto e execute `iex -S mix`, após isso dê o comando: `ReportsGenerator.generate()`.

