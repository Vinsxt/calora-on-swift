//
//  Dictionaries.swift
//  Calora-swift
//
//  Created by Vincent Hartono on 25/08/26.
//  Dictionary is the swift way of key-value pair data storing.
//  Key = The word that we are looking for
//  Value = The definition of that word
//  Just like in an actual dictionary.

import Playgrounds

#Playground {
    var finalFruits: [String] = ["Apple", "Orange", "Banana", "Apple"] // arrays are ordered
    var fruitsSet: Set<String> = ["Apple", "Orange", "Banana", "Apple"] // sets are not ordered, and can't have the same value as a duplicate.
    
    var myFirstDictionary: [String:Bool] = [
        "Apple":true,
        "Orange":false
    ] // [Key:Value]
    
    let item = myFirstDictionary["Orange"] // we call the key, it will return the value.
    // key can be any type of data, but in this example because it's string, we mention a string key
    
    var anotherDictionary: [Int:String] = [
        0 : "Apple",
        176 : "Banana"
    ]
    
    let item2 = anotherDictionary[176] // it looks like we're accessing indexes, but it's not
    // even if key doesn't exist, it will not crash, the value item2 will just be nil
    
    // unless it was a different data type mismatch, it won't compile.
    
    // To add a new key-value pair to a dictionary:
    anotherDictionary[67] = "Mango" // mention the key in [], then value after '='
    
    // To remove an existing key-value pair from a dictionary:
    anotherDictionary.removeValue(forKey: 176)
    
    
    // With custom data model example:
    struct PostModel {
        let id: String
        let title: String
        let likeCount: Int
    }
    
    // Example in Array
    var postArray: [PostModel] = [ // say this is list of posts.
        PostModel(id: "abc123", title: "Post 1", likeCount: 5),
        PostModel(id: "def678", title: "Post 2", likeCount: 7),
        PostModel(id: "xyz789", title: "Post 3", likeCount: 217)
    ]
    
    if postArray.indices.contains(1){
        let item = postArray[1]
    }
    
    // Example in Dictionary
    var postDict: [String:PostModel] = [
        "abc123" : PostModel(id: "abc123", title: "Post 1", likeCount: 5),
        "def678" : PostModel(id: "def678", title: "Post 2", likeCount: 7),
        "xyz789" : PostModel(id: "xyz789", title: "Post 3", likeCount: 217)
    ]
    
    let myNewItem = postDict["def678"]
    
    
    
    
    
}
