
    $(function () {
        //$("select[name^='Contest']").selectmenu();
        //$("select[name^='Contest']").selectmenu('menuWidget').addClass('lq-dropdwn');

        $.widget( "ui.selectmenu", $.ui.selectmenu, {
            open: function() {
                console.log("open");
                //ok
                //$("li:contains(CQ).ui-menu-divider").css("border", "3px solid red");
                //ok slower
                //$("li:contains(CQ)").filter(".ui-menu-divider").css("border", "3px solid red");
                //has 2 classes on one object
                //$(".ui-selectmenu-optgroup.ui-menu-divider").css("border", "3px solid red");
                //OR operator with comma
                //$(".ui-menu ,.ui-menu-divider").css("border", "3px solid red");
                //or with AND
                $(".ui-menu ,li:contains(CQ).ui-menu-divider").css("border", "3px solid red");
                //$("[li:contains(CQ)] [.ui-menu-divider]").css("border", "3px solid red");
                $(".ui-menu-divider").css("color", "brown");
                //$(".ui-menu-divider").fadeIn("slow");
                //$(".ui-menu-divider").fadeOut("slow");

                return this._super();
            }
        });

       // {
 
            //$.widget( "ui.selectmenu", $.ui.selectmenu, {
            //    _renderItem: function( ul, item ) {
            //    return $( '<li>' )
            //       .attr( 'data-value', item.value )
            //       .append( $( '<a>' ).html( '<small>'+item.label+'</small>' ) )
            //       .appendTo( ul );
            //},
 
            //_renderMenu: function( ul, items ) {
            //    var that = this;
            //    $.each( items, function( index, item ) {
            //        that._renderItemData( ul, item );
            //    });
            //    $( ul )
            //       .attr( 'tabindex', -1 )
            //       .addClass( 'dropdown-menu' );
            //},
            //});



        var widget = $("select[name^='Contest']").selectmenu();
        $.each(widget, function (indexInArray, valueOfElement) {
            //console.log(indexInArray + ": " + valueOfElement);
            $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
            $(this).selectmenu('widget').addClass('lq-dropdwn');

            //$(this).selectmenu('widget').on("click", { foo: "jim" }, function (event) {

            //    alert("were here" + event.data.foo);

            //});


      ////sets all li to pink except selected
            //var sm_inst = $(this).data('ui-selectmenu'),
            //old_renderMenu = sm_inst._renderMenu;

            //sm_inst._renderMenu = function (ul, items) {
            //    $(ul).addClass('test');

            //    old_renderMenu.call(this, ul, items)
            //};



            //var sm_inst = $(this).data('ui-selectmenu'),
            //var _li = $(this).data('ui-selectmenu');
            

            //console.log(_li.valueOfElement);

            //old_renderItem = sm_inst._renderMenu._renderItem;

            //sm_inst._renderItem = function (li, items) {

            //    $(li).addClass('test');

            //    old_renderItem.call(this, li, items)
            //};


            //var options = $(this).selectmenu('menuWidget').selectmenu().selectmenu("option")
            //$.each(options, function (indexInArray, valueOfElement) {
            //    console.log(indexInArray + ": " + valueOfElement);
            //    //$(this).css("background-color", "green");
            //});

        });

        


        var widget = $("select[name^='Call']").selectmenu();
        $.each(widget, function (indexInArray, valueOfElement) {
            //console.log(indexInArray + ": " + valueOfElement);
            $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
            $(this).selectmenu('widget').addClass('lq-dropdwn');
        });



        //$("[name^='Contest']").selectmenu('menuWidget').addClass('lq-dropdwn');
        //$("[name^='Contest']").selectmenu('widget').addClass('lq-dropdwn');
        //$("[name^='Contest']").selectmenu();
        //$("[name^='Contest']").selectmenu('menuWidget').addClass('lq-dropdwn');
        //$("[name^='Contest']").selectmenu('widget').addClass('lq-dropdwn');
        $('#Call1').selectmenu();
        $('#Call1').selectmenu('menuWidget').addClass('lq-dropdwn');
        $('#Call1').selectmenu('widget').addClass('lq-dropdwn');
        //$(selector).addClass(className);
        $('#test').tooltip();
        $('#Call3').selectmenu();
        $('#Call3').selectmenu('menuWidget').addClass('overflow-contest-select');

    });

