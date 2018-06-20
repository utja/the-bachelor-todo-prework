def get_first_name_of_season_winner(data, season)
  #quicker to go into first level by entering season key specific to season we are looking for
  data[season].each do |contestants|
    if contestants["status"] == "Winner"
      winner = contestants["name"].split
      winner = winner[0]
      return winner
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, contestants|
    contestants.each do |contestant_info|
      if contestant_info["occupation"] == occupation
        return contestant_info["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  i = 0
  data.each do |season, contestants|
    contestants.each do |contestant_info|
      if contestant_info["hometown"] == hometown
        i += 1
      end
    end
  end
  return i
end

def get_occupation(data, hometown)
  data.each do |season, contestants|
    contestants.each do |contestant_info|
      if contestant_info["hometown"] == hometown
        return contestant_info["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  tot_age = 0
  num_of_contestants = 0
  data[season].each do |contestants|
    # need to change to int, all data stored as string
    tot_age += (contestants["age"]).to_i
    num_of_contestants += 1
  end
  return (tot_age.to_f/num_of_contestants.to_f).round
end
