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
                    $0.tabBarItem.title = "Portfolio"
                    $0.tabBarItem.image = .init(systemName: "person")
                }
            )
            .with(PortfolioModuleFactory())
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
    .adding(PasscodeRoutingInterceptor<Void>())
    .using(GeneralAction.replaceRoot())
    .from(GeneralStep.root())
    .assemble()
    
    static var portfolioScreen: DestinationStep<PortfolioViewController, Void> {
        StepAssembly(
            finder: ClassFinder<PortfolioViewController, Void>(),
            factory: NilFactory())
        
        .from(tabBarScreen)
        .assemble()
    }
    
    static var settingsScreen: DestinationStep<SettingsViewController, Void> {
        StepAssembly(
            finder: ClassFinder<SettingsViewController, Void>(),
            factory: NilFactory())
        
        .from(tabBarScreen)
        .assemble()
    }
    
    static var passcodeScreen: DestinationStep<PasscodeViewController, Void> {
        StepAssembly(
            finder: ClassFinder<PasscodeViewController, Void>(),
            factory: PasscodeModuleFactory())
        
        .using(GeneralAction.presentModally())
        .from(GeneralStep.current())
        .assemble()
    }
}
