//
//  PostsViewModel.swift
//  TestSymphony
//
//  Created by Raed MEZRAOUI on 19-10-19.
//  Copyright © 2019 Raed MEZRAOUI. All rights reserved.
//

import Foundation

class PostsViewModel {
    
    // MARK: - Properties
    
    private var router: PostsRouter.Routes?
    private var author: Author
    
    // MARK: -
    
    var posts: Box<[Post]> = Box([Post]())
    let errorMessage: Box<String> = Box(String())
    
    // MARK: - Init
    
    init(router: PostsRouter.Routes, author: Author) {
        self.router = router
        self.author = author
    }
    
    // MARK: - Public Inerfaces
    
    var rowsCount: Int {
        return posts.value.count
    }
    
    var authorsFirstName: String {
        let firstName = author.name.split(separator: " ").first
        return String(firstName ?? "")
    }
    
    // MARK: - Functions
    
    func authorViewModel() -> AuthorCellViewModel {
        return AuthorCellViewModel(author: author)
    }
    
    func postViewModel(atIndex index: Int) -> PostCellViewModel {
        return PostCellViewModel(post: posts.value[index])
    }
    
    // MARK: - Routing
    
    func openPostsComments(atIndex index: Int) {
        router?.openComments(ofPost: posts.value[index])
    }
}

// MARK: - Requests

extension PostsViewModel {
    
    func fetchPosts() {
        
        PostsServices().fetchPosts(ofAuthor: author) { (result, _) in
            
            switch result {
            case .success(let posts):
                self.posts.value = posts?.sorted (by: { $0.date < $1.date }) ?? [Post]()
            case .failure(let error):
                print("Error \(error.localizedDescription)")
                self.errorMessage.value = error.localizedDescription
            }
        }
    }
}
