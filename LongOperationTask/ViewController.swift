//
//  ViewController.swift
//  LongOperationTask
//
//  Created by Eslam Abotaleb on 18/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var taskTableView: UITableView!
    var tasksName = [String]()
    var typeTask = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
        
    }
    
    
    @IBAction func taskOneAction(_ sender: Any) {
        
        executeMultipleTasks()
        RunLoop.current.run(mode: RunLoop.Mode.default,  before: Date(timeIntervalSinceNow:1))
        typeTask = "\("".printTimestamp()) Task 1"
        self.tasksName.append(typeTask)
        
    }
    
    @IBAction func taskTwoAction(_ sender: Any) {
        executeMultipleTasks()
        RunLoop.current.run(mode: RunLoop.Mode.default,  before: Date(timeIntervalSinceNow: 2))
        typeTask = "\("".printTimestamp()) Task 2"
        self.tasksName.append(typeTask)
        
        
    }
    
    @IBAction func taskThreeAction(_ sender: Any) {
        executeMultipleTasks()
        RunLoop.current.run(mode: RunLoop.Mode.default,  before: Date(timeIntervalSinceNow: 3))
        typeTask = "\("".printTimestamp()) Task 3"
        self.tasksName.append(typeTask)
        
    }
    
    @IBAction func taskFourAction(_ sender: Any) {
        executeMultipleTasks()
        RunLoop.current.run(mode: RunLoop.Mode.default,  before: Date(timeIntervalSinceNow: 4))
        
        typeTask = "\("Task 4".printTimestamp()) Task 4"
        self.tasksName.append(typeTask)
        
    }
    
    @IBAction func clearAllTasks(_ sender: Any) {
        self.tasksName.count == 0 ? print("Not there tasks") :
        self.tasksName.removeAll()
        reloadData()
    }
    
    func executeMultipleTasks() {
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)
        
        let semaphore = DispatchSemaphore(value: 1)
        
            queue.async {
                _ = semaphore.wait(timeout: DispatchTime.distantFuture)
                print("Queue \(self.typeTask):")
                semaphore.signal()
            }
        reloadData()
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.taskTableView.reloadData()
        }
    }
}

//Extension TablbView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = self.tasksName[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksName.count
    }
}
