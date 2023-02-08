 param location  string = resourceGroup().location



resource TestStorage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name:'teststorage'
  location:location 
  kind:'StorageV2'
  sku:{
    name:'Standard_LRS'
   
  }
tags:{
  RqTag:'Rq'
}
}
