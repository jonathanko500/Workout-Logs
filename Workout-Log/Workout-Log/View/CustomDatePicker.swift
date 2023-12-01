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
                    Text("Year")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("Month")
                        .font(.title.bold())
                        
                }
                
                Spacer(minLength: 0)
                
                // start of buttons to change months/year
                Button {
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button {
                    
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
                    Text("\(value.day)")
                }
            }
            
            
        }
    }
    
    func extractDate() -> [DateValue]{
        let calender = Calendar.current
        //getting current date/month
        guard let currMonth = calender.date(byAdding: .month, value: self.currMonth, to: Date()) else {
            return []
        }
        return currMonth.getAllDates().compactMap{ date -> DateValue in
            //getting day
            let day = calender.component(.day, from: date)
            
            return DateValue(day: day, date: date)
            
        }
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
        let range = calender.range(of: .day, in: .month, for: self)!
        return range.compactMap{ day -> Date in
            return calender.date(byAdding: .day, value: day, to: self)!
        }
    }
}
