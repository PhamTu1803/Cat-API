//
//  CatViewController.swift
//  Cat-tableview
//
//  Created by phamtu on 15/07/2021.
//

import UIKit
import QNetwork

class CatViewController: UIViewController {
    
    private var viewModel: CatViewModel!
    //MARK: - IBoutlet
    @IBOutlet weak var catTbview: UITableView!
    @IBOutlet weak var bottomindicator: UIActivityIndicatorView!
    //MARK: - Lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindViewModel()
        self.initTableView()
    }
    /// Init table view
    private func initTableView() {
        catTbview.register(UINib(nibName: "CatTableViewCell", bundle: nil), forCellReuseIdentifier: "CatTableViewCell")
        catTbview.delegate = self
        catTbview.dataSource = self
        catTbview.tableFooterView = UIView()

        // Hide indicator
        self.bottomindicator.isHidden = true
    }
    /// Bind view model
    private func bindViewModel() {
        viewModel = CatViewModel()
        viewModel.needReloadTableView = { [weak self] in
            self?.catTbview.reloadData()
        }
        
        viewModel.needShowError = { [weak self] error in
            self?.showError(error: error)
        }
        viewModel.needSetStateBottomIndicatorView = { [weak self] show in
            self?.bottomindicator.isHidden = !show
            if show {
                self?.bottomindicator.startAnimating()

            } else {
                self?.bottomindicator.stopAnimating()
            }

        }
        
        // Request API here
        viewModel.requestRepositories()
        self.bottomindicator.isHidden = true
    }
    /// - Parameter error: error from server
    private func showError(error: BaseError) {
        let alert = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
    //MARK: - Extention
extension CatViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatTableViewCell") as! CatTableViewCell
        cell.nameCat.text = "Hoang thuong : " + String("\( indexPath.row + 1)")
        cell.bindData(data: viewModel.cellForRowAt(indexPath: indexPath))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = DetailCatViewController.initFromNib()
        viewController.bindData(character: viewModel.cellForRowAt(indexPath: indexPath))
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
}
