//: Playground - noun: a place where people can play

import UIKit
import CoreData


/* Equatable is a Swift protocol that makes it possible to determine whether two value of
*  the same type are considered to be equal using the == and != operators.
*/


class Node<T: Equatable> {
    
    var data: T? = nil
    var next: Node? = nil
}

class Linklist<T: Equatable> {
    
    var head = Node<T>()
    
    func insertAtBegining(data: T) {
        
        if head.data == nil {
            head.data = data
        }
        else {
            let newNode = Node<T>()
            newNode.data = data
            
            newNode.next = head
            head = newNode
        }
    }
    
    func insertAtEnd(data: T) {
        
        if head.data == nil {
            head.data = data
        }
        else {
            var temp =  head
            let newNode = Node<T>()
            newNode.data = data
            
            while temp.next != nil {
                temp = temp.next!
            }
            temp.next = newNode
        }
    }
    
    func insertAtPosition(data: T, n: Int) {
        
        if head.data == nil {
            head.data = data
        }
        else {
            
            var temp = head
            
            //Create new node
            let newNode = Node<T>()
            newNode.data = data
            
            if n == 1 {
                newNode.next = head
                head = newNode
            }
            else {
                for _ in 0..<n-2 {
                    temp = temp.next!
                }
                
                newNode.next = temp.next
                temp.next = newNode
            }
        }
    }
    
    func deleteNode(n: Int) {
        
        if n == 1 {
            
            if head.next == nil {
                head = Node<T>()
            }
            else {
                head = head.next!
            }
        }
        else {
            
            var temp = head
            
            for _ in 0..<n-2 {
                temp = temp.next! // n-1'th node
            }
            
            let deleteNode = temp.next // n'th node
            temp.next = deleteNode!.next
        }
    }
    
    func deleteNode (data: T) {
        
        if head.data == data {
            
            if head.next == nil {
                head = Node<T>()
            }
            else {
                head = head.next!
            }
        }
        else {
            var temp = head
            var previousNode: Node = Node<T>()
            
            while temp.data != data {
                
                //save n-1'th node link
                previousNode = temp
                temp = temp.next!
            }
            previousNode.next = temp.next
        }
    }
    
    //Iterative reverse
    
    func reverse () {
        
        var currentNode = head
        var nextNode = Node<T>()
        var previousNode  = Node<T>()
        
        while currentNode.next != nil {
            
            //save next node address, as link will be broken
            nextNode = currentNode.next!
            
            //set pointer to nil to break its next node link
            currentNode.next = previousNode
            
            //set previous node as currentNode
            previousNode = currentNode
            
            //set currentNode as nextNode
            currentNode = nextNode
        }
        
        //when reach last node, link prev node and current node
        currentNode.next = previousNode
        
        //set head as current node
        head = currentNode
    }
    
    
    func reverseWithRecurstion(temp: Node<T>) {
        if temp.next == nil {
            head = temp
            return
        }
        
        if temp.next != nil {
            reverseWithRecurstion(temp.next!)
        }
        
        // nil  <- 1 <- 2 <- 3 <- 4 <- 5  <- head
        let lastNode = temp.next //as we break link between 4 -> 5, we will save 5th node address
        lastNode?.next = temp //assign 4th node address in 5th node next field
        temp.next = nil // assign 4th node next field as nil
        
    }
    
    func showList() {
        var currentNode: Node! = head
        while currentNode != nil && currentNode.data != nil {
            print(currentNode.data!)
            currentNode = currentNode.next
        }
    }
}

let list = Linklist<Int>()
list.insertAtEnd(1)
list.insertAtEnd(2)
list.insertAtEnd(3)

//list.reverseWithRecurstion(list.head)
//list.reverse()
//list.deleteNode(n: 1)
//list.deleteNode(data: 2)

//list.insertAtBegining(data: 1)
//list.insertAtBegining(data: 2)
//list.insertAtBegining(data: 3)

list.insertAtPosition(4,n: 4)
//list.insertAtPosition(data: 2,n: 2)
//list.insertAtPosition(data: 3,n: 3)

list.showList()


//Union of two sorted array
func mergeArrays(arr1: [Int], arr2: [Int]) -> [Int] {
    
    var resultArray = [Int]()
    
    let count1 = arr1.count
    let count2 = arr2.count
    
    var i: Int = 0
    var j: Int = 0
    
    while i < count1 && j < count2 {
        if arr1[i] < arr2[j] {
            resultArray.append(arr1[i])
            i += 1
        }
        else if arr2[j] < arr1[i] {
            resultArray.append(arr2[j])
            j += 1
        }
        else {
            resultArray.append(arr1[i])
            i += 1
            j += 1
        }
    }
    
    while i < count1 {
        resultArray.append(arr1[i])
        i += 1
    }
    
    while j < count2 {
        resultArray.append(arr2[j])
        j += 1
    }
    
    return resultArray
}

let arr1 = [1,4,6,8]
let arr2 = [2,3,5,7]
let merge = mergeArrays(arr1, arr2: arr2)


