<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Contact</title>
</head>
<body>

<div class="card shadow-sm">
    <div class="card-header bg-primary text-white">
        <h4 class="mb-0">Edit Contact: ${contact?.contactName}</h4>
    </div>

    <div class="card-body">
        <%-- Exibição de Erros --%>
        <g:if test="${flash.error}">
            <div class="alert alert-danger">${flash.error}</div>
        </g:if>
        <g:if test="${flash.message}">
            <div class="alert alert-success">${flash.message}</div>
        </g:if>

        <g:form action="update" id="${contact?.id}" method="POST" enctype="multipart/form-data">
            <div class="row">
                <%-- Coluna Esquerda: Informações Básicas --%>
                <div class="col-md-6">
                    <div class="form-group mb-3">
                        <label class="form-label font-weight-bold">Contact Name</label>
                        <g:textField name="contactName" value="${contact?.contactName}" class="form-control" required="required"/>
                    </div>

                    <div class="form-group mb-3">
                        <label class="form-label font-weight-bold">Group</label>
                        <g:select name="contactGroup.id"
                                  class="form-control"
                                  from="${groupList}"
                                  optionKey="id"
                                  optionValue="name"
                                  value="${contact?.contactGroup?.id}"
                                  noSelection="['':'- Select Group -']"/>
                    </div>

                    <div class="form-group mb-3">
                        <label class="form-label font-weight-bold">Image</label>
                        <input type="file" name="imageFile" class="form-control"/>

                        <g:if test="${contact?.image}">
                            <div class="mt-2 text-center border p-2 bg-light">
                                <p class="small text-muted">Current Image:</p>
                                <img src="${createLink(controller: 'contact', action: 'displayImage', id: contact.id)}"
                                     style="height: 100px; width: 100px; object-fit: cover;"
                                     class="img-thumbnail rounded-circle shadow-sm"/>
                            </div>
                        </g:if>
                    </div>
                </div>

                <%-- Coluna Direita: Detalhes Dinâmicos --%>
                <div class="col-md-6">
                    <h5 class="text-theme border-bottom pb-2">Contact Details</h5>
                    <div id="details-container">
                        <%-- 1. Se o contato já tiver detalhes, renderiza cada um deles --%>
                        <g:if test="${contact?.details}">
                            <g:each in="${contact.details}" var="detail" status="i">
                                <div class="detail-entry border rounded p-3 mb-3 detail-card shadow-sm">
                                    <div class="form-group mb-2">
                                        <label class="small text-uppercase font-weight-bold">Mobile Number</label>
                                        <input type="text" name="details[${i}].mobileNumber" value="${detail?.mobileNumber}" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label class="small text-uppercase font-weight-bold">Email</label>
                                        <input type="email" name="details[${i}].email" value="${detail?.email}" class="form-control"/>
                                    </div>
                                </div>
                            </g:each>
                        </g:if>

                        <%-- 2. Se não houver detalhes, mostra um formulário vazio (ESSENCIAL) --%>
                        <g:else>
                            <div class="detail-entry border rounded p-3 mb-3 detail-card shadow-sm">
                                <div class="form-group mb-2">
                                    <label class="small text-uppercase font-weight-bold">Mobile Number</label>
                                    <input type="text" name="details[0].mobileNumber" class="form-control" placeholder="Ex: (84) 99999-9999"/>
                                </div>
                                <div class="form-group">
                                    <label class="small text-uppercase font-weight-bold">Email</label>
                                    <input type="email" name="details[0].email" class="form-control" placeholder="exemplo@email.com"/>
                                </div>
                            </div>
                        </g:else>
                    </div>
                </div>
            </div>

            <hr>
            <div class="mt-4 d-flex justify-content-between">
                <g:link action="index" class="btn btn-outline-secondary">
                    <i class="fas fa-arrow-left"></i> Back to List
                </g:link>
                <button type="submit" class="btn btn-success px-5 shadow">
                    <i class="fas fa-save"></i> Save Changes
                </button>
            </div>
        </g:form>
    </div>
</div>

</body>
</html>