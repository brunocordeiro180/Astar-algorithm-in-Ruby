#converte as coordenadas para as coordenadas do mapa
def convertToMapFormat(ponto, size)
  aux = ponto[0]
  ponto[0] = size[1] - ponto[1]
  ponto[1] = aux

  return ponto
end

def imprimeMapa(maze, start, last)
  maze.each_with_index do |r, i|
    r.each_with_index { |element, j|

      case element
      when 'X'
        if [i, j] == start || [i, j] == last
          print "#{element}  ".yellow
          STDOUT.flush
        else
          print "#{element}  ".red
          STDOUT.flush
        end
      when 0
        print "   "
        STDOUT.flush
      else
        print "#{element}  ".cyan
        STDOUT.flush
      end
      # print("#{element}  ")
    }
    print("\n")
  end
end