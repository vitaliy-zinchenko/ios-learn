//
//  CollectionViewControllerExample.swift
//  UIKitCodeExample
//
//  Created by Vitalii Zinchenko on 03.07.2020.
//  Copyright © 2020 Vitalii Zinchenko. All rights reserved.
//

import UIKit

struct CustomData {
    var title: String
    var image: UIImage
}

class CollectionViewControllerExample: UIViewController {
    
    let data = [
        CustomData(title: "Test Tile 1", image: #imageLiteral(resourceName: "ivan-rohovchenko-d-nYWJEXnwI-unsplash")),
        CustomData(title: "Test Tile 2", image: #imageLiteral(resourceName: "marcus-platt-w-kWfckV5Co-unsplash")),
        CustomData(title: "Test Tile 3", image: #imageLiteral(resourceName: "vladimir-haltakov-m0Lwn09gpEg-unsplash")),
        CustomData(title: "Test Tile 4", image: #imageLiteral(resourceName: "colton-sturgeon-l18a6NEfaJQ-unsplash")),
        CustomData(title: "Test Tile 5", image: #imageLiteral(resourceName: "junho-w1KEz3pcTKQ-unsplash")),
        CustomData(title: "Test Tile 6", image: #imageLiteral(resourceName: "birger-strahl-6e2bZXxfx5I-unsplash")),
        CustomData(title: "Test Tile 7", image: #imageLiteral(resourceName: "benjamin-suter-HaY_LFj6_qI-unsplash")),
        CustomData(title: "Test Tile 8", image: #imageLiteral(resourceName: "ivan-rohovchenko-Hz94Sr1xi7Q-unsplash")),
        CustomData(title: "Test Tile 9", image: #imageLiteral(resourceName: "colton-sturgeon-l18a6NEfaJQ-unsplash")),
        CustomData(title: "Test Tile 10", image: #imageLiteral(resourceName: "marcus-platt-w-kWfckV5Co-unsplash"))
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let tileWidth = 75
        let tileHeight = 100
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: tileWidth, height: tileHeight)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        collection.backgroundColor = .none
        collection.dataSource = self
        collection.delegate = self
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        view.addSubview(collection)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            collection.heightAnchor.constraint(equalToConstant: CGFloat(tileHeight))
        ])
    }
    
}

extension CollectionViewControllerExample: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("get reused cell for raw \(indexPath.row)")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell

        cell.customData = data[indexPath.row]

        return cell
    }


}

extension CollectionViewControllerExample: UICollectionViewDelegateFlowLayout {
    
}


class CustomCell: UICollectionViewCell {
    
    var customData: CustomData? {
        didSet {
            guard let data = customData else { return }
            updateUI(data)
        }
    }
    
    func updateUI(_ data: CustomData) {
        background.image = data.image
    }
    
    private let background: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 6
        
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("init()")

        contentView.addSubview(background)
        UIUtils.pinEdgesTo(child: background, parent: contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
