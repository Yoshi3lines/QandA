class AnswersController < ApplicationController

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else
      redirect_to question_path(@question), notice: 'In valite'
    end
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: 'Success!'
    else
      flash[:alert] = 'In valite'
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question), notice: 'Deleted!'
  end

  private
    def answer_params
      params.require(:answer).permit(:content, :name, :question_id)
    end
end
