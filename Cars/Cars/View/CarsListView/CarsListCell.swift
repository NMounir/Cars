//
//  CarsListCell.swift
//  Cars
//
//  Created by Nora Mounir on 5/26/18.
//  Copyright © 2018 nmounir. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class CarsListCell: UITableViewCell {

    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var makeNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Configure the cell when car retrieved data
    func configureCell(with imageUrlString: String?, placeholderImage: UIImage?, modelName: String?, makeName: String?) {
        
        modelNameLabel.text = modelName
        modelNameLabel.sizeToFit()
        makeNameLabel.text = makeName
        makeNameLabel.sizeToFit()
        self.layoutIfNeeded()
        
        guard let imageUrlString = imageUrlString else {return}
        guard let url = URL(string: imageUrlString) else {return}
        
        let size = carImageView.frame.size
        carImageView.contentMode = .scaleAspectFill
        carImageView.af_setImage(
            withURL: url,
            placeholderImage: placeholderImage,
            filter: AspectScaledToFitSizeFilter(size: size),
            imageTransition: .crossDissolve(0.2)
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        carImageView.af_cancelImageRequest()
        carImageView.layer.removeAllAnimations()
        carImageView.image = nil
    }
    
}
