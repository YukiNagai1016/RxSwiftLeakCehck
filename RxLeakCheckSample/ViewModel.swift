//
//  ViewModel.swift
//  LeakCheckDemo
//
//  Created by 優樹永井 on 2019/07/26.
//  Copyright © 2019 com.nagai. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class ViewModel {

    lazy var count = _count.asObservable()
    private let _count = BehaviorRelay<Int>(value: 0)

    private let disposeBag = DisposeBag()

    init(tap: ControlEvent<Void>) {
        tap.subscribe(onNext: { _ in
            self._count.accept(self._count.value + 1)
        })
        .disposed(by: disposeBag)
    }
}
