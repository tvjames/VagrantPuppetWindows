# Puppet Standalone Manifest File
# puppet module install puppetlabs/dism
# puppet apply --verbose --write-catalog-summary --modulepath=Z:\ie7box\modules Z:\ie7box\manifests\default.pp

# List Features: dism.exe /online /get-features /format:table
dism { 'NetFx3': ensure => present; } ->
dism { 'IIS-WebServerRole': ensure => present; } ->
dism { 'IIS-HttpRedirect': ensure => present; } ->
dism { 'IIS-NetFxExtensibility': ensure => present; } ->
dism { 'IIS-LoggingLibraries': ensure => present; } ->
dism { 'IIS-HttpTracing': ensure => present; } ->
dism { 'IIS-URLAuthorization': ensure => present; } ->
dism { 'IIS-IPSecurity': ensure => present; } ->
dism { 'IIS-HttpCompressionDynamic': ensure => present; } ->
dism { 'IIS-ManagementScriptingTools': ensure => present; } ->
dism { 'IIS-IIS6ManagementCompatibility': ensure => present; } ->
dism { 'IIS-Metabase': ensure => present; } ->
dism { 'WAS-WindowsActivationService': ensure => present; } ->
dism { 'WAS-ProcessModel': ensure => present; } ->
dism { 'WAS-NetFxEnvironment': ensure => present; } ->
dism { 'WAS-ConfigurationAPI': ensure => present; } ->
dism { 'IIS-ISAPIExtensions': ensure => present; } ->
dism { 'IIS-ISAPIFilter': ensure => present; } ->
dism { 'IIS-ASPNET': ensure => present; } ->
dism { 'IIS-ASP': ensure => present; } ->
dism { 'IIS-CGI': ensure => present; } ->
dism { 'IIS-ServerSideIncludes': ensure => present; } ->
dism { 'IIS-CustomLogging': ensure => present; } ->
dism { 'IIS-BasicAuthentication': ensure => present; } ->
dism { 'IIS-ManagementService': ensure => present; } ->
dism { 'IIS-WMICompatibility': ensure => present; } ->
dism { 'IIS-LegacyScripts': ensure => present; } ->
dism { 'IIS-LegacySnapIn': ensure => present; } ->
dism { 'IIS-WindowsAuthentication': ensure => present; } ->
dism { 'IIS-DigestAuthentication': ensure => present; } ->
dism { 'IIS-ClientCertificateMappingAuthentication': ensure => present; } ->
dism { 'IIS-IISCertificateMappingAuthentication': ensure => present; } ->
dism { 'IIS-ODBCLogging': ensure => present; } ->
dism { 'WCF-HTTP-Activation': ensure => present; } ->
dism { 'IIS-HostableWebCore': ensure => present; } ->
notify { 'server roles and features installed': }
->
software::install { "Software_Package_SciteMSI" :
  name            => "scite-3.3.4${architecture}.msi",
  source          => "puppet:///local/scite-3.3.4${architecture}.msi",
  guid_x86        => "{38D610A0-15B8-4F63-AF9E-43EA55533219}",
  guid_x64        => "{CC61D47B-3109-47AD-A993-B51289EB58DB}",
  install_options => [ '/quiet' ],
  ensure          => "present"
}
->
software::install { "Software_Package_7ZipMSI" :
  name            => "7z920-${architecture}.msi",
  source          => "puppet:///local/7z920-${architecture}.msi",
  guid_x86        => "{23170F69-40C1-2701-0920-000001000000}",
  guid_x64        => "{23170F69-40C1-2702-0920-000001000000}",
  install_options => [ '/quiet' ],
}
->
/*
software::install { "Software_Package_WindowsImagingComponent" :
  name            => "wic_${architecture}_enu.exe",
  source          => "puppet:///local/wic_${architecture}_enu.exe",
  guid_x86        => "Microsoft .NET Framework 4 Extended",
  guid_x64        => "Microsoft .NET Framework 4 Extended",
  install_options => [ '/quiet', '/norestart' ],
}
->
*/
software::install { "Software_Package_DotNet40Redist" :
  name            => "dotNetFx40_Full_x86_x64.exe",
  source          => "puppet:///local/dotNetFx40_Full_x86_x64.exe",
  guid_x86        => "Microsoft .NET Framework 4 Extended",
  guid_x64        => "Microsoft .NET Framework 4 Extended",
  install_options => [ '/quiet', '/norestart' ],
}
->
software::install { "Software_Package_JavaRuntimeEnv7" :
  name            => "jre-7u25-windows-${architecture}.exe",
  source          => "puppet:///local/jre-7u25-windows-${architecture}.exe",
  guid_x86        => "Java 7 Update 25",
  guid_x64        => "Java 7 Update 25",
  install_options => [ '/s' ],
}


