//
//  DeviceConnectionViewModel.swift
//  RemoteTV
//
//  Created by Богдан Тарченко on 27.05.2025.
//

import SwiftUI
import Network

final class DeviceConnectionViewModel: ObservableObject {
    // Аналогично с Onboarding мокнуть подключение, потом выбирая девайс изменять во вьюмодельке RemoteMainViewModel значение connectedDeviceName
    
    // Написал +- как шаблон для реализации подключения к девайсам
    
    private var browser: NWBrowser?
    
    func startDeviceDiscovery() {
        let bonjourDescriptor = NWBrowser.Descriptor.bonjour(type: "_lgservice._tcp", domain: "local")
        // тут рандомный тип, просто для демонстрации

        let parameters = NWParameters.tcp

        browser = NWBrowser(for: bonjourDescriptor, using: parameters)

        browser?.browseResultsChangedHandler = { results, changes in
            print("Found devices: \(results)")
        }
        
        browser?.stateUpdateHandler = { state in
            switch state {
            case .ready:
                print("Browser State: Ready")
            case .failed(let error):
                print("Browser State: Failed with error: \(error)")
            case .cancelled:
                 print("Browser State: Cancelled")
            case .waiting(let error):
                 print("Browser State: Waiting with error: \(error)")
            default:
                 print("Browser State: \(state)")
            }
        }

        browser?.start(queue: .main)
    }
    
    func stopDeviceDiscovery() {
        browser?.cancel()
        browser = nil
    }
    
    deinit {
        stopDeviceDiscovery()
    }
}
