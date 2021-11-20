class GalleryController < ApplicationController
    def index
        @gallery = Store.all
    end
end
