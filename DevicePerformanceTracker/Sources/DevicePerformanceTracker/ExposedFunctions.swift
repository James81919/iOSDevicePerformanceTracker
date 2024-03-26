import Foundation

@_cdecl("StartTracking")
public func startTracking() {
    DevicePerformanceTracker.startTracking()
}

@_cdecl("StopTracking")
public func stopTracking() -> NSDictionary {
    let trackedData = DevicePerformanceTracker.stopTracking()
    let data = trackedData.ConvertToDictionary()
    return data
}
