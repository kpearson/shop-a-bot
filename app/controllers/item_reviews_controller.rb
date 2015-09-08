class ItemReviewsController < ApplicationController
  def new
    @review = ItemReview.new
  end

  def create
    review = ItemReview.new(review_params)
    if review.save
      redirect_to item_path(params[:item_id]), notice: "Thank you for the review"
    else
      render "new", notice: "Sorry, somthing went wrong. Please look over the form and try again"
    end
  end

  def update
    review = ItemReview.find(params[:id])
    respond_to do |format|
      if review.update_attributes(review_params)
        format.html { redirect_to(items_path) }
        format.json { respond_with_bip(review) }
      else
        format.html { redirect_to items_path }
        format.json { respond_with_bip(review) }
      end
    end
  end

  private

  def review_params
    params.require(:item_review).permit(:title, :body).merge(item_id: params[:item_id])
  end
end
