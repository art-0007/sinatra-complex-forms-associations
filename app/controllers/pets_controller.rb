class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    #binding.pry
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    #binding.pry
    @pet = Pet.create(params["pet"])
    if !params["owner"]["name"].empty?
      @owner = Owner.create(params[:owner])
      @owner.pets << @pet
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do 
    #binding.pry
    @owners = Owner.all
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  get '/pets/:id' do 
    #binding.pry
    @owners = Owner.all
    @pet = Pet.find(params[:id])
    #binding.pry
    #raise @pet.owner.name.inspect

    erb :'/pets/show'
  end

  patch '/pets/:id' do 
    #binding.pry
    # if !params[:owner].keys.include?("pet_ids")
    #   params[:owner]["pet_ids"] = []
    #   end
    @pet = Pet.find(params[:id])
    @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
      @owner = Owner.create(params[:owner])
      @owner.pets << @pet
    end

    redirect to "pets/#{@pet.id}"
  end
end