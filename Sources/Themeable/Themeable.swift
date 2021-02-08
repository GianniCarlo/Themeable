//
//  NightMode.swift
//  Night Mode
//
//  Created by Michael on 01/04/2018.
//  Copyright © 2018 Late Night Swift. All rights reserved.
//

import UIKit

/// Describes a type that holds a current `Theme` and allows
/// an object to be notified when the theme is changed.
public protocol ThemeProvider {
	/// Placeholder for the theme type that the app will use
	associatedtype Theme

	/// The current theme that is active
	var currentTheme: Theme { get }

	/// Subscribe to be notified when the theme changes. Handler will be
	/// remove from subscription when `object` is deallocated.
	func subscribeToChanges(_ object: AnyObject, handler: @escaping (Theme) -> Void)
}

/// Describes a type that can have a theme applied to it
public protocol Themeable {
	/// A Themed type needs to know about what concrete type the
	/// ThemeProvider is. So we don't clash with the protocol,
	/// let's call this associated type _ThemeProvider
	associatedtype _ThemeProvider: ThemeProvider

	/// Return the current app-wide theme provider
	var themeProvider: _ThemeProvider { get }

	/// This will be called whenever the current theme changes
	func applyTheme(_ theme: _ThemeProvider.Theme)
}

extension Themeable where Self: AnyObject {
	/// This is to be called once when Self wants to start listening for
	/// theme changes. This immediately triggers `applyTheme()` with the
	/// current theme.
	public func setUpTheming() {
		applyTheme(themeProvider.currentTheme)
		themeProvider.subscribeToChanges(self) { [weak self] newTheme in
			self?.applyTheme(newTheme)
		}
	}
}

open class Theme {
    public var label: UIColor {
        return self.useDarkMode ? self.darkLabel : self.lightLabel
    }
    public var secondaryLabel: UIColor {
        return self.useDarkMode ? self.darkSecondaryLabel : self.lightSecondaryLabel
    }
    public var tertiaryLabel: UIColor {
        return self.useDarkMode ? self.darkTertiaryLabel : self.lightTertiaryLabel
    }
    public var quaternaryLabel: UIColor {
        return self.useDarkMode ? self.darkQuaternaryLabel : self.lightQuaternaryLabel
    }
    public var systemFill: UIColor {
        return self.useDarkMode ? self.darkSystemFill : self.lightSystemFill
    }
    public var secondarySystemFill: UIColor {
        return self.useDarkMode ? self.darkSecondarySystemFill : self.lightSecondarySystemFill
    }
    public var tertiarySystemFill: UIColor {
        return self.useDarkMode ? self.darkTertiarySystemFill : self.lightTertiarySystemFill
    }
    public var quaternarySystemFill: UIColor {
        return self.useDarkMode ? self.darkQuaternarySystemFill : self.lightQuaternarySystemFill
    }
    public var placeholderText: UIColor {
        return self.useDarkMode ? self.lightPlaceholderText : self.darkPlaceholderText
    }
    public var systemBackground: UIColor {
        return self.useDarkMode ? self.darkSystemBackground : self.lightSystemBackground
    }
    public var secondarySystemBackground: UIColor {
        return self.useDarkMode ? self.darkSecondarySystemBackground : self.lightSecondarySystemBackground
    }
    public var tertiarySystemBackground: UIColor {
        return self.useDarkMode ? self.darkTertiarySystemFill : self.lightTertiarySystemFill
    }
    public var systemGroupedBackground: UIColor {
        return self.useDarkMode ? self.darkSystemGroupedBackground : self.lightSystemGroupedBackground
    }
    public var secondarySystemGroupedBackground: UIColor {
        return self.useDarkMode ? self.darkSecondarySystemGroupedBackground : self.lightSecondarySystemGroupedBackground
    }
    public var tertiarySystemGroupedBackground: UIColor {
        return self.useDarkMode ? self.darkTertiarySystemGroupedBackground : self.lightTertiarySystemGroupedBackground
    }
    public var separator: UIColor {
        return self.useDarkMode ? self.darkSeparator : self.lightSeparator
    }
    public var opaqueSeparator: UIColor {
        return self.useDarkMode ? self.darkOpaqueSeparator : self.lightOpaqueSeparator
    }
    public var link: UIColor {
        return self.useDarkMode ? self.darkLink: self.lightLink
    }
    public var darkText: UIColor {
        return self.useDarkMode ? self.darkLabel : self.lightLabel
    }
    public var lightText: UIColor {
        return self.useDarkMode ? self.darkLabel : self.lightLabel
    }

