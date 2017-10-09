//
//  ViewController.swift
//  AHFMKeywordVC
//
//  Created by ivsall2012 on 09/05/2017.
//  Copyright (c) 2017 ivsall2012. All rights reserved.
//

import UIKit
import AHServiceRouter
import AHFMKeywordVCServices
import AHFMKeywordVCManager

class ViewController: UIViewController {
    let showId = 722
    override func viewDidLoad() {
        super.viewDidLoad()
        AHFMKeywordVCManager.activate()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        testEpisodes()
//        testShows()
        testNavigation()
//        testCreateVCThenSearch()
    }
    func testCreateVCThenSearch() {
        
        let isForShows = false
        let info = [AHFMKeywordVCServices.keyIsSearchingForShows: isForShows] as [String : Any]
        guard let data = AHServiceRouter.doTask(AHFMKeywordVCServices.service, taskName: AHFMKeywordVCServices.taskCreateVC, userInfo: info, completion: nil) else {
            return
        }
        
        guard let vc = data[AHFMKeywordVCServices.keyGetVC] as? UIViewController else {
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let serachKeyword = "News"
            let info: [String : Any] = [AHFMKeywordVCServices.keyGetVC: vc, AHFMKeywordVCServices.keySearchKeyword: serachKeyword]
            AHServiceRouter.doTask(AHFMKeywordVCServices.service, taskName: AHFMKeywordVCServices.taskGoSearch, userInfo: info, completion: nil)
        }
        
    }
    
    func testNavigation() {
        let serachKeyword = "News"
        let isForShows = true
        let info = [AHFMKeywordVCServices.keySearchKeyword: serachKeyword, AHFMKeywordVCServices.keyIsSearchingForShows: isForShows] as [String : Any]
        
        AHServiceRouter.navigateVC(AHFMKeywordVCServices.service, taskName: AHFMKeywordVCServices.taskNavigation, userInfo: info, type: .push(navVC: self.navigationController!), completion: nil)
    }
    
    
    func testEpisodes() {
        let serachKeyword = "News"
        let isForShows = false
        let info = [AHFMKeywordVCServices.keySearchKeyword: serachKeyword, AHFMKeywordVCServices.keyIsSearchingForShows: isForShows] as [String : Any]
        guard let data = AHServiceRouter.doTask(AHFMKeywordVCServices.service, taskName: AHFMKeywordVCServices.taskCreateVC, userInfo: info, completion: nil) else {
            return
        }
        
        guard let vc = data[AHFMKeywordVCServices.keyGetVC] as? UIViewController else {
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func testShows() {
        let serachKeyword = "News"
        let isForShows = true
        let info = [AHFMKeywordVCServices.keySearchKeyword: serachKeyword, AHFMKeywordVCServices.keyIsSearchingForShows: isForShows] as [String : Any]
        guard let data = AHServiceRouter.doTask(AHFMKeywordVCServices.service, taskName: AHFMKeywordVCServices.taskCreateVC, userInfo: info, completion: nil) else {
            return
        }
        
        guard let vc = data[AHFMKeywordVCServices.keyGetVC] as? UIViewController else {
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

