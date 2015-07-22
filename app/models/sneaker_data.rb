class SneakerData < ActiveRecord::Base
  #scope :status, -> (status) { where status: status }
  #scope :location, -> (location_id) { where location_id: location_id }
  scope :name_param, -> (name) { where("name like ?", "#{name}%")}
  scope :brand_param, -> (brand) { where("brand like ?", "#{brand}%")}
  scope :sneakertype_param, -> (sneakertype) { where("sneakertype like ?", "#{sneakertype}%")}
  scope :gender_param, -> (gender) { where("gender like ?", "#{gender}%")}
  scope :colour_param, -> (colour) { where("colour like ?", "#{colour}%")}

end
