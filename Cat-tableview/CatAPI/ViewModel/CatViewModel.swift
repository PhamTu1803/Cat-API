//
//  CatViewModel.swift
//  Cat-tableview
//
//  Created by phamtu on 15/07/2021.
//

import Foundation
import QNetwork

class CatViewModel {
    // Service call API
    let service: CatService!
    // Callback to view
    var needReloadTableView: (() -> Void)?
    var needShowError: ((BaseError) -> Void)?
    var needSetStateBottomIndicatorView: ((_ show: Bool) -> Void)?

    private var items: Int = 0
    private var incompleteResults = false
    
    // Datasource
    private var catItem: [CatResponse] = []

    init() {
        // Turn on is test is true if you need test for API
        self.service = CatService(isTest: false)
    }
    /// Request repositories
    func requestRepositories( loadMore: Bool = false ) {
        // Check when load more
        if self.incompleteResults {
            return
        }
        if !loadMore {
//            self.items = 0
            self.catItem.removeAll()
        }

        // Default param
        self.service.searchRepositories(  items : self.items) { [weak self] result in
            guard let strongSelf = self else { return }
            // Check when load more
            if loadMore {
                strongSelf.needSetStateBottomIndicatorView?(false)
            }
            switch result {
            case .success( let catResponse):
                strongSelf.catItem.append(catResponse)
                strongSelf.needReloadTableView?()
            case .failure(let error):
                strongSelf.needShowError?(error)
            }
                
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        return catItem.count
    }

    func cellForRowAt(indexPath: IndexPath) -> CatResponse {
        // Check if the last row number is the same as the last current data element
            if indexPath.row == self.catItem.count - 1 {
//                self.items += 1
                self.requestRepositories( loadMore: true)
                self.needSetStateBottomIndicatorView?(true)
            }

        return catItem[indexPath.row]
    }
}
