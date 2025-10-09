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
        
        VStack{
            
            Button(action: {conexao.sendOne(time: .time1)} ){
                Text("mandar 1")
                    .background(.white)
                    .padding()
            }
            Button(action: {conexao.sendMinusOne(time: .time1)}){
                Text("mandar 1")
                    .background(.white)
                    .padding()
            }
            
            Button(action: {conexao.sendOne(time: .time2)} ){
                Text("mandar 2 ")
                    .background(.white)
                    .padding()
            }
            Button(action: {conexao.sendMinusOne(time: .time2)}){
                Text("mandar 2")
                    .background(.white)
                    .padding()
            }
            
            Button(action: {conexao.sendOne(time: .time3)} ){
                Text("mandar 3")
                    .background(.white)
                    .padding()
            }
            Button(action: {conexao.sendMinusOne(time: .time3)}){
                Text("mandar 3")
                    .background(.white)
                    .padding()
            }
            Button(action: {conexao.sendOne(time: .time4)} ){
                Text("mandar 4")
                    .background(.white)
                    .padding()
            }
            Button(action: {conexao.sendMinusOne(time: .time4)}){
                Text("mandar 4")
                    .background(.white)
                    .padding()
            }
            Button(action: {conexao.sendOne(time: .time5)} ){
                Text("mandar 5")
                    .background(.white)
                    .padding()
            }
            Button(action: {conexao.sendMinusOne(time: .time5)}){
                Text("mandar 5")
                    .background(.white)
                    .padding()
            }
        } .padding()
    }
}


