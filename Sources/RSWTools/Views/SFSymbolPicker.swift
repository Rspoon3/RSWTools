//
//  SFSymbolPicker.swift
//  
//
//  Created by Richard Witherspoon on 4/22/21.
//

import SwiftUI
import SFSymbols
import SwiftTools


@available(iOS 15.1, *)
public struct SFSymbolPicker: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var searchBar = SearchBar()
    @State private var currentSymbols = SFSymbol.allSymbols()
    @State private var sort: SFCategory = .all
    
    public var symbolTitle: String
    public var result: (SFSymbol)->Void
    
    let columns = [GridItem(.adaptive(minimum: 65))]
    
    var searchResults: [SFSymbol]{
        if searchBar.text.isEmpty{
            return currentSymbols
        }
        
        return currentSymbols.filter{$0.title.localizedCaseInsensitiveContains(searchBar.text)}
    }
    
    
    //MARK: Initializer
    public init(symbolTitle: String, result: @escaping (SFSymbol) -> Void) {
        self.symbolTitle = symbolTitle
        self.result = result
    }
    
    
    //MARK: Body
    public var body: some View{
        ZStack{
            Color(.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                LazyVGrid(columns: columns, spacing: 30){
                    ForEach(searchResults) { symbol in
                        ZStack(alignment: .topTrailing){
                            Image(symbol: symbol)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(minHeight: 30)
                                .padding(.horizontal)
                                .foregroundColor(.accentColor)
                                .onTapGesture{
                                    result(symbol)
                                    dismiss()
                                }
                                .contextMenu{
                                    Text(symbol.title)
                                }
                            
                            if symbolTitle == symbol.title{
                                Image(symbol: .checkmark)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 15)
                                    .foregroundColor(.accentColor == .green ? .blue : .green)
                                    .font(.headline)
                            }
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Symbol Picker")
            .navigationBarTitleDisplayMode(.inline)
            .animation(.default, value: searchResults)
            .add(searchBar)
            .onChange(of: sort) { value in
                currentSymbols = value.symbols
            }
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    filterMenu
                }
            }
        }
    }
    
    
    //MARK: Computed Views
    var filterMenu: some View{
        Menu{
            Picker("Filter Options", selection: $sort){
                ForEach(SFCategory.allCategories()){ category in
                    Button {
                        print("")
                    } label: {
                        Label(category.title, systemImage: category.icon)
                    }
                    .tag(category)
                }
            }
        } label: {
            Image(symbol: .filter)
        }
    }
}

@available(iOS 15.1, *)
struct SFSymbolPicker_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolPicker(symbolTitle: SFSymbol.share.title){ _ in}
    }
}
