//
//  LiveGameViewController.swift
//  LeagueStats
//
//  Created by Cray on 12/9/18.
//

import UIKit
import LeagueAPI
import DragonService
import Alamofire

class LiveGameVC: UIViewController {
    
        
    
    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var name: UITextField!
    
    
    @IBOutlet weak var rank1: UILabel!
    @IBOutlet weak var rank2: UILabel!
    @IBOutlet weak var icon1: UIImageView!
    @IBOutlet weak var icon2: UIImageView!
    @IBOutlet weak var icon3: UIImageView!
    @IBOutlet weak var icon4: UIImageView!
    

    @IBOutlet weak var fname2: UILabel!
    @IBOutlet weak var fname3: UILabel!
    @IBOutlet weak var fname4: UILabel!
    @IBOutlet weak var fname: UILabel!
    
    @IBOutlet weak var tier1: UIImageView!
    @IBOutlet weak var tier2: UIImageView!
    @IBOutlet weak var tier3: UIImageView!
    @IBOutlet weak var tier4: UIImageView!
    
    
    
    @IBOutlet weak var rank3: UILabel!
    @IBOutlet weak var rank4: UILabel!
    
    
    @IBOutlet weak var lp1: UILabel!
    @IBOutlet weak var lp2: UILabel!
    @IBOutlet weak var lp3: UILabel!
    @IBOutlet weak var lp4: UILabel!
    
    
    
    var summid: String = ""
    let baseUrl = "https://ddragon.leagueoflegends.com/cdn"
    let versionNum = "8.24.1"
    let localeVer = "en_US"
    lazy var imageViewArr = [imageView1, imageView2, imageView3]
    lazy var iconArr = [icon1, icon2, icon3, icon4]
    lazy var fnameArr = [fname, fname2, fname3, fname4]
    lazy var tierArr = [tier1, tier2, tier3, tier4]
    lazy var rankArr = [rank1, rank2, rank3, rank4]
    lazy var lpArr = [lp1, lp2, lp3, lp4]
    let resultVc: LiveGameResultsVC = LiveGameResultsVC()
    
    private func buildUrl(base: String, paths: [String]) -> URL? {
        var urlString = base
        for path in paths {
            urlString.append("/\(path)")
        }
        
        return URL(string: urlString)
    }
    
