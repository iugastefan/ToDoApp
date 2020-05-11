//
//  ToDoItemView.swift
//  ToDoApp
//
//  Created by user174672 on 5/11/20.
//  Copyright © 2020 Iuga. All rights reserved.
//

import SwiftUI

struct ToDoItemView: View {
    
    @Environment(\.managedObjectContext)var managedObjectContext
    var title:String=""
    var createdAt:String=""
    var completed:Bool=false
    var body: some View {
        
            VStack(alignment: .leading){
            Text(title).font(.headline)
            Text(createdAt).font(.caption)
            }
        
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(title: "To do title",createdAt: "some date")
    }
}
