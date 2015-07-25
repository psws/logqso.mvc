
$(function () {
    _lq.parent_modal_box_id = undefined;
    var btn = $.fn.button.noConflict();

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
                    //no scrollbar on phone
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
     each(function (indexInArray, valueOfElement) {
         $(this).addClass('lq-panel-title');
     });

    $("input[id^='Call']").
    each(function (indexInArray, valueOfElement) {
        $(this).addClass('lq-call-input');

        //$(this).css({
        //    "max-width" : "110px"
        //});
    });

    $("input[type='checkbox']").
   each(function (indexInArray, valueOfElement) {
       $(this).addClass('lq-checkbox');
   });

    $("div.panel-heading button[id$='Dft']").
  each(function (indexInArray, valueOfElement) {
      $(this).addClass('lq-button');
  });

    $("div[id^='hdgPnl'].panel-heading").
    each(function (indexInArray, valueOfElement) {
        //significance
        //$(this).css('border-color', '#aed7ff');
        //$(this).css('color', 'red');
        $(this).css({
            //'border-color':'#aed7ff',
            'color': 'red'
        })


    });

    $("div[id^='hdgAxis'].panel-heading").
        each(function (indexInArray, valueOfElement) {
            //significance
            $(this).css({
                'color': 'red'
            })
        });




    $("div.panel[id^='Pnl'], div.panel-heading[id^='hdgPnl'],  div.panel-body[id^='bdyPnl']").
    each(function (indexInArray, valueOfElement) {
        //$(this).prop('background-color', '#aed7ff');
        $(this).css({
            'background-color': '#aed7ff'
        })
    });

    $("div.panel[id^='AxisPnl'], div.panel-heading[id^='hdgAxisPnl'], div.panel-body[id^='bdyAxisPnl']").
    each(function (indexInArray, valueOfElement) {
        //$(this).prop('background-color', '#aed7ff');
        $(this).css('background-color', '#cbfcda');
    });

    $("span[id^='enb_dis'] input[id^='filter']").
    each(function (indexInArray, valueOfElement) {
        //$(this).prop('background-color', '#aed7ff');
        $(this).css('margin-right', '4px');

    });





    $("span[id^='enb_dis'] input").click(function (e) {
        if (e.currentTarget.checked) {
            e.currentTarget.parentNode.style.color = "red";
            switch (e.currentTarget.id) {
                case 'chk1':
                    $("#Call1").prop("disabled", true);
                    $("#Call1").css("color", "#a4a3a3");
                    break;
                case 'chk2':
                    $("#Call2").prop("disabled", true);
                    $("#Call2").css("color", "#a4a3a3");
                    break;
                case 'chk3':
                    $("#Call3").prop("disabled", true);
                    $("#Call3").css("color", "#a4a3a3");
                    break;
                default:

            }
        } else {
            e.currentTarget.parentNode.style.color = "";
            switch (e.currentTarget.id) {
                case 'chk1':
                    $("#Call1").prop("disabled", false);
                    $("#Call1").css("color", "");
                    break;
                case 'chk2':
                    $("#Call2").prop("disabled", false);
                    $("#Call2").css("color", "");
                    break;
                case 'chk3':
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



    //var widget = $("select[name^='Contest']").selectmenu();
    //$.each(widget, function (indexInArray, valueOfElement) {
    //    //console.log(indexInArray + ": " + valueOfElement);
    //    $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
    //    //$(this).selectmenu('menuWidget').css("line-height", "30px");
    //    //$(this).selectmenu("option", "line-height", "10px");
    //    $(this).selectmenu("option", "width", 110);
    //    $(this).selectmenu('widget').addClass('lq-dropdwn');
    //    //$(this).selectmenu('widget').css("line-height", "30px");

    //    //$(this).selectmenu('widget').on("click", { foo: "jim" }, function (event) {

    //    //    alert("were here" + event.data.foo);

    //    //});

    //    ////sets all li to pink except selected
    //    //var sm_inst = $(this).data('ui-selectmenu'),
    //    //old_renderMenu = sm_inst._renderMenu;

    //    //sm_inst._renderMenu = function (ul, items) {
    //    //    $(ul).addClass('test');

    //    //    old_renderMenu.call(this, ul, items)
    //    //};






    //    //var options = $(this).selectmenu('menuWidget').selectmenu().selectmenu("option")
    //    //$.each(options, function (indexInArray, valueOfElement) {
    //    //    console.log(indexInArray + ": " + valueOfElement);
    //    //    //$(this).css("background-color", "green");
    //    //});

    //});
    //$(" div.panel-body[id^='CtestPnl']").css("padding", "15px 4px 15px 4px");
    $("div.panel-body button[id^='Contest']").addClass('lq-contest-selector')
   .button({
       icons: {
           secondary: "ui-icon-triangle-1-s"
       }
   });
    $("div.panel-body button[id^='Contest'] span.ui-button-text")
    .css({
        "padding-left": "5px",
        "text-align": "left"
    });


    $("select[name^='Cat']").selectmenu().
        each(function (indexInArray, valueOfElement) {
            //console.log(indexInArray + ": " + valueOfElement);
            $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
            switch (valueOfElement.id) {
                case 'CatBnd':
                case 'CatPower':
                    $(this).selectmenu("option", "width", 60);
                    break
                case 'CatAssist':
                    $(this).selectmenu("option", "width", 120);
                    break
                case 'CatTX':
                    $(this).selectmenu("option", "width", 100);
                    break
                default:
                    $(this).selectmenu("option", "width", 100);

            }

            $(this).selectmenu('widget').addClass('lq-dropdwn');

        });



    $("select[name^='Axis']").selectmenu().
        each(function (indexInArray, valueOfElement) {
            //console.log(indexInArray + ": " + valueOfElement);
            $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
            $(this).selectmenu('widget').addClass('lq-dropdwn-larger');
            switch (valueOfElement.id) {
                case 'AxisFunction':
                    $(this).selectmenu("option", "width", 100);
                    $("ul[id^=" + valueOfElement.id + "]").css({
                        'margin-top': -((valueOfElement.childElementCount + 1) * (24)) +"px",
                        //'padding': '0 0 0 0 !important',
                        'line-height':'16px'
                    });

                    break
                case 'AxisInterval':
                    $(this).selectmenu("option", "width", 70);
                    $("ul[id^=" + valueOfElement.id + "]").css({
                        'margin-top': -((valueOfElement.childElementCount + 1) * (23) ) + "px",
                        //'padding': '0 0 0 0 !important',
                        'line-height': '16px'
                    });
                    break
                case 'AxisViewType':
                    $(this).selectmenu("option", "width", 130);
                    $("ul[id^=" + valueOfElement.id + "]").css({
                        'margin-top': -((valueOfElement.childElementCount +1) * (24) ) + "px",
                        //'padding': '0 0 0 0 !important',
                        'line-height': '16px'
                    });
                    break
                default:
                    $(this).selectmenu("option", "width", 100);
                    $("ul[id^=" + valueOfElement.id + "]").css({
                        'margin-top': -((valueOfElement.childElementCount) * (24) + 4) + "px",
                        //'padding': '0 0 0 0 !important',
                        'line-height': '16px'
                    });

            }

        });
    ElementCount = 5;
    //$("ul[id^='Axis']").css({
    //                'margin-top': -(ElementCount * 25)
    //            });



    //$("ul[id^='Axis'] ").
    //    each( function (indexInArray, valueOfElement) { 
    //        $(this).data();
    //        ElementCount = valueOfElement.childElementCount;

    //        $(this).css({
    //            'margin-top': -(ElementCount * 25)
    //        });

    //    });


    //tm = -(5 * 20);
    //AxisFunc.css({
    //    'margin-top': tm
    //});

    //$("ul#AxisFunction-menu li").each(function (indexInArray, valueOfElement) {
    //    if (valueOfElement.childElementCount > 10) {
    //    }
    //});

    //$("select#Contest1").selectmenu('widget').on("click", { foo: "jim" }, function (event) {
    //    $("select#Contest1").find('option').length;
    //    //alert("were here" + event.data.foo);

    //});



    var widget = $("select[name^='Call']").selectmenu();
    $.each(widget, function (indexInArray, valueOfElement) {
        //console.log(indexInArray + ": " + valueOfElement);
        $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
        $(this).selectmenu('widget').addClass('lq-dropdwn');
    });



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




    $("#ContestName1")
          .button()
          .click(function () {
              alert("Running the last action");
          })
          .next()
            .button({
                text: false,
                icons: {
                    primary: "ui-icon-triangle-1-s"
                }
            })
            .click(function () {
                var menu = $(this).parent().next().show().position({

                    my: "left top",
                    at: "left bottom",
                    of: this

                }).click(function (e) {
                    alert("Running the menu action");
                    $("#ContestName1").text = 'CqwwSSB2014';
                })
                $(document).one("click", function () {
                    menu.hide();
                });
                return false;
            })
            .parent()
              .buttonset()
              .next()
                .hide()
                .menu();


    //Modal support

    var appendthis = ("<div class='modal-overlay js-modal-close'></div>");


    //$('a[data-modal-id]').click(function (e) {
    $('button[data-modal-id]').click(function (e) {
        e.preventDefault();

        _lq.parent_modal_box_id = e.currentTarget.id;
        var newleft = $("button[id=" + _lq.parent_modal_box_id + "]").offset().left - $(".modal-box").width() / 2
        newleft = (newleft < 0) ? 0 : newleft;

        $(".modal-box").css({
            top: $("button[id=" + _lq.parent_modal_box_id + "]").offset().top + 20,
            left: newleft
        });
        $("body").append(appendthis);

        $(".modal-overlay").fadeTo(500, 0.7);

        //$(".js-modalbox").fadeIn(500);
        //style popup
        var modalBox = $(this).attr('data-modal-id');
        var popup = $('#' + modalBox + ' h4');
        popup.html("Select a contest for " + _lq.parent_modal_box_id);
        popup.addClass('lq-popup-hdr');
        var list = $('#' + modalBox + ' div[id$="list"]');
        list.addClass('lq-popup-list');

        $('#' + modalBox + ' ol.two-col-list li').off('click').on("click",
            {
                test: _lq.parent_modal_box_id,
                callNo: _lq.parent_modal_box_id
            }, _lq.ContestSelectHandler);
        $('#' + modalBox).fadeIn($(this).data());
    });


    var appendthis = ("<div class='modal-overlay js-modal-close'></div>");

    $('button[data-modal-id]').click(function (e) {
        e.preventDefault();
        $("body").append(appendthis);
        $(".modal-overlay").fadeTo(500, 0.7);
        //$(".js-modalbox").fadeIn(500);
        var modalBox = $(this).attr('data-modal-id');
        $('#' + modalBox).fadeIn($(this).data());

    });




    $(".modal-box").draggable();

    $(".js-modal-close, .modal-overlay").click(function (e) {
        $(this).tooltip();
        $(".modal-box, .modal-overlay").fadeOut(500, function () {
            $(".modal-overlay").remove();
        });
        e.preventDefault(); //keeps window from scrolling to the top

        //return false;  //keeps window from scrolling to the top

    });


    $(window).resize(function () {
        var curWidth = $(window).width(); //store the window's current width

        if (_lq.parent_modal_box_id !== undefined) {

            parent = $("button[id=" + _lq.parent_modal_box_id + "]");
            var newleft = $("button[id=" + _lq.parent_modal_box_id + "]").offset().left - $(".modal-box").width() / 2
            newleft = (newleft < 0) ? 0 : newleft;

            $(".modal-box").offset({
                //top: $(".modal-box").offset().top,
                //left: $(".modal-box").offset().left + deltaX
                //top: _lq.parent_modal_box_id.clientY + 5,
                top: $("button[id=" + _lq.parent_modal_box_id + "]").offset().top + 20,
                left: newleft

            });

        }

        //$(".modal-box").css({
        //    top: ($(window).height() - $(".modal-box").outerHeight()) / 2,
        //    left: ($(window).width() - $(".modal-box").outerWidth()) / 2
        //    //top: e.clientY +5,
        //    //left: e.clientX-$(this).width()
        //});
    });


    $(window).resize();
        document.getElementById("body").style.visibility = "visible";

});

(function (_lq, $, undefined) {

    _lq.parent_modal_box_id;

    _lq.ContestSelectHandler = function (event) {
        //alert(event.data.test);
        $('#' + event.data.test + ' span.ui-button-text').text(event.currentTarget.textContent);
        $(".js-modal-close, .modal-overlay").trigger('click');

    };


}(window._lq = window._lq || {}, jQuery));





//$(window).on('resize', showSize);

//showSize();

//function showSize() {
//    var height = $("div.navbar div.container").height();
//    var width = $("div.navbar div.container").width();
//    $('#size').html('HEIGHT : ' + $(window).height() + '<br>WIDTH : ' + $(window).width());
//    //$('#size2').html('HEIGHT : ' + screen.height + '<br>WIDTH : ' + screen.width);
//    $('#size2').html('HEIGHT : ' + height + '<br>WIDTH : ' + width);

//}


