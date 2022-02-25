// ScrollingBannersView.swift by Gokhan Mutlu on 24.02.2022

import SwiftUI

struct ScrollingBannersView: View {
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			
			HStack(spacing: 10) {
				BannerPanelView(bannerImage: "bannerBig01", title: "SOSYAL HESAP",
								message: "Sosyal Hesap’larını\noluşturarak sevdiklerine\npara gönder, iste.")

				BannerPanelView(bannerImage: "bannerBig02", title: "OYUN & E-PIN",
								message: "Oyun servislerine\nhızlıca para aktarın,\nvakit kaybetmeyin.")
				
			}
			
		}
	}
}

struct ScrollingBannersView_Previews: PreviewProvider {
	static var previews: some View {
		ScrollingBannersView()
			.previewLayout(.sizeThatFits)
	}
}



struct BannerPanelView: View {
	let bannerImage:String
	let title:String
	let message:String
	
	var body: some View {
		
			HStack(alignment: .center){
				Image(bannerImage)
					
				VStack(alignment:.leading) {
					Spacer()
					Text(title)
						.font(.custom("Helvetica-Bold", size: 14))
						.padding(.bottom, 10)
					
					Text(message)
						.font(.custom("Helvetica", size: 14))
						.foregroundColor(Color("inactive"))
					
					Spacer()	
					NavigationLink {
						Text("Banner \(title)")
					} label: {
						HStack {
							Spacer()
							Image("circleChevron")
						}
					}

				}
				.padding(.vertical, 20)
				.padding(.horizontal, 10)
			}
			.background(
				RoundedRectangle(cornerRadius: 10)
					.fill(Color.white)
					.padding(.top, 10)
				.clipped()
			)
			.frame(maxHeight:170)
			
			
	}
}
