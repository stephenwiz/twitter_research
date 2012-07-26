class NotesController < ApplicationController

  before_filter(:fetch_tweet)
  before_filter(:fetch_note, except: [:index, :new, :create])



  def index
    @tweets = @tweet.notes.order('created_at desc')
    respond_with(@notes, location: tweet_url(@tweet))
  end

#  show a single note
  def show
    respond_with(@note)
  end

  #  new show a form to create a new note
  def new
    @note = @tweet.notes.build
    respond_with(@note, location:tweet_url(@tweet))
  end

  #  create actually create the note
  def create
    @note = @tweet.notes.create(params[:note])
    respond_with(@note)
  end

  #  edit show a form to edit an existing note
  def edit
    respond_with(@note)
  end

  #  update actually update the note
  def update
    @note.update_attributes(params[:note])
    respond_with(@note)
  end

  #  destroy delete the note
  def destroy
    @note.destroy
    respond_with(@note)
  end

  private

  def fetch_tweet
    @tweet = current_user.tweets.find(params[:tweet_id])
  end

  def fetch_note
    @note = @tweet.notes.find(params[:id])

  end

end
