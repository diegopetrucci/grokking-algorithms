struct RadioStation: Hashable {
    let name: String
    let coveredStates: Set<Int>
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

func bestStations(stations: Set<RadioStation>, states: Set<Int>) -> Set<RadioStation> {
    var remainingStations = stations
    var remainingStates = states
    
    var result: Set<RadioStation> = []
    
    while !remainingStates.isEmpty && !remainingStations.isEmpty {
        var bestStation = remainingStations.first!
        var coveredStatesByBest = remainingStates.filter(bestStation.coveredStates.contains)
        
        remainingStations.forEach { station in
            let coveredStatesByStation = remainingStates.filter(station.coveredStates.contains)
            if coveredStatesByStation.count > coveredStatesByBest.count {
                bestStation = station
                coveredStatesByBest = coveredStatesByStation
            }
        }
        
        result.insert(bestStation)
        remainingStations.remove(bestStation)
        bestStation.coveredStates.forEach { remainingStates.remove($0) }
    }
    
    return result
}

let station0 = RadioStation(name: "A", coveredStates: [1, 3, 5])
let station1 = RadioStation(name: "B", coveredStates: [2, 4, 6])
let station2 = RadioStation(name: "C", coveredStates: [1, 2, 3, 5])
let station3 = RadioStation(name: "D", coveredStates: [7])

// C, D, B
print(
    bestStations(
        stations: [station0, station1, station2, station3],
        states: [1, 2, 3, 4, 5, 6, 7]
    )
    .map(\.name)
)
