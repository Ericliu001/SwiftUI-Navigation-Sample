/*
 See the LICENSE.txt file for this sample’s licensing information.

 Abstract:
 A view that displays a list of contacts.
 */

import SwiftUI
import Contacts
import UniformTypeIdentifiers

struct ContactList: View {
    @Environment(DataModel.self) private var dataModel
    @State private var isTargeted = false
    let router: ContactRouter
    
    var body: some View {
        List {
            ForEach(dataModel.contacts) { contact in
                Button (action: {
                    router.gotoContactDetail(contact)
                }) {
                    CompactContactView(router: router, contact: contact)
                        .draggable(contact) {
                            ThumbnailView(contact: contact)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
                .draggable(contact)
            }
            .dropDestination(for: Contact.self) {
                droppedContacts,
                index in
                dataModel
                    .handleDroppedContacts(
                        droppedContacts: droppedContacts,
                        index: index
                    )
            }
            .onMove { fromOffsets, toOffset in
                dataModel.contacts
                    .move(fromOffsets: fromOffsets, toOffset: toOffset)
            }
            .onDelete { indexSet in
                dataModel.contacts.remove(atOffsets: indexSet)
            }
        }
#if !os(macOS)
        .listStyle(.insetGrouped)
        .toolbar {
            EditButton()
        }
#endif
    }
}

#Preview {
    ContactList(router: MockContactRouter.shared)
        .environment(DataModel())
}
