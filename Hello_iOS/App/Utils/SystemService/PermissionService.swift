//
//  PermissionService.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/12.
//

import UIKit

import Photos
import UserNotifications
import Contacts

public enum PermissionsServiceState {
    case denied
    case allow
    case unknown
}

public class PermissionsService {
    
    public static func goToSystemSettings() {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
    }
    
    public static func stateCamera() -> PermissionsServiceState {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)
        if cameraAuthorizationStatus == AVAuthorizationStatus.authorized {
            return .allow
        } else if cameraAuthorizationStatus == AVAuthorizationStatus.denied || cameraAuthorizationStatus == AVAuthorizationStatus.restricted {
            return .denied
        } else {
            return .unknown
        }
    }
    
    public static func checkCameraPermissions(okAction: (() -> Void)? = nil, deniedAction: (() -> Void)? = nil) {
        let actualState = PermissionsService.stateCamera()
        switch actualState {
        case .allow:
            okAction?()
        case .denied:
            deniedAction?()
        case .unknown:
            requestCamera(accessGrantedCallback: {
                okAction?()
            }, accessDeniedCallback: {
                deniedAction?()
            })
        }
    }
    
    public static func requestCamera(accessGrantedCallback: @escaping (() -> Void), accessDeniedCallback: @escaping (() -> Void)) {
        guard self.stateCamera() == .unknown else {
            assertionFailure("Check state of camera before request")
            return
        }
        
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                if granted {
                    accessGrantedCallback()
                } else {
                    accessDeniedCallback()
                }
            }
        }
    }
    
    public static func requestPhotoLibrary(changedCallback: @escaping (() -> Void)) {
        if self.statePhotoLibrary() == .unknown {
            PHPhotoLibrary.requestAuthorization({ _ in
                DispatchQueue.main.async {
                    changedCallback()
                }
            })
        } else {
            self.goToSystemSettings()
        }
    }
    
    public static func statePhotoLibrary() -> PermissionsServiceState {
        let photoLibraryAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        if photoLibraryAuthorizationStatus == PHAuthorizationStatus.authorized {
            return .allow
        } else if photoLibraryAuthorizationStatus == PHAuthorizationStatus.restricted || (photoLibraryAuthorizationStatus == PHAuthorizationStatus.denied) {
            return .denied
        } else {
            return .unknown
        }
    }
    
}
