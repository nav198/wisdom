//
//  Model.swift
//  wisdomLeaf_Task
//
//  Created by admin on 24/06/24.
//

import Foundation

struct Photo {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: URL
    let downloadUrl: URL
}

class PhotosApi {
    static let photoArray = PhotosApi()
    
    let listOfPhotos: [Photo] = [
        Photo(id: "20", author: "Aleks Dorohovich", width: 3670, height: 2462, url: URL(string: "https://unsplash.com/photos/nJdwUHmaY8A")!, downloadUrl: URL(string: "https://picsum.photos/id/20/3670/2462")!),
        Photo(id: "21", author: "Alejandro Escamilla", width: 3008, height: 2008, url: URL(string: "https://unsplash.com/photos/jVb0mSn0LbE")!, downloadUrl: URL(string: "https://picsum.photos/id/21/3008/2008")!),
        Photo(id: "22", author: "Alejandro Escamilla", width: 4434, height: 3729, url: URL(string: "https://unsplash.com/photos/du_OrQAA4r0")!, downloadUrl: URL(string: "https://picsum.photos/id/22/4434/3729")!),
        Photo(id: "23", author: "Alejandro Escamilla", width: 3887, height: 4899, url: URL(string: "https://unsplash.com/photos/8yqds_91OLw")!, downloadUrl: URL(string: "https://picsum.photos/id/23/3887/4899")!),
        Photo(id: "24", author: "Alejandro Escamilla", width: 4855, height: 1803, url: URL(string: "https://unsplash.com/photos/cZhUxIQjILg")!, downloadUrl: URL(string: "https://picsum.photos/id/24/4855/1803")!),
        Photo(id: "25", author: "Alejandro Escamilla", width: 5000, height: 3333, url: URL(string: "https://unsplash.com/photos/Iuq0EL4EINY")!, downloadUrl: URL(string: "https://picsum.photos/id/25/5000/3333")!),
        Photo(id: "26", author: "Vadim Sherbakov", width: 4209, height: 2769, url: URL(string: "https://unsplash.com/photos/tCICLJ5ktBE")!, downloadUrl: URL(string: "https://picsum.photos/id/26/4209/2769")!),
        Photo(id: "27", author: "Yoni Kaplan-Nadel", width: 3264, height: 1836, url: URL(string: "https://unsplash.com/photos/iJnZwLBOB1I")!, downloadUrl: URL(string: "https://picsum.photos/id/27/3264/1836")!),
        Photo(id: "28", author: "Jerry Adney", width: 4928, height: 3264, url: URL(string: "https://unsplash.com/photos/_WiFMBRT7Aw")!, downloadUrl: URL(string: "https://picsum.photos/id/28/4928/3264")!),
        Photo(id: "29", author: "Go Wild", width: 4000, height: 2670, url: URL(string: "https://unsplash.com/photos/V0yAek6BgGk")!, downloadUrl: URL(string: "https://picsum.photos/id/29/4000/2670")!),
        Photo(id: "30", author: "Shyamanta Baruah", width: 1280, height: 901, url: URL(string: "https://unsplash.com/photos/aeVA-j1y2BY")!, downloadUrl: URL(string: "https://picsum.photos/id/30/1280/901")!),
        Photo(id: "31", author: "How-Soon Ngu", width: 3264, height: 4912, url: URL(string: "https://unsplash.com/photos/7Vz3DtQDT3Q")!, downloadUrl: URL(string: "https://picsum.photos/id/31/3264/4912")!),
        Photo(id: "32", author: "Rodrigo Melo", width: 4032, height: 3024, url: URL(string: "https://unsplash.com/photos/eG3k60PrTGY")!, downloadUrl: URL(string: "https://picsum.photos/id/32/4032/3024")!),
        Photo(id: "33", author: "Alejandro Escamilla", width: 5000, height: 3333, url: URL(string: "https://unsplash.com/photos/LBI7cgq3pbM")!, downloadUrl: URL(string: "https://picsum.photos/id/33/5000/3333")!),
        Photo(id: "34", author: "Aleks Dorohovich", width: 3872, height: 2592, url: URL(string: "https://unsplash.com/photos/zZvsEMPxjIA")!, downloadUrl: URL(string: "https://picsum.photos/id/34/3872/2592")!),
        Photo(id: "35", author: "Shane Colella", width: 2758, height: 3622, url: URL(string: "https://unsplash.com/photos/znM0ujn2RUA")!, downloadUrl: URL(string: "https://picsum.photos/id/35/2758/3622")!),
        Photo(id: "36", author: "Vadim Sherbakov", width: 4179, height: 2790, url: URL(string: "https://unsplash.com/photos/osSryggkso4")!, downloadUrl: URL(string: "https://picsum.photos/id/36/4179/2790")!),
        Photo(id: "37", author: "Austin Neill", width: 2000, height: 1333, url: URL(string: "https://unsplash.com/photos/erTjj730fMk")!, downloadUrl: URL(string: "https://picsum.photos/id/37/2000/1333")!),
        Photo(id: "38", author: "Allyson Souza", width: 1280, height: 960, url: URL(string: "https://unsplash.com/photos/JabLtzJl8bc")!, downloadUrl: URL(string: "https://picsum.photos/id/38/1280/960")!),
        Photo(id: "39", author: "Luke Chesser", width: 3456, height: 2304, url: URL(string: "https://unsplash.com/photos/pFqrYbhIAXs")!, downloadUrl: URL(string: "https://picsum.photos/id/39/3456/2304")!)
    ]

}


