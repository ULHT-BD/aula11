# aula11
Na aula passada olhámos para junções horizontais e como podemos obter conteúdo obtido a partir de várias tabelas, quando relacionado através de chaves estrangeiras, utilizando a cláusula ```JOIN```.
Nesta aula vemos outra forma de realizar junções como podemos combinar resultados de operações sobre conjuntos e sobre outra junções verticais e como.
Bom trabalho!

[0. Requisitos](#0-requisitos)

[1. Nested Queries](#1-nested-queries)

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
Nested queries ou subqueries consistem em queries onde um SELECT contém outro SELECT. Podemos ter vários nested queries com vários níveis de SELECT encadeados, por exemplo

``` sql
SELECT * FROM t1 
WHERE t1.id IN (
  SELECT t2.id FROM t2 
  WHERE t2.id IN (
    SELECT t3.id FROM t3
  )
);
```




### Exercícios
Considere a Base de Dados hr que usou nas aulas anteriores. Usando nested queries, escreva a query SQL que permite responder cada uma das seguintes questões:

1. Quais os empregados (primeiro nome e último nome) que recebem um salário superior ao empregado cujo id é 163
2. Quais os empregados (primeiro nome, último nome, salário e departamento id) que recebem salário igual ao salário mínimo de algum departamento.
3. Quais os empregados (id, primeiro nome, último nome) dos empregados que ganham acima do salário médio
4. Quais os empregados (primeiro nome, departamento id, job id e nome do departamento) dos empregados que trabalham no departamento Finance.
5. Quais os empregados cujo salário está acima da média mas abaixo de 10000.
6. Quais os empregados que não trabalham nos departamentos dos managers cujo id é entre 100 e 200.
7. Quais os empregados que recebem o segundo salário mais elevado. 
8. Quais os empregados (id primeiro nome e salario) que recebem acima da média e trabalham no mesmo departamento onde algum nome empregado contenha a letra 'J'.
9. Quais os empregados (primeiro nome) que trabalham nos departamentos de United Kingdom.


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
