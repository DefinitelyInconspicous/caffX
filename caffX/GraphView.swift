////
////  GraphView.swift
////  caffX
////
////  Created by Avyan Mehra on 23/8/24.
////
//
//import SwiftUI
//import ExtensionFoundation
//import ExtensionKit
//
//extension CGContext {
//    func drawGridLines(size: CGSize) {
//        setStrokeColor(UIColor.lightGray.cgColor)
//        setLineWidth(0.5)
//        
//        let horizontalSpacing: CGFloat = size.height / 10
//        for i in 1..<10 {
//            let y = CGFloat(i) * horizontalSpacing
//            move(to: CGPoint(x: 0, y: y))
//            addLine(to: CGPoint(x: size.width, y: y))
//        }
//        
//        let verticalSpacing: CGFloat = size.width / 10
//        for i in 1..<10 {
//            let x = CGFloat(i) * verticalSpacing
//            move(to: CGPoint(x: x, y: 0))
//            addLine(to: CGPoint(x: x, y: size.height))
//        }
//        
//        strokePath()
//    }
//}
//
//struct GraphPoint: Identifiable {
//    let id = UUID()
//    let x: Double
//    let y: Double
//}
//
//class GraphViewModel: ObservableObject {
//    @Published var points: [GraphPoint] = []
//    
//    init() {
//        var values = [Double]()
//        for i in 0..<100 {
//            values.append(sin(Double(i)))
//        }
//        
//        let max = values.max() ?? 0
//        let min = values.min() ?? 0
//        
//        for (i, value) in values.enumerated() {
//            let x = Double(i)
//            let y = (value - min) / (max - min)
//            points.append(GraphPoint(x: x, y: y))
//        }
//    }
//}
//struct GraphView: View {
//    @ObservedObject var viewModel = GraphViewModel()
//    
//    var body: some View {
//        
//        Canvas { context, size in
//            let points = viewModel.points
//            
//            // Draw grid lines
//            context.drawGridLines(size: size)
//            
//            // Draw x-axis
//            context.stroke(AsyncLineSequence(start: CGPoint(x: 0, y: size.height / 2),
//                                       end: CGPoint(x: size.width, y: size.height / 2)),
//                           with: .color(.gray))
//            
//            // Draw y-axis
//            context.stroke(AsyncLineSequence(start: CGPoint(x: size.width / 2, y: 0),
//                                       end: CGPoint(x: size.width / 2, y: size.height)),
//                           with: .color(.gray))
//            
//            // Draw data
//            context.stroke(Shape.Path { path in
//                for (i, point) in points.enumerated() {
//                    let x = CGFloat(point.x) / CGFloat(points.count) * size.width
//                    let y = size.height - CGFloat(point.y) * size.height
//                    let point = CGPoint(x: x, y: y)
//                    
//                    if i == 0 {
//                        path.move(to: point)
//                    } else {
//                        path.addLine(to: point)
//                    }
//                }
//            }, with: .color(.blue))
//        }
//    }
//}
//
//
//
//#Preview {
//    GraphView()
//}
