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
    
    it "Walks through brew", js: true do
      upload_recipe
      brew_recipe
      walk_through_brew
      
      page.should have_content "General Notes"
    end

  end
  
  describe "javascript works", js:true do
    it "visits a page" do
      visit "/"
    
      page.should have_content "Recipes"
    end
    
    it "visits user signup page" do
      visit new_user_registration_path

      page.should have_content "Password confirmation"   
    end
  end
end
