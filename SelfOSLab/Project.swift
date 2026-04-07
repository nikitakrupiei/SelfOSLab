import ProjectDescription

struct Deployment {
    static let iOS = "17.0"
}

struct Paths {
    private static let baseFolder = "SelfOSLab"
    
    static let sources = Path(stringLiteral: "\(baseFolder)/Sources")
    static let resources = Path(stringLiteral: "\(baseFolder)/Resources")
    static let tests = Path(stringLiteral: "\(baseFolder)/Tests")
    static let uiTests = Path(stringLiteral: "\(baseFolder)/UITests")
}

struct BundleIDs {
    static let app = "com.nikitakrupiei.selfos"
    static let dev = "com.nikitakrupiei.selfos.dev"
    static let devTests = "com.nikitakrupiei.selfos.dev.tests"
    static let devUITests = "com.nikitakrupiei.selfos.dev.uitests"
}

struct Targets {
    static let app = "SelfOSLab"
    static let dev = "SelfOSLab-Dev"
    static let unitTests = "\(dev)Tests"
    static let uiTests = "\(dev)UITests"
}

let project = Project(
    name: Targets.app,
    packages: [
        .local(path: "../Platform")
    ],
    targets: [
        .target(
            name: Targets.app,
            destinations: .iOS,
            product: .app,
            bundleId: BundleIDs.app,
            deploymentTargets: .iOS(Deployment.iOS),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                .folder(Paths.sources),
                .folder(Paths.resources),
            ],
            dependencies: [
                .package(product: "Platform")
            ]
        ),
        .target(
            name: Targets.dev,
            destinations: .iOS,
            product: .app,
            bundleId: BundleIDs.dev,
            deploymentTargets: .iOS(Deployment.iOS),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                .folder(Paths.sources),
                .folder(Paths.resources),
            ],
            dependencies: [
                .package(product: "Platform")
            ]
        ),
        .target(
            name: Targets.unitTests,
            destinations: .iOS,
            product: .unitTests,
            bundleId: BundleIDs.devTests,
            deploymentTargets: .iOS(Deployment.iOS),
            infoPlist: .default,
            buildableFolders: [
                .folder(Paths.tests)
            ],
            dependencies: [.target(name: Targets.dev)]
        ),
        .target(
            name: Targets.uiTests,
            destinations: .iOS,
            product: .uiTests,
            bundleId: BundleIDs.devUITests,
            deploymentTargets: .iOS(Deployment.iOS),
            buildableFolders: [
                .folder(Paths.uiTests)
            ],
            dependencies: [.target(name: Targets.dev)]
        )
    ]
)
