class PlantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :scientific_name, :image_url, :notes

end
