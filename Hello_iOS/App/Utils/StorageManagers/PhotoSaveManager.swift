//
//  PhotoManager.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/12.
//

import UIKit

class PhotoSaveManager: NSObject {
    private var resultCallBack: BoolClosure?
    
    func saveImageToAlbum(image: UIImage, resultCallBack: @escaping BoolClosure) {
        self.resultCallBack = resultCallBack
        saveImageToPhotoLibrary(image)
    }
    
    private func saveImageToPhotoLibrary(_ image: UIImage) {
        switch PermissionsService.statePhotoLibrary() {
        case .allow:
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
        case .denied:
            resultCallBack?(false)
        case .unknown:
            PermissionsService.requestPhotoLibrary {
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.image(_:didFinishSavingWithError:contextInfo:)), nil)
            }
        }
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        resultCallBack?(error == nil)
    }
}
