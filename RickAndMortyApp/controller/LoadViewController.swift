//
//  LoadViewController.swift
//  RickAndMortyApp
//
//  Created by MacBookPro on 19.11.2023.
//

import UIKit

final class LoadViewController: UIViewController {
    
    private var timer = Timer()
    private let startView = LoadView()
    
    var currentTime = 0
    override func loadView() {
        view = startView
        navigationController?.navigationBar.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createTimer()
    }
    
    private func createTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1/30,
                                     target: self,
                                     selector: #selector(goToMainTapBarVC),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    @objc private func goToMainTapBarVC() {
        
        currentTime += 1
        startView.imageViewPortal.rotate(degrees: CGFloat(currentTime))
        
        if currentTime == 90 {
            let tapBarVc = MainTabBarController()
            navigationController?.pushViewController(tapBarVc, animated: true)
            timer.invalidate()
        }
        
    }


    
}
