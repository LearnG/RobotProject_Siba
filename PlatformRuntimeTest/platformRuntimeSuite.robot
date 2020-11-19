***Settings***
Library     Remote     http://127.0.0.1:1234/PlatformRuntime     WITH NAME     PlatformRuntime
Library      XML
Library    String
Library    OperatingSystem  

*** Variables ***
${CurrencyToSet}    GBP
${LanguageToSet}    English
${HwtypeToSet}      hwtype_set
&{Map1}    type=BASE    path=C:\ProgramData\NCR\Platform\config\cashacceptor\mei_zt_sc.json
&{Map2}    key=MEI_ZT_SC    currency=USD
@{Vec1}    subkey    propertyValue

*** Test Cases ***
#DeviceConfigParser TestCases
Automation#platformRuntimeSuite_DeviceConfigParser#TC1_SetSelectedCurrency
    Log To Console    \nBegin of TC - SetSelectedCurrency
    Set Selected Currency    ${CurrencyToSet}
    ${CurrencyToVerifyFromFile}    XML.Get Element Text    C:/ProgramData/NCR/Platform/config/xpdm_config.xml    .//currency
    Should Be Equal    ${Currency_To_Set}    ${CurrencyToVerifyFromFile}       
    Log To Console     End of TC - SetSelectedCurrency

Automation#platformRuntimeSuite_DeviceConfigParser#TC2_SetSelectedLanguage
    Log To Console    \nBegin of TC - SetSelectedLanguage
    Set Selected Language    ${LanguageToSet}
    ${LanguageToVerifyFromFile}    XML.Get Element Text    C:/ProgramData/NCR/Platform/config/xpdm_config.xml    .//language   
    Log To Console     The Value is ${LanguageToVerifyFromFile}
    Should Be Equal    ${LanguageToSet}    ${LanguageToVerifyFromFile}       
    Log To Console     End of TC - SetSelectedLanguage

Automation#platformRuntimeSuite_DeviceConfigParser#TC3_SetSelectedHwType
    Log To Console    \nBegin of TC - SetSelectedHwType
    PlatformRuntime.Set Selected Hardware Type    ${HwtypeToSet}
    ${HwtypeToVerifyFromFile}    XML.Get Element Text    C:/ProgramData/NCR/Platform/config/xpdm_config.xml    .//hwtype   
    Log To Console     The Value is ${HwtypeToVerifyFromFile}
    Should Be Equal    ${HwtypeToSet}    ${HwtypeToVerifyFromFile}       
    Log To Console     End of TC - SetSelectedHwType

Automation#platformRuntimeSuite_DeviceConfigParser#TC4_GetSelectedLanguage
    Log To Console    \nBeging of TC - GetSelectedLanguage
    ${GetLanguage}    PlatformRuntime.Get Selected Language
    Log To Console    Get Selected Language - ${GetLanguage}
    Log To Console    End of TC - GetSelectedLanguage

Automation#platformRuntimeSuite_DeviceConfigParser#TC5_GetSelectedHwType
    Log To Console    \nBegin of TC - GetSelectedHwType
    ${GetHwType}      PlatformRuntime.Get Selected Hardware Type
    Log To Console    Get Hwtype - ${GetHwType}
    Log to Console    End of TC - GetSelectedHwType            

Automation#platformRuntimeSuite_DeviceConfigParser#TC6_GetSelectedFirmwareUpdateOptions
    Log To Console    \nBegin of TC - GetSelectedFirmwareUpdateOptions
    ${GetFWUpdateOption}    PlatformRuntime.Get Selected Firmware Update Option
    Log To Console    Get Selected FW Update Option - ${GetFWUpdateOption}
    Log To Console    End of TC - GetSelectedFirmwareUpdateOptions

