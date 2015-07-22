class API < Grape::API
  prefix 'api'
  version 'v1', using: :path
  mount Sneaker::Data
end
