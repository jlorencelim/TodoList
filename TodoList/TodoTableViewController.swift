//
//  TodoTableViewController.swift
//  TodoList
//
//  Created by Lorence Lim on 12/01/2018.
//  Copyright © 2018 jlorencelim. All rights reserved.
//

import UIKit
import Stylish
import PopupDialog
import UIColor_Hex_Swift

class TodoTableViewController: UITableViewController {
    
    var todoList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoTableViewCell
        
        cell.titleLabel.text = todoList[indexPath.row]

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let title = "DELETE"
            let message = "Are you sure you want to delete this item?"
            
            let popup = PopupDialog(title: title,
                                    message: message,
                                    buttonAlignment: .horizontal,
                                    transitionStyle: .zoomIn,
                                    gestureDismissal: true)
            
            let defaultButton = DefaultButton.appearance()
            defaultButton.titleColor = UIColor("#ff0000")
            
            let buttonCancel = CancelButton(title: "CANCEL", action: nil)
            let buttonDelete = DefaultButton(title: "DELETE") {
                self.todoList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }

            popup.addButtons([buttonCancel, buttonDelete])
            
            self.present(popup, animated: true, completion: nil)
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onAddTodoPressed(_ sender: UIBarButtonItem) {
        let addTodoDialogVC = AddTodoDialogViewController(nibName: "AddTodoDialog", bundle: nil)
        
        let popup = PopupDialog(viewController: addTodoDialogVC,
                                buttonAlignment: .horizontal,
                                transitionStyle: .bounceDown,
                                gestureDismissal: true)
        
        let buttonCancel = CancelButton(title: "CANCEL", action: nil)
        let buttonAdd = DefaultButton(title: "ADD", height: 60) {
            self.todoList.append(addTodoDialogVC.todoTextField.text!)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        popup.addButtons([buttonCancel, buttonAdd])
        
        present(popup, animated: true, completion: nil)
    }
    
}


extension UIView {
    open override func prepareForInterfaceBuilder() {
        Stylish.stylesheet = Default()
    }
}
extension StyleableUIView {
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}
