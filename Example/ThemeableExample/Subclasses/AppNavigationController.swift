//
//  AppNavigationController.swift
//  Night Mode
//
//  Created by Michael on 01/04/2018.
//  Copyright © 2018 Late Night Swift. All rights reserved.
//

import UIKit
import Themeable

class AppNavigationController: UINavigationController {
	private var themedStatusBarStyle: UIStatusBarStyle?

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return themedStatusBarStyle ?? super.preferredStatusBarStyle
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpTheming()
	}
}

extension AppNavigationController: Themeable {
	func applyTheme(_ theme: Theme) {
		themedStatusBarStyle = theme.statusBarStyle
		setNeedsStatusBarAppearanceUpdate()

		navigationBar.barTintColor = theme.secondarySystemBackground
		navigationBar.tintColor = theme.link
		navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: theme.label
		]
	}
}
