# Login to Azure (Uncomment the below line if you're not already logged in)
# Connect-AzAccount

# Variables
$resourceGroupName = "example-resources"
$location = "East US"
$storageAccountName = "examplestorageaccount" # Ensure this name is globally unique
$skuName = "Standard_GRS"

# Create a Resource Group
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Create the Storage Account
$storageAccount = New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                                        -Name $storageAccountName `
                                        -Location $location `
                                        -SkuName $skuName `
                                        -Kind "StorageV2" `
                                        -AccessTier "Hot"

# Retrieve and Display the Storage Account Keys
$storageAccountKeys = Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName
$storageAccountKeys | ForEach-Object { Write-Output $_.Value }