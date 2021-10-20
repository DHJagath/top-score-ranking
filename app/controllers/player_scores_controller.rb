class PlayerScoresController < ApplicationController
  before_action :set_player_score, only: [:show, :update, :destroy]

  # GET /player_scores
  def index
    @player_scores = PlayerScore.page(params[:page]).per(params[:rows])

    #search by datetime before and after and players names
    if params[:before] && params[:after] && params[:playernames]
      @player_scores = PlayerScore.where(time: (params[:before])..params[:after]).where(playername: params[:playernames])
                      .page(params[:page]).per(params[:rows])
    end 

    #search only by datetime before
    if params[:before] && !params[:after] && !params[:playernames]
      @player_scores = PlayerScore.where('time < ?', params[:before]).page(params[:page]).per(params[:rows])             
    end  

    #search only by datetime after
    if !params[:before] && params[:after] && !params[:playernames]
      @player_scores = PlayerScore.where('time > ?', params[:after]).page(params[:page]).per(params[:rows])
    end

    #search only by players names
    if !params[:before] && !params[:after] && params[:playernames]
      @player_scores = PlayerScore.where(playername: params[:playernames]).page(params[:page]).per(params[:rows])
    end

    #search only by datetime before and players names
    if params[:before] && !params[:after] && params[:playernames]
      @player_scores = PlayerScore.where(playername: params[:playernames]).where('time < ?', params[:before])
                        .page(params[:page]).per(params[:rows])
    end

    #search only by datetime after and palyers names
    if !params[:before] && params[:after] && params[:playernames]
      @player_scores = PlayerScore.where(playername: params[:playernames]).where('time > ?', params[:after])
                        .page(params[:page]).per(params[:rows])
    end

    #search only by datetime before and datetime after
    if params[:before] && params[:after] && !params[:playernames]
      @player_scores = PlayerScore.where(time: (params[:before])..params[:after]).page(params[:page]).per(params[:rows])
    end
    
    render json: @player_scores
  end

  # GET /player_scores/1
  def show
    render json: @player_score
  end

  # GET /player_scores/playername
  def showbyname
    @player_score = PlayerScore.where(playername: params[:playername])
    render json: @player_score
  end

  # GET /player_scores/maxscore
  def maxscore
    @player_score = PlayerScore.where(playername: params[:playername]).order(score: :desc).first
    render json: @player_score
  end

  # GET /player_scores/lowscore
  def lowscore
    @player_score = PlayerScore.where(playername: params[:playername]).order(score: :asc).first
    render json: @player_score
  end

  # GET /player_scores/avascore
  def avascore
    @player_score = PlayerScore.where(playername: params[:playername]).average(:score).to_i 
    render json: @player_score
  end

  # POST /player_scores
  def create
    if !params.has_key?(:playername) || !params.has_key?(:score)
      render json: {error: 'Invalid request data'}, status: :bad_request
    else
      @current_time = Time.new
      @max_id = PlayerScore.maximum(:id)
      if !@max_id
        params[:scoreid] = "1-" + @current_time.to_i.to_s 
      else
        params[:scoreid] = (@max_id+1).to_s + "-" + @current_time.to_i.to_s
      end
      
      @player_score = PlayerScore.new({scoreid: params[:scoreid], playername: params[:playername], 
                                    score: params[:score], time: @current_time})

      if @player_score.save
        render json: @player_score, status: :created, location: @player_score
      else
        render json: @player_score.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /player_scores/1
  def update
    if @player_score.update(player_score_params)
      render json: @player_score
    else
      render json: @player_score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /player_scores/1
  def destroy
    @player_score.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_score
      @player_score = PlayerScore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_score_params
      params.require(:player_score).permit(:scoreid, :playername, :score, :time)
    end
end
