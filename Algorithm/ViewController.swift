//
//  ViewController.swift
//  Algorithm
//
//  Created by Chiang on 2021/3/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let data: [Int] = [5,4,2,6,1,3,7,9,0,8]
        let array = quickSort(array: data, left: 0, right: data.count - 1)
        print(array)
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
