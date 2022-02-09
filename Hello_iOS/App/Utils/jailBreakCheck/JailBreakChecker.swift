//
//  JailBreakChecker.swift
//  Hello_iOS
//
//  Created by Murph on 2022/2/9.
//

import Foundation
import UIKit

class JailBreakChecker {
    static func checkJailBreak() -> Bool{
        if self.checkFileAndPath() { return true }
        if self.checkOpenCydia() { return true }
        return false
    }
    
    static private func checkFileAndPath() -> Bool{
        let fileList = [
            "/Applications/Cydia.app",
            "/Library/MobileSubstrate/MobileSubstrate.dylib",
            "/bin/bash",
            "/usr/sbin/sshd",
            "/etc/apt",
            "/usr/bin/ssh",
            "/private/var/lib/apt",
            "/private/var/lib/cydia",
            "/private/var/tmp/cydia.log",
            "/Applications/WinterBoard.app",
            "/var/lib/cydia",
            "/private/etc/dpkg/origins/debian",
            "/bin.sh",
            "/private/etc/apt",
            "/etc/ssh/sshd_config",
            "/private/etc/ssh/sshd_config",
            "/Applications/SBSetttings.app",
            "/private/var/mobileLibrary/SBSettingsThemes/",
            "/private/var/stash",
            "/usr/libexec/sftp-server",
            "/usr/libexec/cydia/",
            "/usr/sbin/frida-server",
            "/usr/bin/cycript",
            "/usr/local/bin/cycript",
            "/usr/lib/libcycript.dylib",
            "/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
            "/System/Library/LaunchDaemons/com.ikey.bbot.plist",
            "/Applications/FakeCarrier.app",
            "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
            "/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist",
            "/usr/libexec/ssh-keysign",
            "/usr/libexec/sftp-server",
            "/Applications/blackra1n.app",
            "/Applications/IntelliScreen.app",
            "/Applications/Snoop-itConfig.app",
            "/var/lib/dpkg/info"
        ]
        let fileManager = FileManager.default
        var result = false
        fileList.forEach { path in
            if fileManager.fileExists(atPath: path) {
                print("已越狱")
                result = true
            }
        }
        return result
    }
    
    static private func checkOpenCydia() -> Bool {
        return UIApplication.shared.canOpenURL(URL(string: "cydia://")!)
    }
}
