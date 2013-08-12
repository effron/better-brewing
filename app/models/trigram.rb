class Trigram < ActiveRecord::Base
  include Fuzzily::Model
  attr_accessible :score, :trigram, :owner_type

end