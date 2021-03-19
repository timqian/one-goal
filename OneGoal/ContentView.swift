import SwiftUI
import Combine

struct ContentView: View {
    var item: NSStatusItem!
    var popover: NSPopover!
    var icon: String
    @State private var newIcon: String = "⛳️"
    @State private var goalTxt: String = ""

    
    let strengths = ["⛳️", "", "🎯", "⭕️", "🛑","🚩","📌","💣 ","🧨","🏮","🎁","🎈"," 🎏", "🛎","💰","💡","🚀", "⭐️", "🌟", "💫", "✨", "⚡️", "🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "⚫️", "⚪️", "🟤", "❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝", "😜", "🤪", "🤨", "🧐", "🤓", "😎", "🤩", "🥳", "😏", "😒", "😞", "😔", "😟", "😕", "🙁", "☹️", "😣", "😖", "😫", "😩", "🥺", "😢", "😭", "😤", "😠", "😡", "🤬", "🤯", "😳", "🥵", "🥶", "😱", "😨", "😰", "😥", "😓", "🤗", "🤔", "🤭", "🤫", "🤥", "😶", "😐", "😑", "😬", "🙄", "😯", "😦", "😧", "😮", "😲", "🥱", "😴", "🤤", "😪", "😵", "🤐", "🥴", "🤢", "🤮", "🤧", "😷", "🤒", "🤕", "🤑", "🤠", "😈", "👿", "👹", "👺", "🤡", "💩", "👻", "💀", "☠️", "👽", "👾", "🤖", "🎃", "😺", "😸", "😹", "😻", "😼", "😽", "🙀", "😿", "😾", "👋", "🤚", "🖐", "✋", "🖖", "👌", "🤏", "✌️", "🤞", "🤟", "🤘", "🤙", "👈", "👉", "👆", "🖕", "👇", "☝️", "👍", "👎", "✊", "👊", "🤛", "🤜", "👏", "🙌", "👐", "🤲", "🤝", "🙏", "✍️", "🦴", "👀", "👁", "👅", "👄", "💋", "🩸",  "💅", "👓", "🕶",  "💍", "🐲", "🌵", "🌱", "☘️", "🍄", "🌼", "🌻", "🌞", "🌝", "🌚", "🔑", "🪑", "🛒", "🎀", "🎊", "🎉", "🎎", "🎐", "🧧", "✉️", "📎", "🧮", "📍", "✂️", "✏️", "🔎", "🔒", "🔊", "📣"]

    var body: some View {
        HStack {
            if #available(OSX 11.0, *) {
                Picker("", selection: $newIcon) {
                    ForEach(strengths, id: \.self) {
                        Text($0)
                    }
                }
                .onReceive(Just(newIcon)) { newIcon in
                    if let button = item.button {
                        button.title = newIcon + " " + goalTxt
                    }
                }
                .frame(width: 60, alignment: .center)
                .pickerStyle(DefaultPickerStyle())
                .accentColor(.gray)
                .padding(0)
            } else {
                // Fallback on earlier versions
                Picker("", selection: $newIcon) {
                    ForEach(strengths, id: \.self) {
                        Text($0)
                    }
                }
                .onReceive(Just(newIcon)) { newIcon in
                    if let button = item.button {
                        button.title = newIcon + " " + goalTxt
                    }
                }
                .frame(width: 60, alignment: .center)
                .pickerStyle(DefaultPickerStyle())
                .padding(0)
            }

            TextField(
                "My one and only goal currently",
                text: $goalTxt,
                onCommit: {
                    popover.performClose("")
                }
            )
            .onReceive(Just(goalTxt)) { goalTxt in
                if let button = item.button {
                    button.title = newIcon + " " + goalTxt
                }
            }
            .padding(.trailing, 5)
            
        }
        .padding(15)
    }

}

