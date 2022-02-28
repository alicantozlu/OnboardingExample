//
//  PageCells.swift
//  Odev-1
//
//  Created by Ali Can Tozlu on 11.02.2022.
//

import UIKit

class PageCells: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(slide: PageModel){
        imageView.image = slide.image
        titleLabel.text = slide.title
        descriptionLabel.text = slide.description
    }
}
