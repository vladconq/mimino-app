//
//  SettingsCell.swift
//  Mimino5
//
//  Created by Vladislav on 22.10.2021.
//

import UIKit

protocol SettingsCellDelegate {
    func switchToggled()
}

class SettingsCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let reuseIdentifier = "SettingsCell"
    
    var delegate: SettingsCellDelegate?
    
    var settingType: SettingType? {
        didSet {
            guard let settingType = settingType else { return }
            textLabel?.text = settingType.description
            switchControl.isHidden = !settingType.containsSwitch ? true : false
        }
    }
    
    lazy var switchControl: UISwitch = {
        print("switch")
        let switchControl = UISwitch()
        switchControl.isOn = true
        switchControl.onTintColor = .letterQuizColor
        switchControl.addTarget(self, action: #selector(handleSwitchAction), for: .valueChanged)
        return switchControl
    }()
    
    var switchToggled : ((Bool) -> ())?
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureSwitchControl()
    }
    
    func configureSwitchControl() {
        contentView.addSubview(switchControl)
        switchControl.centerY(inView: self)
        switchControl.anchor(right: rightAnchor, paddingRight: 12)
    }
    
    // MARK: - Selectors
    
    @objc func handleSwitchAction(sender: UISwitch) {
        switchToggled?(sender.isOn)
    }
    
}
