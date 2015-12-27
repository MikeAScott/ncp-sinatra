require 'mongo_mapper'

class Payment
  include MongoMapper::Document

  key :vehicle,       String
  key :name_on_card,  String

end