// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKitUI/

import Accelerate
import AudioKit
import SwiftUI

#if os(macOS)
public typealias ViewRepresentable = NSViewRepresentable
#else
public typealias ViewRepresentable = UIViewRepresentable
#endif

public extension Color {
    var cg: CGColor {
		if #available(iOS 14.0, *) {
			return CrossPlatformColor(self).cgColor
		} else {
			let scanner = Scanner(string: description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
			var hexNumber: UInt64 = 0
			var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

			let result = scanner.scanHexInt64(&hexNumber)
			if result {
				r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
				g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
				b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
				a = CGFloat(hexNumber & 0x000000FF) / 255
			}

			return CrossPlatformColor(red: r, green: g, blue: b, alpha: a).cgColor
		}
    }
}

public extension EnvironmentValues {
    var isPreview: Bool {
        #if DEBUG
        return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
        #else
        return false
        #endif
    }
}
