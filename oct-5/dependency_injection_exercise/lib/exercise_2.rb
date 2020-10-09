# ## Exercise 2

# Amend the following classes to be testable in isolation, then write the tests for them.

# Hint: you can inject classes too, not just instances.

# ```ruby
# class Diary
#   def initialize
#     @entries = []
#   end

#   def add(title, body)
#     @entries << Entry.new(title, body)
#   end

#   def index
#     titles = @entries.map do |entry|
#       entry.title
#     end
#     titles.join("\n")
#   end
# end

# class Entry
#   def initialize(title, body)
#     @title = title
#     @body = body
#   end

#   attr_reader :title, :body
# end
# ```

class Diary
  def initialize(entry_class = Entry)
    @entry_class = entry_class
    @entries = []
  end

  def add(title, body)
    @entries << @entry_class.new(title, body)
  end

  def index
    titles = @entries.map do |entry|
      entry.title
    end
    titles.join("\n")
  end

  def all_entries
    @entries
  end
end

class Entry
  def initialize(title, body)
    @title = title
    @body = body
  end

  def title
    @title
  end

  def body
    @body
  end
end
