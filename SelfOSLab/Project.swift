import ProjectDescription

struct Deployment {
    static let iOS = "17.0"
}

struct Paths {
    struct App {
        private static let baseFolder = "SelfOSLab"
        
        static let sources = Path(stringLiteral: "\(baseFolder)/Sources")
        static let resources = Path(stringLiteral: "\(baseFolder)/Resources")
        static let tests = Path(stringLiteral: "\(baseFolder)/Tests")
        static let uiTests = Path(stringLiteral: "\(baseFolder)/UITests")
    }
    
    struct Platform {
        private static let baseFolder = "Platform"
        static let sources = Path(stringLiteral: "../\(baseFolder)/Sources")
        static let tests = Path(stringLiteral: "../\(baseFolder)/Tests")
    }
}

struct BundleIDs {
    struct App {
        static let main = "com.nikitakrupiei.selfos"
        static let unitTests = "com.nikitakrupiei.selfos.tests"
        static let uiTests = "com.nikitakrupiei.selfos.uitests"
    }
    
    struct Platform {
        static let main = "com.nikitakrupiei.selfos.platform"
        static let unitTests = "com.nikitakrupiei.selfos.platform.tests"
    }
}

struct Targets {
    struct App {
        static let main = "SelfOSLab"
        static let unitTests = "\(main)Tests"
        static let uiTests = "\(main)UITests"
    }
    
    struct Platform {
        static let main = "Platform"
        static let unitTests = "\(main)Tests"
    }
}

struct SignSettings {
    static let teamId = SettingValue(stringLiteral: "493K3DK7Y5")
    
    struct ProvisioningProfiles {
        static let debug = SettingValue(stringLiteral: "match Development \(BundleIDs.App.main)")
        static let release = SettingValue(stringLiteral: "match AppStore \(BundleIDs.App.main)")
    }
}

let project = Project(
    name: Targets.App.main,
    targets: [
        // App
        .target(
            name: Targets.App.main,
            destinations: .iOS,
            product: .app,
            bundleId: BundleIDs.App.main,
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
                .folder(Paths.App.sources),
                .folder(Paths.App.resources),
            ],
            dependencies: [
                .target(name: Targets.Platform.main)
            ],
            settings: .settings(
                base: [
                    "DEVELOPMENT_TEAM": SignSettings.teamId,
                    "CODE_SIGN_STYLE": "Manual",
                ],
                configurations: [
                    .debug(name: "Debug", settings: [
                        "CODE_SIGN_IDENTITY": "Apple Development",
                        "PROVISIONING_PROFILE_SPECIFIER": SignSettings.ProvisioningProfiles.debug
                    ]),
                    .release(name: "Release", settings: [
                        "CODE_SIGN_IDENTITY": "Apple Distribution",
                        "PROVISIONING_PROFILE_SPECIFIER": SignSettings.ProvisioningProfiles.release
                    ])
                ]
            )
        ),
        .target(
            name: Targets.App.unitTests,
            destinations: .iOS,
            product: .unitTests,
            bundleId: BundleIDs.App.unitTests,
            deploymentTargets: .iOS(Deployment.iOS),
            infoPlist: .default,
            buildableFolders: [
                .folder(Paths.App.tests)
            ],
            dependencies: [.target(name: Targets.App.main)]
        ),
        .target(
            name: Targets.App.uiTests,
            destinations: .iOS,
            product: .uiTests,
            bundleId: BundleIDs.App.uiTests,
            deploymentTargets: .iOS(Deployment.iOS),
            buildableFolders: [
                .folder(Paths.App.uiTests)
            ],
            dependencies: [.target(name: Targets.App.main)]
        ),
        
        // Platform
        .target(
            name: Targets.Platform.main,
            destinations: .iOS,
            product: .staticFramework,
            bundleId: BundleIDs.Platform.main,
            deploymentTargets: .iOS(Deployment.iOS),
            buildableFolders: [
                .folder(Paths.Platform.sources)
            ]
        ),
        .target(
            name: Targets.Platform.unitTests,
            destinations: .iOS,
            product: .unitTests,
            bundleId: BundleIDs.Platform.unitTests,
            deploymentTargets: .iOS(Deployment.iOS),
            buildableFolders: [
                .folder(Paths.Platform.tests)
            ],
            dependencies: [
                .target(name: Targets.Platform.main)
            ]
        ),
    ]
)
