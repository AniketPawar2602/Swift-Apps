import SwiftUI

struct ContentView: View {
    @State private var messageText = ""
    @State var messages: [String] = ["Welcome to Chatbot 2.O"]
    
    var body: some View {
        VStack{
            HStack{
                Text("ChatBot 2.O")
                    .font(.largeTitle)
                    .bold()
            }
            ScrollView {
                ForEach(messages, id:\.self) { message in
                    if message.contains("[USER]"){
                        let newMessage = message.replacingOccurrences(of: "[USER]", with: "")
                        
                        HStack{
                            Spacer()
                                Text(newMessage)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(.blue.opacity(0.8))
                                    .cornerRadius(20)
                                    .padding(.horizontal,16)
                                    .padding(.bottom,10)
                        }
                    } else{
                        HStack{
                            Text(message)
                                    .padding()
                                    .foregroundColor(.black)
                                    .background(.gray.opacity(0.15))
                                    .cornerRadius(20)
                                    .padding(.horizontal,16)
                                    .padding(.bottom,10)
                            Spacer()
                        }
                    }
                }
            }
            
            HStack{
                TextField("Type Something",text: $messageText)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    .onSubmit {
                        sendmsg(message: messageText)
                    }
                Button{
                    sendmsg(message: messageText)
                } label: {
                    Image(systemName: "paperplane.fill")
                }
                .font(.system(size:26))
                .padding(.horizontal,10)
            }
            .padding()
        }
    }
    func sendmsg(message:String){
        withAnimation{
            messages.append("[USER]"+message)
            self.messageText=""
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            withAnimation{
                messages.append(getBotResponse(message: message))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
