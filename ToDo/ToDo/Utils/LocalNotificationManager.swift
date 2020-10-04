//
//  LocalNotificationManager.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation
import UserNotifications

class LocalNotificationManager {
    static let instance = LocalNotificationManager()
    private var center = UNUserNotificationCenter.current()
    
    func createNotification(title: String, note: String, date: Date, id: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = note
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: date.timeIntervalSinceNow,
                                                        repeats: false)
        
        let request = UNNotificationRequest(identifier: id,
                                            content: content,
                                            trigger: trigger)
        center.add(request)
    }
    
    func updateNotification(title: String, note: String, date: Date, id: String) {
        deleteNotification(with: id)
        createNotification(title: title, note: note, date: date, id: id)
    }
    
    func deleteNotification(with id: String) {
        center.removePendingNotificationRequests(withIdentifiers: [id])
    }
    
    func deleteDeliveredNotifications() {
        center.removeAllDeliveredNotifications()
    }
}

