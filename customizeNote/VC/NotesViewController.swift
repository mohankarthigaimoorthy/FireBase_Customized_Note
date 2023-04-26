import UIKit
import Firebase

class NotesViewController: ViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    
//    var notes: [Note] = [Note]()
    
    let notesVM = NotesViewModel()
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        NotificationCenter.default.addObserver(self, selector: #selector(getUsersCollection), name: Notification.Name("UpdateData"), object: nil)
        //        // Set up the table view
        //        tableView.dataSource = self
        //
        //        // Load the notes from the database
        //        readNotes()
    }
    
    private func setupUI() {
        self.navigationItem.setHidesBackButton(true, animated: true)
        let btnLogout = UIBarButtonItem(title: "Logout", style: .plain,target:  self,action: #selector(logout))
        self.navigationItem.leftBarButtonItem = btnLogout
        setupTableview()
        getUsersCollection()
    }
    
    @objc private func getUsersCollection() {
        notesVM.getUsersCollection { (success, msg) in
            DispatchQueue.main.async {
                if success {
                    self.tableView.reloadData()
                    
                }
                else {
                    self.alert(message: msg)
                }
            }
        }
    }
    
    private  func setupTableview() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NoteCell", bundle: nil), forCellReuseIdentifier: "NoteCell")
    }
    
    @objc func logout() {
        do {
            try Auth.auth().signOut()
            DLog("Sign out successfully")
            self.navigationController?.popToRootViewController(animated: true)
        }
        catch {
            DLog("Sign out error")
        }
    }
    // MARK: - Actions
    
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource {
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           notesVM.arrUsers.count
        }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell") as? NoteCell  else {return UITableViewCell()}
        
        cell.titleLabel.text = notesVM.arrUsers[indexPath.row].noteTitle
        cell.NoteLabel.text = notesVM.arrUsers[indexPath.row].noteDescription
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "updateViewController") as? updateViewController
        vc?.userInfo = notesVM.arrUsers[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [self] _,_, completionHandler in
            notesVM.arrUsers.remove(at: indexPath.row)
            self.tableView.reloadData()
            completionHandler(true)
        }
        deleteAction.backgroundColor = .systemCyan
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
//        guard let id = note.id else {
//          completion(NSError(domain: "com.example.notes", code: 0, userInfo: [
//              NSLocalizedDescriptionKey: "Note ID is missing."
//          ]))
//          return
//      }
//      notesCollection.document(id).delete { error in
//          completion(error)
//      }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
