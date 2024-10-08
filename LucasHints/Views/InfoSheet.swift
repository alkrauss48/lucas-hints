//
//  InfoSheet.swift
//  LucasHints
//
//  Created by Aaron Krauss on 8/1/24.
//

import SwiftUI

struct InfoSheet: View {
    @Binding var isPresented: Bool

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text("Welcome!")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)

                        Text("iMessage stickers included")
                            .fontWeight(.semibold)
                            .font(.system(size: 10))
                            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))

                    Text(
                        LocalizedStringKey(
                            "**Lucas Hints** is an incredibly simple app "
                            + "that helps you create fun, memorable stories "
                            + "with friends and family by kickstarting your creativity."
                            + "\n\n"
                            + "Telling your own stories can be a blast, but sometimes you need "
                            + "a little help to know what to do next."
                            + "\n\n"
                            + "**Lucas Hints** will help by giving you 3 icons across "
                            + "different categories. Want a fresh set? Just pull down "
                            + "to refresh - there's over 400,000 unique combinations "
                            + "of icons!"
                            + "\n\n"
                            + "What do the icons actually mean? That's for you to "
                            + "interpret and decide! It's easy to weave together all kinds "
                            + "of fun adventures."
                            + "\n\n"
                            + "Now get out there and have some fun, and let your "
                            + "creativity flourish!"
                        )
                    )
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 15, trailing: 0))

                    DisclosureGroup("Why was this app built?") {
                        VStack(alignment: .leading) {
                            Text(
                                LocalizedStringKey(
                                    "Hello! I'm Aaron, the creator of **Lucas Hints**. "
                                    + "Lucas is my son. I love creative storytelling with "
                                    + "my friends and family - but I know that sometimes, "
                                    + "you need a little help to get your creative flow "
                                    + "going. That's why this app exists."
                                    + "\n\n"
                                    + "It's meant to give you just enough to think (and "
                                    + "laugh) about what to do next - without telling you "
                                    + "exactly what to do. It's just a few icons, right? "
                                    + "You have to put the meaning together!"
                                    + "\n\n"
                                    + "Want to check out the app I built for my other son, "
                                    + "Cyrus, which will help you quickly store, find, and "
                                    + "add the lyrics of songs that you like to sing? Then "
                                    + "head on over to "
                                    + "[CyrusLyrics](https://apps.apple.com/us/app/cyruslyrics/id1613010334) "
                                    + "in the App Store."
                                )
                            )
                                .padding(EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0))
                        }
                    }
                    Spacer()
                }
                .padding()
                .navigationTitle("Lucas Hints")
                .toolbar {
                    Button(action: {
                        isPresented = false
                    }, label: {
                        Text("Close")
                    })
                }
            }
        }
    }
}

#Preview {
    InfoSheet(isPresented: .constant(true))
}
