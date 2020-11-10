class Rua
  #Classe usada para armazenar informacao sobre a rua
  # O nome e a velocidade nao estao sendo usados neste projeto
  attr_accessor :name, :endX, :speed, :startX, :startY, :endY

  def initialize(name, numbers)
    @name = name
    @startX =  numbers[0]
    @startY = numbers[1]
    @endX = numbers[2]
    @endY = numbers[3]
    @speed = numbers[4]
  end

end