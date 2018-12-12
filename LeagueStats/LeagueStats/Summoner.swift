//
//  Summoner.swift
//  LeagueStats
//
//  Created by Cray on 12/9/18.
//
import UIKit
import LeagueAPI

class Summonerr {
    
    let league = LeagueAPI(APIToken: api.name)
    
    
    func getSummonerInfo(_ name: String) {
        league.riotAPI.getSummoner(byName: name, on: .EUW) { (summoner, errorMsg) in
            if let summoner = summoner {
                print(summoner)
            }
            else {
                print("Request failed cause: \(errorMsg ?? "No error description")")
            }
        }
    }
    
}
