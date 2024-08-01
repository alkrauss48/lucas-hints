//
//  InfoSheet.swift
//  LucasHints
//
//  Created by Aaron Krauss on 8/1/24.
//

import SwiftUI

struct InfoSheet: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Welcome!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))

                    Text("**Lucas Hints** is an incredibly simple app designed to provide you just a little bit of guidance when you need it - without telling you the whole story.")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))

                    Text("Wondering what to do next in your creative storytelling experience, or heck - do you need just a bit of advice with some real life decisions?")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))

                    Text("**Lucas Hints** will help by giving you 3 unique icons across different categories. Don't like the icons you were dealt? Pull down to refresh! Just try not to do that too much - that ruins the fun.")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))

                    Text("Does the order of icons matter, and what do they actually mean? That's for you to interpret and decide!")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))

                    Text("Now get out there and have some fun, and let your creativity reign!")
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))

                    DisclosureGroup("Why was this app built?") {
                        VStack(alignment: .leading) {
                            Text("Hello! I'm Aaron. Lucas is my son. I love encouraging creativity with my friends and family - but I know that sometimes, you need a little help to get your creative flow going. That's why this app exists.")
                                .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))

                            Text("It's meant to give you just enough to think about (and probably laugh about) what to do next - without telling you exactly what to do. It's just a few icons, right? You have to put the meaning together!")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))

                            Text("Want to check out the app I built for my other son, Cyrus, which will help you quickly store, find, and add the lyrics of songs that you like to sing? Then head on over to [CyrusLyrics](https://apps.apple.com/us/app/cyruslyrics/id1613010334) in the App Store.")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))
                        }
                    }
                    Spacer()
                }
                .padding()
                .navigationTitle("Lucas Hints")
            }
        }
    }
}

#Preview {
    InfoSheet()
}
