//
//  Configurable_Widget.swift
//  Configurable Widget
//
//  Created by Shahab Hashmi on 03/12/22.
//

import WidgetKit
import SwiftUI
import Intents
import Charts
import UIKit

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent())
    }
    
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }
    
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for secondOffset in 0 ..< 100 {
            let entryDate = Calendar.current.date(byAdding: .second, value: secondOffset * 5, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
}

//struct MonthlyHoursOfSunshine: Identifiable {
//    var date: Date
//    var hoursOfSunshine: Double
//    let id = UUID()
//    init(month: Int, hoursOfSunshine: Double) {
//        let calendar = Calendar.autoupdatingCurrent
//        self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
//        self.hoursOfSunshine = hoursOfSunshine
//
//    }
//}

struct ChartDatapoint : Identifiable{
    let id: UUID = UUID()
    let x: Date
    let y: Int
}

struct Configurable_WidgetEntryView : View {
    
    var entry: Provider.Entry
    var viewChange: Bool = false
    var data: Dictionary<String, AnyObject> = Dictionary()
    var graphData: [ChartDatapoint] = []
    @AppStorage("pluginDataJSON", store: UserDefaults(suiteName: "group.knowapp")) var name = "hello"
    init(entry: Provider.Entry){
        self.entry = entry
        self.data = getDataFromURL(url: "http://127.0.0.1:8000/widget/dune")
        if self.data["type"] as! String == "Graph" {
            let dataPoints = self.data["data"] as! [Int]
            let timestamps = self.data["timestamp"] as! [String]
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH':'mm':'ss"
            
            for i in 0..<dataPoints.count {
                let date = dateFormatter.date(from: timestamps[i])
                graphData.append(ChartDatapoint(x: date!, y: dataPoints[i]))
            }
        }
    }
    var body: some View {
        // populateGraphData()
        if viewChange {
            graphView
        } else {
            contentView
        }
    }
    
    var graphView: some View {
        HStack {
            Chart(graphData) {
                AreaMark(
                    x: .value("Month", $0.x),
                    y: .value("Hours of Sunshine", $0.y)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(.linearGradient(Gradient(colors: [.green, Color(red: 0.0, green: 1.0, blue: 0.0, opacity: 0.3)]), startPoint: .center, endPoint: .bottom))
            }
            .frame(height: 120)
            .padding(10)
            .chartLegend(.automatic)
        }
    }
    
    var contentView: some View {
        VStack(alignment: .leading) {
            Image(systemName: "message").font(.system(size: 20, weight: .heavy)).imageScale(.large)
            Text("ChainWiz").font(.system(size: 20, weight: .heavy)).imageScale(.large)
            Text("Marketplace for Web3 projects").font(.system(size: 20, weight: .medium))
            Text("Click to view our community").font(.system(size: 15, weight: .light))
        }
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.linearGradient(Gradient(colors: [.green, Color(red: 0.0, green: 1.0, blue: 0.0, opacity: 0.3)]), startPoint: .center, endPoint: .bottom))
    }

//    func populateGraphData(){
//        self.data = getDataFromURL(url: "http://127.0.0.1:8000/widget/dune")
//        if self.data["type"] as! String == "Graph" {
//            let dataPoints = self.data["data"] as! [Int]
//            let timestamps = self.data["timestamp"] as! [String]
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "HH':'mm':'ss"
//
//            for i in 0..<dataPoints.count {
//                let date = dateFormatter.date(from: timestamps[i])
//                graphData.append(ChartDatapoint(x: date!, y: dataPoints[i]))
//            }
//        }
//    }
    func getDataFromURL(url: String) -> Dictionary<String, AnyObject> {
        var rq = URLRequest(url: URL(string: url)!)
        rq.httpMethod = "GET"
        let session = URLSession.shared
        var tempData: Data = Data()
        var json: Dictionary<String, AnyObject> = Dictionary()
        let task = session.dataTask(with: rq, completionHandler: {
            data, response, error -> Void in
            tempData = data!
        })
        task.resume()
        sleep(1)
        do{
            json = try JSONSerialization.jsonObject(with: tempData) as! Dictionary<String, AnyObject>
        } catch {
            print("error")
        }
        
        return json["data"] as! Dictionary<String, AnyObject>
    }
    
}

@main
struct Configurable_Widget: Widget {
    let kind: String = "Configurable_Widget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            Configurable_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct Configurable_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Configurable_WidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}

struct PluginModelDecoded: Identifiable, Codable {
    let id: String = UUID().uuidString
    let name: String
    let queryURL: String
    let vizualization: Array<String>
}
