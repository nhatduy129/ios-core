//
//  main.swift
//  05.DFSForTree
//
//  Created by Duy Nguyen on 31/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//
// LINK: https://www.hackerrank.com/challenges/even-tree/problem
import Foundation

let MAX = 105
var graph: [[Int]] = Array(repeating: [], count: MAX)
var ans = 0
var cnt: [Int] = Array(repeating: 0, count: MAX)

func evenForest(t_nodes: Int, t_edges: Int, t_from: [Int], t_to: [Int]) -> Int {
    for i in 0..<t_edges {
        graph[t_from[i]].append(t_to[i])
        graph[t_to[i]].append(t_from[i])
    }
    dfs(1, 0)
    return ans - 1
}

func dfs(_ u: Int, _ p: Int) {
    cnt[u] = 1
    for v in graph[u] {
        if v == p { continue }
        dfs(v, u)
    }
    if cnt[u] % 2 == 0 {
        ans += 1
        cnt[u] = 0
    }
    cnt[p] += cnt[u]
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

let tNodesEdges: [Int] = readLine()!.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression).split(separator: " ").map {
    if let tItem = Int($0) {
        return tItem
    } else { fatalError("Bad input") }
}

guard tNodesEdges.count == 2 else { fatalError("Bad input") }

let tNodes = tNodesEdges[0]
let tEdges = tNodesEdges[1]

let tFromTo: [[Int]] = AnyIterator{ readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) }.prefix(tEdges).map {
    let tRow: [Int] = $0.split(separator: " ").map {
        if let tItem = Int($0.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return tItem
        } else { fatalError("Bad input") }
    }

    guard tRow.count == 2 else { fatalError("Bad input") }

    return tRow
}

guard tFromTo.count == tEdges else { fatalError("Bad input") }

let tFrom = tFromTo.map{ $0[0] }
let tTo = tFromTo.map{ $0[1] }

let res = evenForest(t_nodes: tNodes, t_edges: tEdges, t_from: tFrom, t_to: tTo)

fileHandle.write(String(res).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
