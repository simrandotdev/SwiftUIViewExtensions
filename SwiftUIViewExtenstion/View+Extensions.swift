//
//  View+Extensions.swift
//  SwiftUIViewExtenstion
//
//  Created by Simran Preet Narang on 2023-06-20.
//

import SwiftUI

extension View {
    func navigationStack(withTitle title: String) -> some View {
        return NavigationStack {
            self
                .navigationTitle(title)
        }
    }
    
    
    func navigationStack(withTitle title: String, path: Binding<NavigationPath>) -> some View {
        return NavigationStack(path: path) {
            self
                .navigationTitle(title)
        }
    }
    
    func embedInZStack() -> some View {
        return ZStack {
            self
        }
    }
    
    func embedInHStack() -> some View {
        return HStack {
            self
        }
    }
    
    func embedInVStack() -> some View {
        return VStack {
            self
        }
    }
    
    func embedIn(stack: Stack) -> some View {
        switch stack {
        case .HStack:
            return AnyView(embedInHStack())
        case .VStack:
            return AnyView(embedInVStack())
        case .ZStack:
            return AnyView(embedInZStack())
        }
    }
    
    func backgroundColor(_ color: Color) -> some View {
        return ZStack {
            color
            self
        }
    }
    
    func navigationLink(destination: () -> some View) -> some View {
        return NavigationLink(destination: destination) {
            self
        }
    }
}

enum Stack {
    case HStack
    case VStack
    case ZStack
}