Automation#platformRuntimeSuite_DeviceConfigParser#TC7_GetSelectedCurrency
    Log To Console    \nBegin of TC - GetSelectedCurrency
    ${GetSelectedCurrency}    PlatformRuntime.Get Selected Currency
    Log To Console    Get Selected FW Update Option - ${GetSelectedCurrency}
    Log To Console    End of TC - GetSelectedFirmwareUpdateOptions
           
Automation#platformRuntimeSuite_DeviceConfigParser#TC8_GetModelInformation
    Log To Console    \nBegin of TC - GetModelInformation
    ${GetEnumeratedDevices}   PlatformRuntime.Enumerate Detected Devices
    Log To Console    ${GetEnumeratedDevices}
    ${GetModelInformation}    PlatformRuntime.Get Model Information    CashAcceptor MEI_ZT_SC    CurrencyMap
    Log To Console    ${GetModelInformation}
    FOR    ${item}    IN    @{GetModelInformation}
        Log To Console    ${item}
    END     
    Log To Console    End of TC - getModelInformation

Automation#platformRuntimeSuite_DeviceConfigParser#TC9_GetLanguageInformation
    Log To Console    \nBegin of TC - getLanguageInformation
    ${values}    PlatformRuntime.Get Language Information
    # Log To Console    ${Values}
    FOR    ${item}    IN    @{values}
            Log To Console    ${item}
    END        
    Log To Console    End of TC - getLanguageInformation
    
Automation#platformRuntimeSuite_DeviceConfigParser#TC10_GetHardwareInformation
    Log To Console    \nBegin of TC - getHardwareInformation
    @{values}    PlatformRuntime.Get Hardware Information
    FOR    ${item}    IN    @{values}
            Log To Console    ${item}
    END        
    Log To Console    End of TC - getHardwareInformation

Automation#platformRuntimeSuite_DeviceConfigParser#TC11_GetDeviceNames
    Log To Console    \nBegin of TC - GetDeviceNames
    @{DeviceNames}    PlatformRuntime.Get Device Names
    FOR    ${item}    IN    @{DeviceNames}
            Log To Console    ${item}
    END 
    Log To Console     \nEnd of TC - GetDeviceNames   
        
Automation#platformRuntimeSuite_DeviceConfigParser#TC12_GetCurrencyInformation
    Log To Console    \nBegin of TC - GetCurrencyInformation
    @{CurrencyInformation}    PlatformRuntime.Get Currency Information
    FOR    ${item}    IN    @{CurrencyInformation}
            Log To Console    ${item}
    END   
    Log To Console    End of TC - GetCurrencyInformation

Automation#platformRuntimeSuite_DeviceConfigParser#TC13_GetCurrencyChildNames
    Log To Console    \nBegin of TC - GetCurrencyChildNames
    ${CurrencyChildNames}    PlatformRuntime.Get Currency Child Names    MoneyControls_BCR
    FOR    ${item}    IN    @{CurrencyChildNames}
            Log To Console    ${item}
    END   
    Log To Console    End of TC - GetCurrencyChildNames

Automation#platformRuntimeSuite_DeviceConfigParser#TC14_GetActionSetWithPaths
    Log To Console    \nBegin of TC - GetActionSetWithPaths
    @{ActionSetWithPaths}    PlatformRuntime.Get Action Set With Paths    MoneyControls_BCR
    FOR    ${item}    IN    @{ActionSetWithPaths}
            Log To Console    ${item}
    END   
    Log To Console    End of TC - GetActionSetWithPaths

Automation#platformRuntimeSuite_DeviceConfigParser#TC15_GetAttributes
    Log To Console    \nBegin of TC - getAttributes
    @{Attributes}    PlatformRuntime.Get Attributes    CashAcceptor MEI_ZT_SC    ActionJsonProfileSetProperty    FALSE
    FOR    ${item}    IN    @{Attributes}
            Log To Console    ${item}
    END   
    Log To Console    End of TC - getAttributes

