//
//  CustomTableViewCell.swift
//  Day4
//
//  Created by Evan N on 16/06/22.
//

import UIKit

protocol CustomTableViewCellDelegate: AnyObject {
    func didTapButton(with id: Int)
}

class CustomTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
   
    @IBOutlet var button: UIButton!
    private var id: Int = 0
    weak var delegate: CustomTableViewCellDelegate?
    @IBAction func didTabButton() {
        delegate?.didTapButton(with: id)
    }
    
    func configure(with id: Int){
        self.id = id
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
