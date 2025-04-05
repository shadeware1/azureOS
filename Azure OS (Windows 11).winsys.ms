s_

[3.5] | {
           class:meta_block | "AzureOS Metadata" {
             meta_tag:file 
             author: Shadeware
             date: 04/05/2025
             title: AzureOS
             description: AzureOS is a modified Windows 11 OS that focuses on removing bloatware, disabling telemetry, hardening security, and pre-installing over 3,000 security and developer tools.
        }
}

[4.3] | {
       startRestartApp
}

[4.1] | {
       tag<RestartApp> gui {
        size:, height: 100; width: 400;
        windowTitle: "AzureOS Setup"
        windowControl = default(winsys) {
          $get_color.pkg
          background: fff; 
        } {
            createMessage_short
            centerMessage: from.data(size) 
            dis.txt  = ("To start Azure OS from your Windows 11 machine, your device will require a restart. This can take seven to 30 minutes depending on your device.")
            use.font = defualt(winsys) use.color = defualt(winsys) 
        } {
               createButton(1) <s.button>OK<e.button> box.text dis.txt = ("Please enter your pin or password:") text.box default(winsys)^t4 |next. = func.reboot default(winsys) 
               createButton(2) <s.button>Cancel<e.button> func.exit
        }
        
       }
} 

[4.1] | {
       tag<active> gui {
        showScreen: $get_color.pkg background((full)king) background: 000000;
        force.king lock(all from.(driver_id)) active_func = finish(load_true) next. = reboot default(winsys) 
       }
}


