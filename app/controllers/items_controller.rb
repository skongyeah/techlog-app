class Api::ItemsController < ApplicationController
    def index
      query = params[:query].presence || ''
      filter = params[:filter].presence || ''
  
      items = Item.where('name LIKE ?', "%#{query}%")
      items = items.where(category: filter) if filter.present?
  
      render json: items
    end
  end