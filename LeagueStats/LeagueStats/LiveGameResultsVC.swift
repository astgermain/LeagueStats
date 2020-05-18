//
//  LiveGameResultsVC.swift
//  LeagueStats
//
//  Created by I Am The Machine on 12/12/18.
//

import UIKit
import LeagueAPI
import DragonService
import Alamofire

class LiveGameResultsVC: UIViewController {

    let league = LeagueAPI(APIToken: api.name)
    var summonerName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefault = UserDefaults.standard
        summonerName = userDefault.string(forKey: "inputName")!
        // Do any additional setup after loading the view, typically from a nib.
        print(summonerName)
        getLiveGame(summonerName)
        print("secondViewDidLoad")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var banned1: UIImageView!
    @IBOutlet weak var banned2: UIImageView!
    @IBOutlet weak var banned3: UIImageView!
    @IBOutlet weak var banned4: UIImageView!
    @IBOutlet weak var banned5: UIImageView!
    @IBOutlet weak var banned6: UIImageView!
    @IBOutlet weak var banned7: UIImageView!
    @IBOutlet weak var banned8: UIImageView!
    @IBOutlet weak var banned9: UIImageView!
    @IBOutlet weak var banned10: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    @IBOutlet weak var label9: UILabel!
    @IBOutlet weak var label10: UILabel!
    
    
    @IBOutlet weak var part1: UIImageView!
    @IBOutlet weak var part2: UIImageView!
    @IBOutlet weak var part3: UIImageView!
    @IBOutlet weak var part4: UIImageView!
    @IBOutlet weak var part5: UIImageView!
    @IBOutlet weak var part6: UIImageView!
    @IBOutlet weak var part7: UIImageView!
    @IBOutlet weak var part8: UIImageView!
    @IBOutlet weak var part9: UIImageView!
    @IBOutlet weak var part10: UIImageView!
    
    @IBOutlet weak var firstSpell1: UIImageView!
    @IBOutlet weak var firstSpell2: UIImageView!
    @IBOutlet weak var firstSpell3: UIImageView!
    @IBOutlet weak var firstSpell4: UIImageView!
    @IBOutlet weak var firstSpell5: UIImageView!
    @IBOutlet weak var firstSpell6: UIImageView!
    @IBOutlet weak var firstSpell7: UIImageView!
    @IBOutlet weak var firstSpell8: UIImageView!
    @IBOutlet weak var firstSpell9: UIImageView!
    @IBOutlet weak var firstSpell10: UIImageView!
    
    @IBOutlet weak var secSpell1: UIImageView!
    @IBOutlet weak var secSpell2: UIImageView!
    @IBOutlet weak var secSpell3: UIImageView!
    @IBOutlet weak var secSpell4: UIImageView!
    @IBOutlet weak var secSpell5: UIImageView!
    @IBOutlet weak var secSpell6: UIImageView!
    @IBOutlet weak var secSpell7: UIImageView!
    @IBOutlet weak var secSpell8: UIImageView!
    @IBOutlet weak var secSpell9: UIImageView!
    @IBOutlet weak var secSpell10: UIImageView!
    
    
    @IBOutlet weak var mainRune1: UIImageView!
    @IBOutlet weak var mainRune2: UIImageView!
    @IBOutlet weak var mainRune3: UIImageView!
    @IBOutlet weak var mainRune4: UIImageView!
    @IBOutlet weak var mainRune5: UIImageView!
    @IBOutlet weak var mainRune6: UIImageView!
    @IBOutlet weak var mainRune7: UIImageView!
    @IBOutlet weak var mainRune8: UIImageView!
    @IBOutlet weak var mainRune9: UIImageView!
    @IBOutlet weak var mainRune10: UIImageView!
    
    
    @IBOutlet weak var sec1: UIImageView!
    @IBOutlet weak var sec2: UIImageView!
    @IBOutlet weak var sec3: UIImageView!
    @IBOutlet weak var sec4: UIImageView!
    @IBOutlet weak var sec5: UIImageView!
    @IBOutlet weak var sec6: UIImageView!
    @IBOutlet weak var sec7: UIImageView!
    @IBOutlet weak var sec8: UIImageView!
    @IBOutlet weak var sec9: UIImageView!
    @IBOutlet weak var sec10: UIImageView!
    
    
    @IBOutlet weak var tierSD1: UIImageView!
    @IBOutlet weak var tierSD2: UIImageView!
    @IBOutlet weak var tierSD3: UIImageView!
    @IBOutlet weak var tierSD4: UIImageView!
    @IBOutlet weak var tierSD5: UIImageView!
    @IBOutlet weak var tierSD6: UIImageView!
    @IBOutlet weak var tierSD7: UIImageView!
    @IBOutlet weak var tierSD8: UIImageView!
    @IBOutlet weak var tierSD9: UIImageView!
    @IBOutlet weak var tierSD10: UIImageView!
    
    
    
