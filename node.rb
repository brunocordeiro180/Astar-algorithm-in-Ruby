class Node
  #Classe representando os nos, sendo cada no um elemento da matriz maze
  attr_accessor :g, :h, :f, :parent, :position

  #Armazena a posicao e a celula que foi acessada antes dessa
  def initialize(parent, position)
    @parent = parent
    @position = position

  end
end