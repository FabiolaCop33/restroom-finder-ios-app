//
//  ContentView.swift
//  RestroomFinder
//
//  Created by Fabiola Correa Padilla on 08/05/24.
//

import SwiftUI
import MapKit


struct ContentView: View {
    @State private var restrooms: [Restroom] = []
    
    private func loadRestrooms()async{
        do {
            restrooms = try await RestroomClient.shared.fetchRestrooms(at: Constants.Urls.restrooms)
            print("Successfully fetched restrooms: \(restrooms.count)")  // Print the number of fetched objects
        } catch {
            print(error.localizedDescription)
        }
    }
    var body: some View {
        TabView{
            NavigationStack{
                Map{
                    ForEach(restrooms){
                        restroom in Marker(restroom.name, coordinate: restroom.coordinate)
                    }
                }
                    .task {
                        await loadRestrooms()
                    }
                    .navigationTitle("Restroom Finder")
            }.tabItem {
                Text("Map")
                Image(systemName: "map")
            }
        }
    }
}

#Preview {
    ContentView()
}
