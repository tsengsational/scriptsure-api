class Api::V1::TitlePagesController < ApplicationController
  def create
    title_page = TitlePage.create(title_page_params)
    render json: title_page
  end

  def update
    title_page = TitlePage.find(params[:id])
    title_page.update(title_page_params)
    render json: title_page
  end

  def show
    title_page = TitlePage.find(params[:id])
    render json: title_page
  end

  def destroy
    title_page = TitlePage.find(params[:id])
    title_page.destroy
    render json: {message: "Title Page successfully deleted."}
  end

  private

  def title_page_params
    params.require(:title_page).permit(:title, :byline, :address_1, :city, :state, :zip, :phone, :email, :notes)
  end
end
