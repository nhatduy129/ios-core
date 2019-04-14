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
    return ans
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
