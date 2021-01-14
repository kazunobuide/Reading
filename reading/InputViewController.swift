//
//  InputViewController.swift
//  reading
//
//  Created by 井手和宣 on 2021/01/09.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController, UITextFieldDelegate  {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextField: UITextField!
    @IBOutlet weak var summarizeTextField: UITextField!
    //(著者名を追加)
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label1TextField: UITextField!
    @IBOutlet weak var label2TextField: UITextField!
    @IBOutlet weak var label3TextField: UITextField!
    @IBOutlet weak var label4TextField: UITextField!
    @IBOutlet weak var label5TextField: UITextField!
    @IBOutlet weak var label6TextField: UITextField!
    @IBOutlet weak var label7TextField: UITextField!
    @IBOutlet weak var label8TextField: UITextField!
    @IBOutlet weak var label9TextField: UITextField!
    @IBOutlet weak var label10TextField: UITextField!
    
    
    let realm = try! Realm()
    var task: Task!
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        summarizeTextField.delegate = self
        
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        titleTextField.text = task.title
        contentsTextField.text = task.contents
        //まとめを追加
        summarizeTextField.text = task.summarize
        //著者名を追加
        authorTextField.text = task.author
        label1TextField.text = task.label1
        label2TextField.text = task.label2
        label3TextField.text = task.label3
        label4TextField.text = task.label4
        label5TextField.text = task.label5
        label6TextField.text = task.label6
        label7TextField.text = task.label7
        label8TextField.text = task.label8
        label9TextField.text = task.label9
        label10TextField.text = task.label10
        datePicker.date = task.date
    }
    
    @objc func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        try! realm.write {
            self.task.title = self.titleTextField.text!
            self.task.contents = self.contentsTextField.text!
            self.task.date = self.datePicker.date
            //まとめ他を追加
            self.task.summarize = self.summarizeTextField.text!
            //著者名を追加
            self.task.author = self.authorTextField.text!
            self.task.label1 = self.label1TextField.text!
            self.task.label2 = self.label2TextField.text!
            self.task.label3 = self.label3TextField.text!
            self.task.label4 = self.label4TextField.text!
            self.task.label5 = self.label5TextField.text!
            self.task.label6 = self.label6TextField.text!
            self.task.label7 = self.label7TextField.text!
            self.task.label8 = self.label8TextField.text!
            self.task.label9 = self.label9TextField.text!
            self.task.label10 = self.label10TextField.text!
            
            self.realm.add(self.task, update: .modified)
        }
        
        super.viewWillDisappear(animated)
    }
    
    
    
    
    // Do any additional setup after loading the view.
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
