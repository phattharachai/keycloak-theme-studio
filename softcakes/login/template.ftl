<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="h-full" data-kt-theme="true" data-kt-theme-mode="light" dir="ltr" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" type="image/png" href="${url.resourcesPath}/img/favicon.png" />
    
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet"/>
    
    <!-- Styles -->
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>

<body class="antialiased flex h-full text-base text-foreground bg-background">
    <!-- Theme Mode Script -->
    <script>
        const defaultThemeMode = 'light';
        let themeMode;

        if (document.documentElement) {
            if (localStorage.getItem('kt-theme')) {
                themeMode = localStorage.getItem('kt-theme');
            } else if (document.documentElement.hasAttribute('data-kt-theme-mode')) {
                themeMode = document.documentElement.getAttribute('data-kt-theme-mode');
            } else {
                themeMode = defaultThemeMode;
            }

            if (themeMode === 'system') {
                themeMode = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
            }

            document.documentElement.classList.add(themeMode);
        }
    </script>

    <style>
        .page-bg {
            background-color: #E5E7EB;
            background-image: linear-gradient(to bottom, #E5E7EB, #D1D5DB);
        }
        .dark .page-bg {
            background-color: #1F2937;
            background-image: linear-gradient(to bottom, #1F2937, #111827);
        }
    </style>

    <div class="flex items-center justify-center grow bg-center bg-no-repeat page-bg">
        <div class="kt-card max-w-[370px] w-full">
            <div class="kt-card-content flex flex-col gap-5 p-6 pt-8">
                <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                    <div class="alert alert-${message.type} mb-4 p-4 rounded-lg <#if message.type == 'error'>bg-red-50 text-red-800 border border-red-200<#elseif message.type == 'success'>bg-green-50 text-green-800 border border-green-200<#elseif message.type == 'warning'>bg-yellow-50 text-yellow-800 border border-yellow-200<#else>bg-blue-50 text-blue-800 border border-blue-200</#if>">
                        <#if message.type == 'success'><span class="font-medium">✓</span></#if>
                        <#if message.type == 'warning'><span class="font-medium">⚠</span></#if>
                        <#if message.type == 'error'><span class="font-medium">✗</span></#if>
                        <#if message.type == 'info'><span class="font-medium">ℹ</span></#if>
                        ${kcSanitize(message.summary)?no_esc}
                    </div>
                </#if>

                <div class="text-center mb-2.5">
                    <#nested "header">
                </div>

                <#nested "form">

                <#if displayInfo>
                    <#nested "info">
                </#if>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}"></script>
        </#list>
    </#if>
</body>
</html>
</#macro>
