//
//  ResourceLoader.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 5.10.2020.
//

import Foundation

class ResourceLoader {
    static let decoder = JSONDecoder()
    static let bundle = Bundle.main
    
    public static func loadTaskList(from jsonFile: String) throws -> [TaskModel]? {
        let url = try bundle.url(forResource: jsonFile, withExtension: "json")
        let data = try Data(contentsOf: url!)
        let taskList: [TaskModel]? = try? decoder.decode([TaskModel].self, from: data)
        return taskList
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
