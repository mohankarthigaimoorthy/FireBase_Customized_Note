//
//  NoteCell.swift
//  customizeNote
//
//  Created by Mohan K on 20/04/23.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var NoteLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var pinnedButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    @IBAction func pinBtn(_ sender: Any) {
    }
    
}



 


