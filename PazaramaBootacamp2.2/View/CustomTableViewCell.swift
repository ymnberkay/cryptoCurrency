//
//  CustomTableViewCell.swift
//  PazaramaBootacamp2.2
//
//  Created by Berkay Yaman on 21.10.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let subtitleLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 16)
            return label
        }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        // Constraints
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            subtitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
