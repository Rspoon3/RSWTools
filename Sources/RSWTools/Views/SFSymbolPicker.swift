//
//  SFSymbolPicker.swift
//  
//
//  Created by Richard Witherspoon on 4/22/21.
//

import SwiftUI
import SFSymbols
import SwiftTools


@available(iOS 15.0, *)
public struct SFSymbolPicker: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentSymbols = SFSymbol.allSymbols
    @State private var sort: Int = 0
    @State private var searchText = String()
    @State private var animation: Animation?
    @Binding var symbol: SFSymbol
    
    public init(symbol: Binding<SFSymbol>){
        _symbol = symbol
    }

    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var searchResults: [SFSymbol]{
        if searchText.isEmpty{
            return currentSymbols
        }
        
        let filteredByTitle = currentSymbols.filter({$0.title.lowercased().contains(searchText.lowercased())})
        
        return withAnimation(.default){
             filteredByTitle
        }
    }
    
    
    public var body: some View{
        NavigationView{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    SearchBar(text: $searchText, placeholder: "Search")
                        .padding()
                    LazyVGrid(columns: columns, spacing: 30, content: {
                        ForEach(searchResults) { symbol in
                            ZStack(alignment: .topTrailing){
                            Image(symbol: symbol)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding(.horizontal)
                                .foregroundColor(.accentColor)
                                .onTapGesture{
                                    self.symbol = symbol
                                    presentationMode.wrappedValue.dismiss()
                                }
                                .contextMenu{
                                    Text(symbol.title)
                                }
                                
                                if self.symbol == symbol{
                                    Image(symbol: .checkmark)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 15)
                                        .foregroundColor(.accentColor == .green ? .blue : .green)
                                        .font(.headline)
                                }
                            }
                        }
                    })
                    .animation(animation)
                }
                .onChange(of: sort) { value in
                    currentSymbols = SFSymbol.Category.allCases[value].symbols
                }
                .onAppear{
                    //Don't want grid animating in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        animation = .default
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Symbol Picker")
            .toolbar{
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                
                ToolbarItem(placement: .primaryAction){
                    Menu{
                        Picker(selection: $sort, label: Text("Filter options")) {
                            ForEach(0..<SFSymbol.Category.allCases.count){ index in
                                let category = SFSymbol.Category.allCases[index]
                                Button(LocalizedStringKey(category.rawValue), symbol: category.symbol){
                                    sort = index
                                }.tag(index)
                            }
                        }
                    } label: {
                        Image(symbol: .filter)
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct SFSymbolPicker_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolPicker(symbol: .constant(.share))
    }
}
