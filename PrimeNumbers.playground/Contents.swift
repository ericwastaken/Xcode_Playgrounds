// Prime Numbers
// A number that is only divisible by 1 and itself.

/**
 Interesting that in a brute force, we only need to check until sqrt(n) when testing to see if n is a prime.
 
 http://stackoverflow.com/questions/5811151/why-do-we-check-up-to-the-square-root-of-a-prime-number-to-determine-if-it-is-pr
 
 Let's say m = sqrt(n) then m × m = n. Now if n is not a prime then n can be written as n = a × b, so m × m = a × b. Notice that m is a real number whereas n, a and b are natural numbers.
 
 Now there can be 3 cases:
 
 a > m ⇒ b < m
 a = m ⇒ b = m
 a < m ⇒ b > m
 In all 3 cases, min(a, b) ≤ m. Hence if we search till m, we are bound to find at least one factor of n, which is enough to show that n is not prime.
 
 */

import Foundation

public func isPrime(_ n:Int) -> Bool {
    // In case we're passed a negative, let's use absolute
    let absn = abs(n)
    // By definition, 1 is not
    if absn <= 1  {
        return false
    }
    // 2 is the first. We might as well just check for it
    if absn == 2 {
        return true
    }
    // Now check any others by checking division up to sqrt(absn)
    let testCeil = Int(ceil(sqrt(Double(absn))))
    for i in 2...testCeil {
        if absn % i == 0 {
            // The number divides by the integer tested, so it can't be a prime
            return false
        }
    }
    
    // Otherwise, we tested 2 - sqrt(n) so it's a prime!
    return true
    
}

// Find primes up to the passed number (not the number of primes)
public func findPrimes(upTo:Int) {
    print("\n\nPrimes up to \(upTo):")
    for i in 2...abs(upTo) {
        if isPrime(i) {
            print(i, terminator:", ")
        }
    }
}

public func findFirstPrimes(count:Int) {
    var counter: Int = 0
    var current: Int = 2
    
    print("\n\nFirst \(count) primes:")
    
    // Just loop until we find enough
    repeat {
        // If the current is a prime, count it and output it
        if isPrime(current) {
            print(current, terminator:", ")
            counter += 1
        }
        // Increment to test the next number
        current += 1
    } while counter < count
    
}

isPrime(2)
isPrime(3)
isPrime(4)
isPrime(5)
isPrime(478)
isPrime(479)
isPrime(480)


findPrimes(upTo: 100)
findFirstPrimes(count: 100)

