# frozen_string_literal: true

class BrandsController < ApplicationController

	before_action :set_brand, only: [:destroy, :edit, :show, :update]

	def index
		@brands = Brand.order(:name)
	end

	def new
		@brand = Brand.new
		render :edit
	end

	def create
		@brand = Brand.new(filtered_params)
		render :edit and return unless @brand.save
		redirect_to brands_path, notice: "Created"
	end

	def edit
	end

	def update
		render :edit and return unless @brand.update(filtered_params)
		redirect_to brands_path, notice: "Created"
	end

	def destroy
		@brand.destroy
		redirect_to brands_path, notice: "Destroyed"
	end

	private

	def filtered_params
		params.require(:brand).permit(:name)
	end

	def set_brand
		@brand = Brand.find params[:id]
	end

end
