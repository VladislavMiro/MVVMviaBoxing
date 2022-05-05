//
//  TableViewCell.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 18.10.2021.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    @IBOutlet private weak var fullNameLabel: UILabel!
    
    public var viewModel: TableViewCellViewModelProtocol! {
        didSet {
            viewModel.fullName.bind { [unowned self] (fullName) in
                self.fullNameLabel.text = fullName
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
