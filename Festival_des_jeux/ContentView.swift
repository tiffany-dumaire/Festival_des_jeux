//
//  ContentView.swift
//  Festival_des_jeux
//
//  Created by user188898 on 3/21/21.
//

import SwiftUI

struct Response: Codable{
    var results = [FestivalData]()
}

struct FestivalData: Codable{
    var nomFestival : String
    var annee : Int
}

struct ContentView: View {
    @State private var results = [FestivalData]()
    
    func loadData(url: String){
        
        guard let lien = URL(string:url) else {return}
        let request = URLRequest(url:lien)
        URLSession.shared.dataTask(with:request){
            data,response,error in
            if let data = data{
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from:data){
                    DispatchQueue.main.async{
                        self.results = decodedResponse.results
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
        var jeux = [Jeu(id: 1, nomJeu: "Jeu1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 3, duree: 10, lienNotice: URL(string: "https://www.google.com")!, typeJeu: "Famille", editeur: "Editeur"),Jeu(id: 2, nomJeu: "Jeu2", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 3, duree: 10, lienNotice: URL(string: "https://www.google.com")!, typeJeu: "Famille", editeur: "Editeur"),Jeu(id: 3, nomJeu: "Jeu3", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 3, duree: 10, lienNotice: URL(string: "https://www.google.com")!, typeJeu: "Famille", editeur: "Editeur")]
    //loadData(url: "backend-festival-app.herokuapp.com/festival/last")
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    HStack{
                        Spacer()
                        Image("logo")
                        .resizable()
                        .frame(minWidth: 120, idealWidth: 120, maxWidth: 120, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .top)
                    }
                    HStack{
                    Text("Festival : \n").bold()
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                    }
                    List(results,id: \.nomFestival){
                        item in
                            Text(item.nomFestival).bold()
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                    }
                    HStack{
                        NavigationLink(
                            destination: ListeJeuxFestival(listeJeuxFestival: ListeJeuxFestivalVM(jeux)),
                            label: {
                                Text("Liste des jeux du Festival")
                                    .bold()
                            }).padding()
                            .background(Color.blue)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    HStack{
                        NavigationLink(
                            destination: ListeJeuxZone(),
                            label: {
                                Text(" Liste des jeux par Zone ")
                                    .bold()
                            }).padding()
                            .background(Color.blue)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                        
                    }
                    Spacer()
                    HStack{
                        NavigationLink(
                            destination: ListeJeuxEditeur(),
                            label: {
                                Text("Liste des jeux par Editeur")
                                    .bold()
                            }).padding()
                            .background(Color.blue)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }.background(
                    Image("backgroundStartView")
                        .resizable()
                        .scaledToFill()
                        .clipped()
                    )
                .edgesIgnoringSafeArea(.all)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
