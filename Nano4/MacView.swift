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
    @State var pontos : [Int] = [0,0,0,0,0]
    var body: some View {
        VStack(spacing: 20){
            ForEach(Array(conexao.pontos.enumerated()), id:\.offset){ index, valor in
                
                Text(String(pontos[index]))
                    .onReceive(conexao.$pontos) { valor in
                        pontos[index] = valor[index] + pontos[index]
                        if pontos[index] < 0 {
                            pontos[index] = 0
                        }
                    }
                
                
                
            }
        }
    }
}