Automation#platformRuntimeSuite_DeviceConfigParser#TC16_GetAttributes
    Log To Console    \nBegin of TC - getAttributes
    @{Attributes}    PlatformRuntime.Get Attributes    CashAcceptor MEI_ZT_SC    ActionJsonProfileSetProperty    TRUE
    FOR    ${item}    IN    @{Attributes}
            Log To Console    ${item}
    END   
    Log To Console    End of TC - getAttributes

Automation#platformRuntimeSuite_DeviceConfigParser#TC17_checkAndUpgradeConfigXMLFile
    Log To Console    \nBegin of TC - checkAndUpgradeConfigXMLFile
    ${Result}    PlatformRuntime.Check And Upgrade Config XML File    temp/MoneyControls_BCR.xml    C:\ProgramData\NCR\Platform\config\MoneyControls_BCR.xml
    Log To Console    ${Result}
    Log To Console    \nEnd of TC - checkAndUpgradeConfigXMLFile
    
# Automation#platformRuntimeSuite_DeviceConfigParser#TC7
    # Log To Console    \nBegin of TC - getConfiguration
    # ${getConfigurationValue}    PlatformRuntime.Get Configuration    CashAcceptor MEI_ZT_SC    ActionSet    ActionJsonProfileSetProperty    @{Vec1}    &{Map1}    &{Map2}
    # Log To Console    ${getConfigurationValue}
    
# Automation#platformRuntimeSuite_DeviceConfigParser#TC8
    # Log To Console    \nBegin of TC - getConfigurations
    # ${getConfigurationValue}    PlatformRuntime.Get Configurations   CashAcceptor MEI_ZT_SC    ActionSet    ActionJsonProfileSetProperty    &{Map1}    &{Map2}     
    # Log To Console    ${getConfigurationValue}
#DeviceDetectParser TestCases
Automation#platformRuntimeSuite_DeviceDetectParser#TC1_GetPlatformProcessInformation
    Log To Console    \nBegin of TC-getPlatformProcessInformation
    ${ProcessInformation}    PlatformRuntime.Get Platform Process Information
    Log To Console    ${ProcessInformation}
    Log To Console    \nEnd of TC-getPlatformProcessInformation

Automation#platformRuntimeSuite_DeviceDetectParser#TC2_enumerateDetectedDevices
    Log To Console    \nBegin of TC-enumerateDetectedDevices
    ${getEnumeratedDevices}    PlatformRuntime.Enumerate Detected Devices
    Log To Console       ${getEnumeratedDevices}
    Log To Console    \nEnd of TC-enumerateDetectedDevices()
      
Automation#platformRuntimeSuite_DeviceDetectParser#TC3_GetDetectInformation
    Log To Console    \nBegin of TC - getDetectInformation
    @{DetectInformation}    PlatformRuntime.Get Detect Information    CashAcceptor.SCN.1
    FOR    ${item}    IN    @{DetectInformation}
            Log To Console    ${item}
    END       
    Log To Console    End of TC - getDetectInformation

Automation#platformRuntimeSuite_DeviceDetectParser#TC4_GetDetectParameter
    Log To Console    \nBegin of TC - getDetectParameter
    ${getParameter}    PlatformRuntime.Get Detect Parameter    CashAcceptor.SCN.1    deviceName
    Log To Console    ${getParameter}
    Log To Console    \nEnd of TC - getDetectParameter
      
Automation#platformRuntimeSuite_DeviceDetectParser#TC5_GetConfigResultsInformation
    Log To Console    \nBegin of TC - getConfigResultsInformation
    @{ConfigResultInfo}    PlatformRuntime.Get Config Results Information    CashAcceptor.SCN.1
    FOR    ${item}    IN    @{ConfigResultInfo}
            Log To Console    ${item}
    END            
    Log To Console    \nEnd of TC - getConfigResultsInformation

Automation#platformRuntimeSuite_DeviceDetectParser#TC6_GetConfigResultsParameter
    Log To Console    \nBegin of TC - getConfigResultsParameter
    ${ConfigResultParameter}    PlatformRuntime.Get Config Results Parameter    CashAcceptor.SCN.1    lastRunStatus
    Log To Console    ${ConfigResultParameter}            
    Log To Console    \nEnd of TC - getConfigResultsParameter

