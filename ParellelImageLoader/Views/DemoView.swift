//
//  DemoView.swift
//  ParellelImageLoader
//
//  Created by Sylvan  on 21/10/2025.
//

import SwiftUI

struct DemoView: View {
    enum LoaderType {
        case callback, combine, asyncType
    }

    @StateObject private var viewModel = DemoViewModel()
    private let loaderType: LoaderType

    init(_ loaderType: LoaderType) {
        self.loaderType = loaderType
    }

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading images...")
            } else {
                ScrollView {
                    VStack {
                        ForEach(viewModel.images, id: \.self) {
                            Image(uiImage: $0)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .shadow(radius: 4)
                        }
                    }
                }
            }
        }
        .task {
            switch loaderType {
            case .callback:
                viewModel.loadUsingCallback()
            case .combine:
                viewModel.loadUsingCombine()
            case .asyncType:
                viewModel.loadUsingAsync()
            }
        }
    }
}
