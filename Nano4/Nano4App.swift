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
#if os(macOS) // mac
        WindowGroup { MacView() }
#elseif os(iOS) // iphone
        WindowGroup { IphoneView() }
#elseif os(tvOS) //tv apple
        WindowGroup { MacView() }
#else
        WindowGroup { Text("nao tem nada") }
#endif
    }
}