    func championImage(championName: String, imageViewNum: Int){
        
        DragonService.Champion().list(version: versionNum, locale: localeVer, completionHandler: { (champions) in
            //print(champions.data["Ahri"]!.name)
            //print(champions.data["Ahri"]!.lore)
            print(champions.data[championName]!.image)
            let campPaths = [self.versionNum, "img", "champion", champions.data[championName]!.image.full]
            let finalUrl = self.buildUrl(base: self.baseUrl, paths: campPaths)
            //for champion in champions{
            Alamofire.request(finalUrl!).responseData(completionHandler: { [weak self] (response) in
                guard let imageData = response.result.value else {
                    print("Image error")
                    return
                }
                let image = UIImage(data: imageData)
                let arrVal = imageViewNum - 1
                DispatchQueue.main.async {
                self?.imageViewArr[arrVal]!.image = image
                }
                
            })
            //DragonService.Perks().list(version: versionNum, locale: "en_US", completionHandler: { (perks) in
            //var url = ""
            //print(perk.name)
            //print(perk.key)
            //print(perk.image)
            //print(perk.id)
            //}
        }, errorHandler: { (error) in
            if self.versionNum.isVersion(lessThan: "7.22.1") {
                print("XCTAssertNotNil(error)")
            } else {
                print(self.versionNum)
                print("XCTAssertNil(error)")
            }
            print("expectation.fulfill()")
        })
        
    }
    
    
    override func viewDidLoad() {
        //getTopMaster()
        super.viewDidLoad()
        getTopMaster()
        // Do any additional setup after loading the view, typically from a nib.
        //championImage(championName: "Ahri", imageViewNum: 1)
        //championImage(championName: "Pyke", imageViewNum: 2)
        //championImage(championName: "Brand", imageViewNum: 3)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let league = LeagueAPI(APIToken: api.name)
    
 
    
    
    func getSummonerInfo(_ name: String) {
        
        league.riotAPI.getSummoner(byName: name, on: .NA) { (summoner, errorMsg) in
            if let summoner = summoner {
                
                //print("summonerinfosuccess")
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
    
    
    
    
   
    
    
    
    /*
    
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
 */
    func getTopMaster() {
        //print("runs")
        
        
        league.riotAPI.getFeaturedGames(on: .NA) { (master, errorMsg) in
            
        if let master = master {
            print("Hello")
            let rando =  Int.random(in: 0..<4)
            let feature1 = master.games[rando].participants
            for (index, part) in feature1.enumerated() {
                if index > 3 {
                    break
                }
                //print("\(part.summonerName)")
            
                
            //print("what")
                self.league.riotAPI.getSummoner(byName: part.summonerName, on: .NA) { (summoner, errorMsg) in
                    if let summoner = summoner {
                        DispatchQueue.main.async {
                            self.fnameArr[index]!.text = "\(part.summonerName)"
                        }
                        //print("\(summoner.name)")
                        //self.fname.text = "\(summoner.name)"
                        guard let queue4 = Queue(.RankedSolo5V5) else { return }
                        print(summoner.id)
                        self.league.riotAPI.getRankedEntry(for: summoner.id, in: queue4, on: .NA) { (rankedPosition, errorMsg) in
                            //print(rankedPosition?.leagueId)
                            //print("works")
                            if let rankedPosition = rankedPosition {
                                DispatchQueue.main.async {
                                    //self.tierArr[index]!.image = UIImage(named: rankedPosition.tier)
                                    self.rankArr[index]!.text = "\(rankedPosition.leagueInfo.rank)"
                                    self.lpArr[index]!.text = "\(rankedPosition.leagueInfo.leaguePoints)"
                                }
                            }
                            else {
                                print("Request failed gsdaoifasjcause: \(errorMsg ?? "No error description")")
                            }
                        }
                        self.league.getProfileIcon(by: summoner.iconId) { (proIcon, errorMsg) in
                            
                            let iconurl = proIcon?.profileIcon.url
                            Alamofire.request(iconurl!).responseData(completionHandler: { [weak self] (response) in
                                guard let imageData = response.result.value else {
                                    print("Image error")
                                    return
                                }
                                //print(iconurl)
                                //print("Hi")
                                let image = UIImage(data: imageData)
                                //let arrVal = imageViewNum
                                DispatchQueue.main.async {
                                self?.iconArr[index]!.image = image
                                }
                            
                        })
                    }
                    
                    //print("summonerinfosuccess")
                    //self.summid = "\(summoner.id)"
                    
                }
                
                else {
                    print("Request failed cause: \(errorMsg ?? "No error description")")
                }
            }
            }
            //print("Success!")
        }
        }
        
    }

    
    
    
    
    @IBAction func findGame(_ sender: Any) {
        //getSummonerInfo(name.text!)
        
        //getRankedPositions(name.text!)
        
        //getLiveGame(name.text!)
        //let summoner: Summoner = Summoner()
        
        let userDefaultStore = UserDefaults.standard
        userDefaultStore.set(name.text, forKey: "inputName")
        performSegue(withIdentifier: "toResults", sender: self)
        
        //print(summonerInfo.getRankedPositions.tier)
    }
    /*
    @IBAction func submit(_ sender: UITextField) {
        //let (firstElement, _, _, _, _) = summonerInfo
        
        
    }
    */
    
    
    
    
    /*
    lazy var summonerName: String = SummonerName.text!
    
    
    lazy var summonerObject = getSummonerInfo(summonerName)
    
    
    lazy var summoner = Summoner(from: summonerObject as! Decoder)
    
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
