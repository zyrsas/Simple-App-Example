//
//  NoteDetailView.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

class NoteDetailView: BaseView {
    
    // MARK: - UI Elements
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Title"
        titleLabel.textColor = .black
        return titleLabel
    }()
    
    lazy var titleField: BaseTextField = {
        let titleField = BaseTextField()
        titleField.placeholder = "Title"
        return titleField
    }()
    
    lazy var bodyLabel: UILabel = {
        let bodyLabel = UILabel()
        bodyLabel.text = "Body"
        bodyLabel.textColor = .black
        return bodyLabel
    }()
    
    lazy var bodyTextView: UITextView = {
        let bodyTextField = UITextView()
        bodyTextField.font = UIFont.systemFont(ofSize: 17)
        return bodyTextField
    }()
    
    // MARK: - Add subviews
    
    override func addSubViews() {
        addSubview(titleLabel)
        addSubview(titleField)
        addSubview(bodyLabel)
        addSubview(bodyTextView)
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            if #available(iOS 11.0, *) {
                make.top.equalTo(safeAreaLayoutGuide.snp.topMargin).offset(15)
            } else {
                make.top.equalToSuperview().offset(15)
            }
        }

        titleField.snp.makeConstraints { (make) in
            make.height.equalTo(35)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        bodyLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(titleField.snp.bottom).offset(15)
        }
        
        bodyTextView.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.top.equalTo(bodyLabel.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    public func fillNote(_ note: Note?) {
        titleField.text = note?.title ?? ""
        bodyTextView.text = note?.body ?? ""
    }
}
