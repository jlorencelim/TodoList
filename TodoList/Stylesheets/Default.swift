//
//  Default.swift
//  TodoList
//
//  Created by Lorence Lim on 15/01/2018.
//  Copyright © 2018 jlorencelim. All rights reserved.
//

import Stylish
import UIColor_Hex_Swift

class Default: Stylesheet {
    let styles: [String : Style] = [
        "CurvedEdge": CurvedEdge(),
        "CenterAlign": CenterAlign(),
        "BackgroundColor": BackgroundColor(),
        "DialogTitle": DialogTitle(),
        "TextField": TextField(),
        "CellTitleLabel": CellTitleLabel(),
    ]
    
    struct BackgroundColor: Style {
        var propertyStylers = [backgroundColor.set(value: UIColor("#585858"))]
    }
    
    struct DialogTitle: Style {
        var propertyStylers = [
            font.set(value: UIFont(name: "HelveticaNeue-Bold", size: 18.0)),
            textColor.set(value: .black),
        ]
    }
    
    struct TextField: Style {
        var propertyStylers = [
            font.set(value: UIFont(name: "HelveticaNeue", size: 16.0)),
            textColor.set(value: .black),
            borderColor.set(value: .black),
            borderWidth.set(value: 1.1),
            backgroundColor.set(value: UIColor("#FFFFFF00")),
        ]
    }
    
    struct CellTitleLabel: Style {
        var propertyStylers = [
            font.set(value: UIFont(name: "HelveticaNeue", size: 18.0)),
            textColor.set(value: .black),
        ]
    }
}