[4.3] | {
      
      mini !pop all("set") = stone.king/power_usr
      
      high.function_debloat {
        // Core Bloatware Removal
        getPackage(Microsoft.Edge) kill.Microsoft.Edge removeMicrosoft.Edge(tree)
        getPackage(OneDrive) kill.OneDrive(king) burn:('C:\Program Files\OneDrive\OneDrive.exe') removeOneDrive(tree)

        // Xbox Slaughter
        getPackage(Microsoft.XboxGamingOverlay) removeMicrosoft.XboxGamingOverlay(tree)
        getPackage(Microsoft.XboxApp) removeMicrosoft.XboxApp(tree)
        getPackage(Microsoft.XboxIdentityProvider) removeMicrosoft.XboxIdentityProvider(tree)
        getPackage(Microsoft.XboxLive) removeMicrosoft.XboxLive(tree)
        getPackage(Microsoft.Xbox) removeMicrosoft.Xbox(tree)
        findpackage -n('XboxApp') removeWindowsCapability -o()

        // Stock Apps
        getPackage(Microsoft.YourPhone) removeMicrosoft.YourPhone(tree)
        getPackage(Microsoft.BingWeather) removeMicrosoft.BingWeather(tree)
        getPackage(Microsoft.GetHelp) removeMicrosoft.GetHelp(tree)
        getPackage(Microsoft.People) removeMicrosoft.People(tree)
        getPackage(Microsoft.MixedReality.Portal) removeMicrosoft.MixedReality.Portal(tree)
        getPackage(Microsoft.OfficeHub) removeMicrosoft.OfficeHub(tree)
        getPackage(Microsoft.SkypeApp) removeMicrosoft.SkypeApp(tree)
        getPackage(Microsoft.ZuneMusic) removeMicrosoft.ZuneMusic(tree)
        getPackage(Microsoft.ZuneVideo) removeMicrosoft.ZuneVideo(tree)
        getPackage(Microsoft.Todos) removeMicrosoft.Todos(tree)
        getPackage(Microsoft.Wallet) removeMicrosoft.Wallet(tree)
        getPackage(Microsoft.WindowsFeedbackHub) removeMicrosoft.WindowsFeedbackHub(tree)
        getPackage(Microsoft.MSPaint) removeMicrosoft.MSPaint(tree)

        // Cortana
        getPackage(Microsoft.549981C3F5F10) kill.Cortana burn:('C:\Windows\SystemApps\Microsoft.Windows.Cortana_cw5n1h2txyewy') removeMicrosoft.Cortana(tree)

        // Store (optional)
        getPackage(Microsoft.Store) kill.Store burn:('C:\Windows\SystemApps\Microsoft.WindowsStore_8wekyb3d8bbwe') removeMicrosoft.Store(tree)

        // Tips, Maps, Alarms, etc.
        getPackage(Microsoft.WindowsMaps) removeMicrosoft.WindowsMaps(tree)
        getPackage(Microsoft.WindowsSoundRecorder) removeMicrosoft.WindowsSoundRecorder(tree)
        getPackage(Microsoft.WindowsAlarms) removeMicrosoft.WindowsAlarms(tree)
        getPackage(Microsoft.Getstarted) removeMicrosoft.Getstarted(tree)
        getPackage(Microsoft.Tips) removeMicrosoft.Tips(tree)

        // Registry Nukes
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo')
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\SmartScreenEnabled')
        reg.burn('HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection')
        reg.burn('HKCU\Software\Microsoft\Xbox')
        reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\GameUX')
        reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Xbox')
        reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA')
        reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics')
        reg.burn('HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack')
        reg.burn('HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice')

        // Services to Disable
        kill.SysMain disable.SysMain
        kill.DiagTrack disable.DiagTrack
        kill.XblGameSave disable.XblGameSave
        kill.XboxGipSvc disable.XboxGipSvc
        kill.WMPNetworkSvc disable.WMPNetworkSvc
        kill.WSearch disable.WSearch
        kill.RemoteRegistry disable.RemoteRegistry
        kill.Diagsvc disable.Diagsvc

        // Optional Defender / Telemetry Kill (if using 3rd-party AV)
        kill.WinDefend disable.WinDefend
        reg.burn('HKLM\SOFTWARE\Policies\Microsoft\Windows Defender', 'DisableAntiSpyware', 1)

        // Optional UAC Disable
        reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', 'EnableLUA', 0)

        // App Background + Suggestions Kill
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications', 'AllowAllApplications', 0)
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager', 'SystemPaneSuggestionsEnabled', 0)
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager', 'SubscribedContent-338393Enabled', 0)
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager', 'SubscribedContent-353698Enabled', 0)
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager', 'RotatingLockScreenEnabled', 0)

        // Burn Remnants
        burn:('C:\Program Files\WindowsApps\Microsoft.Xbox*')
        burn:('C:\Program Files\WindowsApps\Microsoft.Microsoft3DViewer*')
        burn:('C:\Program Files\WindowsApps\Microsoft.YourPhone*')
        burn:('C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Xbox*')
        burn:('C:\Users\*\AppData\Local\Packages\Microsoft.Xbox*')

        // Kill and burn Copilot
        getPackage(MicrosoftWindows.Client.WebExperience) kill.Copilot burn:('C:\Windows\SystemApps\MicrosoftWindows.Client.WebExperience_cw5n1h2txyewy') removeMicrosoftWindows.Client.WebExperience(tree)

        // Registry block to stop future Copilot
        reg.burn('HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot', 'TurnOffWindowsCopilot', 1)
        // Block 365 start menu ads & file suggestion crap
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager', 'OemPreInstalledAppsEnabled', 0)
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager', 'PreInstalledAppsEnabled', 0)
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager', 'PreInstalledAppsEverEnabled', 0)
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager', 'SilentInstalledAppsEnabled', 0)
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager', 'SystemPaneSuggestionsEnabled', 0)

        // Remove OfficeHub junk
        getPackage(Microsoft.MicrosoftOfficeHub) removeMicrosoft.MicrosoftOfficeHub(tree)
        burn:('C:\Program Files\WindowsApps\Microsoft.MicrosoftOfficeHub*')

        // Block experiment content delivery system
        reg.burn('HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System', 'AllowExperimentation', 0)
        reg.burn('HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection', 'AllowTelemetry', 0)
        reg.burn('HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility', 'HideInsiderPage', 1)
        reg.burn('HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability', 'EnablePreviewBuilds', 0)

        // Block experiment content delivery system
        reg.burn('HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System', 'AllowExperimentation', 0)
        reg.burn('HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection', 'AllowTelemetry', 0)
        reg.burn('HKLM\SOFTWARE\Microsoft\WindowsSelfHost\UI\Visibility', 'HideInsiderPage', 1)
        reg.burn('HKLM\SOFTWARE\Microsoft\WindowsSelfHost\Applicability', 'EnablePreviewBuilds', 0)

        //Extra
        getPackage(Microsoft.Clipchamp) removeMicrosoft.Clipchamp(tree)
        getPackage(Microsoft.Whiteboard) removeMicrosoft.Whiteboard(tree)
        getPackage(Microsoft.DevHome) removeMicrosoft.DevHome(tree)
        getPackage(MicrosoftTeams) removeMicrosoftTeams(tree)
        burn:('C:\Program Files\WindowsApps\MicrosoftTeams*')
        getPackage(MicrosoftWindowsWidgets) removeMicrosoftWindowsWidgets(tree)
        burn:('C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy')
        reg.burn('HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced', 'TaskbarDa', 0)
        reg.burn('HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting', 'Disabled', 1)
        kill.WERSvc disable.WERSvc
        reg.burn('HKLM\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance', 'DisableDiagnosticTracing', 1)
        reg.burn('HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat', 'DisableInventory', 1)
        reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack', 'ShowedToastAtFirstLogon', 1)
        reg.del('HKCU\Software\Microsoft\Siuf')
    }
}

