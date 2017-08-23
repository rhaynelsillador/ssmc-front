$("#administration_menus").addClass("navigation__sub--active navigation__sub--toggled");
$("#roles_menu").addClass("navigation__active");

var tableClinic = $("#data-table-clinc").bootgrid({
	ajax: true,
    post: function ()
    {
        return {
            id: "b0df282a-0d67-40e5-8558-c9e93b7befed",
            test: "test"
        };
    },
    url: "RoleList",
    css: {
        icon: 'table-bootgrid__icon zmdi',
        iconSearch: 'zmdi-search',
        iconColumns: 'zmdi-view-column',
        iconDown: 'zmdi-sort-amount-desc',
        iconRefresh: 'zmdi-refresh',
        iconUp: 'zmdi-sort-amount-asc',
        dropDownMenu: 'dropdown form-group--select',
        search: 'table-bootgrid__search',
        actions: 'table-bootgrid__actions',
        header: 'table-bootgrid__header',
        footer: 'table-bootgrid__footer',
        dropDownItem: 'table-bootgrid__label',
        table: 'table table-bootgrid',
        pagination: 'pagination table-bootgrid__pagination'
    },
    templates: {
        actionDropDown: "<span class=\"{{css.dropDownMenu}}\">" + "<a href='' data-toggle=\"dropdown\">{{ctx.content}}</a><ul class=\"{{css.dropDownMenuItems}}\" role=\"menu\"></ul></span>",
        search: "<div class=\"{{css.search}} form-group\"><span class=\"{{css.icon}} {{css.iconSearch}}\"></span><input type=\"text\" class=\"{{css.searchField}}\" placeholder=\"{{lbl.search}}\" /><i class='form-group__bar'></i></div>",
        header: "<div id=\"{{ctx.id}}\" class=\"{{css.header}}\"><p class=\"{{css.search}}\"></p><p class=\"{{css.actions}}\"></p></div>",
        actionDropDownCheckboxItem: "<li><div class='tabe-bootgrid__checkbox checkbox checkbox--dark'><label class=\"{{css.dropDownItem}}\"><input name=\"{{ctx.name}}\" type=\"checkbox\" value=\"1\" class=\"{{css.dropDownItemCheckbox}}\" {{ctx.checked}} /> {{ctx.label}}<i class='input-helper'></i></label></div></li>",
        footer: "<div id=\"{{ctx.id}}\" class=\"{{css.footer}}\"><div class=\"row\"><div class=\"col-sm-6\"><p class=\"{{css.pagination}}\"></p></div><div class=\"col-sm-6 table-bootgrid__showing hidden-xs\"><p class=\"{{css.infos}}\"></p></div></div></div>"
    },
    formatters: {
        "commands": function(column, row) {
        	return 	"<a href=\"RoleUpdate?id="+row.id+"&name="+row.name+"\" class=\"btn btn-sm btn-default command-edit\" data-row-id=\"" + row.id + "\">Edit</a>";
    	}
	}
});


tableClinic.on("loaded.rs.jquery.bootgrid", function() {
	tableClinic.find(".command-status").on("click", function(e){        
        var form = {
        	id: $(this).data("row-id"),
        	status: $(this).data("row-status"),
        }
        var statusMessage = "disable";
        if(form.status == "false" || form.status == false){
        	statusMessage = "enable"
        }
               
        confirmation({
        	text : "Do you want to "+statusMessage+" this faq?",
        	url : "ChangeStatusFaq",
        	form : form,
        	bootGrid : $('#data-table-clinc')
        
        });
        
    }).end().find(".command-delete").on("click", function(e){
    	var form = {
        	id: $(this).data("row-id")
        }
    	
    	confirmDelete({
        	text : "Do you want to delete this faq?",
        	url : "DeleteFaq",
        	form : form,
        	bootGrid : $('#data-table-clinc')
        
        });
    });
});
