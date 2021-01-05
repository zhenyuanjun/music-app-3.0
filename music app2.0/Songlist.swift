//
//  Songlist.swift
//  music app2.0
//
//  Created by 陳元浚 on 2020/11/23.
//

import SwiftUI

struct SongList: View {
    @ObservedObject var songsData = SongsData()
    @State private var showEditSong = false
    @ObservedObject var viewModel = SearchViewModel()
    var body: some View {
        NavigationView{
            List{
                SearchTextField(searchText: $viewModel.searchText)
                ForEach(songsData.songs){ (song) in
                    NavigationLink(destination: SongEditor(songsData: self.songsData, editSong: song)){
                        SongRow(song: song)
                    }
                }
                .onDelete{ (indexSet) in
                    self.songsData.songs.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("Song List")
            .navigationBarItems(leading:
                HStack{
                    EditButton()
                        .padding(5)
                    Button(action: {self.showEditSong = true}, label: {Image(systemName: "plus")})
                }
                ,trailing:
                HStack{
                    Button(action: {
                        for song in DemoData
                        {
                            self.songsData.songs.append(song)
                        }
                        }, label: {Text("Add all")})
                        .padding(5)
                    Button(action: {
                        self.songsData.songs.removeAll()
                    }, label: {Text("Delete all")})
                })
            .sheet(isPresented: $showEditSong) {
                NavigationView{
                    SongEditor(songsData: self.songsData)
                }
            }
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
