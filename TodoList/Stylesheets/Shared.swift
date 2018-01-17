//
//  Shared.swift
//  TodoList
//
//  Created by Lorence Lim on 14/01/2018.
//  Copyright © 2018 jlorencelim. All rights reserved.
//

import Stylish

struct CenterAlign: Style {
    var propertyStylers = [textAlignment.set(value: .center)]
}

struct CurvedEdge: Style {
    var propertyStylers = [cornerRadiusRatio.set(value: 0.16)]
}
