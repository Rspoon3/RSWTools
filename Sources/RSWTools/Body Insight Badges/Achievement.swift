//
//  Achievement.swift
//  
//
//  Created by Richard Witherspoon on 11/18/19.
//

import SwiftUI

public struct Achievement : Identifiable{
    public let id = UUID()
    public let amount : Double
    public let title : String
    public let type : Badge
    
    
    public init(amount : Double, title: String, type : Badge){
        self.amount = amount
        self.title = title
        self.type = type
    }
    
    public func getBadge(isHiddenIfGreaterThan number : Double) -> AnyView {
        switch type {
        case .chart:
            return AnyView(ChartBadge(isHidden: number >= amount ? false : true))
        case .circle:
            return AnyView(CircleBadge(isHidden: number >= amount ? false : true))
        case .flower:
            return AnyView(FlowerBadge(isHidden: number >= amount ? false : true))
        case .rectangle:
            return AnyView(SquareToCircleBadge(isHidden: number >= amount ? false : true))
        case .movingRings:
            return AnyView(MovingRingsBadge(isHidden: number >= amount ? false : true))
        case .pieChart:
            return AnyView(PieChartBadge(isHidden: number >= amount ? false : true))
        case .pulsingStar:
            return AnyView(PulsingStarBadge(isHidden: number >= amount ? false : true))
        case .ringSpinner:
            return AnyView(RingSpinnerBadge(isHidden: number >= amount ? false : true))
        case .rotatingCircle:
            return AnyView(RotatingCircleBadge(isHidden: number >= amount ? false : true))
        case .rotatingStar:
            return AnyView(RotatingStarBadge(isHidden: number >= amount ? false : true))
        case .shapeChange:
            return AnyView(ShapeChangeBadge(isHidden: number >= amount ? false : true))
        case .shiftingGrid:
            return AnyView(ShiftingGridBadge(isHidden: number >= amount ? false : true))
        case .spikyCircle:
            return AnyView(SpikyCircleBadge(isHidden: number >= amount ? false : true))
        case .trimmingTrianlge:
            return AnyView(TrimmingTrianlgeBadge(isHidden: number >= amount ? false : true))
        case .rotatingTriangle:
            return AnyView(RotatingTrianlgeBadge(isHidden: number >= amount ? false : true))
        case .hex:
            return AnyView(HexBadge(isHidden: number >= amount ? false : true))
        }
    }
}


public enum Badge: CaseIterable {
    //16
    case chart
    case circle
    case flower
    case rectangle
    case movingRings
    case pieChart
    case pulsingStar
    case ringSpinner
    case rotatingCircle
    case rotatingStar
    case shapeChange
    case shiftingGrid
    case spikyCircle
    case rotatingTriangle
    case trimmingTrianlge
    case hex
    
    static let opacity = 0.3
}
