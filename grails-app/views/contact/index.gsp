<meta name="layout" content="main"/>

<div class="card">
    <div class="card-header">
        <g:message code="contact" args="['List']"/>
        <span class="float-right">

        <div class="btn-group">
            <g:form controller="contact" action="index" method="GET">
                <div class="input-group" id="search-area">
                    <g:select name="colName" class="form-control"
                              from="[contactName:'Name']"
                              value="${params?.colName}"
                              optionKey="key"
                              optionValue="value"/>

                    <g:textField name="colValue" class="form-control" value="${params?.colValue}"/>

                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">Search</button>
                    </span>
                </div>
            </g:form>
        </div>

            <div class="btn-group">
                <g:link controller="contact" action="create" class="btn btn-success">
                    <g:message code="create"/>
                </g:link>

                <g:link controller="contact" action="index" class="btn btn-primary">
                    <g:message code="reload"/>
                </g:link>
            </div>
        </span>
    </div>

    <div class="card-body">
        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>

        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th style="width: 150px"><g:message code="image"/></th>
                <g:sortableColumn property="contactName" title="Name"/>
                <th class="action-row"><g:message code="action"/></th>
            </tr>
            </thead>

            <tbody>
                <g:each in="${contactList}" var="info">
                    <tr>
                        <td>
                            <g:if test="${info.image}">
                                <img src="${createLink(controller: 'contact', action: 'displayImage', id: info.id)}"
                                     class="img-thumbnail"
                                     style="height: 50px; width: 50px;"/>
                            </g:if>
                            <g:else>
                                <g:img dir="images" file="grails.svg"
                                       class="img-thumbnail"
                                       style="height: 50px; width: 50px;"/>
                            </g:else>
                        </td>

                        <td>${info?.contactName}</td>

                        <td>
                            <div class="btn-group">
                                <g:link controller="contact" action="detail" class="btn btn-secondary" id="${info.id}">
                                    <i class="fas fa-eye"></i>
                                </g:link>

                                <g:link controller="contact" action="edit" class="btn btn-secondary" id="${info.id}">
                                    <i class="fas fa-edit"></i>
                                </g:link>

                                <g:form controller="contact" action="delete" id="${info.id}" method="DELETE" style="display:inline;">
                                    <button type="submit" class="btn btn-secondary"
                                            onclick="return confirm('Tem certeza que deseja excluir este contato?');">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </g:form>
                            </div>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>

        <div class="paginate">
            <g:paginate total="${total ?: 0}" />
        </div>
    </div>
</div>