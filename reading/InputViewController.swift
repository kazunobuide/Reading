//
//  InputViewController.swift
//  reading
//
//  Created by 井手和宣 on 2021/01/09.
//

import UIKit
import RealmSwift

class InputViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextField: UITextField!
    @IBOutlet weak var summarizeTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label1TextField: UITextField!
    let realm = try! Realm()
    var task: Task!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 背景をタップしたらdismissKeyboardメソッドを呼ぶように設定する
                let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(dismissKeyboard))
                self.view.addGestureRecognizer(tapGesture)

                titleTextField.text = task.title
                contentsTextField.text = task.contents
        //まとめを追加
                summarizeTextField.text = task.summarize
                label1TextField.text = task.label1
                datePicker.date = task.date
            }

            @objc func dismissKeyboard(){
                // キーボードを閉じる
                view.endEditing(true)
            }
    // 追加する
        override func viewWillDisappear(_ animated: Bool) {
            try! realm.write {
                self.task.title = self.titleTextField.text!
                self.task.contents = self.contentsTextField.text!
                self.task.date = self.datePicker.date
                //まとめ他を追加
                self.task.summarize = self.summarizeTextField.text!
                self.task.label1 = self.label1TextField.text!
                self.realm.add(self.task, update: .modified)
            }

            super.viewWillDisappear(animated)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
