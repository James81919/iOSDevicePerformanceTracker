import Foundation
import SystemKit
import MetricKit

enum DataCollectionError: Error {
    case unableToRecieveCPUData
    case unableToRecieveGPUData
    case unableToRecieveRAMData
}

struct DevicePerformanceTracker {
    private static var trackedData = TrackedData()
    private static var isTracking = false
    
    public static func startTracking() {
        print("Started tracking")
        trackedData = TrackedData()
        isTracking = true
        Task {
            await collectUsage()
        }
    }
    
    public static func stopTracking() -> TrackedData {
        print("Stopped tracking")
        isTracking = false
        return trackedData
    }
    
    private static func collectUsage() async {
        while isTracking {
            do {
                let cpuUsage = try collectCPUUsage()
                let gpuUsage = try collectGPUUsage()
                let ramUsage = try collectRAMUsage()
                trackedData.cpuUsage.append(cpuUsage)
                trackedData.gpuUsage.append(gpuUsage)
                trackedData.ramUsage.append(ramUsage)
                try await Task.sleep(nanoseconds: 1000000000)
            } catch {
                print("Collection error: \(error)")
            }
        }
    }
    
    private static func collectCPUUsage() throws -> Float32 {
        let cpuUsage = SKSystem.shared.getRunningProcessUsingCPU()
        if (cpuUsage < 0) {
            throw DataCollectionError.unableToRecieveCPUData
        }
        return Float32(cpuUsage)
    }
    
    private static func collectGPUUsage() throws -> Float32 {
        //SKSystem.shared.
        return 0
    }
    
    private static func collectRAMUsage() throws -> Float32 {
        let ramUsage = SKSystem.shared.getMachineUsageMemory().usage
        if (ramUsage < 0) {
            throw DataCollectionError.unableToRecieveRAMData
        }
        return ramUsage
    }
}
