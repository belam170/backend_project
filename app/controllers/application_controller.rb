class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/users' do
    users = User.all
    users.to_json(include: { contacts: {} })
  end

  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json(include: { contacts: {} })
  end

  post '/users' do
    request_body = JSON.parse(request.body.read)
    user = User.new(
      name: request_body['name'],
      email: request_body['email'],
      telephone_number: request_body['telephone_number'],
      address: request_body['address'],
      relationship: request_body['relationship']
    )
    user.save
    user.to_json(include: { contacts: {} })
  end

  patch '/users/:id' do
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

  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy
    user.to_json
  end

  get '/contacts' do
    contacts = Contact.all
    contacts.to_json
  end

  post '/contacts' do
    request_body = JSON.parse(request.body.read)
    user = User.find(request_body['user_id'])
    contact = Contact.create(
      nationality: request_body['nationality'],
      gender: request_body['gender'],
      nickname: request_body['nickname'],
      organization: request_body['organization'],
      user_id: user.id
    )
    contact.to_json
  end

  patch '/contacts/:id' do
    contact = Contact.find(params[:id])
    contact.update(
      nationality: params[:nationality],
      gender: params[:gender],
      nickname: params[:nickname],
      organization: params[:organization]
    )
    contact.to_json(include: { user: { only: [:name, :email, :telephone_number, :address, :relationship] } })
  end

  delete '/contacts/:id' do
    contact = Contact.find(params[:id])
    contact.destroy
    contact.to_json
  end
end
