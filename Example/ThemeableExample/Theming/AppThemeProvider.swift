//
//  AppThemeProvider.swift
//  Night Mode
//
//  Created by Michael on 01/04/2018.
//  Copyright © 2018 Late Night Swift. All rights reserved.
//

import UIKit
import Themeable

final class AppThemeProvider: ThemeProvider {
	static let shared: AppThemeProvider = .init()

	private var theme: SubscribableValue<Theme>
	private var availableThemes: [Theme] = [.ayu, .sky]

	var currentTheme: Theme {
		get {
			return theme.value
		}
		set {
			setNewTheme(newValue)
		}
	}
    
    var useDarkMode: Bool {
        didSet {
            self.setNewTheme(self.currentTheme)
        }
    }

	init() {
		theme = SubscribableValue<Theme>(value: .ayu)
        useDarkMode = false
	}

	private func setNewTheme(_ newTheme: Theme) {
        newTheme.useDarkMode = self.useDarkMode
		let window = UIApplication.shared.delegate!.window!!
		UIView.transition(
			with: window,
			duration: 0.3,
			options: [.transitionCrossDissolve],
			animations: {
				self.theme.value = newTheme
			},
			completion: nil
		)
	}

	func subscribeToChanges(_ object: AnyObject, handler: @escaping (Theme) -> Void) {
		theme.subscribe(object, using: handler)
	}

	func nextTheme() {
		guard let nextTheme = availableThemes.rotate() else {
			return
		}
		currentTheme = nextTheme
	}
}

extension Themeable where Self: AnyObject {
	var themeProvider: AppThemeProvider {
		return AppThemeProvider.shared
	}
}
