import Foundation

let numberOfTasks = Int(readLine()!)!
for _ in 0..<numberOfTasks {
    var phoneBook = Dictionary<String, [String]>()
    let numberOfSubtasks = Int(readLine()!)!
    for _ in 0..<numberOfSubtasks {
        let newCall = String(readLine()!).components(separatedBy: " ")
        let contactName = newCall[0]
        let phoneNumber = newCall[1]
        if phoneBook[contactName]?.isEmpty == nil{
            let tmp: [String] = [phoneNumber]
            phoneBook.updateValue(tmp, forKey: contactName)
//        } else if !(phoneBook[contactName]!).contains(phoneNumber){
        } else {
//            if (phoneBook[contactName]!).contains(phoneNumber){
                let i = (phoneBook[contactName]!).firstIndex(of: phoneNumber)
            if i != nil {
                (phoneBook[contactName]!).remove(at: i!)
            }
            (phoneBook[contactName]!).insert(phoneNumber, at: 0)
        }
        if (phoneBook[contactName]!).count > 5 {
            (phoneBook[contactName]!).removeLast()
        }
    }
    let tmp =  phoneBook.sorted { (first, second)-> Bool in
        return first.key < second.key
    }
    for i in tmp {
        print("\(i.key): \(i.value.count) \(i.value.joined(separator: " "))")
    }
    print()
}
