class PitchesController < ApplicationController
	def index
		pitches = Pitch.all.reverse
		@pitches = pitches.as_json(include: {:creator => {only:[:username]}})
		ordered_pitches = Pitch.order_pitches_by_votes.first(7)
		@ordered_pitches = ordered_pitches.as_json(include: {:creator => {only:[:username]}})
	end

	def new
	end

	def create
		pitch = current_user.pitches.create(title: params[:title], body: params[:body], creator: current_user)
		render :json =>  {pitch: pitch}.as_json(include: {:creator => {only:[:username, :admin]}})
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
		pitch = Pitch.find(params[:id])
		if pitch.destroy
			success = true
			render json: success
		else
			failure = false
			render json: failure
		end
	end
end
