class CandidatesController < ApplicationController
  def index
  end

  def new
    @candidate = Candidate.new  # Model 的實體
  end

  def create  # 本身是不需要畫面的（看需求）
    @candidate = Candidate.new(candidate_params)
    if @candidate.save  # return boolean
      flash[:notice] = 'Added Successfully'
      redirect_to "/"
    else
      flash[:notice] = 'Failure'
      render :new
    end   
  end

  def candidate_params
    # {"name"=>"", "age"=>"", "party"=>"", "policy"=>""}
    params.require(:candidate).permit(:name, :age, :party, :policy)
  end



end
