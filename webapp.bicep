param webAppName string = uniqueString(resourceGroup().id) // Generate unique String for web app name  
   param sku string = 'F1' // The SKU of App Service Plan  
   param linuxFxVersion string = 'NODE|14-lts' // The runtime stack of web app  
   param location string = resourceGroup().location // Location for all resources  
   param repositoryUrl string = 'https://github.com/nasir614/ReactNativeTodo.git'  
   param branch string = 'master'  
   var appServicePlanName = toLower('AppServicePlan-${webAppName}')  
   var webSiteName = toLower('wapp-${webAppName}')  
   resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {  
     name: appServicePlanName  
     location: location  
     properties: {  
       reserved: true  
     }  
     sku: {  
       name: sku  
     }  
   resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {  
     name: hostingPlanName  
     location: location  
     sku: {  
       name: skuName  
     }  
     properties:{  
       reserved: true  
     }  
   }  
   }  
   resource appService 'Microsoft.Web/sites@2020-06-01' = {  
     name: webSiteName  
     location: location  
     properties: {  
       serverFarmId: appServicePlan.id  
       siteConfig: {  
         linuxFxVersion: linuxFxVersion  
       }  
     }  
   }  
   resource srcControls 'Microsoft.Web/sites/sourcecontrols@2021-01-01' = {  
     name: '${appService.name}/web'  
     properties: {  
       repoUrl: repositoryUrl  
       branch: branch  
       isManualIntegration: true  
     }  
   }