[4.3] | {
       lib.firewall(mint_sys)
       block v10.events.data.microsoft.com
       block telemetry.microsoft.com
       block settings-win.data.microsoft.com
       block watson.telemetry.microsoft.com
       block ls_ip = "        
        '13.107.5.88',
        '23.100.122.175',
        '65.52.100.11',
        '191.232.139.254',
        '204.79.197.200',
        '40.76.0.0/14',
        '40.112.0.0/13',
        '40.96.0.0/12'" 
        {
          set_whitelist
            p: 53; prt: UDP; 
        } {
          allowApplication(con)('firaVPN_net.exe') 
          block out(all) 
        }
}

[4.3] | {
       task.stop('\Microsoft\Windows\Application Experience\ProgramDataUpdater')
       task.stop('\Microsoft\Windows\Autochk\Proxy')
       task.stop('\Microsoft\Windows\Customer Experience Improvement Program\Consolidator')
       task.stop('\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip')
       task.stop('\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector')
       reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer', 'SmartScreenEnabled', 'Off')
       reg.burn('HKLM\SOFTWARE\Policies\Microsoft\Windows\System', 'EnableSmartScreen', 0)
       reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching', 'SearchOrderConfig', 0)
}

[4.3] | {
       $get.(dns_encrypt)
       dns_encrypt.config('server_lxdns';)
}

[4.3] | {
       reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', 'NoConnectedUser', 3)
       reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', 'NoConnectedUserType', 3)
       reg.burn('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System', 'NoConnectedUserExperience', 3)
}

[4.3] | {
       $get.('Debotnet')
       Debotnet.runProfile('system_tear') 
       $get.(('ShutUp10++')) 
       ShutUp10++.apply('priv_rcc') 
       ShutUp10++.apply('sware_block_m')
}

[4.3] | {
       reg.burn('HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System', 'AllowExperimentation', 0)
       reg.burn('HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection', 'AllowTelemetry', 0)
       reg.burn('HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack', 'Start', 4)
       reg.burn('HKLM\SYSTEM\CurrentControlSet\Services\dmwappushservice', 'Start', 4)
}

[4.3_wsl] | {
       #.get((winsys_active)shell) 
       $get.('wsl') 
       setup.wsl(application:data) config {
        run(wsl_setup d:kali_linux) wsl(setDefault kali_linux) 
       }
        {
          run(wsl kali_linux) set_enter:(id:u) getData(winsys) username $enter(control_active); set_enter:(id:p) getData(^t4 $inp)  
       }
}

[4.3._wsl] | {
       #.get((winsys_active)shell) 
       $get.('wsl') 
       setup.wsl(application:data) config {
        run(wsl_setup d:arch) wsl(setDefault arch)
       }
       {
          run(wsl arch) set_enter:(id:u) getData(winsys) username $enter(control_active); set_enter:(id:p) getData(^t4 $inp)  

          // Step 1: Add BlackArch repositories
          arch.runCommand('curl -O https://blackarch.org/strap.sh')
          arch.runCommand('chmod +x strap.sh')
          arch.runCommand('sudo ./strap.sh')

          // Step 2: Update and install BlackArch tools
          arch.runCommand('sudo pacman -Syu')  // Update system
          arch.runCommand('sudo pacman -S blackarch')  // Install all BlackArch tools (optional)

          // Step 3: Confirm setup by checking BlackArch tools
          arch.runCommand('sudo pacman -S --needed blackarch-tools')  // Ensure all tools are available
       }
}

[4.3] | {
    func.avs {
        run(osarmor_setup) { download('https://www.osarmor.com/download') run('osarmor_installer.exe') }
        run(bitdefender_free_setup) { download('https://www.bitdefender.com/en-us/consumer/free-antivirus') run('bitdefender_installer.exe') }
        run(floki_avs_setup) { download('https://avs.shadeware.dev/azure-installer/setup/floki_avs.exe') run('floki_avs.exe') }
        run(cisa_setup) { download('https://www.shdeware.dev/CISA-integration-and-consulting-avs/@CISA.exe') run('@CISA.exe') }
        run(wither_setup) { download('https://www.withersec.net/security.exe') run('security.exe') }
        check_installation('OSArmor') check_installation('Bitdefender') check_installation('CrowdStrike') check_installation('Floki') check_installation('@CISA') check_installation('Wither')
    }
    post_installation {
        run('osarmor_config') { configure('osarmor') set_rules('default_rules') }
        run('bitdefender_config') { configure('bitdefender') set_definitions('auto_update') }
        run('crowdstrike_config') { configure('crowdstrike') set_real_time_monitoring('enabled') }
        run('floki_config') { configure('floki') set_protection_level('high') }
        run('cisa_config') { configure('@CISA') set_security_tuning('max') }
        run('wither_config') { configure('wither') set_auto_scan('enabled') }
        validate('osarmor_status') validate('bitdefender_status') validate('crowdstrike_status') validate('floki_status') validate('cisa_status') validate('wither_status')
    }
}

[4.5] | {
       loop:constant recheck(trigger:reboot) 
       follow.user config_rules(user = ops_king)
}