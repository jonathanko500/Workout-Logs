//
//  CustomDatePicker.swift
//  Workout-Log
//
//  Created by Jonathan Ko on 12/1/23.
//

import SwiftUI

struct CustomDatePicker: View{
    
    @Binding var currDate: Date
    
    //update month when button click
    @State var currMonth: Int = 0
    
    var body: some View{
        VStack(spacing: 35){
            
            let days: [String] =
                ["Sun", "Mon", "Tue", "Wed","Thu", "Fri","Sat"]
            
            
            HStack (spacing: 20){
            
                
                VStack(alignment: .leading, spacing: 10){
                    //top of calander holding month + year
                    Text(extraDate()[0])
                        .font(.title.bold())
                    
                    Text(extraDate()[1])
                        .font(.title.bold())
                        
                }
                
                Spacer(minLength: 0)
                
                // start of buttons to change months/year
                Button {
                    
                    withAnimation{
                        currMonth -= 1
                    }
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    withAnimation{
                        currMonth += 1
                    }
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
                //end of buttons to change month/year

            }
            .padding(.horizontal)
            //Day View
            
            HStack (spacing: 0){
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            //dates
            let col = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: col, spacing: 15){
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                            Capsule()
                                .fill(Color("Red"))
                                .padding(.horizontal,8)
                                .opacity(isSameDay(date1: value.date, date2: currDate) ? 1 : 0)
                        )
                        .onTapGesture {
                            currDate = value.date
                        }
                }
            }
            //display log details
            VStack(spacing: 15){
                Text("Workout")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.vertical, 10)
                
                
                
                if let log = logs.first(where: { log in
                    return isSameDay(date1: log.logDate, date2: currDate)
                }) {
                    ForEach(log.log){ log in
                        VStack(alignment: .leading, spacing: 10){
                            
                            //Warm up
                            Text("Warm Up:\n\(log.warmUp.set.sets)")
                                .font(.title2.bold())
                            if !log.warmUp.set.notes.isEmpty {
                                Text("Warm Up Focus:\n\(log.warmUp.set.notes)")
                                    .font(.title3.bold())
                            }
                            //pre set
                            Text("Pre-Set:\n\(log.preSet.set.sets)")
                                .font(.title2.bold())
                            if !log.preSet.set.notes.isEmpty {
                                Text("Pre-Set Focus:\n\(log.preSet.set.notes)")
                                    .font(.title3.bold())
                            }
                            //main set
                            Text("Main-Set:\n\(log.mainSet.set.sets)")
                                .font(.title2.bold())
                            
                            if !log.mainSet.set.notes.isEmpty {
                                Text("Main-Set Focus:\n\(log.mainSet.set.notes)")
                                    .font(.title3.bold())
                            }
                            //warm down
                            Text("Warm Down:\n\(log.warmDown.set.sets)")
                                .font(.title2.bold())

                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    }
                }
                else {
                    Text("Should have done a workout")
                }
            }
            .padding()
            
        }
        .onChange(of: currMonth){newValue in
            // update month
            currDate = getCurrMonth()
            
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue) -> some View {
        VStack{
            if value.day != -1{
                if let log = logs.first(where: { log in
                    return isSameDay(date1: log.logDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: log.logDate, date2: currDate) ? .white: .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    Circle()
                        .fill(isSameDay(date1: log.logDate, date2: currDate) ? .white : Color("Blue"))
                        .frame(width: 8, height: 8)

                } else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currDate) ? .white: .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
        .padding(.vertical)
        .frame(height: 60, alignment: .top)
    }
    
    //check for logs
    func isSameDay(date1: Date, date2: Date)-> Bool{
        let calender = Calendar.current
        return calender.isDate(date1, inSameDayAs: date2)
    }
    
    //get year + month
    func extraDate() -> [String]{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currDate)
        
        return date.components(separatedBy: " ")
    }
    
    
    func getCurrMonth() -> Date{
        let calender = Calendar.current
        //getting current date/month
        guard let currMonth = calender.date(byAdding: .month, value: self.currMonth, to: Date()) else {
            return Date()
        }
        
        return currMonth
    }
    
    
    func extractDate() -> [DateValue]{
        let calender = Calendar.current
        //getting current date/month
        let currMonth = getCurrMonth()
        var days = currMonth.getAllDates().compactMap{ date -> DateValue in
            //getting day
            let day = calender.component(.day, from: date)
            
            return DateValue(day: day, date: date)
            
        }
        
        let firstWeekday = calender.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
}


struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//get current dates
extension Date{
    func getAllDates()->[Date]{
        let calender = Calendar.current
        
        //get start date
        let startDate = calender.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        
        let range = calender.range(of: .day, in: .month, for: startDate)!
        return range.compactMap{ day -> Date in
            return calender.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
