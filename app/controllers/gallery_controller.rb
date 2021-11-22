class GalleryController < ApplicationController
  before_action :authenticate_user!
    
    def index
        @gallery = Store.all
        
    end
end
