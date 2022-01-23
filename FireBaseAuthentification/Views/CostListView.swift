//
//  CostListView.swift
//  FireBaseAuthentification
//
//  Created by Konstantin Kirillov on 23.01.2022.
//

import SwiftUI
import Firebase

struct CostListView: View {
    @State private var showAddForm = false
    @StateObject var expenses = Expenses()
    @ObservedObject var loginData: LoginData
    
    @AppStorage("login_status") var loginStatus = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.costs) { cost in
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(cost.name)")
                                .bold()
                            Text("\(cost.typeCost)")
                        }
                        Spacer()
                        Text("$\(cost.ammount)")
                    }
                }.onDelete(perform: delete)
            }
            .listStyle(.plain)
            .navigationTitle("My costs")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {showAddForm.toggle()}) {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showAddForm) {
                            NewCostView(isPresented: $showAddForm, expenses: expenses)
                        }
                        Button("logout") {
                            do {
                                try loginData.signOutUser()
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        expenses.costs.remove(atOffsets: offsets)
    }
}

struct CostListView_Previews: PreviewProvider {
    static var previews: some View {
        CostListView(loginData: LoginData())
    }
}
