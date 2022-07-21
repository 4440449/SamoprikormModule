//
//  CustomSearchNavigationBar_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 18.07.2022.
//

import SwiftUI


struct MainSceneNavigationView_SP: UIViewControllerRepresentable {
    
    //MARK: - Dependencies

    private let contentView: MainSceneView_SP
    private let actionPool: ActionPool_SP
    
    //MARK: - Init
    
    init(contentView: MainSceneView_SP,
         actionPool: ActionPool_SP) {
        self.contentView = contentView
        self.actionPool = actionPool
    }
    
    //MARK: - Representable
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let rootVC = UIHostingController (rootView: contentView)
        let controller = MainSceneNavigationController_SP(
            searchBarDelegate: context.coordinator,
            rootViewController: rootVC)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        uiViewController.view.setNeedsDisplay()
    }
    
    func makeCoordinator() -> Coordinator {
        return MainSceneNavigationView_SP.Coordinator(actionPool: actionPool)
    }
    
    
    final class Coordinator: NSObject, UISearchBarDelegate {
        
        private let actionPool: ActionPool_SP
        
        init(actionPool: ActionPool_SP) {
            self.actionPool = actionPool
        }
                
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            actionPool.dispatch(params: .search(searchText))
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            actionPool.dispatch(params: .search(""))
        }
    }
        
}


//MARK: - Raw navigation controller

final class MainSceneNavigationController_SP: UINavigationController {
    
    // MARK: - Dependencies
    
    private let searchBarDelegate: UISearchBarDelegate

    // MARK: - Init
    
     init(searchBarDelegate: UISearchBarDelegate,
          rootViewController: UIViewController) {
        self.searchBarDelegate = searchBarDelegate
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.topItem?.searchController = searchController
        viewControllers.first?.navigationItem.leftBarButtonItem = closeButton
        setupInititalUI()
    }

    // MARK: - Property
    
    private lazy var closeButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.down"),
                                     style: .plain,
                                     target: self,
                                     action: #selector(closeButtonTapped))
        button.tintColor = .label
        return button
    }()
    
    @objc private func closeButtonTapped() {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    private lazy var searchController: UISearchController = {
        let controller = UISearchController()
        controller.searchBar.placeholder = "Искать продукт"
        controller.searchBar.setValue("Отмена", forKey: "cancelButtonText")
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.delegate = searchBarDelegate
        return controller
    }()
    
    // MARK: - Initital UI
    
    private func setupInititalUI() {
        self.navigationBar.topItem?.title = "Продукты"
        self.navigationBar.prefersLargeTitles = true
        self.navigationBar.standardAppearance.largeTitleTextAttributes = [.font : UIFont(name: "Montserrat-Black", size: 34)!]
        self.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
    }
        
}
