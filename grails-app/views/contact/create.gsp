<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Contact Create</title>
    <style>
        .table-custom thead { background-color: #f8f9fa; }
        .form-section { border: 1px solid #e3e6f0; padding: 20px; border-radius: 5px; margin-bottom: 20px; }
        .header-title { background: #fff; padding: 10px; border-bottom: 1px solid #eeeeee; margin-bottom: 20px; }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="header-title">
        <h5 class="m-0 font-weight-bold text-dark">Contact Create</h5>
    </div>

    <g:hasErrors bean="${this.contact}">
        <div class="alert alert-danger">
            <g:renderErrors bean="${this.contact}" as="list" />
        </div>
    </g:hasErrors>

    <g:form action="save" method="POST" enctype="multipart/form-data">
        <div class="form-section bg-white">

            <div class="form-group">
                <label>Contact Name *</label>
                <g:textField name="contactName" value="${contact?.contactName}" class="form-control" placeholder="Contact Name" required="required"/>
            </div>

            <div class="form-group mt-3">
                <label>Image</label>
                <div class="custom-file">
                    <input type="file" name="imageFile" class="form-control">
                </div>
            </div>

            <div class="form-group mt-3">
                <label>Contact Group Name *</label>
                <g:select name="contactGroup.id"
                          from="${groupList}"
                          optionKey="id"
                          optionValue="name"
                          value="${contact?.contactGroup?.id}"
                          noSelection="['': 'Select a Group...']"
                          class="form-control"
                          required="required" />
            </div>

            <div class="table-responsive mt-4">
                <table class="table table-bordered" id="detailsTable">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Mobile</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Website</th>
                            <th>Address</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="detailsBody">
                        <tr class="detail-row">
                            <td style="width: 120px;">
                                <select name="details[0].type" class="form-control form-control-sm">
                                    <option value="Home">Home</option>
                                    <option value="Work">Work</option>
                                </select>
                            </td>
                            <td><input type="text" name="details[0].mobileNumber" class="form-control form-control-sm" placeholder="Mobile"></td>
                            <td><input type="text" name="details[0].phoneNumber" class="form-control form-control-sm" placeholder="Phone"></td>
                            <td><input type="email" name="details[0].email" class="form-control form-control-sm" placeholder="Email"></td>
                            <td><input type="text" name="details[0].website" class="form-control form-control-sm" placeholder="Website"></td>
                            <td><input type="text" name="details[0].address" class="form-control form-control-sm" placeholder="Address"></td>
                            <td class="text-center">
                                <button type="button" class="btn btn-danger btn-sm" onclick="removeRow(this)">×</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <button type="button" class="btn btn-primary btn-sm" onclick="addRow()">
                    <span class="plus-icon">+ Add Row</span>
                </button>
            </div>

            <div class="mt-4">
                <button type="submit" class="btn btn-primary">Save Contact</button>
                <g:link action="index" class="btn btn-secondary">Cancel</g:link>
            </div>
        </div>
    </g:form>
</div>

<script>
    function addRow() {
        var tableBody = document.getElementById('detailsBody');
        var rows = document.getElementsByClassName('detail-row');
        var rowCount = rows.length;

        var firstRow = rows[0];
        var newRow = firstRow.cloneNode(true);

        var inputs = newRow.querySelectorAll('input, select');
        inputs.forEach(function(input) {
            input.name = input.name.replace(/\[\d+\]/, '[' + rowCount + ']');
            input.value = '';
        });

        tableBody.appendChild(newRow);
    }

    function removeRow(btn) {
        var rows = document.getElementsByClassName('detail-row');
        if (rows.length > 1) {
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        } else {
            alert("At least one detail row is required.");
        }
    }
</script>
</body>
</html>