    @IBOutlet weak var tierF1: UIImageView!
    @IBOutlet weak var tierF2: UIImageView!
    @IBOutlet weak var tierF3: UIImageView!
    @IBOutlet weak var tierF4: UIImageView!
    @IBOutlet weak var tierF5: UIImageView!
    @IBOutlet weak var tierF6: UIImageView!
    @IBOutlet weak var tierF7: UIImageView!
    @IBOutlet weak var tierF8: UIImageView!
    @IBOutlet weak var tierF9: UIImageView!
    @IBOutlet weak var tierF10: UIImageView!
    
    
    @IBOutlet weak var rankSD1: UILabel!
    @IBOutlet weak var rankSD2: UILabel!
    @IBOutlet weak var rankSD3: UILabel!
    @IBOutlet weak var rankSD4: UILabel!
    @IBOutlet weak var rankSD5: UILabel!
    @IBOutlet weak var rankSD6: UILabel!
    @IBOutlet weak var rankSD7: UILabel!
    @IBOutlet weak var rankSD8: UILabel!
    @IBOutlet weak var rankSD9: UILabel!
    @IBOutlet weak var rankSD10: UILabel!
    
    
    @IBOutlet weak var rankF1: UILabel!
    @IBOutlet weak var rankF2: UILabel!
    @IBOutlet weak var rankF3: UILabel!
    @IBOutlet weak var rankF4: UILabel!
    @IBOutlet weak var rankF5: UILabel!
    @IBOutlet weak var rankF6: UILabel!
    @IBOutlet weak var rankF7: UILabel!
    @IBOutlet weak var rankF8: UILabel!
    @IBOutlet weak var rankF9: UILabel!
    @IBOutlet weak var rankF10: UILabel!
    
    
    @IBOutlet weak var lpSD1: UILabel!
    @IBOutlet weak var lpSD2: UILabel!
    @IBOutlet weak var lpSD3: UILabel!
    @IBOutlet weak var lpSD4: UILabel!
    @IBOutlet weak var lpSD5: UILabel!
    @IBOutlet weak var lpSD6: UILabel!
    @IBOutlet weak var lpSD7: UILabel!
    @IBOutlet weak var lpSD8: UILabel!
    @IBOutlet weak var lpSD9: UILabel!
    @IBOutlet weak var lpSD10: UILabel!
    
    @IBOutlet weak var lpF1: UILabel!
    @IBOutlet weak var lpF2: UILabel!
    @IBOutlet weak var lpF3: UILabel!
    @IBOutlet weak var lpF4: UILabel!
    @IBOutlet weak var lpF5: UILabel!
    @IBOutlet weak var lpF6: UILabel!
    @IBOutlet weak var lpF7: UILabel!
    @IBOutlet weak var lpF8: UILabel!
    @IBOutlet weak var lpF9: UILabel!
    @IBOutlet weak var lpF10: UILabel!
    
    
    
    
    
    
    
