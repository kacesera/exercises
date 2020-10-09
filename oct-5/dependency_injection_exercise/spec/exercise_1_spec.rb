require 'exercise_1'

describe Note do
  it 'displays a note' do
    formatter_double = double :formatter, format: "Title & Note!"
    note = Note.new("Title", "Body", formatter_double)

    expect(note.display).to eq("Title & Note!")
  end
end

describe NoteFormatter do
  it 'formats a note' do
    note_double = double :note, title: "TITLE", body: "BODY"
    note_formatter = NoteFormatter.new

    expect(note_formatter.format(note_double)).to eq("Title: TITLE\nBODY")
  end
end