class Hospital < ApplicationRecord
  has_many :doctors

  def ordered_docs
    doctors.joins(:patients).select("doctors.*, count(patients.id) as pt_count").group("doctors.id").order("pt_count desc")
  end
end
