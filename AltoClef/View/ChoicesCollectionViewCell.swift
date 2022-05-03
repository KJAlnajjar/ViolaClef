//
//  ChoicesCollectionViewCell.swift
//  AltoClef
//
//  Created by Khalil AlNajjar on 28/04/2022.
//

import UIKit

class ChoicesCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            changeLabelColors(when: isSelected)
        }
    }
    
    let choiceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        contentView.addSubview(choiceLabel)
        choiceLabel.anchorToFill(view: contentView)
    }
    
    private func changeLabelColors(when selected: Bool) {
        if selected {
            choiceLabel.textColor = .white
            choiceLabel.backgroundColor = .systemBlue
        } else {
            choiceLabel.textColor = .systemBlue
            choiceLabel.backgroundColor = .white
        }
    }
}
