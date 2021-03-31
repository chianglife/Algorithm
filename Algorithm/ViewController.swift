//
//  ViewController.swift
//  Algorithm
//
//  Created by Chiang on 2021/3/18.
//
//心得：1.确定影响的变量个数。2.确定变量的边界值。3.确定指针移动方向

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var data: [Int] = [5,4,2,6,1,3,7,9,0,8,10]
//        let data: [Int] = [4,3,2,1]
//        let array = quickSort(array: data, left: 0, right: data.count - 1)
//        let array = insertSort(array: data)
//        insertSort(array: &data)
        shellSort(array: &data)
        print(data)
    }
}

//用基数排一次
func division(array: [Int], left: Int, right: Int) -> (left: Int, right: Int, array: Array<Int>) {
    let base = array[left]
    var left = left
    var right = right
    var array = array
    
    while left < right {
        while left < right && array[right] >= base {
            right -= 1
        }
        array[left] = array[right]
        
        while left < right && array[left] <= base {
            left += 1
        }
        array[right] = array[left]
    }
    array[left] = base
    print(array)
    return (left, right, array)
}

func quickSort(array: [Int], left: Int, right: Int) -> Array<Int> {
    if left < right {
        let sort = division(array: array, left: left, right: right)
        
        let leftSortedArr = quickSort(array: sort.array, left: left, right: sort.left - 1)
        
        let rightSortedArr = quickSort(array: leftSortedArr, left: sort.right + 1, right: right)
        
        return rightSortedArr
    }
    return array
}

//插入排序
func insertSort(array: [Int]) -> Array<Int> {
    var result = array
    for i in 1..<result.count {
        let temp = result[i]
        var index: Int? = nil
        for j in (0..<i).reversed() {
            if result[j] > temp {
                result[j + 1] = result[j]//往后移一位
                index = j
            }
        }
        if index != nil {
            result[index!] = temp
        }
    }
    return result
}

func insertSort(array: inout [Int]){//关键字inout
    for i in 1..<array.count {
        let temp = array[i]
        var index: Int? = nil
        for j in (0..<i).reversed() {
            if array[j] > temp {
                array[j + 1] = array[j]//往后移一位
                index = j
            }
        }
        if index != nil {
            array[index!] = temp
        }
    }
}

//shell sort 希尔排序
//待排数列 87654321 步长为n/2
// 8 7 6 5      4 3 2 1
//          >>
// 4 3 2 1      8 7 6 5

/* 4 3         2 1
   2 1         4 3
   8 7    >>   6 5
   6 5         8 7
 */

// 2 1 4 3 6 5 8 7  >> 1 2 3 4 5 6 7 8

//[3, 4, 2, 6, 1, 5, 7, 9, 0, 8, 10]
//[0, 4, 1, 6, 2, 5, 3, 9, 7, 8, 10]
//[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
func shellSort(array: inout [Int]) {
    var gap = array.count/2
    while gap > 0 {//gap循环
        for i in stride(from: gap, to: array.count, by: gap) {//插入排序
            let temp = array[i]
            var index: Int? = nil
            for j in stride(from: i - gap, through: i%gap, by: -gap) {
                if array[j] > temp {//只要是大于选择基数就都往后移一位
                    array[j + gap] = array[j]
                    index = j
//                    array.swapAt(j + gap, j)
                }
            }
            if index != nil {
                array[index!] = temp
            }
        }
        gap = gap/2
        print(array)
    }
}
