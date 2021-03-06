import SwiftUI
import Combine

struct ContentView: View {
    var item: NSStatusItem!
    var popover: NSPopover!
    var icon: String
    @State private var newIcon: String = "โณ๏ธ"
    @State private var goalTxt: String = ""

    
    let strengths = ["โณ๏ธ", "", "๐ฏ", "โญ๏ธ", "๐","๐ฉ","๐","๐ฃ ","๐งจ","๐ฎ","๐","๐"," ๐", "๐","๐ฐ","๐ก","๐", "โญ๏ธ", "๐", "๐ซ", "โจ", "โก๏ธ", "๐ด", "๐ ", "๐ก", "๐ข", "๐ต", "๐ฃ", "โซ๏ธ", "โช๏ธ", "๐ค", "โค๏ธ", "๐งก", "๐", "๐", "๐", "๐", "๐ค", "๐ค", "๐ค", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐คฃ", "โบ๏ธ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐ฅฐ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "๐คช", "๐คจ", "๐ง", "๐ค", "๐", "๐คฉ", "๐ฅณ", "๐", "๐", "๐", "๐", "๐", "๐", "๐", "โน๏ธ", "๐ฃ", "๐", "๐ซ", "๐ฉ", "๐ฅบ", "๐ข", "๐ญ", "๐ค", "๐ ", "๐ก", "๐คฌ", "๐คฏ", "๐ณ", "๐ฅต", "๐ฅถ", "๐ฑ", "๐จ", "๐ฐ", "๐ฅ", "๐", "๐ค", "๐ค", "๐คญ", "๐คซ", "๐คฅ", "๐ถ", "๐", "๐", "๐ฌ", "๐", "๐ฏ", "๐ฆ", "๐ง", "๐ฎ", "๐ฒ", "๐ฅฑ", "๐ด", "๐คค", "๐ช", "๐ต", "๐ค", "๐ฅด", "๐คข", "๐คฎ", "๐คง", "๐ท", "๐ค", "๐ค", "๐ค", "๐ค ", "๐", "๐ฟ", "๐น", "๐บ", "๐คก", "๐ฉ", "๐ป", "๐", "โ ๏ธ", "๐ฝ", "๐พ", "๐ค", "๐", "๐บ", "๐ธ", "๐น", "๐ป", "๐ผ", "๐ฝ", "๐", "๐ฟ", "๐พ", "๐", "๐ค", "๐", "โ", "๐", "๐", "๐ค", "โ๏ธ", "๐ค", "๐ค", "๐ค", "๐ค", "๐", "๐", "๐", "๐", "๐", "โ๏ธ", "๐", "๐", "โ", "๐", "๐ค", "๐ค", "๐", "๐", "๐", "๐คฒ", "๐ค", "๐", "โ๏ธ", "๐ฆด", "๐", "๐", "๐", "๐", "๐", "๐ฉธ",  "๐", "๐", "๐ถ",  "๐", "๐ฒ", "๐ต", "๐ฑ", "โ๏ธ", "๐", "๐ผ", "๐ป", "๐", "๐", "๐", "๐", "๐ช", "๐", "๐", "๐", "๐", "๐", "๐", "๐งง", "โ๏ธ", "๐", "๐งฎ", "๐", "โ๏ธ", "โ๏ธ", "๐", "๐", "๐", "๐ฃ"]

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

