<#import "parts/common.ftl" as c>


<@c.page>
<div class="form-row">
    <div class="form-group col-md-6" >
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
            <button type="submit" class="btn btn-outline-primary ml-2">Search</button>
        </form>
    </div>
</div>

<div class="pb-3"><a class="btn btn-outline-primary"" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
    New message
</a>
</div>

<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group ml-3">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group">
                <input type="text" name="text" class="form-control ${(textError??)?string('is-invalid','')}"
                      value="<#if message??>${message.text}</#if>" placeholder="Введите сообщение"/>
                    <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                    </#if>

            </div>

            <div class="form-group">
                <input type="text" class="form-control ${(tagError??)?string('is-invalid','')}"
                       value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг">
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>

            <#--<div class="form-group">-->
                <#--<input type="text" class="form-control"-->
                       <#--value="<#if message??>${message.tag}</#if>" name="tag"  placeholder="Тэг"/>-->
          <#--<#if tagError??>-->
                <#--<div class="invalid-feedback">-->
                    <#--${tagError}-->
                <#--</div>-->
          <#--</#if>-->
            </div>
            <div class="form-group">
                 <div class="custom-file">
                 <input type="file" name="file" id="customFile">
                 <label class="custom-file-label" for="customFile">Choose file</label>
                 </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Добавить</button>
            </div>
        </form>
    </div>
</div>

<div class="card-columns">
<#list messages as message>
<div class="card my-3,border border-primary">
        <#if message.fileName??>
            <img src="/img/${message.fileName}" class="card-img-top">
        </#if>
    <div class="m-2">
        <span>${message.text}</span>
        <p class="font-weight-bold"> <i>${message.tag}</i></p>
    </div>

    <div class="card-footer text-muted">
        ${message.authorName}
    </div>
</div>
    <#else>
 NO MESSAGES
    </#list>
</div>
</@c.page>