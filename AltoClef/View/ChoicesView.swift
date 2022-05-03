//
//  ChoicesView.swift
//  AltoClef
//
//  Created by Khalil AlNajjar on 28/04/2022.
//

import UIKit

enum QuestionTypes {
    case notes
    case leftArmFingers
}

class ChoicesView: UIView {
    
    private var choices = [String]()
    var didSelectAnItem: () -> Void = {}
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.allowsSelection = true
        collectionView.allowsMultipleSelection = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ChoicesCollectionViewCell.self, forCellWithReuseIdentifier: ChoicesCollectionViewCell.className)
        return collectionView
    }()
    
    init(choices: [String]) {
        super.init(frame: .zero)
        self.choices = choices
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubviews() {
        addSubview(collectionView)
        collectionView.anchorToFill(view: self)
    }
    
    func getIndexForSelectedItem() -> Int? {
        return collectionView.indexPathsForSelectedItems?.first?.item
    }
}

extension ChoicesView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return choices.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChoicesCollectionViewCell.className, for: indexPath) as! ChoicesCollectionViewCell
        let choice = choices[indexPath.item]
        cell.choiceLabel.text = choice
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectAnItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfChoicesPerRow = 3
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(numberOfChoicesPerRow - 1))
        let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(numberOfChoicesPerRow))
        let height = 45
        return CGSize(width: size, height: height)
    }
}
