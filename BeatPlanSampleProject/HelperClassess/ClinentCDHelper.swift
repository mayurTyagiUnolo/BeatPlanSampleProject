
import Foundation

class ClientCDHelper{
    
    static let shared = ClientCDHelper()
    
    init() { }
    
    
    func fetchAllObjsInBackground() -> [Client]{
        var clientArray: [Client] = []
        let client1 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "1", employeeID: -2)
        let client2 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "2")
        let client3 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "3")
        let client4 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "4")
        let client5 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "5")
        clientArray.append(client1)
        clientArray.append(client2)
        clientArray.append(client3)
        clientArray.append(client4)
        clientArray.append(client5)
        return clientArray
    }
    
    
    func fetchObjectsToEdit() -> [Client]{
        var clientArray: [Client] = []
        let client1 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "1")
        let client4 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "4")
        let client5 = Client(clientName: "mayur", age: 22, address: "unolo", clientID: "5")
        clientArray.append(client1)
        clientArray.append(client4)
        clientArray.append(client5)
        return clientArray
    }
    
    
}
