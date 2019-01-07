class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      # 建立候選人成功
      redirect_to candidates_path, notice: "新增候選人成功!"
    else
      # 建立候選人失敗
      render :new
    end
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])

    if @candidate.update(candidate_params)
      redirect_to candidates_path, notice: "資料更新成功"
    else
      render :edit
    end
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end
end
