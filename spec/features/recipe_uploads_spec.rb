require 'spec_helper'

describe "RecipeUploads" do

  context "when logged in" do
    before :each do
      sign_up_as_tester
    end

    describe "New recipe page" do
      it "should load the page" do
        visit new_recipe_url

        page.should have_content("Upload a recipe")
      end

      it "should create a recipe with valid xml" do
        upload_recipe
        page.should have_content "Predicted Recipe Properties"
      end
    end
  end
  
  describe "Cloning Recipes" do
    it "should clone the recipe" do
      sign_up("original_author")
      upload_recipe
      sign_out
      sign_up("cloner")
      visit recipe_url(1)
      click_button "Clone Me"
      
      page.should have_content "By cloner"
    end
  end
end
