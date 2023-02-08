resource TestStorage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name:'TestStorage'
  location:resourceGroup().location 
  kind:'StorageV2'
  sku:{
    name:'Standard_LRS'
   
  }

}