    let lightLabel: UIColor
    let darkLabel: UIColor
    let lightSecondaryLabel: UIColor
    let darkSecondaryLabel: UIColor
    let lightTertiaryLabel: UIColor
    let darkTertiaryLabel: UIColor
    let lightQuaternaryLabel: UIColor
    let darkQuaternaryLabel: UIColor
    let lightSystemFill: UIColor
    let darkSystemFill: UIColor
    let lightSecondarySystemFill: UIColor
    let darkSecondarySystemFill: UIColor
    let lightTertiarySystemFill: UIColor
    let darkTertiarySystemFill: UIColor
    let lightQuaternarySystemFill: UIColor
    let darkQuaternarySystemFill: UIColor
    let lightPlaceholderText: UIColor
    let darkPlaceholderText: UIColor
    let lightSystemBackground: UIColor
    let darkSystemBackground: UIColor
    let lightSecondarySystemBackground: UIColor
    let darkSecondarySystemBackground: UIColor
    let lightTertiarySystemBackground: UIColor
    let darkTertiarySystemBackground: UIColor
    let lightSystemGroupedBackground: UIColor
    let darkSystemGroupedBackground: UIColor
    let lightSecondarySystemGroupedBackground: UIColor
    let darkSecondarySystemGroupedBackground: UIColor
    let lightTertiarySystemGroupedBackground: UIColor
    let darkTertiarySystemGroupedBackground: UIColor
    let lightSeparator: UIColor
    let darkSeparator: UIColor
    let lightOpaqueSeparator: UIColor
    let darkOpaqueSeparator: UIColor
    let lightLink: UIColor
    let darkLink: UIColor
    
