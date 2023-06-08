class ApplicationController < Sinatra::Base
    set :default_content_type, 'application/json'
  
    get '/user' do
      user = User.all
      user.to_json
    end
  
    get '/user/:id' do
      user = User.find(params[:id])
      user.to_json
    end
  
    post '/user' do
      request_body = JSON.parse(request.body.read)
      user = User.create(request_body)
      user.to_json(only: [:name, :email, :telephone_number, :address, :relationship])
    end
    
    patch '/user/:id' do
      user = User.find(params[:id])
      user.update(
        name: params[:name],
        email: params[:email],
        telephone_number: params[:telephone_number],
        address: params[:address],
        relationship: params[:relationship]
      )
      user.to_json
    end
    
    delete '/user/:id' do 
      user = User.find(params[:id])
      user.destroy
      user.to_json
    end
  
    get '/contact' do
      cont = Contact.all.includes(:contact_groups)
      cont.to_json(include: { contact_groups: { only: :name } })
    end
    
    get '/contact/:id' do
      cont = Contact.find(params[:id])
      cont.to_json(include: { contact_groups: { only: :name } })
    end
  
    post '/contact' do
      request_body = JSON.parse(request.body.read)
      contact_data = request_body.except('contact_groups')
      contact_groups_data = request_body['contact_groups']
    
      contact = Contact.create(contact_data)
      contact_groups_data.each do |group_data|
        group = ContactGroup.find_or_create_by(name: group_data['name'])
        contact.contact_groups << group
      end
    
      contact.to_json(include: { contact_groups: { only: :name } })
    end
    
    patch '/contact/:id' do 
      cont = Contact.find(params[:id])
      cont.update(
        name: params[:name],
        phone_number: params[:phone_number],
        email: params[:email],
        address: params[:address],
        organization: params[:organization]
      )
      cont.to_json(include: { contact_groups: { only: :name } })
    end
    
    delete '/contact/:id' do
      cont = Contact.find(params[:id])
      cont.destroy
      cont.to_json(include: { contact_groups: { only: :name } })
    end
  end
  