class ConsoleOutput

  private

  def print_header
    puts "Bet number\t| "+
         "Amount before bet\t| "+
         "Bet\t\t| "+
         "pseudo-random\t| "+
         "Won?\t| "+
         "Amount after bet\t| "+
         "Broken?\t|"
  end

  def print_footer
    puts 'Game over :('
  end

  public

  def generate(turns)
    print_header
    turns.each_with_index do |turn, i|
      puts "#{i}\t\t| "+
           "#{turn[:amount_before_bet]}\t\t\t| "+
           "#{turn[:bet]}\t\t| "+
           "#{turn[:pseudo_random]}\t\t| "+
           "#{turn[:won]}\t| "+
           "#{turn[:amount_after_bet]}\t\t\t| "+
           "#{turn[:broke]}\t\t|"
    end
    print_footer
  end

end
