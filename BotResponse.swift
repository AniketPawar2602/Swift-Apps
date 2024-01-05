import Foundation
func getBotResponse(message : String) -> String {
    let tempMessage=message.lowercased()
    
    if tempMessage.contains("hello"){
        return "Hey There!"
    }
    else if tempMessage.contains("goodbye"){
        return "Talk to you later!"
    }
    else if tempMessage.contains("how are you"){
        return "I'm Fine"
    }
    else{
        return "That's Cool"
    }
}
