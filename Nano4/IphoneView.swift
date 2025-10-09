//
//  ContentView 2.swift
//  Nano4
//
//  Created by Andre Castilhano on 09/10/25.
//


//
//  ContentView.swift
//  Nano4
//
//  Created by Andre Castilhano on 08/10/25.
//

import SwiftUI
import CoreLocation
import NetworkExtension

struct IphoneView: View {
    @ObservedObject var conexao = Host()
    var body: some View {
        VStack {
            List(conexao.avaliedPeers, id:\.self){ par in
                
                Text(par.displayName)
                    .foregroundStyle(.white)
                
            }
            HStack{
                Button(action: conexao.sendOne){
                    Text("mandar")
                        .background(.white)
                        .padding()
                }
                Button(action: conexao.sendMinusOne){
                    Text("mandar")
                        .background(.white)
                        .padding()
                }
            }
        } .padding()
    }
}


