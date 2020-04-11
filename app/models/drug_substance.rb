class DrugSubstance < ApplicationRecord
  belongs_to :drug
  belongs_to :substance
end
