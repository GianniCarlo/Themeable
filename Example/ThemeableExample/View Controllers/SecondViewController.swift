//
//  SecondViewController.swift
//  Night Mode
//
//  Created by Michael on 01/04/2018.
//  Copyright © 2018 Late Night Swift. All rights reserved.
//

import UIKit
import Themeable

class SecondViewController: UIViewController {
	@IBOutlet private var titleLabel: UILabel!
	@IBOutlet private var subtitleLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpTheming()
	}
    @IBAction func toggleDarkMode(_ sender: UIBarButtonItem) {
        themeProvider.useDarkMode = !themeProvider.useDarkMode
    }

	@IBAction func toggleThemeActionTriggered() {
		themeProvider.nextTheme()
	}
}

extension SecondViewController: Themeable {
	func applyTheme(_ theme: Theme) {
		view.backgroundColor = theme.systemBackground
		titleLabel.textColor = theme.label
		subtitleLabel.textColor = theme.secondaryLabel
	}
}
