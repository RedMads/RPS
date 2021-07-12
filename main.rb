require "os"
require "colorize"
require_relative "src/banner.rb"
include Banner


class RPS

    def initialize()

        # main vars !
        @elements = {
            "rock" => "scissors",
            "paper" => "rock",
            "scissors" => "paper"
        }
        @computer_choice = nil
        @player_choice = nil
        
        #settings vars !
        @rounds = 3
        @player_wins = 0
        @computer_wins = 0
        @ties = 0

    end

    def clear()
        
        if OS.linux? or OS.mac?

            system("clear")

        elsif OS.windows?

            system("cls")

        end

    end



    def get_computer_choice()

        return @elements.keys[rand() * @elements.length]

    end


    def get_player_choice()

        puts "[1] - rock\n[2] - paper\n[3] - scissors\n\n"


        print "Choose > "

        inp = gets.chomp()

        while true

            case inp

            when "1"

                return "rock"
                
            when "2"

                return "paper"

            when "3"
                
                return "scissors"
                
            else
                puts "[!] Option not found !\n"
                print "Choose > "

                inp = gets.chomp()
                
            end

        end

    end

    def logic(c_choice, p_choice)


        # # ----------  TIE CHECK  ---------- #
        if c_choice == p_choice

            return "tie"

        end
        # ---------- TIE CHECK END ---------- #

        ##########################################
        
        # ----------   WINNER  CHECK   ---------- #

        # Player win check !
        if @elements[p_choice] == c_choice

            return "player win"
        
        end
        
        # Computer check win !
        if @elements[c_choice] == p_choice

            return "computer win"

        end

        # ----------  WINNER CHECK END ---------- #

    end

    def get_status()

        puts "Rounds: #{@rounds}"
        puts "Player wins: #{@player_wins}"
        puts "Computer wins: #{@computer_wins}"
        puts "Ties: #{@ties}\n\n"
        

    end

    def get_choices()

        puts "Player choice: #{@player_choice}\n\n"
        puts "Computer choice: #{@computer_choice}\n\n"

    end


    def play()
        
        begin
    
            @computer_choice = get_computer_choice()
            @player_choice = get_player_choice()
    
            result = logic(@computer_choice, @player_choice)

            get_choices()
    
            case result

            when "tie"
                @rounds -= 1
                @ties  += 1
                puts "[~] it's a tie !"
                
            when "player win"
                @rounds -= 1
                @player_wins += 1
                puts "[$] Player win this round (#{@player_wins}/3)!"

            when "computer win"
                @rounds -= 1
                @computer_wins += 1
                puts "[$] Computer win this round (#{@computer_wins}/3)!"

            end

        rescue Interrupt

            puts "\n\n[!] Keyboard interrupt, Exting."; exit()
    
            
        end
   

    end

    def again()

        print "[?] Play again? (y/n): "

        inp = gets.chomp()

        while true

            case inp.downcase()

            when "y", "yes"

                main()

            when "n", "no"

                puts "[$] Thanks For playing !"; exit()

            else 

                print "[?] Play again? (y/n): "

                inp = gets.chomp()

            end

        end

    end
    

    def play_best_of()

        while @rounds != 0
            clear(); Banner::print_banner()
            play()
            sleep(2.7)

            if @player_wins > @computer_wins

                puts "[$] Player win (#{@player_wins}/3) rounds !"

            elsif @computer_wins > @player_wins

                puts "[$] Computer win (#{@computer_wins}/3) rounds !"


            elsif @player_wins == @computer_wins

                puts "[~] No one win, Equals !"

            end

            

        end

        again()

    end


end

def main()
    
    obj = RPS.new()
    obj.play_best_of()

end

main()
