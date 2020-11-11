//
//  ViewController.swift
//  iOS-Eliq-Challenge
//
//  Created by Amir on 11/8/20.
//

import UIKit
import PKHUD

final class MainViewController: UIViewController, StoryboardInstantiable
{
    fileprivate var viewModel: MainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        HUD.show(.systemActivity)
        bind(to: viewModel)
        initUI()
    }
    
    func initUI() {
        self.title = "Exchange App"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .redo, target: self, action: #selector(updateData))
    }
    
    @objc private func updateData () {
        HUD.show(.systemActivity)
        viewModel.updateData()
    }
    
    func bind(to viewModel: MainViewModel) {
        viewModel.rates.observe(on: self) { _ in
            DispatchQueue.main.async {
                HUD.hide()
            }
        }
        viewModel.errorMessage.observe(on: self) { [weak self] (message) in
            self?.showError(message)
        }
    }
    
    func showError(_ message: String) {
        HUD.show(.error)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            HUD.hide()
        }
    }
    
    @IBAction func pressedCurrencyButton(_ sender: UIButton) {
        let currency = Currencies(rawValue: sender.title(for: .normal)!)!
    }
    
    @IBAction func pressedExchangeButton(_ sender: UIButton) {
    }
    
    
}

//MARK: - Create
extension MainViewController {
    static func create(with viewModel: MainViewModel) -> MainViewController {
        let viewController = MainViewController.instantiateViewController()
        viewController.viewModel = viewModel
        return viewController
    }
}
