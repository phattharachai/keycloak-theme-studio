<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="text-center mb-5">
                    <h3 class="text-lg font-medium text-mono leading-none mb-2.5">
                        ${msg("loginAccountTitle")}
                    </h3>
                    <div class="flex items-center justify-center font-medium">
                        <span class="text-sm text-secondary-foreground me-1.5">
                            ${msg("noAccount")}
                        </span>
                        <a tabindex="8" class="text-sm link" href="${url.registrationUrl}">
                            ${msg("doRegister")}
                        </a>
                    </div>
                </div>

                <#if social.providers??>
                    <div class="grid grid-cols-2 gap-2.5 mb-4">
                        <#list social.providers as p>
                            <a id="social-${p.alias}" class="kt-btn kt-btn-outline justify-center" type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="ml-2">${p.displayName!}</span>
                                <#else>
                                    <span>${p.displayName!}</span>
                                </#if>
                            </a>
                        </#list>
                    </div>

                    <div class="flex items-center gap-2 mb-4">
                        <span class="border-t border-border w-full"></span>
                        <span class="text-xs text-muted-foreground font-medium uppercase">${msg("or")}</span>
                        <span class="border-t border-border w-full"></span>
                    </div>
                </#if>

                <#if !usernameHidden??>
                    <div class="flex flex-col gap-1 mb-4">
                        <label for="username" class="kt-form-label font-normal text-mono">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                        </label>
                        <input tabindex="2" id="username" class="kt-input" name="username" value="${(login.username!'')}" placeholder="email@email.com" type="text" autofocus autocomplete="username"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                        <#if messagesPerField.existsError('username','password')>
                            <span id="input-error" class="text-sm text-red-600 mt-1" aria-live="polite">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </#if>

                <div class="flex flex-col gap-1 mb-4">
                    <div class="flex items-center justify-between gap-1">
                        <label for="password" class="kt-form-label font-normal text-mono">${msg("password")}</label>
                        <#if realm.resetPasswordAllowed>
                            <a tabindex="6" class="text-sm kt-link shrink-0" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                        </#if>
                    </div>
                    <div class="kt-input" data-kt-toggle-password="true">
                        <input tabindex="3" id="password" class="" name="password" type="password" autocomplete="current-password"
                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                        />
                        <button class="kt-btn kt-btn-sm kt-btn-ghost kt-btn-icon bg-transparent! -me-1.5" data-kt-toggle-password-trigger="true" type="button">
                            <span class="kt-toggle-password-active:hidden">
                                <i class="ki-filled ki-eye text-muted-foreground"></i>
                            </span>
                            <span class="hidden kt-toggle-password-active:block">
                                <i class="ki-filled ki-eye-slash text-muted-foreground"></i>
                            </span>
                        </button>
                    </div>
                </div>

                <div class="mb-4">
                    <#if realm.rememberMe && !usernameHidden??>
                        <label class="kt-label">
                            <#if login.rememberMe??>
                                <input tabindex="4" id="rememberMe" name="rememberMe" type="checkbox" checked class="kt-checkbox kt-checkbox-sm">
                            <#else>
                                <input tabindex="4" id="rememberMe" name="rememberMe" type="checkbox" class="kt-checkbox kt-checkbox-sm">
                            </#if>
                            <span class="kt-checkbox-label">${msg("rememberMe")}</span>
                        </label>
                    </#if>
                </div>

                <div id="kc-form-buttons">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <button tabindex="5" class="kt-btn kt-btn-primary flex justify-center w-full" name="login" id="kc-login" type="submit">${msg("doLogIn")}</button>
                </div>
            </form>
        </#if>
        </div>

      </div>
    </#if>

    <#if section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container" class="text-center mt-4">
                <div class="flex items-center justify-center font-medium">
                    <span class="text-sm text-secondary-foreground me-1.5">${msg("noAccount")}</span>
                    <a tabindex="7" class="text-sm link" href="${url.registrationUrl}">${msg("doRegister")}</a>
                </div>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
