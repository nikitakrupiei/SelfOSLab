import ProjectDescription

let project = Project(
    name: "SelfOSLab",
    packages: [
        .local(path: "../Platform")
    ],
    targets: [
        .target(
            name: "SelfOSLab",
            destinations: .iOS,
            product: .app,
            bundleId: "com.nikitakrupiei.selfos",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "SelfOSLab/Sources",
                "SelfOSLab/Resources",
            ],
            dependencies: [
                .package(product: "Platform")
            ]
        ),
        .target(
            name: "SelfOSLab-Dev",
            destinations: .iOS,
            product: .app,
            bundleId: "com.nikitakrupiei.selfos.dev",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            buildableFolders: [
                "SelfOSLab/Sources",
                "SelfOSLab/Resources",
            ],
            dependencies: [
                .package(product: "Platform")
            ]
        ),
        .target(
            name: "SelfOSLabTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.nikitakrupiei.selfos.dev.tests",
            infoPlist: .default,
            buildableFolders: [
                "SelfOSLab/Tests"
            ],
            dependencies: [.target(name: "SelfOSLab-Dev")]
        ),
        .target(
            name: "SelfOSLabUITests",
            destinations: .iOS,
            product: .uiTests,
            bundleId: "com.nikitakrupiei.selfos.dev.uitests",
            buildableFolders: [
                "SelfOSLab/UITests"
            ],
            dependencies: [.target(name: "SelfOSLab-Dev")]
        )
    ]
)
