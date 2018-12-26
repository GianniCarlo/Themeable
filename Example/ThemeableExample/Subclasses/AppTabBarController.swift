//
//  AppTabBarController.swift
//  Night Mode
//
//  Created by Michael on 01/04/2018.
//  Copyright © 2018 Late Night Swift. All rights reserved.
//

import UIKit
import Themeable

class AppTabBarController: UITabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpTheming()
	}
}

extension AppTabBarController: Themeable {
	func applyTheme(_ theme: AppTheme) {
		tabBar.barTintColor = theme.barBackgroundColor
		tabBar.tintColor = theme.barForegroundColor
	}
}
