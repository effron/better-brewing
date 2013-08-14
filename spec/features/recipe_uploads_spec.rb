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
    before :each do
      sign_up("original_author")
      upload_recipe
      sign_out
      sign_up("cloner")
      visit recipe_url(1)
      click_button "Clone Me"
    end
    it "should clone the recipe" do

      page.should have_content "By cloner"
    end

    it "should have information about the original uploader" do

      page.should have_content "Originally uploaded by: original_author"
    end

    it "should remember the original uploader even on clones of clones" do
      sign_out
      sign_up("double_cloner")
      visit recipe_url(2)
      click_button "Clone Me"

      page.should have_content "By double_cloner"
      page.should have_content "Originally uploaded by: original_author"
    end
  end
end
