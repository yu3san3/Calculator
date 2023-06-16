//
//  ViewController.swift
//  Calculator
//
//  Created by 丹羽雄一朗 on 2023/06/16.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calculatorCollectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var calculatorCollectionView: UICollectionView!
    @IBOutlet weak var calculatorHeightConstraitnt: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorCollectionView.delegate = self
        calculatorCollectionView.dataSource = self
        calculatorCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
    }


}

