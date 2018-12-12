//
//  LiveGameViewController.swift
//  LeagueStats
//
//  Created by Cray on 12/9/18.
//

import UIKit
import LeagueAPI
import DragonService


class LiveGameViewController: UIViewController {
    
    
    @IBOutlet weak var name: UITextField!
    var summid: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let league = LeagueAPI(APIToken: api.name)
    
 
    
    func getSummonerInfo(_ name: String) {
        
        league.riotAPI.getSummoner(byName: name, on: .NA) { (summoner, errorMsg) in
            if let summoner = summoner {
                
                print("summonerinfosuccess")
                //self.summid = "\(summoner.id)"
                
            }
            else {
                print("Request failed cause: \(errorMsg ?? "No error description")")
            }
        }
        
    }
    //I hate completion handlers
    
    func retrieveSummonerId(_ name: String, completionHandler: @escaping (String?) -> ()) {
        league.riotAPI.getSummoner(byName: name, on: .NA) { (summoner, errorMsg) in
            if let summoner = summoner {
                
                //print(summoner.id.value)
                //print("sumidendshere")
                let summid = summoner.id.value
                completionHandler(summid)
                
            }
            else {
                print("Request failed cause: \(errorMsg ?? "No error description")")
            }
            
        }
        
    }
    
    func getRankedPositions(_ id: String) {
        retrieveSummonerId(id) { summid in
        //guard let queue = Queue(.RankedSolo5V5) else { return }
            self.league.riotAPI.getRankedPositions(for: SummonerId(summid!), on: .NA) { (rankedPosition, errorMsg) in
            if let rankedPosition = rankedPosition {
                print(rankedPosition[0].tier)
                print(rankedPosition[0].leagueInfo.rank)
                print(rankedPosition[0].leagueInfo.leaguePoints)
                //print(rankedPosition[0].tier)
                print("rankedendshere")
            }
            else {
                print("Request failed cause: \(errorMsg ?? "No error description")")
            }
        }
        }
    }
    
    func getLiveGame(_ id: String) {
        retrieveSummonerId(id) { summid in
            self.league.riotAPI.getLiveGame(by: SummonerId(summid!), on: .NA) { (liveGame, errorMsg) in
            if let liveGame = liveGame {
                print(liveGame.participants[0].summonerName)
                print(liveGame.participants[0].summonerSpell1)
                /*for element in (liveGame.participants[0].runePage?.runeIds)!{
                    print(element)
                }
                 */
                //To get the primary mastery
                print(liveGame.participants[0].runePage?.runeIds[0])
                //To get primary tree
                print(liveGame.participants[0].runePage?.primaryPath)
                //To get secondary tree
                print(liveGame.participants[0].runePage?.secondaryPath)
                //print()
                print("livegameendshere")
            }
            else {
                print("Request failed cause: \(errorMsg ?? "No error description")")
            }
        }
        }
    }
    
    @IBAction func submit(_ sender: UIButton) {
        //let (firstElement, _, _, _, _) = summonerInfo
        
        
    
        getSummonerInfo(name.text!)
       
        getRankedPositions(name.text!)
        
        getLiveGame(name.text!)
        //let summoner: Summoner = Summoner()
        print("hi")
        //print(summonerInfo.getRankedPositions.tier)
        
    }
    
    
    
    
    
    /*
    lazy var summonerName: String = SummonerName.text!
    
    
    lazy var summonerObject = getSummonerInfo(summonerName)
    
    
    lazy var summoner = Summoner(from: summonerObject as! Decoder)
    
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
