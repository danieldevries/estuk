class TransactionsController < ApplicationController
  def create
    book = Book.find_by(slug: params[:slug])
    sale = book.sales.create(
      amount: book.price,
      buyer_email: current_user.email,
      seller_email: book.user.email
    )

    redirect_to pickup_path(guid: sale.guid)
  end

  def pickup
    @sale = Sale.find_by(guid: params[:guid])
    @book = @sale.book
  end
end
