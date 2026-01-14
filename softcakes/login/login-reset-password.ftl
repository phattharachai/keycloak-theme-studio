<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false displayInfo=false; section>
    <#if section = "header">
    <#elseif section = "form">
    <div id="kc-form">
      <div id="kc-form-wrapper">
        <#if realm.password>
            <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
                <div class="text-center mb-5">
                    <img src="${url.resourcesPath}/img/logo.png" alt="Logo" class="mx-auto mb-4" style="max-width: 150px; height: auto;" />
                    <h3 class="text-lg font-medium text-mono">
                        ${msg("emailForgotTitle")}
                    </h3>
                    <span class="text-sm text-secondary-foreground">
                        ${msg("emailInstruction")}
                    </span>
                </div>
                
                <div class="flex flex-col gap-1 mb-5">
                    <label for="username" class="kt-form-label font-normal text-mono">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>
                    <input type="text" id="username" name="username" class="kt-input" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>
                    
                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="text-sm text-red-600 mt-1" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if>
                </div>

                <div class="flex flex-col gap-3">
                    <button type="submit" class="kt-btn kt-btn-primary flex justify-center items-center grow">
                        ${msg("doSubmit")}

                    </button>

                </div>
            </form>
        </#if>
      </div>
    </div>

    <div id="kc-registration-container" class="text-center mt-4">
        <div class="flex items-center justify-center font-medium">
            <a tabindex="7" class="text-sm link" href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
        </div>
    </div>
    </#if>
</@layout.registrationLayout>
