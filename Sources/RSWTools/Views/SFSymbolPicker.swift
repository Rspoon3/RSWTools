//
//  SFSymbolPicker.swift
//  
//
//  Created by Richard Witherspoon on 4/22/21.
//

import SwiftUI
import SFSymbols
import SwiftTools

public struct SFSymbolPicker: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentSymbols = SFSymbol.allSymbols
    @State private var sort: SFCategory = .all
    @State private var searchText = ""
    
    public var symbolTitle: String
    public var result: (SFSymbol)->Void
    private let color: Color
    
    let columns = [GridItem(.adaptive(minimum: 65))]
    
    var searchResults: [SFSymbol] {
        guard !searchText.isEmpty else {
            return currentSymbols
        }
        
        return currentSymbols.filter{
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    //MARK: Initializer
    public init(
        symbolTitle: String,
        color: Color = .accentColor,
        result: @escaping (SFSymbol) -> Void
    ) {
        self.symbolTitle = symbolTitle
        self.result = result
        self.color = color
    }
    
    
    //MARK: Body
    public var body: some View{
        ZStack{
            Color(.systemGroupedBackground)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(searchResults) { symbol in
                        ZStack(alignment: .topTrailing){
                            Image(symbol: symbol)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 50)
                                .padding(.horizontal)
                                .foregroundColor(color)
                                .onTapGesture{
                                    result(symbol)
                                    dismiss()
                                }
                                .contextMenu{
                                    Text(symbol.title)
                                }
                            
                            if symbolTitle == symbol.title {
                                Image(symbol: .checkmark)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 15)
                                    .foregroundColor(color == .green ? .blue : .green)
                                    .font(.headline)
                            }
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Symbol Picker")
            .navigationBarTitleDisplayMode(.inline)
            .animation(.default, value: searchResults)
            .searchable(text: $searchText)
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
                ForEach(SFCategory.allCategories){ category in
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

struct SFSymbolPicker_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolPicker(symbolTitle: SFSymbol.share.title){ _ in}
    }
}
