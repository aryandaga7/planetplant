import SwiftUI
import FirebaseAuth
import FirebaseFirestore


// add all methods in here
class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var username: String = ""
    @Published var cards: [String] = []

    private let db = Firestore.firestore()

    init() {
        listenForAuthChanges()

        if let userId = user?.uid {
            fetchUserName(userId: userId)
            fetchCards(userId: userId)
        }
    }

    func listenForAuthChanges() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.user = user

            if let userId = user?.uid {
                self.fetchUserName(userId: userId)
                self.fetchCards(userId: userId)
            }
        }
    }
    
    
    /*
     func fetchUserName(userId: String) {
         let user = db.getUserId
         if !user.exists(db.collection("users").document(userId)
        
     }
     */

    func fetchUserName(userId: String) {
        let docRef = db.collection("users").document(userId)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists, let data = document.data() {
                self.username = data["username"] as? String ?? ""
            } else {
                print("Document does not exist")
            }
        }
    }

    // Yotube one not working for signin sign out. It is for old ios
    func signUp(email: String, password: String, username: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            } else {
                self.user = result?.user
                if let userId = self.user?.uid {
                    self.saveUserName(userId: userId, newName: username)
                }
                completion(true)
            }
        }
    }


    func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [self] result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
            } else {
                self.user = result?.user
                if let userId = self.user?.uid {
                    fetchUserName(userId: userId)
                    fetchCards(userId: userId)
                }
                completion(true)
            }
        }
    }
    
    //problem where after signing out and then if try to sign up you go into the person who last logged in
    //maybe make bool flag to see if user actually logged oyt
    func signOut() {
        try? Auth.auth().signOut()
        user = nil
    }
    
    // This function is no longer needed as we are saving the username at sign up.
    func updateUserName(newName: String) {
            guard let userId = user?.uid else { return }
            saveUserName(userId: userId, newName: newName)
        }

        func saveUserName(userId: String, newName: String) {
            let docRef = db.collection("users").document(userId)
            docRef.setData(["username": newName], merge: true) { error in
                if let error = error {
                    print("Error updating username: \(error.localizedDescription)")
                } else {
                    print("Username updated successfully")
                    self.username = newName
                }
            }
        }
    
    func fetchCards(userId: String) {
        let docRef = db.collection("users").document(userId)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists, let data = document.data() {
                self.cards = data["cards"] as? [String] ?? []
            } else {
                print("Document does not exist")
            }
        }
    }

    func saveCards(userId: String, cards: [String]) {
        let docRef = db.collection("users").document(userId)
        docRef.setData(["cards": cards], merge: true) { error in
            if let error = error {
                print("Error updating cards: \(error.localizedDescription)")
            } else {
                print("Cards updated successfully")
            }
        }
    }
    
    func addCard(type: String) {
        guard let userId = user?.uid else { return }
        cards.append(type)
        saveCards(userId: userId, cards: cards)
    }
    

}
