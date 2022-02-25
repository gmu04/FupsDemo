// ContentView.swift by Gokhan Mutlu on 24.02.2022

import SwiftUI

struct ContentView: View {
    var body: some View {
		VStack {
			Image("fups")
				.padding()
			Text("Home scene")
				.font(.largeTitle)
				.padding()
			
			Spacer()
			
#if DEBUG
			Divider()
			Text("Back navigation button shows for testing")
				.font(.caption)
				.foregroundColor(.secondary)
				.italic()
#endif
			
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
