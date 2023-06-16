//
//  ViewController.swift
//  Calculator
//
//  Created by 丹羽雄一朗 on 2023/06/16.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return numbers.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers[section].count
    }

    //セルの大きさ、collectionViewのヘッダーの大きさを変更
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: 10)
    }

    //セルの大きさを指定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 3 * 10) / 4
        return .init(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = calculatorCollectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CalculatorViewCell
        cell.numberLabel.text = numbers[indexPath.section][indexPath.row]
        return cell
    }

    let numbers = [
        ["C", "%", "$", "÷"],
        ["7", "8", "9", "×"],
        ["4", "5", "6", "-"],
        ["1", "2", "3", "+"],
        ["0", ".", "="]
    ]

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var calculatorCollectionView: UICollectionView!
    @IBOutlet weak var calculatorHeightConstraitnt: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorCollectionView.delegate = self
        calculatorCollectionView.dataSource = self
        calculatorCollectionView.register(CalculatorViewCell.self, forCellWithReuseIdentifier: "cellId")
        calculatorHeightConstraitnt.constant = view.frame.width * 1.4
        calculatorCollectionView.backgroundColor = .clear

        view.backgroundColor = .black
    }


}

class CalculatorViewCell: UICollectionViewCell {

    let numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "1"
        label.font = .boldSystemFont(ofSize: 32)
        label.clipsToBounds = true
        label.backgroundColor = .orange
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(numberLabel)

        numberLabel.frame.size = self.frame.size //セルの大きさと同じサイズに
        numberLabel.layer.cornerRadius = self.frame.height / 2
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

