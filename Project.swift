import ProjectDescription

//Project.swift
let settings = Settings.settings(base: [:], configurations: [
    .debug(
        name: "Development",
        xcconfig: "GolfPro/Sources/Configurations/Configuration-Development.xcconfig"
    ),
    .debug(
        name: "Staging",  // It's for Debug, but it's called Inhouse
        xcconfig: "GolfPro/Sources/Configurations/Configuration-Staging.xcconfig"
    ),
    .release(
        name: "Production",
        xcconfig: "GolfPro/Sources/Configurations/Configuration-Production.xcconfig"
    )
])

let project = Project(
    name: "GolfPro",
    packages: [
        .package(
            url: "https://github.com/Swinject/Swinject",
            .upToNextMajor(from: "2.8.3")
        ),
        .package(
            url: "https://github.com/kvasnetskyi/CombineNetworking",
            .upToNextMajor(from: "0.1.3")
        ),
        .package(
            url: "https://github.com/kishikawakatsumi/KeychainAccess",
            .upToNextMajor(from: "4.0.0")
        ),
    ],
    settings: settings,
    targets: [
        .target(
            name: "GolfPro",
            destinations: .iOS,
            product: .app,
            bundleId: "com.trackman.GolfPro",
            infoPlist: .extendingDefault(with: [
                "UILaunchStoryboardName": "LaunchScreen",
                "AUTH_BASE_URL": "$(AUTH_BASE_URL)",
                "TOKEN_BASE_URL": "$(TOKEN_BASE_URL)",
                "APP_ENVIRONMENT": "$(APP_ENVIRONMENT)",
                "STORAGE_BASE_URL": "$(STORAGE_BASE_URL)",
                "AUTH_API_KEY": "$(AUTH_API_KEY)"
            ]),
            sources: ["GolfPro/Sources/**"],
            resources: ["GolfPro/Resources/**"],
            dependencies: [
                .target(name: "AuthenticationUI"),
                .target(name: "Authentication"),
                .target(name: "HomeUI"),
                .target(name: "Home"),
                .target(name: "AppContainer"),
            ]
        ),
        .target(
            name: "GolfProTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.trackman.GolfProTests",
            infoPlist: .default,
            sources: ["GolfPro/Tests/**"],
            resources: [],
            dependencies: [.target(name: "GolfPro")]
        ),
        .target(
            name: "Entities",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.trackman.GolfPro",
            infoPlist: .default,
            sources: ["Entities/Sources/**"],
            resources: [],
            dependencies: []
        ),
        .target(
            name: "CoreUI",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.trackman.GolfPro",
            infoPlist: .default,
            sources: ["CoreUI/Sources/**"],
            resources: [],
            dependencies: [.target(name: "Entities")]
        ),
        .target(
            name: "Authentication",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.trackman.GolfPro",
            infoPlist: .default,
            sources: ["Authentication/Sources/**"],
            resources: [],
            dependencies: [
                .target(name: "Utility"),
                .target(name: "Entities"),
                .target(name: "Networking"),
                .target(name: "CoreUI"),
            ]
        ),
        .target(
            name: "AuthenticationUI",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.trackman.GolfPro",
            infoPlist: .default,
            sources: ["AuthenticationUI/Sources/**"],
            resources: [],
            dependencies: [.target(name: "CoreUI"),
                           .target(name: "Authentication")]
        ),
        .target(
            name: "Home",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.trackman.GolfPro",
            infoPlist: .default,
            sources: ["Home/Sources/**"],
            resources: [],
            dependencies: [
                .target(name: "Entities"),
                .target(name: "Networking"),
                .target(name: "CoreUI"),
            ]
        ),
        .target(
            name: "HomeUI",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.trackman.GolfPro",
            infoPlist: .default,
            sources: ["HomeUI/Sources/**"],
            resources: [],
            dependencies: [
                .target(name: "CoreUI"),
                .target(name: "Home"),
                .target(name: "Utility"),
            ]
        ),
        .target(
            name: "AppContainer",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.trackman.GolfPro",
            infoPlist: .default,
            sources: ["AppContainer/Sources/**"],
            resources: [],
            dependencies: [
                .target(name: "Entities"),
                .target(name: "Networking"),
                .target(name: "Authentication"),
                .package(product: "Swinject"),
                .package(product: "CombineNetworking"),
                .target(name: "Home"),
            ]
        ),
        .target(
            name: "Networking",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.trackman.GolfPro",
            infoPlist: .default,
            sources: ["Networking/Sources/**"],
            resources: [],
            dependencies: [
                .target(name: "Entities"),
                .package(product: "Swinject"),
                .package(product: "CombineNetworking"),
                .package(product: "KeychainAccess")
            ]
        ),
        .target(
            name: "Utility",
            destinations: .iOS,
            product: .staticFramework,
            bundleId: "com.trackman.GolfPro",
            infoPlist: .default,
            sources: ["Utility/Sources/**"],
            resources: [],
            dependencies: [
            ]
        ),
    ]
)
