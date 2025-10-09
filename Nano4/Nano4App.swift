//
//  Nano4App.swift
//  Nano4
//
//  Created by Andre Castilhano on 08/10/25.
//

import SwiftUI

@main
struct Nano4App: App {
    
    var body: some Scene {
#if os(macOS)
        WindowGroup { MacView() }
#elseif os(iOS)
        WindowGroup { IphoneView() }
#else
        WindowGroup { Text("nem tem ai") }
#endif
    }
}
