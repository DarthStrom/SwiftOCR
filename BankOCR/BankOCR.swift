//
//  BankOCR.swift
//  BankOCR
//
//  Created by Jason Duffy on 3/23/16.
//  Copyright © 2016 Kata. All rights reserved.
//

import Foundation

class BankOCR {
    class func parseNumber(source: String) -> Int {
        let digits = splitIntoDigits(source)
        let digitDigits = digits.map() { digit in
            getDigit(digit)
        }
        let accountString = digitDigits.reduce("") { (soFar, current) in
            return soFar + current
        }
        return Int(accountString)!
    }

    private class func splitIntoDigits(source: String) -> [String] {
        let rows = source.componentsSeparatedByString("\n")
        var result = [String]()
        for (var i = 0; i < 27; i += 3) {
            let range = Range<String.Index>(start: rows[0].startIndex.advancedBy(i), end: rows[0].startIndex.advancedBy(i+3))
            result.append(rows[0].substringWithRange(range) + rows[1].substringWithRange(range) +
                rows[2].substringWithRange(range) + rows[3].substringWithRange(range))
        }
        print(result)
        return result
    }

    private class func getDigit(s: String) -> String {
        switch s {
        case " _ " +
             "| |" +
             "|_|" +
             "   ":
            return "0"

        case "   " +
             "  |" +
             "  |" +
             "   ":
            return "1"

        case " _ " +
             " _|" +
             "|_ " +
             "   ":
            return "2"

        case " _ " +
             " _|" +
             " _|" +
             "   ":
            return "3"

        case "   " +
             "|_|" +
             "  |" +
             "   ":
            return "4"

        case " _ " +
             "|_ " +
             " _|" +
             "   ":
            return "5"

        case " _ " +
             "|_ " +
             "|_|" +
             "   ":
            return "6"

        case " _ " +
             "  |" +
             "  |" +
             "   ":
            return "7"

        case " _ " +
             "|_|" +
             "|_|" +
             "   ":
            return "8"

        case " _ " +
             "|_|" +
             " _|" +
             "   ":
            return "9"

        default:
            return "10"
        }
    }
}