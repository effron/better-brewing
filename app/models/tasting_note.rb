# == Schema Information
#
# Table name: tasting_notes
#
#  id                    :integer          not null, primary key
#  brew_note_id          :integer
#  alcohol               :integer
#  dark_fruit            :integer
#  citrus_fruit          :integer
#  hoppy                 :integer
#  floral                :integer
#  spicy                 :integer
#  herbal                :integer
#  malty                 :integer
#  toffee                :integer
#  burnt                 :integer
#  sweet                 :integer
#  sour                  :integer
#  bitter                :integer
#  dry                   :integer
#  body                  :integer
#  linger                :integer
#  serving_vessel_id     :integer
#  consumption_vessel_id :integer
#  rating                :integer
#  misc                  :text
#  appearance            :text
#  aroma                 :text
#  flavor                :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class TastingNote < ActiveRecord::Base
  attr_accessible :alcohol, :bitter, :body, :burnt, :citrus_fruit, :dark_fruit,
                  :dry, :floral, :herbal, :hoppy, :linger, :malty, :rating,
                  :sour, :spicy, :sweet, :toffee, :appearance, :aroma, :flavor,
                  :misc, :serving_vessel_id, :consumption_vessel_id,
                  :brew_note_id

  belongs_to :brew_note
  belongs_to :serving_vessel
  belongs_to :consumption_vessel

  def flavor_attribute_names
    ["alcohol", "bitter", "body", "burnt", "citrus_fruit", "dark_fruit","dry",
      "floral", "herbal", "hoppy", "linger", "malty", "sour", "spicy",
      "sweet", "toffee"]
  end

  def flavor_attribute_values
    values = [alcohol, bitter, body, burnt, citrus_fruit, dark_fruit, dry, floral,
      herbal, hoppy, linger, malty, sour, spicy, sweet, toffee]

    values.map { |value| value || 0 }
  end
end
