//
//  SettingsController.swift
//  Mimino5
//
//  Created by Vladislav on 21.10.2021.
//

import UIKit
import StoreKit

class SettingsController: UITableViewController {
    
    // MARK: - Properties
    
    // managers
    let switchSettingsManager = SwitchSettingsManager.shared
    let scoreManager = ScoreManager.shared
    
    // ui
    private lazy var warningView = WarningView(colorTheme: .georgianColor)
    
    private let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let view = UIVisualEffectView(effect: blurEffect)
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - UI
    
    func configureUI() {
        configureNavigationBar()
        configureSelf()
    }
    
    func configureNavigationBar() {
        navigationItem.title = "Настройки"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.mainWhiteColor]
        navigationController?.navigationBar.barTintColor = .georgianColor
        navigationController?.navigationBar.sizeToFit()
        let backButton = UIBarButtonItem()
        backButton.tintColor = .mainWhiteColor
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    func configureSelf() {
        tableView.rowHeight = 60
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseIdentifier)
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
    }
    
    // MARK: - Helpers
    
    func handleResetScorePressed() {
        let alert = UIAlertController(title: "Внимание", message: "Вы уверены, что хотите сбросить рекорды всех тренировок?", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Сбросить результаты", style: UIAlertAction.Style.destructive, handler: { action in
            self.scoreManager.resetScore()
        }))
        alert.addAction(UIAlertAction(title: "Отменить", style: UIAlertAction.Style.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        SettingsSections.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .mainWhiteColor
        
        let title = UILabel()
        title.font = .boldSystemFont(ofSize: 16)
        title.textColor = .mainBlackColor.withAlphaComponent(0.8)
        
        view.addSubview(title)
        title.centerY(inView: view)
        title.anchor(left: view.leftAnchor, paddingLeft: 16)
        
        title.text = SettingsSections(rawValue: section)?.description
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingsSections(rawValue: section) else { return 0 }
        
        switch section {
        case .Audio: return AudioOptions.allCases.count
        case .Support: return SupportOptions.allCases.count
        case .Danger: return DangerOptions.allCases.count
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseIdentifier, for: indexPath) as! SettingsCell
        
        guard let section = SettingsSections(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .Audio:
            let audio = AudioOptions(rawValue: indexPath.row)
            cell.settingType = audio
            cell.selectionStyle = .none
            
            switch audio {
            case .autoPronunciation:
                cell.switchControl.isOn = switchSettingsManager.isOn(switchType: .autoPronunciation)
                cell.switchToggled = { switchState in
                    self.switchSettingsManager.toggleSwitch(switchType: .autoPronunciation)
                }
            case .vibration:
                cell.switchControl.isOn = switchSettingsManager.isOn(switchType: .vibration)
                cell.switchToggled = { switchState in
                    self.switchSettingsManager.toggleSwitch(switchType: .vibration)
                }
            case .none:
                break
            }
        case .Support:
            let support = SupportOptions(rawValue: indexPath.row)
            cell.settingType = support
        case .Danger:
            let danger = DangerOptions(rawValue: indexPath.row)
            cell.settingType = danger
            cell.textLabel?.textColor = .georgianColor
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let section = SettingsSections(rawValue: indexPath.section) else { return }
        
        switch section {
        case .Support:
            let support = SupportOptions(rawValue: indexPath.row)
            
            switch support {
            case .rateApp:
                guard let scene = view.window?.windowScene else {
                    return
                }
                SKStoreReviewController.requestReview(in: scene)
            //            case .shareApp:
            //                print("shareApp")
            case .suggestImprovement:
                let botURL = URL.init(string: "tg://resolve?domain=miminoapp")
                
                if UIApplication.shared.canOpenURL(botURL!) {
                    UIApplication.shared.openURL(botURL!)
                } else {
                    print("telega not installed")
                    // Telegram is not installed.
                    
                    let alert = UIAlertController(title: "", message: "Похоже, что у вас не установлен Telegram. В таком случае вы можете предложить улучшение в App Store, либо установить Telegram и присоединиться к общему чату поддержки ☺️", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Хорошо", style: UIAlertAction.Style.cancel, handler: nil))
                    
                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                }
            case .none:
                return
            }
        case .Danger:
            let danger = DangerOptions(rawValue: indexPath.row)
            
            switch danger {
            case .resetResult:
                handleResetScorePressed()
            case .none:
                return
            }
        case .Audio:
            return
        }
    }
    
}

