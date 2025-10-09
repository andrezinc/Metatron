//
//  Host.swift
//  Nano4
//
//  Created by Andre Castilhano on 08/10/25.
//

import Foundation
import MultipeerConnectivity

enum times {
    case time1
    case time2
    case time3
    case time4
    case time5
}

final class Host: NSObject, ObservableObject{
    
    let serviceType = "points"
    let peerId = MCPeerID(displayName: String(Int.random(in: 0...100000)))
    let peerBrowser : MCNearbyServiceBrowser
    let peerSession : MCSession
    let peerAdvertiser:  MCNearbyServiceAdvertiser
    @Published var avaliedPeers = [MCPeerID]()
    @Published var pontos = 0
    
    override init(){
        peerSession = MCSession(
            peer: peerId,
            securityIdentity: nil,
            encryptionPreference: .none
        )
        peerBrowser = MCNearbyServiceBrowser(
            peer: peerId,
            serviceType: serviceType
        )
        peerAdvertiser = MCNearbyServiceAdvertiser(
            peer: peerId,
            discoveryInfo: nil,
            serviceType: serviceType
        )
        
        
        super.init()
        
        peerBrowser.delegate = self
        peerSession.delegate = self
        peerAdvertiser.delegate = self
        
        peerAdvertiser.startAdvertisingPeer()
        peerBrowser.startBrowsingForPeers()
    }
//    func sendOne(time : times){
    func sendOne(){
        if !peerSession.connectedPeers.isEmpty{
//            switch time {case .time1:
//                <#code#>
//            case .time2:
//                <#code#>
//            case .time3:
//                <#code#>
//            case .time4:
//                <#code#>
//            case .time5:
//                <#code#>
//            }
            
            do {
                try peerSession.send( String("1").data(using: .utf8)!, toPeers: peerSession.connectedPeers, with: .reliable)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    func sendMinusOne(){
        if !peerSession.connectedPeers.isEmpty{
            do {
                try peerSession.send( String("-1").data(using: .utf8)!, toPeers: peerSession.connectedPeers, with: .reliable)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    @MainActor
    func changeValue(valor : Int){
        self.pontos = valor
    }
    
}
extension Host: MCSessionDelegate{
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        if state == .connected{
            print("Conectou ne papai")
        }
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        Task{
            await changeValue(valor:  Int(String(data:data, encoding: .utf8) ?? "0" ) ?? 0 )
        }        
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: (any Error)?) {
        
    }
}

extension Host: MCBrowserViewControllerDelegate{
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        
#if os(macOS)
        browserViewController.dismiss(true)
#elseif os(iOS)
        browserViewController.dismiss(animated: true)
#endif
        
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
#if os(macOS)
        browserViewController.dismiss(true)
#elseif os(iOS)
        browserViewController.dismiss(animated: true)
#endif
        
    }
    
}
extension Host: MCNearbyServiceBrowserDelegate {
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        
        DispatchQueue.main.async{
            if !self.avaliedPeers.contains(peerID){
                self.avaliedPeers.append(peerID)
            }
        }
        browser.invitePeer(peerID, to: peerSession, withContext: nil, timeout: 10)
    }
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        guard let index = avaliedPeers.firstIndex(of: peerID) else {return}
        DispatchQueue.main.async{
            self.avaliedPeers.remove(at:index)
        }
    }
}

extension Host: MCNearbyServiceAdvertiserDelegate{
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        invitationHandler(true,peerSession)
    }
    
    
}
