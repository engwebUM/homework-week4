  class Player
    def initialize shoe 
      @shoe = shoe
    end

    def put_on
      shoe.put_on
    end
  end

  player = Player.new shoe