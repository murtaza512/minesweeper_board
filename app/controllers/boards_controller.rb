class BoardsController < ApplicationController
  include RandomizeMines

  before_action :board_params, only: [:create]

  attr_accessor :email, :rows, :cols, :mines

  def index
    @boards = Board.order(created_at: :desc).limit(10)
  end

  def create
    email = board_params[:email]
    rows = board_params[:rows].to_i
    cols = board_params[:cols].to_i    
    mines = board_params[:mines].to_i

    mines_location = locations(rows, cols, mines)
  
    @board = Board.new(email: email, rows: rows, cols: cols, mines: mines_location)

    if @board.save
      redirect_to @board
    else
      render 'index'
    end
  end

  def show
    def show
      @board = Board.find(params[:id])
      @mines_board = cached_board(@board)
    rescue ActiveRecord::RecordNotFound
      redirect_back_or_to '/'
    end
  end
    

  private

  def board_params
    params.permit(:email, :rows, :cols, :mines)
  end

  def cached_board(board)
    key = "board#{board.id}"
    Rails.cache.fetch key, expires_in: 1.day do
      grid(board.mines, board.rows, board.cols)
    end
  end

end