    public var useDarkMode = false
    public var statusBarStyle = UIStatusBarStyle.default
    required public init(lightLabel: UIColor? = nil, darkLabel: UIColor? = nil, lightSecondaryLabel: UIColor? = nil, darkSecondaryLabel: UIColor? = nil, lightTertiaryLabel: UIColor? = nil, darkTertiaryLabel: UIColor? = nil, lightQuaternaryLabel: UIColor? = nil, darkQuaternaryLabel: UIColor? = nil, lightSystemFill: UIColor? = nil, darkSystemFill: UIColor? = nil, lightSecondarySystemFill: UIColor? = nil, darkSecondarySystemFill: UIColor? = nil, lightTertiarySystemFill: UIColor? = nil, darkTertiarySystemFill: UIColor? = nil, lightQuaternarySystemFill: UIColor? = nil, darkQuaternarySystemFill: UIColor? = nil, lightPlaceholderText: UIColor? = nil, darkPlaceholderText: UIColor? = nil, lightSystemBackground: UIColor? = nil, darkSystemBackground: UIColor? = nil, lightSecondarySystemBackground: UIColor? = nil, darkSecondarySystemBackground: UIColor? = nil, lightTertiarySystemBackground: UIColor? = nil, darkTertiarySystemBackground: UIColor? = nil, lightSystemGroupedBackground: UIColor? = nil, darkSystemGroupedBackground: UIColor? = nil, lightSecondarySystemGroupedBackground: UIColor? = nil, darkSecondarySystemGroupedBackground: UIColor? = nil, lightTertiarySystemGroupedBackground: UIColor? = nil, darkTertiarySystemGroupedBackground: UIColor? = nil, lightSeparator: UIColor? = nil, darkSeparator: UIColor? = nil, lightOpaqueSeparator: UIColor? = nil, darkOpaqueSeparator: UIColor? = nil, lightLink: UIColor? = nil, darkLink: UIColor? = nil) {
        
        self.lightLabel = lightLabel ?? UIColor.label
        self.darkLabel = darkLabel ?? UIColor.label
        self.lightSecondaryLabel = lightSecondaryLabel ?? UIColor.secondaryLabel
        self.darkSecondaryLabel = darkSecondaryLabel ?? UIColor.secondaryLabel
        self.lightTertiaryLabel = lightTertiaryLabel ?? UIColor.tertiaryLabel
        self.darkTertiaryLabel = darkTertiaryLabel ?? UIColor.tertiaryLabel
        self.lightQuaternaryLabel = lightQuaternaryLabel ?? UIColor.quaternaryLabel
        self.darkQuaternaryLabel = darkQuaternaryLabel ?? UIColor.quaternaryLabel
        self.lightSystemFill = lightSystemFill ?? UIColor.systemFill
        self.darkSystemFill = darkSystemFill ?? UIColor.systemFill
        self.lightSecondarySystemFill = lightSecondarySystemFill ?? UIColor.secondarySystemFill
        self.darkSecondarySystemFill = darkSecondarySystemFill ?? UIColor.secondarySystemFill
        self.lightTertiarySystemFill = lightTertiarySystemFill ?? UIColor.tertiarySystemFill
        self.darkTertiarySystemFill = darkTertiarySystemFill ?? UIColor.tertiarySystemFill
        self.lightQuaternarySystemFill = lightQuaternarySystemFill ?? UIColor.quaternarySystemFill
        self.darkQuaternarySystemFill = darkQuaternarySystemFill ?? UIColor.quaternarySystemFill
        self.lightPlaceholderText = lightPlaceholderText ?? UIColor.placeholderText
        self.darkPlaceholderText = darkPlaceholderText  ?? UIColor.placeholderText
        self.lightSystemBackground = lightSystemBackground ?? UIColor.systemBackground
        self.darkSystemBackground = darkSystemBackground ?? UIColor.systemBackground
        self.lightSecondarySystemBackground = lightSecondarySystemBackground ?? UIColor.secondarySystemBackground
        self.darkSecondarySystemBackground = darkSecondarySystemBackground ?? UIColor.secondarySystemBackground
        self.lightTertiarySystemBackground = lightTertiarySystemBackground ?? UIColor.tertiarySystemBackground
        self.darkTertiarySystemBackground = darkTertiarySystemBackground ?? UIColor.tertiarySystemBackground
        self.lightSystemGroupedBackground = lightSystemGroupedBackground ?? UIColor.systemGroupedBackground
        self.darkSystemGroupedBackground = darkSystemGroupedBackground ?? UIColor.systemGroupedBackground
        self.lightSecondarySystemGroupedBackground = lightSecondarySystemBackground ?? UIColor.secondarySystemGroupedBackground
        self.darkSecondarySystemGroupedBackground = darkSecondarySystemGroupedBackground ?? UIColor.secondarySystemGroupedBackground
        self.lightTertiarySystemGroupedBackground = lightTertiarySystemGroupedBackground ?? UIColor.tertiarySystemGroupedBackground
        self.darkTertiarySystemGroupedBackground = darkTertiarySystemGroupedBackground ?? UIColor.tertiarySystemGroupedBackground
        self.lightSeparator = lightSeparator ?? UIColor.separator
        self.darkSeparator = darkSeparator ?? UIColor.separator
        self.lightOpaqueSeparator = lightOpaqueSeparator ?? UIColor.opaqueSeparator
        self.darkOpaqueSeparator = darkOpaqueSeparator ?? UIColor.opaqueSeparator
        self.lightLink = lightLink ?? UIColor.link
        self.darkLink = darkLink ?? UIColor.link
    }
}
