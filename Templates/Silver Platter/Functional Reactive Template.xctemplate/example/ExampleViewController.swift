//
//  StoreViewController.swift
//  Chesterfield
//
//  Created by Simen Fonnes on 09.08.2018.
//  Copyright © 2018 Beining & Bogen. All rights reserved.
//

import UIKit
import Cartography
import MBProgressHUD

public class StoreViewController : UIViewController {
    
    public let storeViewModel = StoreViewModel()
    let buyButton = UIButton(frame: .zero)
    var backButton : UIBarButtonItem!
    var restoreButton : UIBarButtonItem!
    
    override public init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        backButton = UIBarButtonItem(title: "Nei takk", style: .plain, target: self, action: #selector(StoreViewController.didTapBackButton))
        restoreButton = UIBarButtonItem(title: "Restore", style: .plain, target: self, action: #selector(StoreViewController.didTapRestoreSubscriptionButton))
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        bindStyles()
        bindViewModel()
        storeViewModel.inputs.viewDidLoad()
    }
    
    func bindStyles() {
        view.backgroundColor = .white
        buyButton.backgroundColor = UIColor.blue
    }
    
    func bindViewModel() {
        storeViewModel.outputs.goBack.observeValues { [weak self] _ in
            guard let s = self else {return}
            s.navigationController?.popViewController(animated: true)
        }
        
        storeViewModel.outputs.restore.observeValues{ [weak self] _ in
            //guard let s = self else {return}
            //Does nothing for now.
        }
        
        storeViewModel.outputs.shouldShowSpinner.observeValues { [weak self] visible in
            guard let s = self else {return}
            if visible { MBProgressHUD.showAdded(to: s.view, animated: true) }
            else { MBProgressHUD.hide(for: s.view, animated: true) }
        }
        
        storeViewModel.outputs.showConfirmation.observeValues { [weak self] _ in
            guard let s = self else {return}
            
            let alert = UIAlertController(title: "Kjøp", message: "Er du sikker på at du vil kjøpe?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Jeppsi peppsi", style: .default, handler: { _ in
                s.storeViewModel.inputs.purchaseSubscriptionTapped()
            }))
            alert.addAction(UIAlertAction(title: "Nop", style: .cancel, handler: nil))
            s.present(alert, animated: true)
        }
        
        storeViewModel.outputs.showError.observeValues{ [weak self] error in
            guard let s = self else {return}
            
            let alert = UIAlertController(title: "Feil", message: error.debugDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            s.present(alert, animated: true)
        }
        
        storeViewModel.outputs.showSuccess.observeValues{ [weak self] in
            guard let s = self else {return}
            
            let alert = UIAlertController(title: "Kjøpt!", message: "Du har kjøpt abonoment!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            s.present(alert, animated: true)
        }
    }
    
    func setupViews() {
        navigationItem.leftBarButtonItem = backButton
        navigationItem.rightBarButtonItem = restoreButton
        view.addSubview(buyButton)
        
        buyButton.setTitle("Kjøp abonoment", for: .normal)
        buyButton.addTarget(self, action: #selector(StoreViewController.didTapBuyButton), for: .touchUpInside)
    }
    
    func setupConstraints() {
        constrain(view, buyButton) { (viewProxy, buyButtonProxy) in
            buyButtonProxy.bottom == viewProxy.bottom
            buyButtonProxy.left == viewProxy.left
            buyButtonProxy.right == viewProxy.right
            buyButtonProxy.height == 44
        }
    }
    
    @objc func didTapBackButton() {
        storeViewModel.inputs.closeTapped()
    }
    
    @objc func didTapRestoreSubscriptionButton() {
        storeViewModel.inputs.restoreTapped()
    }
    
    @objc func didTapBuyButton() {
        storeViewModel.inputs.buyTapped()
    }
}
