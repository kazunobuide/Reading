//
//  Task.swift
//  reading
//
//  Created by 井手和宣 on 2021/01/09.
//

import RealmSwift


class Task: Object {
    // 管理用 ID。プライマリーキー
    @objc dynamic var id = 0

    // タイトル
    @objc dynamic var title = ""

    // 内容
    @objc dynamic var contents = ""
    
    // メモ
    @objc dynamic var label1 = ""
    @objc dynamic var label2 = ""
    @objc dynamic var label3 = ""
    @objc dynamic var label4 = ""
    @objc dynamic var label5 = ""
    @objc dynamic var label6 = ""
    @objc dynamic var label7 = ""
    @objc dynamic var label8 = ""
    @objc dynamic var label9 = ""
    @objc dynamic var label10 = ""
    
    // まとめ
    @objc dynamic var summarize = ""
    
    // 日時
    @objc dynamic var date = Date()

    // id をプライマリーキーとして設定
    override static func primaryKey() -> String? {
        return "id"
    }
}
