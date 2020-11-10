load 'node.rb'

#algoritmo A* para encontrar menor caminho
def astar(maze, start, last)

  #Cria node inicial
  start_node = Node.new(parent = nil, position = start)

  start_node.g = 0
  start_node.h = 0
  start_node.f = 0

  #Cria node final
  end_node = Node.new(parent =nil, position =last)

  end_node.g = 0
  end_node.h = 0
  end_node.f = 0

  #Inicializa lista de nodes visitados
  open_list = []

  #inicializa lista closed
  closed_list = []

  # Adiciona o node inicial na open list
  open_list.push(start_node)

  #Loop enquando nao encontra no final
  while open_list.length > 0

    #Pega node sendo analizado no momento, tem que ser o node com o menor f
    current_node = open_list[0]
    current_index = 0

    open_list.each_with_index do |item, index|
      if item.f < current_node.f
        current_node = item
        current_index = index
      end
    end

    #Retira node analizado no momento da open list
    open_list.delete_at(current_index)
    #Retira node analizado no momento da closed list
    closed_list.push(current_node)

    #Verifica se encontrou o no final
    if current_node.position == end_node.position
      path = []
      current = current_node

      while current != nil
        path.push(current.position)
        current = current.parent
      end

      return path.reverse

    end

    #Gera os vizinhos do node atual
    children = []

    [[0, -1], [0, 1], [-1, 0], [1, 0]].each { |new_position|
      #percorre uma coluna OU uma linha por vez
      node_position = [current_node.position[0] + new_position[0], current_node.position[1] + new_position[1]]

      #verifica se o vizinho nao ultrapassa a borda da matriz
      if node_position[0] > (maze.length - 1) || node_position[0] < 0 || node_position[1] > (maze[maze.length - 1].length - 1) || node_position[1] < 0
        next
      end

      #verifica se o vizinho se encontra na rua
      if maze[node_position[0]][node_position[1]] != 0
        next
      end


      new_node = Node.new(current_node, node_position)
      children.push(new_node)

    }

    #Loop entre os vizinhos
    children.each { |child|
      #Verifica se o vizinho esta na closed list
      closed_list.each { |closed_child|
        if child.position == closed_child.position
          next
        end
      }

      #Cria os valores f, g e h para a funcao f = g + h, sendo h a heuristica
      child.g = current_node.g + 1
      child.h = ((child.position[0] - end_node.position[0]) ** 2) + ((child.position[1] - end_node.position[1]) ** 2)
      child.f = child.g + child.h

      #Se o vizinho ja esta na open list
      open_list.each { |open_node|
        if child.position == open_node.position && child.g > open_node.g
          next
        end
      }

      #Adiciona o vizinho na open list
      open_list.push(child)
    }

  end

end