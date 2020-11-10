#Metodos referentes ao Mapa(lembrando que aqui estou chamando o mapa de maze)

#Inicializa o mapa com #'s
def initializeMaze(size)
  return Array.new(size[0] + 1){Array.new(size[1] + 1, '#')}
end

#Preenche o mapa com as ruas, sendo as celulas das ruas iguais a 0
def fillMaze(maze, streets)
  
  streets.each do |rua|
    maze.each_index do |i|

      # Get subarray and loop over its indexes also.
      subarray = maze[i]
      subarray.each_index do |j|
        # Display the cell.
        if i >= rua.startX && i <= rua.endX && j >= rua.startY && j <= rua.endY
          maze[i][j] = 0
        end
      end

    end
  end

  return maze.transpose.reverse
end

#Encontra o tamanho do mapa atraves da maior coordenada de x e a maior de y
def findSize(streets)
  x = 0
  y = 0
  streets.each do |rua|
    if(rua.endX > x)
      x = rua.endX
    end

    if(rua.endY > y)
      y = rua.endY
    end
  end

  return [x, y]
end