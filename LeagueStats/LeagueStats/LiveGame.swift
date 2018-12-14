//
//  LiveGame.swift
//  LeagueStats
//
//  Created by Cray on 12/9/18.
//

import UIKit
import LeagueAPI

class LiveGame {
    
    let league = LeagueAPI(APIToken: api.name)
    
    func getLiveGame(_ id: String){
        league.riotAPI.getLiveGame(by: SummonerId(id), on: .EUW) { (liveGame, errorMsg) in
            if let liveGame = liveGame {
                print(liveGame)
            }
            else {
                print("Request failed cause: \(errorMsg ?? "No error description")")
            }
        }
    }
    
    
    
    
}
