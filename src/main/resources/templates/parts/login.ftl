<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>
<#macro login path isRegisterForm>
<form action="${path}" method="post">
    <div class="card border-primary mb-3" >
    <div class="mx-auto" >
    <#if isRegisterForm>
        <div class="my-4"> <h4> <strong>Регистрация </strong> </h4> </div>
    <#else>
        <div class="my-4"> <h4> <strong> Вход в личный кабинет </strong> </h4> </div>
    </#if>
    <div class="form-group row">
        <div class="col-lg-12">
            <input type="text" name="username" class="form-control" placeholder="Ваше имя" />
        </div>
    </div>
    <div class="form-group row">
        <div class="col-lg-12">
            <input type="password" name="password" class="form-control" placeholder="Пароль" />
        </div>
    </div>

    <#if isRegisterForm>
    <div class="form-group row">
        <div class="col-lg-12">
            <input type="email" name="email" class="form-control" placeholder="some@some.com" />
        </div>
        <div class="invalid-feedback">
            Введите существующий e-mail.
        </div>
    </div>
    </#if>
    <button class="btn btn-primary btn-lg btn-block" type="submit">
        <#if isRegisterForm>Зарегистрироваться<#else>Войти</#if></button>
    <div class="form-group row">
        <div class="col-lg-12 my-3">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if !isRegisterForm>
        <p> Ещё нет аккаунта? <a href="/registration">Зарегистрироваться</a> </p>
    <#else>
        <p> Уже есть аккаунт? <a href="/login">Войти</a> </p>
    </#if>
        </div>
    </div>
</div>
    </div>



</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if known>
    <button class="btn btn-primary" type="submit">Выйти</button>
    <#else>
     <button class="btn btn-primary" type="submit">Войти</button>
     </#if>
</form>
</#macro>