    var summid2: String = ""
    let baseUrl = "https://ddragon.leagueoflegends.com/cdn"
    let versionNum = "8.24.1"
    let localeVer = "en_US"
    lazy var bannedArr = [banned1, banned2, banned3, banned4, banned5, banned6, banned7, banned8, banned9, banned10]
    lazy var partArr = [part1, part2, part3, part4, part5, part6, part7, part8, part9, part10]
    lazy var summNameArr = [label1, label2, label3, label4, label5, label6, label7, label8, label9, label10]
    lazy var summSpell1Arr = [firstSpell1, firstSpell2, firstSpell3, firstSpell4, firstSpell5, firstSpell6, firstSpell7, firstSpell8, firstSpell9, firstSpell10]
    lazy var summSpell2Arr = [secSpell1, secSpell2, secSpell3, secSpell4, secSpell5, secSpell6, secSpell7, secSpell8, secSpell9, secSpell10]
    lazy var mainRuneArr = [mainRune1, mainRune2, mainRune3, mainRune4, mainRune5, mainRune6, mainRune7, mainRune8, mainRune9, mainRune10]
    lazy var secArr = [sec1, sec2, sec3, sec4, sec5, sec6, sec7, sec8, sec9, sec10]
    lazy var tierSDArr = [tierSD1, tierSD2, tierSD3, tierSD4, tierSD5, tierSD6, tierSD7, tierSD8, tierSD9, tierSD10]
    lazy var tierFArr = [tierF1, tierF2, tierF3, tierF4, tierF5, tierF6, tierF7, tierF8, tierF9, tierF10]
    lazy var rankSDArr = [rankSD1, rankSD2, rankSD3, rankSD4, rankSD5, rankSD6, rankSD7, rankSD8, rankSD9, rankSD10]
    lazy var rankFArr = [rankF1, rankF2, rankF3, rankF4, rankF5, rankF6, rankF7, rankF8, rankF9, rankF10]
    lazy var lpSDArr = [lpSD1, lpSD2, lpSD3, lpSD4, lpSD5, lpSD6, lpSD7, lpSD8, lpSD9, lpSD10]
    lazy var lpFArr = [lpF1, lpF2, lpF3, lpF4, lpF5, lpF6, lpF7, lpF8, lpF9, lpF10]
    
    private func buildUrl(base: String, paths: [String]) -> URL? {
        var urlString = base
        for path in paths {
            urlString.append("/\(path)")
        }
        
        return URL(string: urlString)
    }
    
