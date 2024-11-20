//
//  AuthViewModel.swift
//  GMart
//
//  Created by Gowrisankar Samy on 19/11/24.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


protocol AuthenticationFormProtocal {
    var formIsValid: Bool {get}
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        Task{
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, Password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: Password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: failed to login with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, Password: String, fullName: String) async throws{
        print("create user Clicked")
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: Password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullname: fullName, email: email)
            let encodeduser =  try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodeduser)
            await fetchUser()
            
        } catch {
            print("Debug faile to creat user with error : \(error.localizedDescription)")
        }
        
    }
    
    func signOut() {
        do{
            try Auth.auth().signOut()   /* Sign out the user on Backend */
            self.userSession = nil    /* clear the user session and takes to the login */
            self.currentUser = nil   /* clear out current user data model*/
        } catch{
            print("DEBUG: failed to signout the user \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uId = Auth.auth().currentUser?.uid else { return }
        
        guard  let snapShot = try? await Firestore.firestore().collection("users").document(uId).getDocument() else { return }
        self.currentUser = try? snapShot.data(as: User.self)
        
        print("Debug current user is \(String(describing: self.currentUser))")
    }
    
}
