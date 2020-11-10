# Carregando arquivos intermediários
load 'rua.rb'
load 'maze.rb'
load 'astar.rb'
load  'scripts.rb'
require 'colorize'

#Lendo arquivo com as coordenadas das ruas
file = File.open("ruas")

#Armazendo as linhas do arquivo em um array
file_data = file.readlines.map(&:chomp)

#inicializando array que irá conter as ruas
streets = []

file_data.each { |item|
  #Para cada rua lida cria um objeto contendo nome, coordenada x inicial, coordenada x final, y inicial e y final
  name = item.scan(/[a-z.A-Z]/).join
  #cria array com os números lidos no arquivo
  numbers = item.scan(/\d+/).map(&:to_i)
  #adiciona rua lida no array
  streets.push(Rua.new(name, numbers))
}

#encontra o tamanho do mapa, com a maior coordenada de x e a maior de y
size = findSize(streets)

#OBS: Aqui estou chamando o mapa de labirinto(em ingles maze)
#inicializa labirinto vazio
emptyMaze = initializeMaze(size)

#preenche as coordenadas das ruas com 0 e o resto com #
maze = fillMaze(emptyMaze, streets)

###################################################
# Leitura de entrada do usuário
# Exemplo do arquivo (15,70) parando (8 ,15) e indo para (45,13)
start = []
last = []
parada = []

#Leitura da coordenada inicial
puts("Digite a coordenada inicial")
gets.chomp.scan(/\d+/) do |x|
  start.push(x.to_i)
end

puts("Deseja incluir parada intermediaria?[s/n]")
r = ''
loop do
  r = gets.chomp
  if r == 's' || r == 'n'
    break
  end
end

if r == 's'
  #Leitura da parada intermediária
  puts("Digite a coordenada de uma parada intermediária")
  gets.chomp.scan(/\d+/) do |x|
    parada.push(x.to_i)
  end
  parada = convertToMapFormat(parada, size)
end

#Leitura da coordenada final
puts("Digite a coordenada final")
gets.chomp.scan(/\d+/) do |x|
  last.push(x.to_i)
end

#Converter coordenadas para o formato do mapa
start = convertToMapFormat(start, size)
last = convertToMapFormat(last, size)


if parada != []
  #calcula o caminho entre o comeco e a parada
  path1 = astar(maze, start, parada)

#calcula o caminho entre a parada e o ponto final
  path2 = astar(maze, parada, last)

#junta os dois caminhos
  paths = path1 + path2
else
 paths = astar(maze, start, last)
end


#para cada celula do caminho, adicionar um X para mostrar o caminho escolhido
paths.each do |cell|
  maze[cell[0]][cell[1]] = 'X'
end

#Aqui o ponto inicial e o final estao de amarelo
imprimeMapa(maze,start, last)






