//
//  ProfileInfoHeaderCollectionReusableView.swift
//  SimyaStagram
//
//  Created by Nizamet Özkan on 9.02.2021.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject {
    func profileHeaderDidTapPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFallowesButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFallowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhoto: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let postButton: UIButton = {
       let button = UIButton()
        button.setTitle("Posts" ,for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    private let fallowingButton: UIButton = {
       let button = UIButton()
        button.setTitle("Fallowing" ,for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    private let followersButton: UIButton = {
       let button = UIButton()
        button.setTitle("Fallowes" ,for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    private let editProfileButton: UIButton = {
       let button = UIButton()
        button.setTitle("Edit Profile" ,for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
        return button
    }()
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        label.text = "UwU Name"
        return label
    }()
    private let bioLabel: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "UwU Label"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()
        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    private func addButtonActions() {
        editProfileButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        followersButton.addTarget(self, action: #selector(didTapFollowerButton), for: .touchUpInside)
        fallowingButton.addTarget(self, action: #selector(didTapFollowingButton), for: .touchUpInside)
        editProfileButton.addTarget(self, action: #selector(didTapEditProfileButton), for: .touchUpInside)
    }
    
    private func addSubviews() {
        addSubview(profilePhoto)
        addSubview(postButton)
        addSubview(fallowingButton)
        addSubview(followersButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        let ppSize = width/4
        
        profilePhoto.frame = CGRect(x: 5, y: 5, width: ppSize, height: ppSize).integral
        
        profilePhoto.layer.cornerRadius = ppSize/2.0
        
        let buttonHeight = ppSize/2
        let countButtonWidth = (width-10-ppSize)/3
        
        postButton.frame = CGRect(x: profilePhoto.right, y: 5, width: countButtonWidth, height: buttonHeight)
        followersButton.frame = CGRect(x: postButton.right, y: 5, width: countButtonWidth, height: buttonHeight)
        fallowingButton.frame = CGRect(x: followersButton.right, y: 5, width: countButtonWidth, height: buttonHeight)
        editProfileButton.frame = CGRect(x: profilePhoto.right, y: 5 + buttonHeight, width: countButtonWidth*3, height: buttonHeight)
        
        let bioLabelSize = bioLabel.sizeThatFits(frame.size)
        
        nameLabel.frame = CGRect(x: 5, y: 5 + profilePhoto.bottom, width: width-10, height: 50)
        bioLabel.frame = CGRect(x: 5, y: 5 + nameLabel.bottom, width: width-10, height: bioLabelSize.height)
    }
    
    @objc private func didTapPostsButton(){
        delegate?.profileHeaderDidTapPostButton(self)
    }
    @objc private func didTapFollowerButton(){
        delegate?.profileHeaderDidTapFallowesButton(self)
    }
    @objc private func didTapFollowingButton(){
        delegate?.profileHeaderDidTapFallowingButton(self)
    }
    @objc private func didTapEditProfileButton(){
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
}
