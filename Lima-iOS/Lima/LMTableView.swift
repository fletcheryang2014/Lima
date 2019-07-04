//
//  LMTableView.swift
//  Lima
//
//  Created by yangyi on 2019/7/2.
//  Copyright © 2019 Lima. All rights reserved.
//

import UIKit

public class LMTableView: UITableView {
    
    public var data: [Any] = [] {
        didSet {
            reloadData()
        }
    }
    public var configure: (Any) -> LMTableViewCell
    public var select: ((IndexPath) -> Void)?

    public init<T>(style: UITableView.Style = .plain,
         _ data: @autoclosure () -> [T]? = nil,
         _ configure: @escaping (T) -> LMTableViewCell,
         select: ((IndexPath) -> Void)? = nil,
         with: ((LMTableView) -> Void)? = nil) {
        
        self.configure = { data in
            configure(data as! T)
        }
        self.select = select
        
        super.init(frame: .zero, style: style)
        
        if let d = data() {
            self.data = d
        }
        
        dataSource = self
        delegate = self
        
        with?(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LMTableView: UITableViewDataSource, UITableViewDelegate {

    //MARK: UITableViewDataSource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: "LMTableViewCell")
//        if cell == nil {
//            cell = self.cell()
//        }
        let data = self.data[indexPath.row]
        return configure(data)
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        select?(indexPath)
    }
}