    func bannedChampionImage(championName: String, imageViewNum: Int){
        
        DragonService.Champion().list(version: versionNum, locale: localeVer, completionHandler: { (champions) in
            print(champions.data[championName]!.name)
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
                //let arrVal = imageViewNum
                self?.bannedArr[imageViewNum]!.image = image
                if championName == ""{
                    DispatchQueue.main.async {
                    self?.bannedArr[imageViewNum]!.image = UIImage(named: "noChamp")
                    }
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
    
    func summonerSpell1Image(summonerSpellUrl: String, imageViewNum: Int){
       
        Alamofire.request(summonerSpellUrl).responseData(completionHandler: { [weak self] (response) in
            guard let imageData = response.result.value else {
                print("Image error")
                return
            }
            let image = UIImage(data: imageData)
            //let arrVal = imageViewNum
            DispatchQueue.main.async {
            self?.summSpell1Arr[imageViewNum]!.image = image
            }
        })
    }
    
    func summonerSpell2Image(summonerSpellUrl: String, imageViewNum: Int){
        
        Alamofire.request(summonerSpellUrl).responseData(completionHandler: { [weak self] (response) in
            guard let imageData = response.result.value else {
                print("Image error")
                return
            }
            let image = UIImage(data: imageData)
            //let arrVal = imageViewNum
            DispatchQueue.main.async {
            self?.summSpell2Arr[imageViewNum]!.image = image
            }
        })
    }
    
    func mainRuneImage(mainRuneUrl: String, imageViewNum: Int){
        
        Alamofire.request(mainRuneUrl).responseData(completionHandler: { [weak self] (response) in
            guard let imageData = response.result.value else {
                print("Image error")
                return
            }
            let image = UIImage(data: imageData)
            //let arrVal = imageViewNum
            DispatchQueue.main.async {
            self?.mainRuneArr[imageViewNum]!.image = image
            }
        })
    }
    func secRuneImage(secRuneUrl: String, imageViewNum: Int){
        
        Alamofire.request(secRuneUrl).responseData(completionHandler: { [weak self] (response) in
            guard let imageData = response.result.value else {
                print("Image error")
                return
            }
            let image = UIImage(data: imageData)
            //let arrVal = imageViewNum
            DispatchQueue.main.async {
            self?.secArr[imageViewNum]!.image = image
            }
            
        })
    }
    
    func partChampionImage(championName: String, imageViewNum: Int){
        
        DragonService.Champion().list(version: versionNum, locale: localeVer, completionHandler: { (champions) in
            //print(champions.data["Ahri"]!.name)
            //print(champions.data["Ahri"]!.lore)
            print(championName)
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
                //let arrVal = imageViewNum
                DispatchQueue.main.async {
                self?.partArr[imageViewNum]!.image = image
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
    
    
    
    func retrieveSummonerId(_ name: String, completionHandler: @escaping (String?) -> ()) {
        league.riotAPI.getSummoner(byName: name, on: .NA) { (summoner, errorMsg) in
            if let summoner = summoner {
                
                //print(summoner.id.value)
                //print("sumidendshere")
                let summid2 = summoner.id.value
                completionHandler(summid2)
                
            }
            else {
                //print("here")
                print("Request failed cause: \(errorMsg ?? "No error description")")
            }
            
        }
        
    }
    /*
    func getRankedPositions(_ id: String) { retrieveSummonerId(id) { summid in
            guard let queue = Queue(.RankedSolo5V5) else { return }
            self.league.riotAPI.getRankedPositions(for: SummonerId(summid!), on: .NA) { (rankedPosition, errorMsg) in
                if let rankedPosition = rankedPosition {
                    //print(rankedPosition[0].tier)
                    //print(rankedPosition[0].leagueInfo.rank)
                    //print(rankedPosition[0].leagueInfo.leaguePoints)
                    //print(rankedPosition[0].tier)
                    //print("rankedendshere")
                }
                else {
                    print("Request failed cause: \(errorMsg ?? "No error description")")
                }
            }
        }
    }
    
    */
    
    
    func getLiveGame(_ id: String) {
        
        retrieveSummonerId(id) { summid2 in
            self.league.riotAPI.getLiveGame(by: SummonerId(summid2!), on: .NA) { (liveGame, errorMsg) in
                if let liveGame = liveGame {
                    let parts = liveGame.participants
                    let bans = liveGame.bannedChampions
                    
                    for (index, part) in parts.enumerated() {
                        var sfinal = ""
                        DispatchQueue.main.async { // Correct
                            self.summNameArr[index]!.text = "\(part.summonerName)"
                        }
                        
                        guard let queue = Queue(.RankedSolo5V5) else { return }
                        self.league.riotAPI.getRankedEntry(for: part.summonerId!, in: queue, on: .NA) { (rankedPosition, errorMsg) in
                            if let rankedPosition = rankedPosition {
                                //rankedPosition.tier
                                DispatchQueue.main.async {
                                //self.tierSDArr[index]!.image = UIImage(named: rankedPosition.tier)
                                self.rankSDArr[index]!.text = "\(rankedPosition.leagueInfo.rank)"
                                self.lpSDArr[index]!.text = "\(rankedPosition.leagueInfo.leaguePoints)"
                                //print(rankedPosition[0].leagueInfo.rank)
                                //print(rankedPosition[0].leagueInfo.leaguePoints)
                                //print(rankedPosition[0].tier)
                                //print("rankedendshere")
                                }
                            }
                            else {
                                print("Request failed cause: \(errorMsg ?? "No error description")")
                            }
                        }
                        
                        guard let queue2 = Queue(.RankedFlex5V5) else { return }
                        self.league.riotAPI.getRankedEntry(for: part.summonerId!, in: queue2, on: .NA) { (rankedPosition, errorMsg) in
                            if let rankedPosition = rankedPosition {
                                //rankedPosition.tier
                                DispatchQueue.main.async {
                                //self.tierFArr[index]!.image = UIImage(named: rankedPosition.tier)
                                self.rankFArr[index]!.text = "\(rankedPosition.leagueInfo.rank)"
                                self.lpFArr[index]!.text = "\(rankedPosition.leagueInfo.leaguePoints)"
                                //print(rankedPosition[0].leagueInfo.rank)
                                //print(rankedPosition[0].leagueInfo.leaguePoints)
                                //print(rankedPosition[0].tier)
                                //print("rankedendshere")
                                }
                            }
                            else {
                                print("Request failed cause: \(errorMsg ?? "No error description")")
                            }
                        }
                        
                        
                        self.league.getSummonerSpell(by: part.summonerSpell1) { (summonerSpell, errorMsg) in
                            if let summonerSpell = summonerSpell {
                                //print(summonerSpell.image.url)
                                self.summonerSpell1Image(summonerSpellUrl: summonerSpell.image.url, imageViewNum: index)
                                
                            }
                            else {
                                print("Request failed cause: \(errorMsg ?? "No error description")")
                            }
                        }
                        self.league.getSummonerSpell(by: part.summonerSpell2) { (summonerSpell, errorMsg) in
                            if let summonerSpell = summonerSpell {
                                //print(summonerSpell.image.url)
                                self.summonerSpell2Image(summonerSpellUrl: summonerSpell.image.url, imageViewNum: index)
                                
                            }
                            else {
                                print("Request failed cause: \(errorMsg ?? "No error description")")
                            }
                        }
                        
                        self.league.getRune(by: (part.runePage?.runeIds[0])!) { (runePath, errorMsg) in
                            if let runePath = runePath {
                                self.mainRuneImage(mainRuneUrl: runePath.image.url, imageViewNum: index)
                            }
                            else {
                                print("Request failed cause: \(errorMsg ?? "No error description")")
                            }
                        }
                        
                        self.league.getRunePath(by: (part.runePage?.secondaryPath)!) { (runePath, errorMsg) in
                            if let runePath = runePath {
                                self.secRuneImage(secRuneUrl: runePath.image.url, imageViewNum: index)
                            }
                            else {
                                print("Request failed cause: \(errorMsg ?? "No error description")")
                            }
                        }
                        
                        
                        self.league.getChampionDetails(by: part.championId) { (championDeets, errorMsg) in
                            if let championDeets = championDeets {
                                let s = championDeets.name
                                if ((s.range(of: "'") == nil) && (s.range(of: " ") == nil)){
                                    
                                    let snil = s.lowercased()
                                    let spre = snil.capitalized
                                    let stwo = spre.replacingOccurrences(of: "Wukong", with: "MonkeyKing")
                                    sfinal = stwo
                                }
                                else if (s.range(of: " ") != nil){
                                    let sone = s.replacingOccurrences(of: " ", with: "")
                                    
                                    sfinal = sone
                                }
                                    
                                    
                                else if (s.range(of: "'") != nil) {
                                    let sthree = s.replacingOccurrences(of: "'", with: "")
                                    let sfour = sthree.lowercased()
                                    let sfive = sfour.capitalized
                                    sfinal = sfive.replacingOccurrences(of: "Reksai", with: "RekSai")
                                    
                                }
                                else {
                                    print("error")
                                }
                                    
                                self.partChampionImage(championName: sfinal, imageViewNum: index)
                                print(championDeets.name)
                                    
                                    
                            }
                            else {
                                print("Request failed cause: \(errorMsg ?? "No error description")")
                            }
                        }
                            
                    }
                    for (index, ban) in bans.enumerated() {
                        var sfinal = ""
                        self.league.getChampionDetails(by: ban.championId) { (championDeets, errorMsg) in
                            if let championDeets = championDeets {
                                let s = championDeets.name
                                if ((s.range(of: "'") == nil) && (s.range(of: " ") == nil)){
                                    let snil = s.lowercased()
                                    let spre = snil.capitalized
                                    let stwo = spre.replacingOccurrences(of: "Wukong", with: "MonkeyKing")
                                    sfinal = stwo
                                    
                                }
                                else if (s.range(of: " ") != nil){
                                    let sone = s.replacingOccurrences(of: " ", with: "")
                                    let stwo = sone.replacingOccurrences(of: "Wukong", with: "MonkeyKing")
                                    sfinal = stwo
                                }
                                
                                
                                else if (s.range(of: "'") != nil) {
                                    let sthree = s.replacingOccurrences(of: "'", with: "")
                                    let sfour = sthree.lowercased()
                                    sfinal = sfour.capitalized
                                }
                                else {
                                    print("error")
                                }
                                
                                
                                self.bannedChampionImage(championName: sfinal, imageViewNum: index)
                                //print(championDeets.name)
                                
                                
                            }
                            else {
                                print("Request failed cause: \(errorMsg ?? "No error description")")
                            }
                        }
                        
                    }
                    
                    
                    
                    //print("ItWorkd")
                    //print(liveGame.participants[0].summonerName)
                    //print(liveGame.participants[0].summonerSpell1)
                    /*for element in (liveGame.participants[0].runePage?.runeIds)!{
                     print(element)
                     }
                     */
                    //To get the primary mastery
                    //resultVc.banned1 = championImage(championName: <#T##String#>, imageViewNum: <#T##Int#>)
                    //print(liveGame.participants[0].runePage?.runeIds[0])
                    //To get primary tree
                    //print(liveGame.participants[0].runePage?.primaryPath)
                    //To get secondary tree
                    //print(liveGame.participants[0].runePage?.secondaryPath)
                    
                    //print("livegameendshere")
                }
                else {
                    print("Request failed cause: \(errorMsg ?? "No error description")")
                }
            }
        }
    }
    
}
