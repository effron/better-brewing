require 'spec_helper'

describe "BrewNote" do

  context "when logged in" do
    before :each do
      sign_up_as_tester
    end

    it "Adds new brew note" do
      upload_recipe
      brew_recipe
      page.should have_content "General Notes"
    end

  end
end
