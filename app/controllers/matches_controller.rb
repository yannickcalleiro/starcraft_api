class MatchesController < ApplicationController
	def index 

		matches = Match.all.includes(:winner)
		render(:json => matches.to_json({:include => :winner}))
	end
	def faction
		faction = params[:faction]
		matches = Match.all.includes(:winner).where("winner_faction = ? OR loser_faction = ?", faction, faction)
		num_matches = Match.all.where("winner_faction = ? OR loser_faction = ?", faction, faction).length
		win_matches = Match.all.where("winner_faction = ?", faction).length
		percentage = ((win_matches*1.0)/(num_matches*1.0))*100.0
		render(:json => {:matches => matches.to_json({:include => :winner}), :win_percentage => percentage.to_json})
	end 
	def player
		player = Player.find_by(id: params[:player_id])
		matches = Match.all.includes(:winner).where("winner_id = ? OR loser_id = ?", player.id, player.id)
		num_matches = Match.all.where("winner_id = ? OR loser_id = ?", player.id, player.id).length
		win_matches = Match.all.where("winner_id = ?", player.id).length
		los_matches = Match.all.where("loser_id = ?", player.id).length
		win_percentage = ((win_matches*1.0)/(num_matches*1.0))*100.0
		los_percentage = ((los_matches*1.0)/(num_matches*1.0))*100.0
	
		render(:json => {:matches => matches.to_json({:include => :winner}), :win_percentage => win_percentage.to_json, :lose_percentage => los_percentage.to_json})
	end

	def player_faction
		player = Player.find_by(id: params[:player_id])
		faction = params[:faction]
		matches = Match.all.includes(:winner).where("(winner_id = ? OR loser_id = ?) AND (winner_faction = ? OR loser_faction = ?)", player.id, player.id, faction, faction)
		render(:json => matches.to_json({:include => :winner}))
	end
end
