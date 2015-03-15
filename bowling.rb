class Bowling
    
    attr_accessor :rolls, :gameCompleted, :totalScore
    
    
    ##Simplifiquei as condições dos ifs
    ##Diminui os niveis de nesting dos metodos
    
    def initialize
        @rolls = []
        @totalScore = 0
        @gameCompleted = false
    end
    
    
    def roll(pins)
        gameCompleted?
        if pins == 10
            @rolls.push(pins)
            @rolls.push(0)
            else
            @rolls.push(pins)
        end
    end
    
    
    
    def score
        # return the current score
        i = 0
        while @rolls[i] && i<=19 do
            #spare
            if spare?
                @totalScore += sparePoints i
                #strike
                elsif strike?
                @totalScore += strikePoints i
                else
                @totalScore += @rolls[i] + @rolls[i + 1]
            end
            
            i += 2
            
            if @rolls.size == 19
                @gameCompleted = true
            end
        end
        @totalScore
        end
        
        
        def gameCompleted?
            @gameCompleted==19
        end
        
        
        def spare?
            @rolls[i] + @rolls[i+1] == 10
        end
        
        
        def strike?
            @rolls[i] == 10
        end
        
        
        def sparePoints position
            spare = 10
            if @rolls[position + 1]
                spare + @rolls[position + 1]
                else
                spare
            end
        end
        
        
        def strikePointsAux points
            result = 0
            if @rolls[position + 4]
                result = points * 2 + @rolls[position + 4]
                else
                result = points * 2
            end
            result
        end
        
        
        def sparePointsAux2 points
            result = 0
            if @rolls[position + 3]
                result = points + @rolls[position + 2] + @rolls[position + 3]
                else
                result = points + @rolls[position + 2]
            end
            result
        end
        
        
        def strikePoints position
            strike = 10
            
            if @rolls[position + 2]
                if @rolls[position + 2] == strike
                    strile = strikePointsAux strike
                    #if @rolls[position + 4]
                    #    strike * 2 + @rolls[position + 4]
                    #    else
                    #    strike * 2
                    #end
                    else
                    strike = strikePointsAux2 strike
                    #if @rolls[position + 3]
                    #    strike + @rolls[position + 2] + @rolls[position + 3]
                    #    else
                    #    strike + @rolls[position + 2]
                    #end
                end
                else
                strike
            end
        end
    end