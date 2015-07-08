
$(function () {
    //$("select[name^='Contest']").selectmenu();
    //$("select[name^='Contest']").selectmenu('menuWidget').addClass('lq-dropdwn');

    $.widget("ui.selectmenu", $.ui.selectmenu, {
        open: function (event, ui) {
            //console.log("open");
            //ok
            $("li:contains(CQ).ui-menu-divider").css("border", "3px solid green");
            $("li:contains(CQ).ui-menu-divider").addClass('ui-menu-divider-lq');

            // find every selectmenu ul and adds scroll bar if children li exceed 20
            $(".ui-menu").each(function (indexInArray, valueOfElement) {
                if (valueOfElement.childElementCount > 10) {
                    var mq = window.matchMedia("(min-width:700px");
                    if (mq.matches == true) {
                        $(this).addClass('overflow-contest-select');
                    }
                }

            });

            //ok slower
            //$("li:contains(CQ)").filter(".ui-menu-divider").css("border", "3px solid red");
            //has 2 classes on one object
            //$(".ui-selectmenu-optgroup.ui-menu-divider").css("border", "3px solid red");
            //OR operator with comma
            //$(".ui-menu ,.ui-menu-divider").css("border", "3px solid red");
            //or with AND
            //$(".ui-menu ,li:contains(CQ).ui-menu-divider").css("border", "3px solid red");
            //$("[li:contains(CQ)] [.ui-menu-divider]").css("border", "3px solid red");
            $(".ui-menu-divider").css("color", "green");
            //$(".ui-menu").css("width", "115px");
            $(".ui-menu").addClass("lq-call-text");


            //$(".ui-menu-divider").fadeIn("slow");
            //$(".ui-menu-divider").fadeOut("slow");

            return this._super();
        }
        //,
        //close: function() {
        //    $("li:contains(Cq).ui-menu-item").closest('ul').removeClass('overflow-contest-select');
        //    return this._super();
        //}


    });


    $(".panel-heading h3:contains(Call1).panel-title").addClass("lq-call1-bkgnd");
    $(".panel-heading h3:contains(Call2).panel-title").addClass("lq-call2-bkgnd");
    $(".panel-heading h3:contains(Call3).panel-title").addClass("lq-call3-bkgnd");

    //$(".panel-heading h3:contains(Call3).panel-title").css({
    //    "background-color": "green",
    //    "color": "red"
    //});

   $(".panel-heading h3:contains(Call).panel-title").
    each( function (indexInArray, valueOfElement) { 
        $(this).addClass('lq-panel-title');
    });
     
   $("input[id^='Call']").
   each(function (indexInArray, valueOfElement) {
       $(this).addClass('lq-call-input');

       //$(this).css({
       //    "max-width" : "110px"
       //});
   });

    $("input[contains='checkbox']").
   each(function (indexInArray, valueOfElement) {
       $(this).addClass('lq-checkbox');
   });

    $("span button[id$='Dft']").
  each(function (indexInArray, valueOfElement) {
      $(this).addClass('lq-button');
  });

    $("div.panel-heading, div.panel, div[id^='bdyPnl']").
    each(function (indexInArray, valueOfElement) {
        //$(this).prop('background-color', '#aed7ff');
        $(this).css('background-color', '#aed7ff');
    });

    $("span[id^='enb_dis'] input[id^='filter']").
    each(function (indexInArray, valueOfElement) {
        //$(this).prop('background-color', '#aed7ff');
        $(this).css('margin-right', '4px');
        //$(this).css('width', '70px');

    });



   

    $("span[id^='enb_dis'] input").click(function (e) {
        if ( e.currentTarget.checked) {
            e.currentTarget.parentNode.style.color = "red";
            switch (e.currentTarget.id) {
                case    'chk1':
                    $("#Call1").prop( "disabled" , true);
                    $("#Call1").css("color", "#a4a3a3");
                    break;
                case    'chk2':
                    $("#Call2").prop("disabled", true);
                    $("#Call2").css("color", "#a4a3a3");
                    break;
                case    'chk3':
                    $("#Call3").prop("disabled", true);
                    $("#Call3").css("color", "#a4a3a3");
                    break;
                default:

            }
        } else {
            e.currentTarget.parentNode.style.color = "";
            switch (e.currentTarget.id) {
                case    'chk1':
                    $("#Call1").prop( "disabled" , false);
                    $("#Call1").css("color", "");
                    break;
                case    'chk2':
                    $("#Call2").prop("disabled", false);
                    $("#Call2").css("color", "");
                    break;
                case    'chk3':
                    $("#Call3").prop("disabled", false);
                    $("#Call3").css("color", "");
                    break;
                default:

            }
        }
        //e.preventDefault();

    });

    //$(".panel-heading").css({
    //    "color": "black",
    //    "background-color": "blue"
    //});
  



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
            $(this).selectmenu("option", "width", 110);
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



   


            //var options = $(this).selectmenu('menuWidget').selectmenu().selectmenu("option")
            //$.each(options, function (indexInArray, valueOfElement) {
            //    console.log(indexInArray + ": " + valueOfElement);
            //    //$(this).css("background-color", "green");
            //});

        });

        //$("select#Contest1").selectmenu('widget').on("click", { foo: "jim" }, function (event) {
        //    $("select#Contest1").find('option').length;
        //    //alert("were here" + event.data.foo);

        //});



        //var widget = $("select[name^='Call']").selectmenu();
        //$.each(widget, function (indexInArray, valueOfElement) {
        //    //console.log(indexInArray + ": " + valueOfElement);
        //    $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
        //    $(this).selectmenu('widget').addClass('lq-dropdwn');
        //});



        ////$("[name^='Contest']").selectmenu('menuWidget').addClass('lq-dropdwn');
        ////$("[name^='Contest']").selectmenu('widget').addClass('lq-dropdwn');
        ////$("[name^='Contest']").selectmenu();
        ////$("[name^='Contest']").selectmenu('menuWidget').addClass('lq-dropdwn');
        ////$("[name^='Contest']").selectmenu('widget').addClass('lq-dropdwn');
        //$('#Call1').selectmenu();
        //$('#Call1').selectmenu('menuWidget').addClass('lq-dropdwn');
        //$('#Call1').selectmenu('widget').addClass('lq-dropdwn');
        ////$(selector).addClass(className);
        //$('#test').tooltip();
        //$('#Call3').selectmenu();
        //$('#Call3').selectmenu('menuWidget').addClass('overflow-contest-select');

});
//var LQ = {};


//$(window).on('resize', showSize);

//showSize();

//function showSize() {
//    var height = $("div.navbar div.container").height();
//    var width = $("div.navbar div.container").width();
//    $('#size').html('HEIGHT : ' + $(window).height() + '<br>WIDTH : ' + $(window).width());
//    //$('#size2').html('HEIGHT : ' + screen.height + '<br>WIDTH : ' + screen.width);
//    $('#size2').html('HEIGHT : ' + height + '<br>WIDTH : ' + width);

//}


