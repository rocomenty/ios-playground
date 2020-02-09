import UIKit

var str = "Hello, playground"
class Assignment {
    
    
    func fibonacci(n: Int) {
    
    //Write your code here.
        var a = 0
        var b = 1
        var k = n
        k -= 2
        while n > 0 {
            print(a+b)
            c = b
            b = a + b
            a = b
        }
    
    }
    
    
}
