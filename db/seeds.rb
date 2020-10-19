# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Player.create(fname: 'Babe', lname: 'Ruth', bats: 'L', throws: 'L')
user = User.find_by(email: "keith@example.com")
player = Player.find_by(lname: "Ruth")

#Player.create(fname: 'Ty', lname: 'Cobb', bats: 'L', throws: 'R')
#UserPlayer.create(user_id:user.id, player_id:player.id, year:2014)

#League.create(title: "Major League Baseball", abbr: "MLB")
#League.create(title: "Federal League", abbr: "FL")
#mlb = League.find_by(abbr: "MLB")
#SubLeague.create(title: "American League", abbr: "AL", league_id: mlb.id)
#SubLeague.create(title: "National League", abbr: "NL", league_id: mlb.id)
#Division.create(title: "No American League Divisions", abbr: "NA", sub_league_id: 1)
#Division.create(title: "NoNational League Divisions", abbr: "NA", sub_league_id: 2)
#Team.create(name: "Boston", nickname: "Red Sox", abbr: "BOS", location: "Boston, Massachusettes", division_id: 1)
#Season.create(year: 2014, league_id: 1)

def get_player_data(player_id)
    url = URI.parse("http://lookup-service-prod.mlb.com/json/named.sport_hitting_tm.bam?league_list_id='mlb'&game_type='R'&season='1914'&player_id='#{player_id}'")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
    }
    return JSON.parse(res.body)
end

ruth = Player.find_by(lname: 'Ruth')
ruth_data = get_player_data(ruth.mlb_api_pid)["sport_hitting_tm"]["queryResults"]["row"]
SeasonBattingStat.create(
    player_id: ruth.id,
    team_id: 1,
    season_id: 1,
    g: ruth_data["g"].to_i,
    ab: ruth_data["ab"].to_i,
    tpa: ruth_data["tpa"].to_i,
    h: ruth_data["h"].to_i,
    xbh: ruth_data["xbh"].to_i,
    tb: ruth_data["tb"].to_i,
    d: ruth_data["d"].to_i,
    t: ruth_data["t"].to_i,
    hr: ruth_data["hr"].to_i,
    bb: ruth_data["bb"].to_i,
    ibb: ruth_data["ibb"].to_i,
    hbp: ruth_data["hbp"].to_i,
    so: ruth_data["so"].to_i,
    r: ruth_data["r"].to_i,
    rbi: ruth_data["rbi"].to_i,
    sb: ruth_data["sb"].to_i,
    cs: ruth_data["cs"].to_i,
    go: ruth_data["go"].to_i,
    gidp: ruth_data["gidp"].to_i,
    gidp_opp: ruth_data["gidp_opp"].to_i,
    ao: ruth_data["ao"].to_i,
    go_ao: ruth_data["go_ao"].to_i,
    sac: ruth_data["sac"].to_i,
    sf: ruth_data["sf"].to_i,
    hgnd: ruth_data["hgnd"].to_i,
    hldr: ruth_data["hldr"].to_i,
    hpop: ruth_data["hpop"].to_i,
    hfly: ruth_data["hfly"].to_i,
    roe: ruth_data["roe"].to_i,
    lob: ruth_data["lob"].to_i,
    avg: ruth_data["avg"].to_f,
    slg: ruth_data["slg"].to_f,
    obp: ruth_data["obp"].to_f,
    ops: ruth_data["ops"].to_f,
    babip: ruth_data["babip"].to_f
)
