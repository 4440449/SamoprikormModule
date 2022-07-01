//
//  Reducer_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 01.06.2022.
//


struct Reducer_SP {
    
    func execute(action: Action_SP, state: State_SP) -> State_SP {
        var newState = state
        switch action {
            
        case .initialLoading(let params):
            newState.cards = params.cards
            
        case .search(let params):
            newState.searchFieldText = params.text
            
        case .sendErrorMessage(let params):
            newState.errorMessage = params.description
            
        case .isLoading(let params):
            newState.isLoading = params.status
            
        case .imageLoading(let params):
            for i in 0..<newState.cards.count {
                if newState.cards[i].id == params.card.id {
                    newState.cards[i].image = params.image
                }
            }
            
        case .isLoadingImage(let params):
            for i in 0..<newState.cards.count {
                if newState.cards[i].id == params.card.id {
                    newState.cards[i].imageIsLoading = params.status
                }
            }
        case .needToReloading(let params):
            newState.needToReloading = params.status
        }
        return newState
    }
    
}
