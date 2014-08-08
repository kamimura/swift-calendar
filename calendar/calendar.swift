//
//  calendar.swift
//  calendar
//
//  Created by kamimura on 8/8/14.
//  Copyright (c) 2014 kamimura. All rights reserved.
//

import Foundation

func isLeap(year:Int) -> Bool {
    if year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) {
        return true
    }
    return false
}

func leapdays(y1:Int, y2:Int) -> Int {
    var days = 0
    for year:Int in y1..<y2 {
        if isLeap(year) {
            days += 1
        }
    }
    return days
}

func getWeekday(year:Int, month:Int, day:Int) -> String {
    var date = NSDate()
    let calendar = NSCalendar.currentCalendar()
    var comps = calendar.components(NSCalendarUnit.YearCalendarUnit|NSCalendarUnit.MonthCalendarUnit|NSCalendarUnit.DayCalendarUnit, fromDate: date)
    
    comps.year = year
    comps.month = month
    comps.day = day
    date = calendar.dateFromComponents(comps)
    
    let weekday = calendar.components(NSCalendarUnit.WeekdayCalendarUnit, fromDate: date)
    let date_formatter = NSDateFormatter()
    
    date_formatter.dateFormat = "E"
    return date_formatter.stringFromDate(date)
}