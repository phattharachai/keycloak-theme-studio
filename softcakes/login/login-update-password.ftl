<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
    <div id="kc-form">
        <div id="kc-form-wrapper">
            <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
                <div class="text-center mb-5">
                    <img src="${url.resourcesPath}/img/logo.png" alt="Logo" class="mx-auto mb-4" style="max-width: 150px; height: auto;" />
                    <h3 class="text-lg font-medium text-mono">
                        ${msg("updatePasswordTitle")}
                    </h3>
                    <span class="text-sm text-secondary-foreground">
                        ${msg("updatePasswordDescription")}
                    </span>
                </div>

                <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
                <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>

                <div class="flex flex-col gap-1 mb-4">
                    <label for="password-new" class="kt-form-label font-normal text-mono">
                        ${msg("passwordNew")}
                    </label>
                    <div class="kt-input" data-kt-toggle-password="true">
                        <input type="password" id="password-new" name="password-new" class="" autofocus autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>" />
                        <button class="kt-btn kt-btn-sm kt-btn-ghost kt-btn-icon bg-transparent! -me-1.5" data-kt-toggle-password-trigger="true" type="button">
                            <span class="kt-toggle-password-active:hidden">
                                <i class="ki-filled ki-eye text-muted-foreground"></i>
                            </span>
                            <span class="hidden kt-toggle-password-active:block">
                                <i class="ki-filled ki-eye-slash text-muted-foreground"></i>
                            </span>
                        </button>
                    </div>
                    <#if messagesPerField.existsError('password')>
                        <span id="input-error-password" class="text-sm text-red-600 mt-1" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="flex flex-col gap-1 mb-5">
                    <label for="password-confirm" class="kt-form-label font-normal text-mono">
                        ${msg("passwordConfirm")}
                    </label>
                    <div class="kt-input" data-kt-toggle-password="true">
                        <input type="password" id="password-confirm" name="password-confirm" class="" autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />
                        <button class="kt-btn kt-btn-sm kt-btn-ghost kt-btn-icon bg-transparent! -me-1.5" data-kt-toggle-password-trigger="true" type="button">
                            <span class="kt-toggle-password-active:hidden">
                                <i class="ki-filled ki-eye text-muted-foreground"></i>
                            </span>
                            <span class="hidden kt-toggle-password-active:block">
                                <i class="ki-filled ki-eye-slash text-muted-foreground"></i>
                            </span>
                        </button>
                    </div>
                    <#if messagesPerField.existsError('password-confirm')>
                        <span id="input-error-password-confirm" class="text-sm text-red-600 mt-1" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="flex flex-col gap-3">
                    <button type="submit" class="kt-btn kt-btn-primary flex justify-center w-full">
                        ${msg("doSubmit")}
                    </button>
                    
                    <#if isAppInitiatedAction??>
                        <button type="submit" name="cancel-aia" value="true" class="kt-btn kt-btn-outline flex justify-center w-full">
                            ${msg("doCancel")}
                        </button>
                    </#if>
                </div>
            </form>
        </div>
    </div>
    </#if>
</@layout.registrationLayout>
