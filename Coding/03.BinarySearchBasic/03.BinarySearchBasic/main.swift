//
//  main.swift
//  03.BinarySearchBasic
//
//  Created by Duy Nguyen on 29/10/20.
//  Copyright © 2020 Duy Nguyen. All rights reserved.
//

import Foundation

/// Find target in nums, return index if it exist, otherwise return nil
/// This method is basic binary search, clone from this.
func binarySearch(_ nums: [Int], _ target: Int) -> Int? {
    var left = 0, right = nums.count - 1
    var mid = 0
    while left <= right {
        mid = (left + right) / 2
        if nums[mid] > target {
            right = mid - 1
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            return mid
        }
    }
    return nil
}

/// Binary search find index for insert.
/// Solve this question: https://leetcode.com/problems/search-insert-position
//public int searchInsert(int[] nums, int target) {
//    if(target>nums[nums.length-1]){
//        return nums.length;
//    }
//    int l=0;
//    int r=nums.length-1;
//
//    while(l<r){
//        int m = l+(r-l)/2;
//        if(target>nums[m]){
//            l=m+1;
//        }else{
//            r=m;
//        }
//    }
//    return l;
//}
func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    if target > nums[nums.count - 1] {
        return nums.count
    }
    var l = 0
    var r = nums.count - 1
    while l < r {
        let m = l + (r-l)/2
        if target > nums[m] {
            l = m + 1
        } else {
            r = m
        }
    }
    return l
}

func main() {
    let res = searchInsert([1,3,5,6], 0)
    print(res)
}

main()
