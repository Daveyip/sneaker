require'grape'

module Sneaker
  class Data < Grape::API
    resource :sneaker_data do
      desc "list all sneaker"
      get do
        SneakerData.all
      end
      desc "list sneaker by id"
      get 'id/:id'  do
        SneakerData.find(params[:id])
        #:requirements => { :id => /\d+/ }
      end
      desc "filter"
      #params do
      #    requires :name, regexp: /^$|[a-z]/
      #  end
      get 'filter' do
        puts "fuck1"
        if params[:name].blank? == false
          puts "fuck2"
          return SneakerData.where("name LIKE ?", "%#{params[:name]}%")
          puts params[:name]
        end
        if params[:brand].blank? == false
          puts "fuck3"
          return SneakerData.where("name LIKE ?", "%#{params[:name]}%").where("brand like ?","%#{params[:brand]}%")
        #SneakerData = SneakerData.where("name LIKE ? AND brand like ?", "%#{params[:name]}%", "%#{params[:brand]}%")
        end
      end
      desc "create a new sneaker"
      params do
        requires :name, type: String
        requires :description, type: String
        requires :sneakertype, type: String
        requires :brand, type: String
        requires :gender, type: String
        requires :colour, type: String
        requires :time, type: Date
      end
      post do
        SneakerData.create!({
                            name:params[:name],
                            description:params[:description],
                            sneakertype:params[:sneakertype],
                            brand:params[:brand],
                            gender:params[:gender],
                            colour:params[:colour],
                            time:params[:time]
                        })
      end
      desc "delete an sneaker"
      params do
        requires :id, type: String
      end
      delete ':id' do
        SneakerData.find(params[:id]).destroy!
      end
      desc "update an employee description"
      params do
        requires :id, type: String
        requires :description, type:String
      end
      put ':id' do
        SneakerData.find(params[:id]).update({
                                                 description:params[:description]
                                         })
      end
    end
    resource :dropdown_list do
      desc "drop down list"
       get ':id' do
         if params[:id] == '1'
           BrandList.all
         elsif params[:id] == '2'
           ColourList.all
         elsif params[:id] == '3'
           SneakertypeList.all
         end
       end
    end
  end
end
