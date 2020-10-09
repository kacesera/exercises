require "exercise_2"

describe Diary do

  it "adds new entries" do
    entry_double = double :entry
    entry_class_double = double :entry_class, new: entry_double

    diary = Diary.new(entry_class_double)
    diary.add("title", "body")

    expect(diary.entries).to include entry_double
  end

  it "indexes titles with a newline" do
    entry_double = double :entry
    entry_class_double = double :entry_class, new: entry_double

    diary = Diary.new(entry_class_double)
    3.times { diary.add("title", "body") }

    allow(entry_double).to receive(:title) {"TITLE"}
    expect(diary.index).to eq("TITLE\nTITLE\nTITLE")
  end
end

describe Entry do
  entry = Entry.new("My Title", "The greatest entry EVER!!!")
  
  it "has a title" do 
    expect(entry.title).to eq "My Title"
  end

  it "has a body" do 
    expect(entry.body).to eq "The greatest entry EVER!!!"
  end
end