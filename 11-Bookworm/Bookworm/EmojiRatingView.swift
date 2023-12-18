//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Kevin Pfefferle on 12/17/23.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int

    var body: some View {
        switch rating {
        case 1:
            Text("☹️")
                .accessibilityRepresentation {
                    Text("1")
                }
        case 2:
            Text("😕")
                .accessibilityRepresentation {
                    Text("2")
                }
        case 3:
            Text("🙂")
                .accessibilityRepresentation {
                    Text("3")
                }
        case 4:
            Text("😄")
                .accessibilityRepresentation {
                    Text("4")
                }
        default:
            Text("🤯")
                .accessibilityRepresentation {
                    Text("5")
                }
        }
    }
}

#Preview {
    EmojiRatingView(rating: 3)
}
