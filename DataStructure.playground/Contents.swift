//: Playground - noun: a place where people can play

import UIKit
import CoreData


/* Equatable is a Swift protocol that makes it possible to determine whether two value of
*  the same type are considered to be equal using the == and != operators.
*/


class Node<T: Equatable> {
    
    var data: T? = nil
    var next: Node? = nil
    
    func setLink(node: Node) {
        next = node
    }
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
    
    func insertAtEnd(link: Node<T>) {
        
        if head.data == nil {
            head.data = link.data
        }
        else {
            var temp =  head
            while temp.next != nil {
                temp = temp.next!
            }
            temp.next = link
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
            
            if n == 0 {
                newNode.next = head
                head = newNode
            }
            else {
                for _ in 0..<n-1 {
                    temp = temp.next!
                }
                
                newNode.next = temp.next
                temp.next = newNode
            }
        }
    }
    
    func deleteNode(n: Int) {
        
        if n == 0 {
            
            if head.next == nil {
                head = Node<T>()
            }
            else {
                head = head.next!
            }
        }
        else {
            
            var temp = head
            
            for _ in 0..<n-1 {
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
    

    //Time complexity : O(n) Assume that n is the list's length. Space complexity : O(n)
    func reverseWithRecurstion() {
        var temp = head
        if temp.next == nil {
            head = temp
            return
        }
        
        
        if temp.next != nil {
            reverseWithRecurstion(head: temp.next!)
        }
        
        // nil  <- 1 <- 2 <- 3 <- 4 <- 5  <- head
        temp.next.next = head
        temp.next = nil
    }
    
    func showList() {
        var currentNode: Node! = head
        while currentNode != nil && currentNode.data != nil {
            print(currentNode.data!)
            currentNode = currentNode.next
        }
        print("\n")

    }

    func isCircular() -> Bool {
        var fastPtr: Node? = head
        var slowPtr: Node? = head
        
        while fastPtr != nil && fastPtr?.next != nil {
            fastPtr = fastPtr?.next!.next!
            slowPtr = slowPtr?.next!
            if fastPtr === slowPtr {
                return true
            }
        }
        
        return false
    }
    
}

let list = Linklist<Int>()
let node1 = Node<Int>()
node1.data = 9

let node2 = Node<Int>()
node2.data = 6

let node3 = Node<Int>()
node3.data = 7

let node4 = Node<Int>()
node4.data = 1

let node5 = Node<Int>()
node5.data = 2

list.insertAtEnd(link: node1)
list.insertAtEnd(link: node2)
list.insertAtEnd(link: node3)
list.insertAtEnd(link: node4)
list.insertAtEnd(link: node5)

//list.insertAtEnd(data: 5)
//list.insertAtEnd(data: 6)
//list.insertAtEnd(data: 7)
//list.insertAtEnd(data: 1)
//list.insertAtEnd(data: 2)
list.showList()

//node2.setLink(node: node7)
//list.isCircular()
//list.reverseWithRecurstion(list.head)
//list.reverse()
//list.deleteNode(n: 1)
//list.deleteNode(data: 2)

//list.insertAtBegining(data: 1)
//list.insertAtBegining(data: 2)
//list.insertAtBegining(data: 3)

//list.insertAtPosition(data: 4, n: 4)
list.insertAtPosition(data: 4,n: 0)
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
let merge = mergeArrays(arr1: arr1, arr2: arr2)


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
shuffleArray(arr: [6,2,8,4,7])


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
generateFibonacci(number: 5)


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
    
    if numeberToBeSearch < midElement  {
        let slice = Array(arr[min...mid-1])
        binarySearch(arr: slice, numeberToBeSearch: numeberToBeSearch)
    }
    else if numeberToBeSearch > midElement {
        let slice = Array(arr[mid+1...max])
        binarySearch(arr: slice, numeberToBeSearch: numeberToBeSearch)
    }
    else {
        print("search value \(numeberToBeSearch) found")
    }
}


let numberList : Array<Int> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
binarySearch(arr: numberList, numeberToBeSearch: 1)

func quickSort<T: Comparable>(arr: [T]) -> [T] {
    
    guard arr.count > 1 else {  return arr }
    
    let pivot = arr[arr.count/2]
    let less = arr.filter { $0 < pivot }
    let equal = arr.filter { $0 == pivot }
    let greater = arr.filter { $0 > pivot }
    
    return quickSort(arr: less) + equal + quickSort(arr: greater)
}

let randomArr = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]

let quickArray = quickSort(arr: randomArr)


func getPartitionIndex( arr: inout [Int], start: Int, end: Int) -> Int {
    
    let pivot = arr[end]
    var pIndex = start
    
    for index in start..<end {
        
        if arr[index] <= pivot {
            
            if  index != pIndex {
                arr.swapAt(index, pIndex)
            }
            pIndex += 1
        }
    }
    
    if  pIndex != end {
        arr.swapAt(pIndex, end)
    }
    return pIndex
}

func quickerSortArray( arr: inout [Int], start: Int, end: Int) {
    
    if start < end {
        
        let pIndex: Int = getPartitionIndex(arr: &arr, start: start, end: end)
        
        quickerSortArray(arr: &arr, start: start, end: (pIndex-1))
        quickerSortArray(arr: &arr, start: (pIndex+1), end: end)
    }
}

var randomAr = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26 ]
quickerSortArray(arr: &randomAr, start: 0, end: randomAr.count-1 )

