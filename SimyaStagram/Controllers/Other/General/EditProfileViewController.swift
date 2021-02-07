//
//  EditProfileViewController.swift
//  SimyaStagram
//
//  Created by Nizamet Özkan on 3.02.2021.
//

import UIKit

class EditProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
        
    }
    
    @objc private func didTapSave() {
        
    }
    
    @objc private func didTapCancel() {
        
    }
    
    @objc private func didTapChangeProfile() {
        let actionSheet = UIAlertController(title: "Chose Picture", message: "Are youse to change profile picture?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Picture", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Chose From Library", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        //For ipad
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        //For ipad
        
        present(actionSheet, animated: true, completion: nil)
    }
}
