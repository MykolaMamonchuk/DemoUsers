//
//  ExtUserDefaults.swift
//  DemoUserList
//
//  Created by MMU on 09.11.2022.
//

import Foundation
extension UserDefaults {
    func saveNSUDByKey(value: String, key: String) {
        set(value, forKey: key)
        synchronize()
    }

    func getNSUDByKey(key: String, _ defaultReturn: String = "") -> String {
        guard let obj = object(forKey: key) as? String else { return defaultReturn }
        return obj
    }

    func saveIntNSUDByKey(value: Int, key: String) {
        set(value, forKey: key)
        synchronize()
    }

    func getIntNSUDByKey(key: String, _ defaultReturn: Int? = nil) -> Int? {
        guard let obj = object(forKey: key) as? Int else { return defaultReturn }
        return obj
    }

    func saveNSUDAnyByKey(value: Any, key: String) {
        set(value, forKey: key)
        synchronize()
    }

    func getNSUDAnyByKey(key: String) -> Any? {
        return object(forKey: key)
    }

    func removeNSUDByKey(key: String) {
        removeObject(forKey: key)
        synchronize()
    }

    /**

     - parameters:
     Any?, String

     An example of using a *function*
     ````
     class Wow: NSObject, NSCoding {
     override init() {
     super.init()
     }

     init(name: String) {
     self.name = name
     }

     func encode(with coder: NSCoder) {
     coder.encode(name, forKey: "name")
     }

     required init?(coder aDecoder: NSCoder) {
     if let name = aDecoder.decodeObject(forKey: "name") as? String {
     self.name = name
     }
     }

     var name: String?
     }

     UserDefaults().saveNSUDAnyDataByKey(value: Wow(), key: "yourKey")

     ````
     */

    func saveNSUDAnyDataByKey(value: Any?, key: String) {
        guard let anyData = value else { return }
        //        let archive = NSKeyedArchiver.archivedData(withRootObject: anyData)
        do {
            let archive = try NSKeyedArchiver.archivedData(withRootObject: anyData, requiringSecureCoding: false)
            set(archive, forKey: key)
            synchronize()
        } catch {
            fatalError("Can't encode data: \(error)")
        }
    }

    /**

     - parameters:
     String

     An example of using a *function*
     ````
     let yourSavedClass = UserDefaults().getNSUDAnyDataByKey(key: "yourKey") as? Wow

     ````
     */

    func getNSUDAnyDataByKey(key: String) -> Any? {
        do {
            guard let dataObject = data(forKey: key) else { return nil }
            return try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataObject)
        } catch {
            return nil
        }
    }
}