Automation#platformRuntimeSuite_DeviceDetectParser#TC7_GetFirmwareUpdateResultsInformation
    Log To Console    \nBegin of TC-getFirmwareUpdateResultsInformation
    @{FirmwareUpdateResultInfo}    PlatformRuntime.Get Firmware Update Results Information    CashAcceptor.SCN.1
    FOR    ${item}    IN    @{FirmwareUpdateResultInfo}
            Log To Console    ${item}
    END            
    Log To Console    \nEnd of TC-getFirmwareUpdateResultsInformation

Automation#platformRuntimeSuite_DeviceDetectParser#TC6_GetFirmwareUpdateResultsParameter
    Log To Console    \nBegin of TC-getFirmwareUpdateResultsParameter
    ${FirmwareResultParameter}    PlatformRuntime.Get Firmware Update Results Parameter    CashAcceptor.SCN.1    lastRunStatus
    Log To Console    ${FirmwareResultParameter}
    Log To Console    \nEnd of TC-getFirmwareUpdateResultsParameter
    
#DeviceInfo
Automation#platformRuntimeSuite_DeviceDetectParser#TC8_GetDeviceName
    Log To Console    \nBegin of TC-getDeviceName
    ${DeviceName}     PlatformRuntime.Get Device Name
    Log To Console    ${DeviceName}
    Log To Console    \nEnd of TC-getDeviceName

Automation#platformRuntimeSuite_DeviceDetectParser#TC9_GetDeviceClass
    Log To Console    \nBegin of TC-getDeviceClass
    ${DeviceClass}     PlatformRuntime.Get Device Class
    Log To Console    ${DeviceClass}
    Log To Console    \nEnd of TC-getDeviceName

Automation#platformRuntimeSuite_DeviceDetectParser#TC10_GetProfileName
    Log To Console    \nBegin of TC-getProfileName
    @{ProfileName}     PlatformRuntime.Get Profile Name
    FOR    ${item}    IN    @{ProfileName}
            Log To Console    ${item}
    END 
    Log To Console    \nEnd of TC-getProfileName

Automation#platformRuntimeSuite_DeviceDetectParser#TC11_GetInstanceName
    Log To Console    \nBegin of TC-getInstanceName
    ${InstanceName}     PlatformRuntime.Get Instance Name    0
    Log To Console    ${InstanceName}
    Log To Console    \nEnd of TC-getInstanceName

Automation#platformRuntimeSuite_DeviceDetectParser#TC12_GetDeviceCashType
    Log To Console    \nBegin of TC-getDeviceCashType
    ${DeviceCashType}    PlatformRuntime.Get Device Cash Type
    Log To Console    ${DeviceCashType}
    Log To Console    \nEnd of TC-getDeviceCashType

Automation#platformRuntimeSuite_DeviceDetectParser#TC13_GetDeviceAdditionalData
    Log To Console    \nBegin of TC- getDeviceAdditionalData
    @{AdditionalData}     PlatformRuntime.Get Device Additional Data
    FOR    ${item}    IN    @{AdditionalData}
            Log To Console    ${item}
    END 
    Log To Console    \nEnd of TC-getDeviceAdditionalData

#ErrorCodeTestCases
Automation#platformRuntimeSuite_ErrorCases#TC33_XMLFileLoadFail
    Log To Console    \nBegin of TC - SetSelectedCurrency
    ${returnValue}    Set Selected Currency    ${CurrencyToSet}
    Should Not Be Empty    ${returnValue}
    #${CurrencyToVerifyFromFile}    XML.Get Element Text    C:/ProgramData/NCR/Platform/config/xpdm_config.xml    .//currency
    #Should Be Equal    ${CurrencyToVerifyFromFile}    1000        
    Log To Console     End of TC - SetSelectedCurrency


         