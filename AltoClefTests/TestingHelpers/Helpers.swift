//
//  Helpers.swift
//  AltoClefTests
//
//  Created by Khalil AlNajjar on 26/04/2022.
//

import UIKit
@testable import AltoClef

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

func numberOfItems(in collectionView: UICollectionView, section: Int = 0) -> Int? {
    collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: section)
}

func cellForItem(in collectionView: UICollectionView, item: Int, section: Int = 0) -> UICollectionViewCell? {
    collectionView.dataSource?.collectionView(collectionView, cellForItemAt: IndexPath(item: item, section: section))
}

func selectItem(in collectionView: UICollectionView, item: Int, section: Int = 0) {
    collectionView.selectItem(at: IndexPath(item: item, section: section), animated: true, scrollPosition: .bottom)
}

func didSelectItem(in collectionView: UICollectionView, item: Int, section: Int = 0) {
    collectionView.delegate?.collectionView?(collectionView, didSelectItemAt: IndexPath(item: item, section: section))
}

func getANoreInformation(note: Notes = .E5, leftArmFinger: [LeftArmFingers] = [.forthFinger, .openString], notePicture: UIImage = UIImage()) -> NotesInformation {
    return NotesInformation(note: note, leftArmFinger: [.forthFinger, .openString], notePicture: notePicture)
}
