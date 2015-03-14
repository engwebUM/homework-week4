  class Player
  	attr_writer :shoe

    def put_on
      shoe.put_on
    end

    def shoe
      @shoe ||= Shoe.new
    end

  end

  player = Player.new