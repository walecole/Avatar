//
//  Data.swift
//  Avatar
//
//  Created by WALE on 11/09/2017.
//  Copyright © 2017 AppSoul. All rights reserved.
//

import UIKit

func getData() -> Array<Dictionary<String,String>> {
    
    let data = [
        ["title" : "Bug",
         "author" : "Wale",
         "image" : "image",
         "avatar" : "avatar",
         "text" : "A random text about the image goes in here"
        ],
        ["title" : "Cat",
         "author" : "Tola",
         "image" : "image2",
         "avatar" : "avatar",
         "text" : "A random text about the image goes in here"
        ],
        ["title" : "Ford Model",
         "author" : "Taiwo",
         "image" : "image3",
         "avatar" : "avatar",
         "text" : "A random text about the image goes in here"
        ],
        ["title" : "Music",
         "author" : "Segun",
         "image" : "image",
         "avatar" : "avatar",
         "text" : "A random text about the image goes in here"
        ],
    ]
    return data
}
