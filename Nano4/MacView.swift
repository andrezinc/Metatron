//
//  ContentView.swift
//  Nano4
//
//  Created by Andre Castilhano on 08/10/25.
//

import SwiftUI
import CoreLocation
import NetworkExtension

struct MacView: View {
    @ObservedObject var conexao = Host()
    @State var pontos : Int = 0
    var body: some View {
        HStack{
            Text("Time:" + String(pontos))
                .font(.system(size: 50))
                .onReceive(conexao.$pontos) { valor in
                    pontos = valor + pontos
                }
        }
    }
}
