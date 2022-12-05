# aula11
Na aula passada olhámos para junções horizontais e como podemos obter conteúdo obtido a partir de várias tabelas, quando relacionado através de chaves estrangeiras, utilizando a cláusula ```JOIN```.
Nesta aula vemos outra forma de realizar junções como podemos combinar resultados de operações sobre conjuntos e sobre outra junções verticais e como.
Bom trabalho!

[0. Requisitos](#0-requisitos)

[1. Junção Horizontal](#1-nested-queries)

[2. Operações UNION, INTERSECT e MINUS](#3-operações-union-intersect-e-minus)

[3. Resoluções](#3-resoluções)

[Bibliografia e Referências](#bibliografia-e-referências)

[Outros](#outros)

## 0. Requisitos
Requisitos: Para esta aula, precisa de ter o ambiente de trabalho configurado ([Docker](https://www.docker.com/products/docker-desktop/) com [base de dados HR](https://github.com/ULHT-BD/aula03/blob/main/docker_db_aula03.zip) e [DBeaver](https://dbeaver.io/download/)). Caso ainda não o tenha feito, veja como fazer seguindo o passo 1 da [aula03](https://github.com/ULHT-BD/aula03/edit/main/README.md#1-prepare-o-seu-ambiente-de-trabalho).

Caso já tenha o docker pode iniciá-lo usando o comando ```docker start mysgbd``` no terminal, ou através do interface gráfico do docker-desktop:
<img width="1305" alt="image" src="https://user-images.githubusercontent.com/32137262/194916340-13af4c85-c282-4d98-a571-9c4f7b468bbb.png">

Deve também ter o cliente DBeaver.

## 1. Nested Queries
A junção horizontal permite recuperar dados de várias relações em simultâneo a efetuando associações através de valores em chaves estrangeiras. Corresponde a efetuar um produto cartesiano seguido de uma seleção. Em SQL esta operacao e conseguida com recurso a clausula ```JOIN```.

A juncao pode ser feita de varias formas: ```INNER JOIN``` (juncao interna) ou ```OUTER JOIN``` (juncao externa) a esquerda ou a direita.

A sintaxe geral e:

``` sql
SELECT t1.col1, t1.col2, t2.col3, t2.col4 
FROM tabela1 t1
  [LEFT/RIGHT] [INNER/OUTER] JOIN tabela2 t2 ON t1.col1 = t2.col3
);
```

Por exemplo,

<img width="759" alt="image" src="https://user-images.githubusercontent.com/32137262/204396892-a62fe137-447b-4958-a727-980d4bbd969c.png">

Podemos obter informação sobre veiculos (matricula, marca) e respetivos proprietarios (nif e nome) usando a query:

``` sql
SELECT
  v.matricula, v.marca, p.nif, p.nome
FROM veiculo v JOIN proprietário p ON v.nif = p.nif;
```

O resultado da execução da query é:

<img width="602" alt="image" src="https://user-images.githubusercontent.com/32137262/204397360-22b5e0ab-5254-4fe5-b009-ec46d6ce144f.png">


O quadro seguinte resume os varios tipos de ```JOIN```.

<img width="848" alt="image" src="https://user-images.githubusercontent.com/32137262/204397593-6118a241-1d2b-430b-861f-a0c0f901a92c.png">

Vimos nas aulas anteriores que podemos usar a clausula ```DELETE``` para eliminar tuplos da nossa relacao. O ```DELETE JOIN``` permite remover de uma ou várias relações de acordo com uma operação ```JOIN```

``` sql
DELETE T1, T2
FROM T1
INNER JOIN T2 ON T1.key = T2.key
WHERE condition;
```

### Exercícios
Considere a Base de Dados seguinte:

Disciplina(id, nome, carga_horaria, prof_id), prof_id:FK(Professor)

Professor(nif, nome, telefone, email) 

Escreva o código SQL que permite obter:
1. Criar as relações Disciplina e Professor e inserir alguns tuplos que permitam testar as queries seguintes 

2. Nome das disciplinas (e.g. Fundamentos de Programação, Programação I, etc) cuja carga horário é superior a 20h

3. Informação de id e nome de disciplinas e respetivos professores

4. Professores de disciplinas com carga horária superior a 40h

5. Disciplinas sem professores associados

## 3. Operações UNION, INTERSECT e MINUS
Em SQL podemos efetuar operações entre vários conjuntos. 
![image](https://user-images.githubusercontent.com/32137262/197638351-749da169-af37-4809-b1e3-b0e8f4d3fc2f.png)

Exemplos:
|Operador|Descrição|Exemplo|
|--------|---------|-------|
|UNION|Conjunto de tuplos que estão no primeiro e/ou no segundo conjunto, sem duplicados|Obter diferentes nomes de alunos e nomes de professores: ```SELECT nome FROM alunos UNION SELECT nome FROM professores;```|
|UNION ALL|Conjunto de tuplos que estão no primeiro e/ou no segundo conjunto, incluindo duplicados|Obter nomes de alunos e nomes de professores mantendo repetições entre grupos: ```SELECT nome FROM alunos UNION ALL SELECT nome FROM professores;```|
|INTERSECT|Conjunto de tuplos que existem simultaneamente no primeiro e no segundo conjuntos.|Obter nomes de alunos que também são nomes de professores: ```SELECT nome FROM alunos INTERSECT SELECT nome FROM professores;```|
|EXCEPT (MINUS)|Conjunto de tuplos que estão no primeiro conjunto mas não no segundo conjunto|Obter nomes de alunos que não são nomes de professores: ```SELECT nome FROM alunos EXCEPT SELECT nome FROM professores;```|

### Exercícios
Para cada uma das alíneas seguintes, escreva a query que permite obter:
1. Uma única lista com os nomes próprios e os apelidos de todos os trabalhadores
2. A lista de nomes próprios que sejam nome de pelo menos um trabalhador que recebe comissão e de um trabalhador que não recebe


## 3. Resoluções
[Resolução dos exercícios em aula](https://github.com/ULHT-BD/aula11/blob/main/aula11_resolucao.sql)

## Bibliografia e Referências
* [Slides aula (+material extra)](https://github.com/ULHT-BD/aula11/blob/main/Aula11.pdf) 
* [Subqueries in mysql.com](https://dev.mysql.com/doc/refman/8.0/en/subqueries.html)


## Outros
Para dúvidas e discussões pode juntar-se ao grupo slack da turma através do [link](
https://join.slack.com/t/ulht-bd/shared_invite/zt-1iyiki38n-ObLCdokAGUG5uLQAaJ1~fA) (atualizado 2022-11-03)
