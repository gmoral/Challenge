//
//  AppContainer.swift
//  Challenge
//
//  Created by Guillermo Moral on 08/03/2023.
//

protocol AppContainer {
    var apiClient: ApiClientService & RemoteImageDataService { get }
    var localDataService: LocalDataImageService { get }

    func getDataImageUseCase() -> ImageDataUseCase
}

struct AppContainerImp: AppContainer {

    var apiClient: ApiClientService & RemoteImageDataService = ApiClientServiceImp()
    var localDataService: LocalDataImageService = LocalDataImageServiceImp()

    func getDataImageUseCase() -> ImageDataUseCase {
        let imageDataRepository = ImageRepositoryImp(
            remoteDataService: apiClient,
            localDataCache: localDataService)
        return ImageDataUseCaseImp(imageDataRepository: imageDataRepository)
    }
}
