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
        for minuteOffset in 0 ..< 50 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: minuteOffset, to: currentDate)!
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

struct MonthlyHoursOfSunshine: Identifiable {
    var date: Date
    var hoursOfSunshine: Double
    let id = UUID()
    init(month: Int, hoursOfSunshine: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.date = calendar.date(from: DateComponents(year: 2020, month: month))!
        self.hoursOfSunshine = hoursOfSunshine
        
    }
}

struct Configurable_WidgetEntryView : View {
    
    var entry: Provider.Entry
    var data: [MonthlyHoursOfSunshine] = [
        MonthlyHoursOfSunshine(month: 1, hoursOfSunshine: 74),
        MonthlyHoursOfSunshine(month: 2, hoursOfSunshine: 80),
        MonthlyHoursOfSunshine(month: 12, hoursOfSunshine: 62)
    ]
    @AppStorage("pluginDataJSON", store: UserDefaults(suiteName: "group.knowapp")) var name = "hello"
    var body: some View {
        HStack{
            Text(name)
            Chart(data) {
                LineMark(
                    x: .value("Month", $0.date),
                    y: .value("Hours of Sunshine", $0.hoursOfSunshine)
                )
                .foregroundStyle(.blue.opacity(0.5))
            }
        }
        
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
