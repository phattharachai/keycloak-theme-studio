<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <form id="kc-register-form" action="${url.registrationAction}" method="post">
            <div class="text-center mb-5">
                <img src="${url.resourcesPath}/img/logo.png" alt="Logo" class="mx-auto mb-4" style="max-width: 150px; height: auto;" />
                <h3 class="text-lg font-medium text-mono leading-none mb-2.5">
                    ${msg("registerTitle")}
                </h3>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="flex flex-col gap-1 mb-4">
                    <label for="username" class="kt-form-label text-mono">
                        ${msg("username")}
                    </label>
                    <input type="text" id="username" class="kt-input" name="username" 
                           value="${(register.formData.username!'')}" autocomplete="username"
                           aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" />
                    
                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="text-sm text-red-600 mt-1" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if>
                </div>
            </#if>

            <div class="flex flex-col gap-1 mb-4">
                <label for="email" class="kt-form-label text-mono">
                    ${msg("email")}
                </label>
                <input type="text" id="email" class="kt-input" name="email" 
                       value="${(register.formData.email!'')}" autocomplete="email"
                       aria-invalid="<#if messagesPerField.existsError('email')>true</#if>" />
                
                <#if messagesPerField.existsError('email')>
                    <span id="input-error-email" class="text-sm text-red-600 mt-1" aria-live="polite">
                        ${kcSanitize(messagesPerField.get('email'))?no_esc}
                    </span>
                </#if>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="flex flex-col gap-1 mb-4">
                    <label for="firstName" class="kt-form-label text-mono">
                        ${msg("firstName")}
                    </label>
                    <input type="text" id="firstName" class="kt-input" name="firstName" 
                           value="${(register.formData.firstName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>" />
                    
                    <#if messagesPerField.existsError('firstName')>
                        <span id="input-error-firstName" class="text-sm text-red-600 mt-1" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="flex flex-col gap-1 mb-4">
                    <label for="lastName" class="kt-form-label text-mono">
                        ${msg("lastName")}
                    </label>
                    <input type="text" id="lastName" class="kt-input" name="lastName" 
                           value="${(register.formData.lastName!'')}"
                           aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>" />
                    
                    <#if messagesPerField.existsError('lastName')>
                        <span id="input-error-lastName" class="text-sm text-red-600 mt-1" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                        </span>
                    </#if>
                </div>
            </#if>

            <#if passwordRequired??>
                <div class="flex flex-col gap-1 mb-4">
                    <label for="password" class="kt-form-label font-normal text-mono">
                        ${msg("password")}
                    </label>
                    <div class="kt-input" data-kt-toggle-password="true">
                        <input type="password" id="password" class="" name="password" 
                               autocomplete="new-password" placeholder="${msg("password")}"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>" />
                        <button class="kt-btn kt-btn-sm kt-btn-ghost kt-btn-icon bg-transparent! -me-1.5" 
                                data-kt-toggle-password-trigger="true" type="button">
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

                <div class="flex flex-col gap-1 mb-4">
                    <label for="password-confirm" class="kt-form-label font-normal text-mono">
                        ${msg("passwordConfirm")}
                    </label>
                    <div class="kt-input" data-kt-toggle-password="true">
                        <input type="password" id="password-confirm" class="" name="password-confirm"
                               autocomplete="new-password" placeholder="${msg("passwordConfirm")}"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />
                        <button class="kt-btn kt-btn-sm kt-btn-ghost kt-btn-icon bg-transparent! -me-1.5" 
                                data-kt-toggle-password-trigger="true" type="button">
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
            </#if>

            <#if recaptchaRequired??>
                <div class="mb-4">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </#if>

            <input type="hidden" name="termsAccepted" value="on" />

            <button class="kt-btn kt-btn-primary flex justify-center grow w-full mb-3" type="submit">
                ${msg("doRegister")}
            </button>

        </form>
      </div>
    </div>

    <div id="kc-registration-container" class="text-center mt-4">
        <div class="flex items-center justify-center font-medium">
            <span class="text-sm text-secondary-foreground me-1.5">${msg("alreadyHaveAccount")}</span>
            <a tabindex="7" class="text-sm link" href="${url.loginUrl}">${msg("doLogIn")}</a>
        </div>
    </div>

    </#if>

</@layout.registrationLayout>
