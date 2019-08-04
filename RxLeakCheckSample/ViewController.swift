//
//  ViewController.swift
//  RxLeakCheckSample
//
//  Created by 優樹永井 on 2019/07/26.
//  Copyright © 2019 com.nagai. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let vc = MemoryLeakViewController.make()
                self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
        
        bButton.rx.tap
            .subscribe(onNext: { [weak self] in
                let vc = NormalViewController.make()
                self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
}
