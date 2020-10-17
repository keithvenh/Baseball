module PagesHelper
    require 'net/http'
    require 'json'
    def get_player_data(player_id)
        url = URI.parse("http://lookup-service-prod.mlb.com/json/named.sport_hitting_tm.bam?league_list_id='mlb'&game_type='R'&season='1914'&player_id='#{player_id}'")
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
        }
        return JSON.parse(res.body)
    end

    def get_player_info
        url = URI.parse("http://lookup-service-prod.mlb.com/json/named.search_player_all.bam?sport_code='mlb'&active_sw='N'&name_part='babe ruth'")
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
        }
        return JSON.parse(res.body)
    end
end
