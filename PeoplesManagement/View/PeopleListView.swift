//
//  PeopleListView.swift
//  PeoplesManagement
//
//  Created by Suguru Tokuda on 11/8/23.
//

import SwiftUI

struct PeopleListView: View {
    @StateObject var vm = PeopleViewModel()
    @EnvironmentObject var mainCoordinator: MainCoordinator
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.people) { person in
                    PeopleCell(person: person)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                        .onTapGesture {
                            mainCoordinator.goToDetailsScreen(person: person)
                        }
                }
            }
            .listStyle(.plain)
        }
        .padding(.horizontal, 3)
        .task {
            await vm.getDataFromViewModel(urlString: APIEndpoint.peopleListEndPoint)
        }
        .alert("Error", isPresented: $vm.isErrorOccured, actions: {
            Button(role: .cancel) {
                vm.setErrorOccuredToFalse()
            } label: {
                Text("OK")
            }
        }, message: {
            Text(vm.customError?.localizedDescription ?? "")
        })
    }
}

#Preview {
    PeopleListView()
}
