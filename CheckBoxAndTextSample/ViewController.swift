//
//  ViewController.swift
//  CheckBoxAndTextSample
//
//  Created by cano on 2021/02/04.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewController: UIViewController {

    @IBOutlet weak var checkBox: CheckBoxButton!
    @IBOutlet weak var textField: UITextField!
    
    // チェックボックスが有効か？
    let checkBoxValid = BehaviorRelay(value: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.bind()
    }

    func bind() {
        // チェックボックスの有効性
        self.checkBoxValid.asObservable().bind(to: self.checkBox.rx.isSelected).disposed(by: rx.disposeBag)
        self.checkBox.rx.tap.subscribe(onNext: { [unowned self] _ in
            self.checkBoxValid.accept(!checkBoxValid.value)
        }).disposed(by: rx.disposeBag)
        
        // チェックがある時のみテキスト編集を有効にする
        self.checkBoxValid.bind(to: self.textField.rx.isEnabled).disposed(by: rx.disposeBag)
    }

}

