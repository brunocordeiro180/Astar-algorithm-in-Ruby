
<h3 align="center">Caminhos no mapa</h3>

<p align="center">
Aplicação em Ruby para encontrar menor caminho utilizando o algoritmo A*
<br />

</p>




<!-- TABLE OF CONTENTS -->
## Table of Contents

* [Sobre o projeto](#sobre-o-projeto)
  * [Tecnologias utilizadas](#built-with)
* [Aplicação](#aplicacao)
  * [Pré-requisitos](#pre-requisitos)
  * [Rodando o programa](#rodando-o-programa)
* [Considerações Finais](#consideracoes-finais)

<!-- ABOUT THE PROJECT -->
## Sobre o Projeto

[![A* result][product-screenshot]](https://example.com)

O projeto visa simular a escolha de melhor caminho entre um ponto inicial e um ponto final de um mapa, contendo um ponto intermediário se o usuário desejar
Alguns pontos importantes sobre o projeto:
* Gera uma matriz representando um mapa com as ruas informadas no arquivo 'ruas'
* As ruas só podem estar na horizontal ou na vertical

### Tecnologias utilizadas

* [Ruby](https://www.ruby-lang.org/pt)
* [Colorize](https://github.com/fazibear/colorize)

Para encontrar o menor caminho entres os pontos foi utilizado o algoritmo A*. Esse algoritmo foi escrito tendo como base o pseudocódigo encontrado em 
[A*](https://en.wikipedia.org/wiki/A*_search_algorithm)



<!-- GETTING STARTED -->
## Aplicação

A seguir se encontram uma série de passos para instalar os programas necessários para rodar o programa.

### Pré-requisitos

Primeiramente você deve ter o [Ruby](https://www.ruby-lang.org/pt/)

```sh
sudo apt-get install ruby
```

Para visualizar a saída com as cores é necessário instalar a gem [Colorize](https://github.com/fazibear/colorize)

```sh
sudo apt-get install ruby-dev
gem install colorize
```

### Rodando o programa

Você pode rodar o programa utilizando 
```sh
ruby main.rb
```
O abrindo a pasta do projeto na sua IDE de preferência como o [RubyMine](https://www.jetbrains.com/ruby/)

<!-- USAGE EXAMPLES -->
## Considerações Finais

O projeto se encontra em fase inicial. Algumas funcionalidades precisam ser instaladas, como:

* Testes utilizando o RSpec
* Opção para o usuário escolher entre o menor caminho e o caminho mais curto
* Não permitir entradas de usuário inválidas, e verificar se o arquivo se encontra no formato correto
* Permitir que no arquivo possam ser adicionados pontos de interseção


[product-screenshot]: screenshot.png
