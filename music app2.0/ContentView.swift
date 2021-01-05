//
//  ContentView.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/11/23.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var songsData = SongsData()
    var body: some View {
        TabView{
            SongList(songsData: self.songsData).tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
            PlayList(songsData: self.songsData).tabItem{
                Image(systemName: "bolt.horizontal.fill")
                Text("Practice list")
            }
            SearchView()
                .tabItem{
                    Image(systemName: "play.rectangle.fill")
                    Text("My work")
            }
            ArtistList()
                .tabItem{
                    Image(systemName: "heart.fill")
                    Text("Fav Artist")
            }
            Chart(songsData: self.songsData).tabItem{
                Image(systemName: "chart.pie.fill")
                Text("Chart")
            }
        }.accentColor(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
