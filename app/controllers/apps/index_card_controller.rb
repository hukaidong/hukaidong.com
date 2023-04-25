class Apps::IndexCardController < ApplicationController
  def main
    @index_cards = IndexCardResource.load_all
  end
end
