class CardsController < ApplicationController
  def index
    @q = Card.ransack(params[:q])
    @cards = @q.result.order(:name).page params[:page]
  end

  def show
    @card = Card.find(params[:id])
    # associated tables
    @supertype = @card.supertype.name
    @types = @card.types
    @cardset = @card.cardset
    # links to associated tables
    @link_super = "/supertypes"
    @link_sub = "/subtypes"
    @link_type = "/types"
    @link_cardset = "/cardsets/#{@cardset.id}"

    return unless params[:q].present? and params[:q][:artist_title_eq].present?

    params[:q][:artist_cont_any] = params[:q][:artist_title_eq].split(" ")
  end
end
