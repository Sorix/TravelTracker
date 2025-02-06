//
//  Created by Алексей on 29.01.2025.
//

import RouteComposer

enum AppConfiguration {
    
    static let tabBarScreen = StepAssembly(
        finder: NilFinder(),
        factory: CompleteFactoryAssembly(
            factory: TabBarControllerFactory()
        )
        .with(
            CompleteFactoryAssembly(
                factory: NavigationControllerFactory {
                    $0.tabBarItem.title = "Profile"
                    $0.tabBarItem.image = .init(systemName: "person")
                }
            )
            .with(ProfileModuleFactory())
            .assemble()
        )
        .with(
            CompleteFactoryAssembly(
                factory: NavigationControllerFactory {
                    $0.tabBarItem.title = "Settings"
                    $0.tabBarItem.image = .init(systemName: "gear")
                }
            )
            .with(SettingsModuleFactory())
            .assemble()
        )
        .assemble()
    )
    .adding(PasscodeRoutingInterceptor<Any?>())
    .using(GeneralAction.replaceRoot())
    .from(GeneralStep.root())
    .assemble()
    
    static var profileScreen = StepAssembly(
            finder: ClassFinder<ProfileViewController, Any?>(),
            factory: NilFactory())
    
    .from(tabBarScreen)
    .assemble()
    
    static var settingsScreen = StepAssembly(
            finder: ClassFinder<SettingsViewController, Any?>(),
            factory: NilFactory())
    
    .from(tabBarScreen)
    .assemble()
    
    static var passcodeScreen: DestinationStep<PasscodeViewController, Any?> {
        StepAssembly(
            finder: ClassFinder<PasscodeViewController, Any?>(),
            factory: PasscodeModuleFactory())
        
        .using(GeneralAction.presentModally())
        .from(GeneralStep.current())
        .assemble()
    }
}
