class CategoriesController < ApplicationController
    
    def show
        category_setter
    end

    def index
        @categories = Category.all
    end


    private

    def category_setter
       @category = Category.find(params[:id])
    end

    def category_params
        #TODO - make this work if we need to add categories
    end

end
