class SnailsPaceRace

  FINISH_LINE = 10

  def initialize
    @color_table = { 1 => 'red', 2 => 'orange', 3 => 'yellow', 4 => 'green', 5 => 'blue', 6 => 'pink'}
    @player_position = { 'red' => 0, 'orange' => 0, 'yellow' => 0, 'green' => 0, 'blue' => 0, 'pink' => 0}
  end

  def roll_die
    random_number = rand(6) + 1
    my_color = @color_table[random_number]
    return my_color
  end

  def move_player(color)
    @player_position[color] += 1
  end

  def show_race
    @player_position.each_key do |k|
      puts "-" * 75
      formatted_player_name = sprintf("%6s", k)
      print "#{formatted_player_name}\t\t"
      print " X--X " * @player_position[k]
      print "|\n"
    end
  end

  def game_over?
    @player_position.each_key do |k|
         if @player_position[k] == 10
           return k
         end
    end
    return false
    end
end

game = SnailsPaceRace.new

while not game.game_over? do
  print "Hit enter to roll"
  gets
  color = game.roll_die
  game.move_player(color)
  game.show_race
  print "\n"
end

puts "Game over!!  #{game.game_over?} WINS"








#player_position = {}
#(1..10000000).each do
#
#  unless player_position[my_color].nil?
#    player_position[my_color] += 1
#  else
#    player_position[my_color] = 1
#  end
#end
#puts "------------------"
#player_position.each_key do |k,v|
#  puts "Color #{k} rolled #{player_position[k]} times"
#end
