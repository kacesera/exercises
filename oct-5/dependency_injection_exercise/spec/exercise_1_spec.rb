require 'exercise_1'

describe Note do
  let(:formatter_double) { 
    double :formatter, 
    format: "Title & Note!" 
  }
  it 'displays a note' do
    note = Note.new("Title", "Body", formatter_double)
    expect(note.display).to eq("Title & Note!")
  end
end

describe NoteFormatter do
  let(:note_double) { 
    double :note, 
    title: "TITLE", 
    body: "BODY"
  }
  it 'formats a note' do
    expect(subject.format(note_double)).to eq("Title: TITLE\nBODY")
  end
end