//intersection of 2 sorted arrays
func intersectionOfArrays(arr1: [Int], arr2: [Int]) -> [Int] {
    var resultArray = [Int]()
    
    let count1 = arr1.count
    let count2 = arr2.count
    
    var i: Int = 0
    var j: Int = 0
    
    while i < count1 && j < count2 {
        
        if arr1[i] < arr2[j] {
            i += 1
        }
        else if arr2[j] < arr1[i] {
            j += 1
        }
        else {
            resultArray.append(arr1[i])
            i += 1
            j += 1
        }
    }
    return resultArray
}

//let arr11 = [1,2,3,5]
//let arr22 = [2,3,5,7]
//let intersection = intersectionOfArrays(arr11, arr2: arr22)


//find missing number
func getMissingNumber(arr: [Int]) -> Int {
    let arrCount = arr.count
    var totalElements = (arrCount+1)*(arrCount+2)/2
    
    for index in 0..<arrCount {
        totalElements -= arr[index]
    }
    return totalElements
}

//let arr = [1,2,4]
//let number = getMissingNumber(arr)



//reverse an array using iterative method
func reverse(arr: [Int]) -> [Int] {
    var arr1 = arr
    
    var start = 0
    var end = arr.count-1
    
    while start < end {
        
        let temp = arr[start]
        arr1[start] = arr[end]
        arr1[end] = temp
        
        start += 1
        end -= 1
    }
    return arr1
}

//let arr = [1,2,4]
//let reverseArr = reverse(arr)


//reverse an array using recursive method
var start = 0
var array1 = [Int]()
var end = 0


func reverseArray() {
    
    if start < end {
        
        let temp = array1[start]
        array1[start] = array1[end]
        array1[end] = temp
        
        start += 1
        end -= 1
        
        reverseArray()
    }
}

let arr = [5,6,7,8,9]
array1 = arr
end = array1.count-1

reverseArray()
array1


//generate shuffle array
func shuffleArray(arr: [Int]) -> [Int] {
    var arr1 = arr
    
    let randomIndex = Int(arc4random() % UInt32(arr1.count))
    
    for i in 0..<arr1.count {
        let temp = arr1[i]
        arr1[i] = arr1[randomIndex]
        arr1[randomIndex] = temp
    }
    return arr1
}
shuffleArray([6,2,8,4,7])


//fibonacci
func generateFibonacci(number: Int) {
    
    var first = 0, second = 1, next = 0
    var index = 0
    
    while index < number {
        
        if index <= 1 {
            next = index
        }
        else {
            next = first+second
            first = second
            second = next
        }
        print(next)
        index += 1
    }
}
generateFibonacci(5)


//even and odd arrays
var evenArray: [Int] = []
var oddArray: [Int] = []

func seperateEvenOddArrays(arr: [Int]) {
    
    for i in 0..<arr.count {
        
        if arr[i]%2 == 0 {
            evenArray.append(arr[i])
        }
        else {
            oddArray.append(arr[i])
        }
    }
}

//seperateEvenOddArrays([1,2,3,4,5,6])
//evenArray
//oddArray

func binarySearch(arr: [Int], numeberToBeSearch: Int) {
    
    let min = 0
    let max = arr.count-1
    let mid = (min+max)/2

    if numeberToBeSearch < arr[min] || numeberToBeSearch > arr[max] {
        print("search value \(numeberToBeSearch) not found")
        return
    }
    
    let midElement = arr[mid]
    
    if midElement > numeberToBeSearch {
        let slice = Array(arr[min...mid-1])
        binarySearch(slice, numeberToBeSearch: numeberToBeSearch)
    }
    else if midElement < numeberToBeSearch {
        let slice = Array(arr[mid+1...max])
        binarySearch(slice, numeberToBeSearch: numeberToBeSearch)
    }
    else {
        print("search value \(numeberToBeSearch) found")
    }
}


let numberList : Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
binarySearch(numberList, numeberToBeSearch: 1)

func quickSort<T: Comparable>(arr: [T]) -> [T] {
    
    guard arr.count > 1 else {  return arr }
    
    let pivot = arr[arr.count/2]
    let less = arr.filter { $0 < pivot }
    let equal = arr.filter { $0 == pivot }
    let greater = arr.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

let randomArr = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]

let quickArray = quickSort(randomArr)


func getPartitionIndex(inout arr: [Int], start: Int, end: Int) -> Int {
    
    let pivot = arr[end]
    var pIndex = start
    
    for index in start..<end {
        
        if arr[index] <= pivot {
            
            if  index != pIndex {
                swap(&arr[index], &arr[pIndex])
            }
            pIndex += 1
        }
    }
    
    if  pIndex != end {
        swap(&arr[pIndex], &arr[end])
    }
    return pIndex
}

func quickerSortArray(inout arr: [Int], start: Int, end: Int) {
    
    if start < end {
        
        let pIndex: Int = getPartitionIndex(&arr, start: start, end: end)
        
        quickerSortArray(&arr, start: start, end: (pIndex-1))
        quickerSortArray(&arr, start: (pIndex+1), end: end)
    }
}

var randomAr = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
quickerSortArray(&randomAr, start: 0, end: randomAr.count-1 )
