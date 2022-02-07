public class MyLibrary {
    private let weatherService: WeatherService

    /// The class's initializer.
    /// Whenever we call the `MyLibrary()` constructor to instantiate a `MyLibrary` instance,
    /// the runtime then calls this initializer.  The constructor returns after the initializer returns.
    public init(weatherService: WeatherService? = nil) {
        self.weatherService = weatherService ?? WeatherServiceImpl()
    }

    public func isWeather(completion: @escaping (Bool?) -> Void) {
        // Fetch the current weather from the backend.
        weatherService.getTemperature { response in
            switch response {
            case let .failure(error):
                print(error)
                completion(nil)
            case let .success(temperature):
                print(temperature)
                completion(true)
            }
        }
    }

    public func isGreeting(completion: @escaping (Bool?) -> Void) {
        weatherService.getGreeting { response in
            switch response {
            case let .failure(error):
                print(error)
                completion(nil)
            case let .success(message):
                print(message)
                completion(true)
            }
        }
    }
}