//
//  EditeurView.swift
//  Festival_des_jeux
//
//  Created by user184780 on 4/2/21.
//

import SwiftUI

struct EditeurView: View {
    let editeur : Editeur
    let jeux : [Jeu]
    
    init(editeur:Editeur,jeux:[Jeu]){
        self.editeur = editeur
        self.jeux = jeux
    }
    
    func listeJeux() -> [AnyView]{
        var res:[AnyView] = []
        if self.jeux.count>0{
            for j in self.jeux{
                let cur = AnyView(
                NavigationView{
                    VStack{
                        HStack{
                            Text("Nom du jeu : \(j.nomJeu)")
                            .foregroundColor(.green)
                                .bold()
                            .font(.title)
                            Spacer()
                        }
                        Spacer()
                        HStack{
                            Text("Nombre de joueurs:")
                                .bold()
                            Text("\(j.nbJoueurMin) à \(j.nbJoueurMax)")
                            Spacer()
                        }
                        HStack{
                            Text("Age minimum requis :")
                                .bold()
                            Text("\(j.ageMin)")
                            Spacer()
                        }
                        HStack{
                            Text("Durée du jeu :")
                                .bold()
                            Text("\(j.duree) minutes")
                            Spacer()
                        }
                        HStack{
                            Text("Nom Editeur: ")
                                .bold()
                            Text("\(j.editeur)")
                            Spacer()
                        }
                        HStack{
                            Text("Type du Jeux : ")
                                .bold()
                            Text("\(j.typeJeu)")
                            Spacer()
                        }
                        Spacer()
                        VStack{
                            HStack{
                                Text("Lien vers la notive :")
                                    .bold()
                                Spacer()
                            }
                            HStack{
                                if(j.lienNotice == ""){
                                    Text("Aucune notice renséignée")
                                }else{
                                    Text("\(j.lienNotice)")
                                }
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                })
                res.append(cur)
            }
        }else{
            res.append(AnyView(Text("Pas de jeux trouvés")))
        }
        return res
    }
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Spacer()
                    Image("logo")
                    .resizable()
                    .frame(minWidth: 120, idealWidth: 120, maxWidth: 120, minHeight: 90, idealHeight: 90, maxHeight: 90, alignment: .top)
                }
                HStack{
                    var listeJeu = listeJeux()
                    CarouselView(carouselLocation: 0, itemHeight: 350, views: listeJeu)
                }
                Spacer()
            }.background(
                Image("new")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                )
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct EditeurView_Previews: PreviewProvider {
    static var e1 : Editeur = Editeur(idEditeur: 1, nomEditeur: "Editeur 1")
    static var j1 : Jeu = Jeu(id: 1, nomJeu: "Jeu 1", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur")
    static var j2 : Jeu = Jeu(id: 2, nomJeu: "Jeu 2", nbJoueurMin: 1, nbJoueurMax: 2, ageMin: 5, duree: 20, lienNotice: "", typeJeu: "Famille", editeur: "Editeur")
    static var jeux : [Jeu] =  [j1,j2]
    static var previews: some View {
        EditeurView(editeur: e1, jeux: jeux)
    }
}
