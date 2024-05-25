//
//  StorageUploader.swift
//  WhatsAppClone
//
//  Created by YILMAZ ER on 23.05.2024.
//

import Foundation
import Firebase
import FirebaseStorage
import AVFoundation

struct StorageUploader {
    
    static func uploadVideo(withData data: Data) async throws -> String? {
        let ref = Storage.storage().reference().child("/message_videos/\(UUID().uuidString)")
        let metadata = StorageMetadata()
        metadata.contentType = "video/quicktime"
        do {
            let _ = try await ref.putDataAsync(data, metadata: metadata)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("failed to upload video \(error.localizedDescription)")
            return nil
        }
    }
    
    static func uploadProfileImage(uiImage: UIImage) async throws -> String? {
        guard let imageData = uiImage.jpegData(compressionQuality: 0.25) else { return nil}
        let storageRef = Storage.storage().reference(withPath: "/profile_image/\(UUID().uuidString)")
        do {
            _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("failed to upload image \(error.localizedDescription)")
            return nil
        }
    }
    
    static func uploadMessageImage(uiImage: UIImage) async throws -> String? {
        guard let imageData = uiImage.jpegData(compressionQuality: 0.25) else { return nil}
        let storageRef = Storage.storage().reference(withPath: "/message_image/\(UUID().uuidString)")
        do {
            _ = try await storageRef.putDataAsync(imageData)
            let url = try await storageRef.downloadURL()
            return url.absoluteString
        } catch {
            print("failed to upload image \(error.localizedDescription)")
            return nil
        }
    }
    
    
    static func uploadAudio(withUrl recordingURL: URL) async throws -> String? {
        let ref = Storage.storage().reference().child("/message_audios/\(UUID().uuidString)")
        let metaData = StorageMetadata()
        metaData.contentType = "audio/m4a"
        do {
            let _ = try await ref.putFileAsync(from: recordingURL, metadata: metaData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("failed to upload voice recording \(error.localizedDescription)")
            return nil
        }
    }
}
