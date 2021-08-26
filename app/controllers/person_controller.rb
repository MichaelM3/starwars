class PersonController < ApplicationController

    def index
        people = Person.all
        render json: people
    end

    def show
        person = Person.find_by(id: params[:id])
        render json: person
    end

end