//Binary Search

let array = [1,2,3,4,5,6,7]

func binarySearch(searchNum: Int, list: [Int]) -> Bool {
    
    var leftIndex = 0
    var rightIndex = array.count-1
    
    while leftIndex <= rightIndex {
        
        let midIndex = (leftIndex+rightIndex)/2
        let middleValue = array[midIndex]
        
        if searchNum == middleValue {
            return true
        }
        
        if searchNum < middleValue {
            rightIndex = midIndex-1
        }
        
        if searchNum > middleValue {
            leftIndex = midIndex+1
        }
    }
    return false
}

print(binarySearch(searchNum: 0,list: array))


//Find most common name in an array

var nameArray = ["Piyush", "Mohit", "Piyush", "Swift"]

func findMostCommonName() -> String {
   var nameDict = [String : Int]()
   
   for name in nameArray {
       if let countValue = nameDict[name] {
           nameDict[name] = countValue+1
       }
       else {
            nameDict[name] = 1
       }
   }
   
   var mostCommonName = ""
   
   for (key, count) in nameDict where count > 1 {
     mostCommonName = key
   }
   return mostCommonName
}

let commonName = findMostCommonName()
print(commonName)

//Reverse every other word
var sentence = "Hello Swift Apple Google"

func reverseEveryOtherWord(sentence: String) -> String {
    
    let allWords = sentence.components(separatedBy: " ")
    var newSenetence = ""
    
    for (index, word) in allWords.enumerated() {
       
        if newSenetence != "" {
            newSenetence += " "
        }
        
        if index % 2 == 1 {
            newSenetence += String(word.characters.reversed())
        }else {
            newSenetence += word
        }
    }
    return newSenetence
}

let otherWordReversed = reverseEveryOtherWord(sentence: sentence)

//2D Array - Switch Rows to Columns
let array2: [[Int]] = [ [13,4,8,14,1], [9,6,3,7,21], [5,12,17,9,3] ]
var newArray: [[Int]] = []

//let desired array = [ [(0,0), (1,0), (2,0)], 
//                      [(0,1), (1,1), (2,1)],
//                      [(0,2), (1,2), (2,2)]             
//                      [(0,3), (1,3), (2,3)]...so on ]

//As we have to convert 3X5 (Rows X Columns) array in to 5X3 (Rows X Columns) array, our inner loop should be of desired item count which is here 3 columns
for var x in 0..<array2[0].count {
  
  //this array will hold transformed subarrays
  var tempArray: [Int] = []
  
  for var y in 0..<array2.count {
    tempArray.append(array2[y][x])
    print("[\(y)][\(x)]: \(tempArray)")
  }
  newArray.append(tempArray)
}
print("Transformed Array: \(newArray)")

//Binary Search
var numList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
func binarySearch(key: Int, imin: Int, imax: Int) {
  
  var midIndex: Double = round(Double((imin+imax)/2))
  var midNumber = numList[Int(midIndex)]
  
  if midNumber > key {
    binarySearch(key: key, imin: imin, imax: Int(midIndex-1))
  } else if midNumber < key {
    binarySearch(key: key, imin: Int(midIndex)+1, imax: imax)
  } else {
    //key found
    print("value \(key) found in array")
  }
}

binarySearch(key: 4, imin: 0, imax: numList.count-1)
