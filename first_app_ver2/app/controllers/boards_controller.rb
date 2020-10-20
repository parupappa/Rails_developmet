class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(params_board)
    @board.save
    redirect_to board_url(@board)
  end

  def show
    @board = Board.find(params[:id])
    #routesのidに応じた:id をBoardモデルから取得
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update_attributes(params_board) #DBのレコードを複数同時に更新できるメソッド
    redirect_to board_url(@board)
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    redirect_to board_url
  end

  private #メソッドのアクセスを制約する

    def params_board
      params.permit(:title, :editor)
      #パーミッションでは引数の項目が存在しているかをチェックしている
      #チェックして@boardに渡している
    end


 end