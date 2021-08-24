//
//  main.swift
//  AlgorithmSwift
//
//  Created by Duy Nguyen on 28/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Foundation

protocol ListViewModelType {
    func transform()
}

extension ListViewModelType {
    func transform() {
        
    }
}

class ListViewModel: ListViewModelType {
    private let someThing: NSObject
    
    init(someThing: NSObject) {
        self.someThing = someThing
    }
    
    func transform() {
        
    }
}

class ListViewController: NSObject {
    let viewModel: ListViewModelType
    
    init(viewModel: ListViewModelType) {
        self.viewModel = viewModel
    }
    
    func abc() {
        viewModel.transform()
    }
}

let vm = ListViewModel(someThing: NSObject())
let vc = ListViewController(viewModel: vm)
