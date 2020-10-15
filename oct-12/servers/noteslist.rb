class NotesList

  def initialize(socket)
    @filename = nil
    @socket = socket
    @notes = []
    @input = ""
    @choice = ""
  end

  def interactive_menu
    @socket.puts "What would you like to do? Type quit to end"
    @socket.puts "1. Add note"
    @socket.puts "2. See notes"
    @socket.puts "3. Load notes"
    @socket.puts "4. Save notes"
    @socket.puts "5. Exit"
    @choice = @socket.gets.chomp
    process
  end

  def process
    case @choice
    when "1"
      add_note
    when "2"
      see_notes
    when "3"
      try_load_notes
    when "4"
      try_save_notes
    when "5"
      exit 
    end
  end

  def add_note
    @socket.puts "Type 'back' to go back to the menu."
    until @input.downcase == 'back'
      @socket.puts "----------------------"
      @input = @socket.gets.chomp
      @notes << "- "+ @input unless @input == 'back'
    end
    interactive_menu
  end

  def see_notes
    @socket.puts "----------------------"
    @notes.each { |note| @socket.puts note }
    @socket.puts "----------------------"
    interactive_menu
  end

  def try_save_notes
    @socket.puts "Type 'new' to save a few file, or press enter to save to your loaded file."
    file_type = @socket.gets.chomp
  
    if file_type == 'new'
      @socket.puts "Enter a file name"
      @filename = "#{@socket.gets.chomp}.csv"
    elsif file_type.empty? && @filename == 'none'
      @socket.puts "There is no loaded file. Please enter a filename:"
      @filename = "#{@socket.gets.chomp}.csv"
    end
    save_notes
    @socket.puts "----------------------"
    @socket.puts "#{@notes.count} note saved to #{@filename}"
    @socket.puts "----------------------"
    interactive_menu
  end

  def save_notes
    File.open(@filename, "w") do |file|
      @notes.each do |note|
        file << note
      end
    end
  end

  def try_load_notes
    @socket.puts "Which file would you like to load from? Type 'none' if starting from scratch or to go back"
    @filename = @socket.gets.chomp.downcase
  
    interactive_menu if @filename == 'none'
  
    if File.exists?(@filename)
      load_notes
      @socket.puts "Loaded #{@notes.count} notes from #{@filename}"
    else
      @socket.puts "Sorry, #{@filename} doesn't exist."
      try_load_notes
    end
    interactive_menu
  end
  
  def load_notes
    File.foreach(@filename) do |note|
      add_loaded_notes(note.chomp)
    end
  end

  def add_loaded_notes(note)
    @notes << note
  end
end