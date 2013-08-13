require 'spec_helper'

describe BoilNote do
  describe "Average volume" do
    it "finds average volume" do
      note = BoilNote.create!({post_boil_volume: 10, pre_boil_volume: 30})
      expect(note.average_volume).to eq(20)
    end

    it "finds average volume in gallons" do
      note = BoilNote.create!({post_boil_volume: 10, pre_boil_volume: 30})

      expect(note.average_volume_gallons).to eq(0.15625)
    end
  end

  describe "Creating with other units" do
    it "saves correct volume when given gallons" do
      note = BoilNote.create!({pre_boil_volume_gallons: 0.25})

      expect(note.pre_boil_volume).to eq(32)
    end

    it "saves correct volume when given gallons, recovered as gallons" do
      note = BoilNote.create!({pre_boil_volume_gallons: 0.25})

      expect(note.pre_boil_volume_gallons).to eq(0.25)
    end
  end
end
