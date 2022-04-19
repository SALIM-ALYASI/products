//
//  Cell.swift
//  products
//
//  Created by الياسي on 19/04/2022.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var nounLabel: UILabel!
    @IBOutlet weak var producttypeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func productsdata(_ Products:ProductsData )  {
        nounLabel.text = Products.noun
        producttypeLabel.text = Products.product_type
    }
}
