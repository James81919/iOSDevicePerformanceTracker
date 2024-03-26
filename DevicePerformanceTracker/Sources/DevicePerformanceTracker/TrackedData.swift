import Foundation

struct TrackedData {
    public var cpuUsage : [Float32] = []
    public var gpuUsage : [Float32] = []
    public var ramUsage : [Float32] = []
    
    public func ConvertToDictionary() -> NSDictionary {
        let data: NSDictionary = [
            "cpuUsage": cpuUsage,
            "gpuUsage": gpuUsage,
            "ramUsage": ramUsage
        ]
        return data
    }
}
