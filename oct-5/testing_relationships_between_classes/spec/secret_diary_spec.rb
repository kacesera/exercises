require_relative '../lib/secret_diary'

### WARNING ###
# For the purposes of this exercise, you are testing after
# the code has been written. This means your tests are prone
# to false positives!
#
# Make sure your tests work by deleting the bodies of the
# methods in `secret_diary.rb`, like this:
#
# ```ruby
# def write(new_message)
# end
# ```
#
# If they fail, then you know your tests are working
# as expected.
### WARNING ###

RSpec.describe SecretDiary do
  let(:my_diary) { double("Fake Diary") }
  let(:diary) { SecretDiary.new(my_diary) }

  context "when locked" do
    it "refuses to be read" do
      expect(diary.read).to eq("Go away!")
    end

    it "refuses to be written" do
      expect(diary.write("Hello")).to eq("Go away!")
    end
  end

  context "when unlocked" do
    before { diary.unlock }

    it "gets read" do
      expect(my_diary).to receive(:read)
      diary.read
    end

    it "gets written" do
      allow(my_diary).to receive(:write)
      diary.write("A really great entry!")
    end
  end
end
