//
//  ContentView.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 22.02.2022.
//
//

import SwiftUI
import Foundation


struct MainSceneView_SP: View {
    
    //MARK: - Init
    init(store: Store_SP,
         actionPool: ActionPool_SP) {
        self.store = store
        self.actionPool = actionPool
        actionPool.dispatch(params: .initialLoading)
    }
    
    //MARK: - Dependencies
    
    private let actionPool: ActionPool_SP
    @ObservedObject private var store: Store_SP
    
    //MARK: - State
    
    @State private var isDisplayingErrorAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: - Body
    
    var body: some View {
        //        NavigationView {
            ZStack {
                Color("background", bundle: nil)
                    .ignoresSafeArea(.all, edges: .all)
                ScrollView {
                    ZStack {
                        Color.clear
                            .frame(height: UIScreen.main.bounds.height * 0.2,
                                   alignment: .center)
                        VStack(alignment: .center) {
                            if store.state.isLoading {
                                ProgressView()
                                    .progressViewStyle(.circular)
                                    .scaleEffect(1.3)
                            }
                            if (store.state.needToReloading && !store.state.isLoading) {
                                Button {
                                    actionPool.dispatch(params: .initialLoading)
                                } label: {
                                    Image(systemName: "arrow.clockwise")
                                        .scaleEffect(1.4)
                                        .foregroundColor(Color.primary)
                                }
                            }
                        }
//                        .frame(height: UIScreen.main.bounds.height*0.6,
//                               alignment: .center)
                        VStack {
                            ForEach(store.state.cards.filter({
                                $0.title.contains(store.state.searchFieldText.capitalized)
                                ||
                                store.state.searchFieldText.isEmpty
                            })) { card in
                                NavigationLink (destination: {
                                    DetailSceneConfigurator_SP.configure(card: card)
                                }, label: {
                                    CardView_SP(product: card, actionPool: actionPool)
                                })
                                    .buttonStyle(PlainButtonStyle())
                            }
                            .padding(.bottom, 10)
                        }
                    }
                }
            }
//            .navigationTitle("Продукты")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button {
//                        presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Image(systemName: "chevron.down")
//                            .foregroundColor(.primary)
//                    }
//                }
//            }
//        }
//        }
//        .navigationViewStyle(.stack)
//        .searchable(text: $txtField,
//                    placement: .navigationBarDrawer(displayMode: .always),
//                    prompt: "Искать продукт")
//        .onChange(of: txtField,
//                  perform: { newTxt in
//            actionPool.dispatch(params: .search(newTxt))
//        })
        .alert(isPresented: $isDisplayingErrorAlert) {
            Alert(title: Text("Ошибка"),
                  message: Text(store.state.errorMessage),
                  dismissButton: .cancel(Text("Закрыть"),
                                         action: {
                actionPool.dispatch(params: .hideAlert)
            }))
        }
        .onChange(of: store.state.errorMessage) { errorMessage in
            guard !errorMessage.isEmpty else { return }
            print("onChange")
            isDisplayingErrorAlert = true
        }
    }
}
