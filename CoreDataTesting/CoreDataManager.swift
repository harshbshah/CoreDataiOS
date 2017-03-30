//
//  CoreDataManager.swift
//  CoreDataTesting
//
//  Created by Harsh Shah on 2017-03-29.
//  Copyright © 2017 Harsh Shah. All rights reserved.
//

import UIKit
import CoreData
class CoreDataManager: NSObject {
private class func getContext() -> NSManagedObjectContext
{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.persistentContainer.viewContext
    }
    class func storeObj(){
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "ImageEntity", in: context)
        let managedObj = NSManagedObject(entity: entity!, insertInto: context)
        managedObj.setValue("image0", forKey: "name")
        managedObj.setValue("harsh", forKey: "by")
        managedObj.setValue(2016, forKey: "year")
        
        
        do{
            try context.save()
                print("Saved!")
            
            
        }catch{
            print(error.localizedDescription)
        }
        
    }
    struct imageItem{
        var imageName:String?
        var imageYear:Int?
        var imageBy:String?
        init() {
            imageName = ""
            imageBy = ""
            imageYear = 0
        }
        init(name:String,by:String,year:Int){
            self.imageName = name
            self.imageYear = year
            self.imageBy = by
        }
    }
    
    class func fetchObj() ->[imageItem] {
        var arr = [imageItem]()
        let fetchRequest :NSFetchRequest<ImageEntity> = ImageEntity.fetchRequest()
        do{
            let fetchResult  = try getContext().fetch(fetchRequest)
           
            for item in fetchResult
            {
            let img = imageItem.init(name:item.name!,by:item.by!,year:Int(item.year))
                arr.append(img)
                print(img.imageName!)
            }
        }catch{
            print(error.localizedDescription)
        }
        return arr
    
   
}
}

