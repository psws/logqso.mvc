
$(function () {
    window.URL = window.URL || window.webkitURL;
    _lq.parent_modal_box_id = undefined;
    _lq.SessionSaveControlSelections = "SessionSaveControlSettings";
    var btn = $.fn.button.noConflict();

    //$("select[name^='Contest']").selectmenu();
    //$("select[name^='Contest']").selectmenu('menuWidget').addClass('lq-dropdwn');
    //get control data

    // Fetch the initial data.
    //var controlUri = '/api/control/';
    var bodyContainer =  $("div.body-content ");
    var updateProgressDiv = $("#updateProgressDiv");
    var tmp = bodyContainer.width();
    var position = bodyContainer.offset();

    var x = position.left + Math.round(bodyContainer.width() / 2) - Math.round(updateProgressDiv.width() / 2);
    var y = position.top + Math.round(bodyContainer.height() / 2) - Math.round(updateProgressDiv.height() / 2);

    //	set the progress element to this position
    updateProgressDiv.css({
        position: "absolute",
        top: y + "px",
        left: x + "px"
    } );

    getAllControls();
    getAllData();
    LoadCallPopupTabs();

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
            //$(".ui-menu").addClass("lq-call-text");


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

    //if (isDebug == 0) {
    //    //remove menu API
    //    $("ul.navbar-nav li:contains(API)").remove();
    // }


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

    $("button[id^='Call'] ").
    each(function (indexInArray, valueOfElement) {
        $(this).addClass('lq-call-button');
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


    $("div.panel-body[id^='bdyPnl']").
    each(function (indexInArray, valueOfElement) {
        //$(this).prop('background-color', '#aed7ff');
        $(this).css({
            'padding': '4px 4px 2px 4px'
        })
    });


    $("div.panel[id^='AxisPnl'], div.panel-heading[id^='hdgAxisPnl'], div.panel-body[id^='bdyYaxisPnl'], div.panel-body[id^='bdyXaxisPnl']").
    each(function (indexInArray, valueOfElement) {
        //$(this).prop('background-color', '#aed7ff');
        $(this).css('background-color', '#cbfcda');
    });

    $("span[id^='enb_dis'] input[id^='filter']").
    each(function (indexInArray, valueOfElement) {
        //$(this).prop('background-color', '#aed7ff');
        $(this).css('margin-right', '4px');

    });

    $("div.panel-body span[id^='enb_dis'] ").
    each(function (indexInArray, valueOfElement) {
        //$(this).prop('background-color', '#aed7ff');
        $(this).css('margin-right', '4px');

    });

    $("div[id= graph]").css({
        'padding-left': '0px',
        'padding-right': '0px'
    });


    function PropertyColorState(Selector, property, state, color) {
        $(Selector).prop(property, state);
        $(Selector).css("color", color);
    }

    function SelectMenuState(Selector, property) {
        $Select = $(Selector);
        $.each($Select, function (indexInArray, valueOfElement) {
            $(this).selectmenu(property);
        });
    }

    $("span[id^='enb_dis'] input").click(function (e) {
        if (e.currentTarget.checked) {
            var DataUpdated = false;
            var ControlUpdated = false;

            e.currentTarget.parentNode.style.color = "red";
            switch (e.currentTarget.id) {
                case 'chk1':
                    PropertyColorState("#Call1", "disabled", true, "#a4a3a3");
                    SelectMenuState("#Station1, #Radio1", "disable");
                    _lq.DataCallSettingsDto[1].Disabled = true;
                    DataUpdated = true;
                    break;
                case 'chk2':
                    PropertyColorState("#Call2", "disabled", true, "#a4a3a3");
                    SelectMenuState("#Station2, #Radio2", "disable");
                    _lq.DataCallSettingsDto[2].Disabled = true;
                    DataUpdated = true;
                    break;
                case 'chk3':
                    PropertyColorState("#Call3", "disabled", true, "#a4a3a3");
                    SelectMenuState("#Station3, #Radio3", "disable");
                    _lq.DataCallSettingsDto[3].Disabled = true;
                    DataUpdated = true;
                    break;
                case 'filtercatchk':
                    PropertyColorState("#filtercatchk", "checked", true, "#a4a3a3");
                    SelectMenuState("Select[id^='Cat']", "disable");
                    _lq.ControlCategorySettingsDto.Disabled = true;
                    ControlUpdated = true;
                    break;
                case 'filterQsochk':
                    PropertyColorState("#filterQsochk", "checked", true, "#a4a3a3");
                    SelectMenuState("Select[id^='Filt']", "disable");
                    _lq.ControlFiltersSettingsDto.Disabled = true;
                    ControlUpdated = true;
                    break;

                default:

            }
        } else {
            e.currentTarget.parentNode.style.color = "";
            switch (e.currentTarget.id) {
                case 'chk1':
                    PropertyColorState("#Call1", "disabled", false, "");
                    SelectMenuState("#Station1, #Radio1", "enable");
                    _lq.DataCallSettingsDto[1].Disabled = false;
                    DataUpdated = true;
                    break;
                case 'chk2':
                    PropertyColorState("#Call2", "disabled", false, "");
                    SelectMenuState("#Station2, #Radio2", "enable");
                    _lq.DataCallSettingsDto[2].Disabled = false;
                    DataUpdated = true;
                    break;
                case 'chk3':
                    PropertyColorState("#Call3", "disabled", false, "");
                    SelectMenuState("#Station3, #Radio3", "enable");
                    _lq.DataCallSettingsDto[31].Disabled = false;
                    DataUpdated = true;
                    break;
                case 'filtercatchk':
                    SelectMenuState("Select[id^='Cat']", "enable");
                    _lq.ControlCategorySettingsDto.Disabled = false;
                    ControlUpdated = true;
                    break;
                case 'filterQsochk':
                    SelectMenuState("Select[id^='Filt']", "enable");
                    _lq.ControlFiltersSettingsDto.Disabled = false;
                    ControlUpdated = true;
                default:

            }

        }
        if (ControlUpdated == true) {
            _lq.SessionSaveControlSettings();
        }
        if (DataUpdated == true) {
            _lq.SessionSaveDataSettings();
        }
        if (ControlUpdated == true || DataUpdated == true) {
            
        }


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
    $("div.panel-body button[id^='Contest'], button[id^=Call]").addClass('lq-contest-selector')
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
                    $(this).selectmenu("option", "width", 110);
                    break
                case 'CatTX':
                    $(this).selectmenu("option", "width", 90);
                    break
                default:
                    $(this).selectmenu("option", "width", 100);

            }

            $(this).selectmenu('widget').addClass('lq-dropdwn');

        });

    $("select[name^='Filt']").selectmenu().
            each(function (indexInArray, valueOfElement) {
                //console.log(indexInArray + ": " + valueOfElement);
                $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
                switch (valueOfElement.id) {
                    case 'FiltBand':
                        $(this).selectmenu("option", "width", 60);
                        break
                    case 'FiltContinent':
                        $(this).selectmenu("option", "width", 75);
                        break
                    case 'FiltCountry':
                        $(this).selectmenu("option", "width", 160);
                        break
                    case 'FiltCQZone':
                        $(this).selectmenu("option", "width", 80);
                        break
                    default:
                        $(this).selectmenu("option", "width", 100);

                }

                $(this).selectmenu('widget').addClass('lq-dropdwn');

            });

    $("select[name^='Yaxis'] , select[name^='Xaxis']").selectmenu().
        each(function (indexInArray, valueOfElement) {
            //console.log(indexInArray + ": " + valueOfElement);
            $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
            $(this).selectmenu('widget').addClass('lq-dropdwn-larger');
            switch (valueOfElement.id) {
                case 'YaxisFunction':
                    $(this).selectmenu("option", "width", 120);
                    break;
                case 'YaxisInterval':
                    $(this).selectmenu("option", "width", 70);
                    break;
                case 'YaxisViewType':
                    $(this).selectmenu("option", "width", 130);
                    break;
                case 'XaxisStarttime':
                    $(this).selectmenu("option", "width", 130);
                    break;
                case 'XaxisDuration':
                    $(this).selectmenu("option", "width", 70);
                    break;
                default:
                    $(this).selectmenu("option", "width", 100);

            }

        });


    $("select[name^='Station']").selectmenu().
        each(function (indexInArray, valueOfElement) {
            $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
            $(this).selectmenu("option", "width", 80);
            $(this).selectmenu('widget').addClass('lq-dropdwn');

        });

    $("select[name^='Radio']").selectmenu().
        each(function (indexInArray, valueOfElement) {
            $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
            $(this).selectmenu("option", "width", 60);
            $(this).selectmenu('widget').addClass('lq-dropdwn');

        });


    //ElementCount = 5;
    //$("ul[id^='Axis']").css({
    //                'margin-top': -(ElementCount * 25)
    //            });

    //set DDL change event
    $("select[id ^='Cat'], select[id ^='Filt'], select[id ^='Yaxis'], select[id ^='Xaxis']").
        each(function (indexInArray, valueOfElement) {
            $(this).on("selectmenuselect", function (event, ui) {
                id = $("#" + ui.item.element[0].parentElement.name + " option:selected");
                _lq.ControlUpdated(ui.item.element[0].parentElement.name, id[0].innerHTML, id[0].value);
            })

        });
    //set DDL Data change event
    $("select[id ^='Station'], select[id ^='Radio']").
        each(function (indexInArray, valueOfElement) {
            $(this).on("selectmenuselect", function (event, ui) {
                id = $("#" + ui.item.element[0].parentElement.name + " option:selected");
                _lq.DataUpdated(ui.item.element[0].parentElement.name, id[0].innerHTML);
            })

        });


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




    //$("#ContestName1")
    //      .button()
    //      .click(function () {
    //          alert("Running the last action");
    //      })
    //      .next()
    //        .button({
    //            text: false,
    //            icons: {
    //                primary: "ui-icon-triangle-1-s"
    //            }
    //        })
    //        .click(function () {
    //            var menu = $(this).parent().next().show().position({

    //                my: "left top",
    //                at: "left bottom",
    //                of: this

    //            }).click(function (e) {
    //                alert("Running the menu action");
    //                $("#ContestName1").text = 'CqwwSSB2014';
    //            })
    //            $(document).one("click", function () {
    //                menu.hide();
    //            });
    //            return false;
    //        })
    //        .parent()
    //          .buttonset()
    //          .next()
    //            .hide()
    //            .menu();


    //Modal support

    var appendthis = ("<div class='modal-overlay js-modal-close'></div>");


    //$('a[data-modal-id]').click(function (e) {
    $('button[id^=Contest][ data-modal-id]').click(function (e) {
        e.preventDefault();
        puwidth = 500;
        //var bodywidth = $('#body')[0].clientWidth;
        //if (puwidth + 10 > bodywidth) {
        //    puwidth = bodywidth - 10;
        //}
        _lq.parent_modal_box_id = e.currentTarget.id;
        offset = $("button[id=" + _lq.parent_modal_box_id + "]").offset();
        //wid = $("div[id=popup].modal-box").width();
        var newleft = $("button[id=" + _lq.parent_modal_box_id + "]").offset().left - puwidth / 1.3
        newleft = (newleft < 0) ? 0 : newleft;

        $(".modal-box").css({
            top: $("button[id=" + _lq.parent_modal_box_id + "]").offset().top + 20,
            left: newleft
        }).css('width', puwidth +'px');;
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

        // map all choices to ContestSelectHandler()
        $('#' + modalBox + ' ol.two-col-list li').off('click').on("click",
            {
                test: _lq.parent_modal_box_id,
                callNo: _lq.parent_modal_box_id
            }, _lq.ContestSelectHandler);

        $('#' + modalBox).fadeIn($(this).data());
    });

    $('button[id^=Call][ data-modal-id]').click(function (e) {
        e.preventDefault();

        _lq.parent_modal_box_id = e.currentTarget.id;
        puwidth = 570;
        var bodywidth = $('#body')[0].clientWidth;
        if (puwidth + 10 > bodywidth) {
            puwidth = bodywidth - 10;
        }
        var newleft = $("button[id=" + _lq.parent_modal_box_id + "]").offset().left - puwidth / 1.3
        newleft = (newleft < 0) ? 0 : newleft;

        
        //$(".js-modalbox").fadeIn(500);
        ////style popup
        //var modalBox = $(this).attr('data-modal-id');
        //var popup = $('#' + modalBox + ' h4');
        //popup.html("Select a Call for " + _lq.parent_modal_box_id);
        //popup.addClass('lq-popup-hdr');
        //var list = $('#' + modalBox + ' div[id$="list"]');
        //list.addClass('lq-popup-list');

        //$('#jqxTabs').jqxTabs({
        //    width: 480,
        //    height: 150,
        //    theme: 'energyblue'
        //});

        var call = e.currentTarget.innerText.toUpperCase();
        //set active tab 
        var c = call.charCodeAt(0).toString(16);
        var acttab;
        var actDiv;
        if (c > 0 && c <= 9) {
            acttab = 0;
            actDiv = 'CTab1';
        } else {
            acttab = c - 40;
            actDiv = 'CTab' + call[0];

        }

        var tdiv;
        var tabNo;
        var popupNo;
        switch (_lq.parent_modal_box_id) {
            case 'Call1':
                tdiv = $('div[id=tabs1]');
                tabNo = 'tabs1';
                popupNo = 'popupCall1';
                break;
            case 'Call2':
                tdiv = $('div[id=tabs2]');
                tabNo = 'tabs2';
                popupNo = 'popupCall2';
                break;
            case 'Call3':
                tdiv = $('div[id=tabs3]');
                tabNo = 'tabs3';
                popupNo = 'popupCall3';
                break;
            default:

        }
        $('#' + popupNo).css({
            top: $("button[id=" + _lq.parent_modal_box_id + "]").offset().top + 20,
            left: newleft
        }).css('width', puwidth + 'px');
        $("body").append(appendthis);

        $(".modal-overlay").fadeTo(500, 0.7);

        //style popup
        var modalBox = $('#' + popupNo + '' );
        var popup = $('#' + popupNo + ' h4');
        popup.html("Select a Call for " + _lq.parent_modal_box_id);
        popup.addClass('lq-popup-hdr');

        tdiv.tabs({
            width: 480,
            height: 150,
            active: acttab,
            create: function (event, ui) {
                _lq.InitTab = ui.tab[0].innerText;
                LoadInitialCallTab(event, ui);

            },
            activate: function (event, ui)
            {
                //alert(  ui.newTab.index());
                LoadCallTab(event, ui);
                //alert(ui.newTab.attr('li', "innerHTML")[0].getElementsByTagName("a")[0].innerHTML);
                //alert( this.text);
            }
            });

        //LoadInitialCallTab() tab is only called once
        //after this first call, InitTabState is set true.
        //Whenever the call? button is pushed, getAllData will be called if the button call[0] is in the InitTab character range.
        //Without this hack the initTab initial tab is never updated again.
        if (_lq.InitTabState == 0) {
            _lq.InitTabState = 1;
        } else if (_lq.InitTab == call[0]) {
            _lq.GetCallData(_lq.parent_modal_box_id, null);
        }
        //var CallTab = $("#tabs1").tabs("widget");
        $("#" + tabNo + " ul.ui-tabs-nav li a").
            each(function (indexInArray, valueOfElement) {
                //console.log(indexInArray + ": " + valueOfElement);
                $(this).addClass('jqxtab-tab-button');
                $(this).css('padding', '1px 1px 1px 1px');
            });
        $("#" + tabNo + " ul.ui-tabs-nav li").
         each(function (indexInArray, valueOfElement) {
             $(this).css('margin', '0');
         });

        //$("#tabs li" ).tab(function (index, event) {
        //    this.

        //});

        //$('#' + modalBox).fadeIn($(this).data());
        $('#' + popupNo).fadeIn($(this).data());
    });

    //var appendthis = ("<div class='modal-overlay js-modal-close'></div>");

    //$('button[data-modal-id]').click(function (e) {
    //    e.preventDefault();
    //    $("body").append(appendthis);
    //    $(".modal-overlay").fadeTo(500, 0.7);
    //    //$(".js-modalbox").fadeIn(500);
    //    var modalBox = $(this).attr('data-modal-id');
    //    $('#' + modalBox).fadeIn($(this).data());

    //});




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



    function getAllControls() {
        _lq.ajaxHelper(_lq.controlUri + "/GetControlNames", 'GET','json', true, null , getAllControlsLoad);

        function getAllControlsLoad(data) {
            //console.log(data.ControlCategoryDto.CatOperator);

            $select = $('#CatOp');
            //clear the current content of the select
            $select.html('');
            //iterate over the data and append a select option
            $.each(data.ControlCategoryDto.CatOperator, function (key, val) {
                //$select.append('<option id="' + val.CatOpr + '">' + val.CatOprName + '</option>');
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#CatBnd');
            $select.html('');
            $.each(data.ControlCategoryDto.CatBand, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#CatPower');
            $select.html('');
            $.each(data.ControlCategoryDto.CatPower, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#CatAssist');
            $select.html('');
            $.each(data.ControlCategoryDto.CatAssisted, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#CatTX');
            $select.html('');
            $.each(data.ControlCategoryDto.CatNoOfTx, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            //Filter
            $select = $('#FiltBand');
            $select.html('');
            $.each(data.ControlFiltersDto.FiltBand, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#FiltContinent');
            $select.html('');
            $.each(data.ControlFiltersDto.FiltContinent, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#FiltCountry');
            $select.html('');
            $.each(data.ControlFiltersDto.FiltCountryInnerHTML, function (key, val) {
                //val has to be innerhtml with &nbsp
                $select.append('<option value =' + val.key + '>' + val.value + '</option>');
            })
            $ul = $("ul[id^=FiltCountry]");
            if (data.ControlFiltersDto.FiltCountryInnerHTML.length > 20) {
                $ul.css({
                    //'overflow-y':scroll,
                    'height': (20 * (20)) + "px",
                    'line-height': '16px',
                });
            }

            $select = $('#FiltCQZone');
            $select.html('');
            $.each(data.ControlFiltersDto.FiltCQZone, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })
            $ul = $("ul[id^=FiltCQZone]");
            if (data.ControlFiltersDto.FiltCQZone.length > 20) {
                $ul.css({
                    //'overflow-y':scroll,
                    'height': (20 * (20)) + "px",
                    'line-height': '16px',
                });
            }


            //Yaxis
            $select = $('#YaxisFunction');
            $select.html('');
            $.each(data.ControlYaxisDto.YaxisFunction, function (key, val) {
                val = val.replace("  ", "&nbsp;&nbsp;");
                $select.append('<option >' + val + '</option>');
            })
            //make dropup
            $ul = $("ul[id^=YaxisFunction]");
            $ul.css({
                'margin-top': -((data.ControlYaxisDto.YaxisFunction.length + 1) * (22.5)) + "px",
                'line-height': '16px'
            });

            $select = $('#YaxisInterval');
            $select.html('');
            $.each(data.ControlYaxisDto.YaxisInterval, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })
            //make dropup
            $ul = $("ul[id^=YaxisInterval]");
            $ul.css({
                'margin-top': -((data.ControlYaxisDto.YaxisInterval.length + 1) * (23)) + "px",
                'line-height': '16px'
            });

            $select = $('#YaxisViewType');
            $select.html('');
            $.each(data.ControlYaxisDto.YaxisViewType, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })
            //make dropup
            $ul = $("ul[id^=YaxisViewType]");
            $ul.css({
                'margin-top': -((data.ControlYaxisDto.YaxisViewType.length + 1) * (23)) + "px",
                'line-height': '16px'
            });

            //Xaxis
            $select = $('#XaxisStarttime');
            $select.html('');
            var Day2HR = false;
            $.each(data.ControlXaxisDto.XaxisStarttime, function (key, val) {
                if (Day2HR == false && val.indexOf("Day2") > -1) {
                    Day2HR = true;
                    $select.append('<option disabled>______________</option>');
                }
                val = val.replace("  ", "&nbsp;&nbsp;");
                $select.append('<option >' + val + '</option>');
            })
            //make dropup
            $ul = $("ul[id^=XaxisStarttime]");
            $ul.css({
                'margin-top': -((data.ControlXaxisDto.XaxisStarttime.length + 1) * (23.2)) + "px",
                'line-height': '16px'
            });

            $select = $('#XaxisDuration');
            $select.html('');
            $.each(data.ControlXaxisDto.XaxisDuration, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })
            //make dropup
            $ul = $("ul[id^=XaxisDuration]");
            $ul.css({
                'margin-top': -((data.ControlXaxisDto.XaxisDuration.length + 1) * (23)) + "px",
                'line-height': '16px'
            });


            //check if cached
            dataobj = window.sessionStorage.getItem(_lq.SessionSaveControlSelections);
            SessionSaveControlSettings = JSON.parse(dataobj);
            if (SessionSaveControlSettings != null) {
                SetControlCategorySettingsDefaults(SessionSaveControlSettings.ControlCategorySettingsDto);
                SetControlFiltersSettingsDefaults(SessionSaveControlSettings.ControlFiltersSettingsDto);
                SetControlXaxisSettingsDefaults(SessionSaveControlSettings.ControlXaxisSettingsDto);
                SetControlYaxisSettingsDefaults(SessionSaveControlSettings.ControlYaxisSettingsDto);
                _lq.SessionSaveControlSettings();

                //SetControlDefaults(SessionSaveControlSettings);
            }else {
                GetControlSelections();
            }



        };

    }


    function GetControlSelections() {
        _lq.ajaxHelper(_lq.controlUri + "/GetControlSelections", 'GET', 'json', true, null, GetControlSelectionsLoad);
        function GetControlSelectionsLoad(data) {
            SetControlCategorySettingsDefaults(data.ControlCategorySettingsDto);
            SetControlFiltersSettingsDefaults(data.ControlFiltersSettingsDto);
            SetControlXaxisSettingsDefaults(data.ControlXaxisSettingsDto);
            SetControlYaxisSettingsDefaults(data.ControlYaxisSettingsDto);

            _lq.SessionSaveControlSettings();

        };  
    }




    function getAllData() {
        _lq.ajaxHelper(_lq.dataUri + "/GetDataCallInfoSelections", 'GET', 'json', true, null, SetCallInfoObjDataSettings);
    }



    function SetCallInfoObjDataSettings(data) {
        if (data.length > 3) {
            //popup dialog selection box, to select whivh saved session
            //noy implemented yet
        } else {
            for (var i = 0; i < data.length; i++) {
    
                switch (data[i].CallGroup) {
                    case 1:
                        SetCallinfo(1, data[i]);
                        break;
                    case 2:
                        SetCallinfo(2, data[i]);
                        break;
                    case 3:
                        SetCallinfo(3, data[i]);
                        break;
                    default:
        
                }
            }
        }
        SetDataSettingsDefaults(data);

    }

    function SetCallinfo(index, data) {
        var olWWs = $("div[id= WWssblist] ol.two-col-list")
        var olWWc = $("div[id= WWcwlist] ol.two-col-list")
        var olWPX = $("div[id= WPXlist] ol.two-col-list")
        olWWs.html('');
        olWWc.html('');
        olWPX.html('');
        $.each(data.ContestNames, function (key, val) {
            if (val.value.indexOf('Cqww S') != -1) {
                olWWs.append('<li value = ' + val.key +'>' + val.value + '</li>');
            }else if (val.value.indexOf('Cqww C') != -1) {
                olWWc.append('<li value = ' + val.key +'>' + val.value + '</li>');
            } else if (val.value.indexOf('Cqwpx') != -1) {
                olWPX.append('<li value = ' + val.key +'>' + val.value + '</li>');
            }
        })

        $select = $("div[id^= bdyPnl] #Station" + index)
        $select.html('');
        $.each(data.StationNames, function (key, val) {
            $select.append('<option value = ' + val.key + '>' + val.value + '</option>');
        })

        $select = $("div[id^= bdyPnl] #Radio" + index)
        $select.html('');
        $.each(data.RadioNames, function (key, val) {
            $select.append('<option value = ' + val.key + '>' + val.value + '</option>');
        })
    }

    function LoadCallPopupTabs() {
        $('div[id^=tab]').each(function () {
            var tab = this.id;
            var TabUl = $('div[id=' + tab + '] ul');
            var DivUl = $('div[id=' + tab + ']');

            var alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            if ($('div[id=' + tab + '] ul li').length == 0) {

                TabUl.append('<li ><a href="#CTab1">1-9</a></li>');
                DivUl.append('<div id="CTab1"></div>');
                var CTab = "CTab";
                for (var i = 0; i < 26; i++) {
                    TabUl.append('<li ><a href="#' + CTab + alpha[i] + '">' + alpha[i] + '</a></li>');
                    DivUl.append('<div id="' + CTab + alpha[i] + '"></div>');
                }
            }

        });

    }

    function LoadInitialCallTab(event, ui) {
        //function LoadCallTab(actDiv, Callgroup) {
        var actDiv = ui.panel[0].id;
        var tabNo = event.target.id;
        var Tabdiv = $('div[id =' + tabNo + '] div[id=' + actDiv + ']')
        var list = "list" + actDiv;
        //Tabdiv.append("<ol id ='list" + actDiv + "' class='five-col-list'></ol>");
        //var TabOl = $('div[id =' + tabNo + '] ol[id=' + list + ']');
        //TabOl.append('<li value = ' + val.key + '>' + val.value + '</li>');
        //for (var i = 0; i < 25; i++) {
        //    TabOl.append('<li value = '+ i +'> CN2R </li>');
        //}

        //Div[0].innerText += "Hello World inital " + _lq.parent_modal_box_id;
        // map all choices to CallSelectHandler()
        //var modalBox = $(this).attr('data-modal-id');

        //$('div[id=' + actDiv + '] ol.five-col-list li').off('click').on("click",
        //    {
        //        test: _lq.parent_modal_box_id,
        //        callNo: _lq.parent_modal_box_id
        //    }, _lq.CallSelectHandler);

        _lq.GetCallData(_lq.parent_modal_box_id, null);

    }

    function LoadCallTab(event, ui) {
        //function LoadCallTab(actDiv, Callgroup) {
        var actDiv = ui.newPanel[0].id;
        var tabNo = event.target.id;

        TabdivOl = $('div[id =' + tabNo + '] div[id=' + actDiv + ']')
        var list = "list" + actDiv;
        var TabOl = $('div[id =' + tabNo + '] ol[id=' + list + ']');
        var ReloadCalltab = false;
        switch (_lq.parent_modal_box_id) {
            case 'Call1':
                if (_lq.CallReload1 == true) {
                    ReloadCalltab = true;
                }
                break;
            case 'Call2':
                if (_lq.CallReload2 == true) {
                    ReloadCalltab = true;
                }
            case 'Call3':
                if (_lq.CallReload3 == true) {
                    ReloadCalltab = true;
                }
                break;
            default:
        }

        //ReloadCalltab is true whenever the cat or contest changes.
        if (TabdivOl[0].children.length == 0 || ReloadCalltab == true) {
            ////Tabdiv.append("<ol id ='list" + actDiv + "' class='five-col-list'></ol>");
            ////TabOl = $('div[id =' + tabNo + '] ol[id=' + list + ']');
            //TabOl.append('<li value = ' + val.key + '>' + val.value + '</li>');
            //for (var i = 0; i < 200; i++) {
            //    TabOl.append('<li value = ' + i + '> CN2R </li>');
            //}
            //if (ReloadCalltab) {
            //    ui.newPanel.empty();
            //}

            var tabChar = ui.newTab[0].innerText;
            _lq.GetCallData(_lq.parent_modal_box_id, tabChar);


            //$('div[id=' + actDiv + ']  ol.five-col-list li').off('click').on("click",
            //            {
            //                test: _lq.parent_modal_box_id,
            //                callNo: _lq.parent_modal_box_id
            //            }, _lq.CallSelectHandler);
        }

    }




    $("button[id$= 'Dft']").click(function () {
        var ReqUri = "/GetControlSelection/";
        switch (this.id ) {
            case "CatDft":
                ReqUri += "ControlCategorySettingsDto";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET', 'json', true, null, ControlCategorySettingsDtoLoad);
                function ControlCategorySettingsDtoLoad(ControlCategorySettingsDto) {
                       SetControlCategorySettingsDefaults(ControlCategorySettingsDto);
                   };
                break;
            case "QsoDft":
                ReqUri += "ControlFiltersSettingsDto";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET', 'json', true, null, SetControlFiltersSettingsDefaultsLoad);
                function SetControlFiltersSettingsDefaultsLoad(ControlFiltersSettingsDto) {
                       SetControlFiltersSettingsDefaults(ControlFiltersSettingsDto);

                   };
                break;
            case "AxisDft":
                ReqUri += "ControlYaxisSettingsDto";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET', 'json', true, null, ControlYaxisSettingsDtoLoad);
                function ControlYaxisSettingsDtoLoad(ControlYaxisSettingsDto) {
                      SetControlYaxisSettingsDefaults(ControlYaxisSettingsDto);
                  };
                break;
            case "XAxisDft":
                ReqUri += "ControlXaxisSettingsDto";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET', 'json', true, null, SetControlXaxisSettingsDefaultsLoad);
                function SetControlXaxisSettingsDefaultsLoad(ControlXaxisSettingsDto) {
                      SetControlXaxisSettingsDefaults(ControlXaxisSettingsDto);
                  };
                break;
            default:

        }
        _lq.SessionSaveControlSettings();


    })

    function SetControlCategorySettingsDefaults(ControlCategorySettingsDto) {
        $select = $('#CatOp').val(ControlCategorySettingsDto.CatOperator);
        $select.selectmenu("refresh");
        $select = $('#CatBnd').val(ControlCategorySettingsDto.CatBand);
        $select.selectmenu("refresh");
        $select = $('#CatPower').val(ControlCategorySettingsDto.CatPower);
        $select.selectmenu("refresh");
        $select = $('#CatAssist').val(ControlCategorySettingsDto.CatAssisted);
        $select.selectmenu("refresh");
        $select = $('#CatTX').val(ControlCategorySettingsDto.CatNoOfTx);
        $select.selectmenu("refresh");
        if (ControlCategorySettingsDto.Disabled) {
            PropertyColorState("#filtercatchk", "checked", true, "#a4a3a3");
            $("#filtercatchk").prev("label").css(
                 { "color": "red" });
            SelectMenuState("Select[id^='Cat']", "disable");
            _lq.ControlCategorySettingsDto.Disabled = true;
        } else {
            PropertyColorState("#filtercatchk", "checked", false, "");
            $("#filtercatchk").prev("label").css(
                { "color": "" });
            SelectMenuState("Select[id^='Cat']", "enable");
            _lq.ControlCategorySettingsDto.Disabled = false;
        }
        _lq.ControlCategorySettingsDto = ControlCategorySettingsDto;
    }

    function SetControlFiltersSettingsDefaults(ControlFiltersSettingsDto) {
        $select = $('#FiltBand').val(ControlFiltersSettingsDto.FiltBand);
        $select.selectmenu("refresh");
        $select = $('#FiltContinent').val(ControlFiltersSettingsDto.FiltContinent);
        $select.selectmenu("refresh");

        //index = $('#FiltCountry').prop("selectedIndex");

        //$('#FiltCountry').prop("selectedValue", ControlFiltersSettingsDto.FiltCountryInnerHTML).selectmenu('refresh');
        if (ControlFiltersSettingsDto.FiltCountryInnerHTML.value.indexOf("&nbsp") != -1) {
            var Selectedval = ControlFiltersSettingsDto.FiltCountryInnerHTML.value.replace("&nbsp;&nbsp;&nbsp;&nbsp;", "    ");
            var Selectedval = Selectedval.replace("&amp;", "&");
        }
        // $('#FiltCountry').val(Selectedval).selectmenu('refresh');
        $select = $('#FiltCountry');
        ////var tmp = $select.value;
        ////var tmp = $('#FiltCountry option[value=' + ControlFiltersSettingsDto.FiltCountryInnerHTML.key + ']').prop('selected', true);
        if ($select.length != 0) {
            $select[0].selectedIndex = ControlFiltersSettingsDto.FiltCountryInnerHTML.key;
            //the next 2 lines are required for the Samsung Internet browser
            $select = $('#FiltCountry option[value=' + ControlFiltersSettingsDto.FiltCountryInnerHTML.key + ']');
            $select[0].innerText = Selectedval;
            $('#FiltCountry').selectmenu("refresh");
        }



        $select = $('#FiltCQZone').val(ControlFiltersSettingsDto.FiltCQZone);
        $select.selectmenu("refresh");
        if (ControlFiltersSettingsDto.Disabled) {
            PropertyColorState("#filterQsochk", "checked", true, "#a4a3a3");
            $("#filterQsochk").prev("label").css(
                 { "color": "red" });
            SelectMenuState("Select[id^='Filt']", "disable");
            _lq.ControlFiltersSettingsDto.Disabled = true;
        } else {
            PropertyColorState("#filterQsochk", "checked", false, "");
            $("#filterQsochk").prev("label").css(
                { "color": "" });
            SelectMenuState("Select[id^='Filt']", "enable");
            _lq.ControlFiltersSettingsDto.Disabled = false;
        }
        _lq.ControlFiltersSettingsDto = ControlFiltersSettingsDto;

    }

    function SetControlXaxisSettingsDefaults(ControlXaxisSettingsDto) {
        $('#XaxisStarttime').prop("selectedIndex", ControlXaxisSettingsDto.XaxisStarttimeIndex).selectmenu('refresh');

        //$select = $('#XaxisStarttime').val(ControlXaxisSettingsDto.XaxisStarttime);
        //$select.selectmenu("refresh");
        $select = $('#XaxisDuration').val(ControlXaxisSettingsDto.XaxisDuration);
        $select.selectmenu("refresh");
        _lq.ControlXaxisSettingsDto = ControlXaxisSettingsDto;
    }

    function SetControlYaxisSettingsDefaults(ControlYaxisSettingsDto) {
        $('#YaxisFunction').prop("selectedIndex", ControlYaxisSettingsDto.YaxisFunctionIndex).selectmenu('refresh');

        //$select = $('#YaxisFunction').val(ControlYaxisSettingsDto.YaxisFunction);
        //$select.selectmenu("refresh");
        $select = $('#YaxisInterval').val(ControlYaxisSettingsDto.YaxisInterval);
        $select.selectmenu("refresh");
        $select = $('#YaxisViewType').val(ControlYaxisSettingsDto.YaxisViewType);
        $select.selectmenu("refresh");
        _lq.ControlYaxisSettingsDto = ControlYaxisSettingsDto;
    }

    function SetDataSettingsDefaults(DataCallInfoObj) {
        for (var i = 0; i < DataCallInfoObj.length; i++) {
            _lq.DataCallSettingsDto[i].CallGroup = DataCallInfoObj[i].CallGroup;
            _lq.DataCallSettingsDto[i].SelectedContestName = DataCallInfoObj[i].SelectedContestName;
            _lq.DataCallSettingsDto[i].SelectedCall = DataCallInfoObj[i].SelectedCall;
            _lq.DataCallSettingsDto[i].SelectedRadioType = DataCallInfoObj[i].QsoRadioType;
            _lq.DataCallSettingsDto[i].Disabled = DataCallInfoObj[i].Disabled;
            _lq.DataCallSettingsDto[i].LogId = DataCallInfoObj[i].LogId;

            switch (DataCallInfoObj[i].CallGroup) {
                case 1:
                    //http://stackoverflow.com/questions/5580616/jquery-change-button-text
                    $("button[id='Call1'] ").text(DataCallInfoObj[i].SelectedCall);
                    $("button[id='Contest1'] span").text(DataCallInfoObj[i].SelectedContestName);
                    if (DataCallInfoObj[i].SelectedStationName != null) {
                        $select = $('#Station1').val(DataCallInfoObj[i].SelectedStationName).selectmenu("refresh");
                        _lq.DataCallSettingsDto[i].SelectedStationName = DataCallInfoObj[i].SelectedStationName;
                    }else {
                        $select = $('#Station1').val("ALL").selectmenu("refresh");
                        _lq.DataCallSettingsDto[i].SelectedStationName = "ALL";
                    }
                    var chk = $("input[id='chk1'] ")
                    if (chk .length != 0) {
                        if (DataCallInfoObj[i].Disabled == true) {
                            chk[0].checked = true;
                        } else {
                            chk[0].checked = false;
                        }
                    }
                    $select = $('#Radio1').prop("selectedIndex", DataCallInfoObj[i].QsoRadioType).selectmenu('refresh');
                    break;
                case 2:
                    //http://stackoverflow.com/questions/5580616/jquery-change-button-text
                    $("button[id='Call2'] ").text(DataCallInfoObj[i].SelectedCall);
                    $("button[id='Contest2'] span").text(DataCallInfoObj[i].SelectedContestName);
                    if (DataCallInfoObj[i].SelectedStationName != null) {
                        $select = $('#Station2').val(DataCallInfoObj[i].SelectedStationName).selectmenu("refresh");
                    } else {
                        $select = $('#Station2').val("ALL").selectmenu("refresh");
                    }
                    var chk = $("input[id='chk2'] ")
                    if (chk.length != 0) {
                        if (DataCallInfoObj[i].Disabled == true) {
                            chk[0].checked = true;
                        } else {
                            chk[0].checked = false;
                        }
                    }
                    $select = $('#Radio2').prop("selectedIndex", DataCallInfoObj[i].QsoRadioType).selectmenu('refresh');
                    break;
                case 3:
                    //http://stackoverflow.com/questions/5580616/jquery-change-button-text
                    $("button[id='Call3'] ").text(DataCallInfoObj[i].SelectedCall);
                    $("button[id='Contest3'] span").text(DataCallInfoObj[i].SelectedContestName);
                    if (DataCallInfoObj[i].SelectedStationName != null) {
                        $select = $('#Station3').val(DataCallInfoObj[i].SelectedStationName).selectmenu("refresh");
                    }else {
                        $select = $('#Station3').val("ALL").selectmenu("refresh");
                    }
                    var chk = $("input[id='chk3'] ")
                    if (chk.length != 0) {
                        if (DataCallInfoObj[i].Disabled == true) {
                            chk[0].checked = true;
                        } else {
                            chk[0].checked = false;
                        }
                    }
                    $select = $('#Radio3').prop("selectedIndex", DataCallInfoObj[i].QsoRadioType).selectmenu('refresh');
                    break;
                default:
        
            }
        }
        _lq.SessionSaveDataSettings();


    }
 



    $(window).resize();
    document.getElementById("body").style.visibility = "visible";


    });


//END OF $FUNCTION

// encapsuleted _lq class
    (function (_lq, $, undefined) {
    _lq.controlUri = '/v1/Control';
    _lq.dataUri = '/v1/Data';

    _lq.parent_modal_box_id;
    _lq.CallReload1 = true;
    _lq.CallReload2 = true;
    _lq.CallReload3 = true;
    _lq.InitTab;
    _lq.InitTabState = 0;
    _lq.ajaxCallCount = 0;

    _lq.SessionSaveControlSelections;

    _lq.ControlCategorySettingsDto =  {
        CatOperator: '',
        CatBand: '',
        CatPower: '',
        CatAssisted: '',
        CatNoOfTx: '',
        Disabled: 0
    };

    _lq.ControlFiltersSettingsDto = {
        FiltBand: '',
        FiltContinent: '',
        FiltCountryInnerHTML: '',
        FiltCQZone: '',
        Disabled: 0
    };

    _lq.ControlXaxisSettingsDto = {
        XaxisDuration: '',
        XaxisStarttime: '',
        XaxisStarttimeIndex: ''
    };

    _lq.ControlYaxisSettingsDto = {
        YaxisFunction: '',
        YaxisFunctionIndex: '',
        YaxisInterval: '',
        YaxisViewType: ''
    };

    _lq.ControlSettingsDto = [_lq.ControlCategorySettingsDto, _lq.ControlFiltersSettingsDto, _lq.ControlXaxisSettingsDto, _lq.ControlYaxisSettingsDto];


    _lq.DataCallSettings1 = {
        CallGroup: '',
        SelectedContestName: '',
        SelectedCall: '',
        SelectedStationName: '',
        SelectedRadioType: '',
        LogId: '',
        Disabled: 0,
        StationNames: '',
        ContestNames: '',
        RadioNames: '',
    };
    _lq.DataCallSettings2 = {
        CallGroup: '',
        SelectedContestName: '',
        SelectedCall: '',
        SelectedStationName: '',
        SelectedRadioType: '',
        LogId: '',
        Disabled: 0,
        StationNames: '',
        ContestNames: '',
        RadioNames: '',
    };
    _lq.DataCallSettings3 = {
        CallGroup: '',
        SelectedContestName: '',
        SelectedCall: '',
        SelectedStationName: '',
        SelectedRadioType: '',
        LogId: '',
        Disabled: 0,
        StationNames: '',
        ContestNames: '',
        RadioNames: '',
    };


    _lq.DataCallSettingsDto = [_lq.DataCallSettings1, _lq.DataCallSettings2, _lq.DataCallSettings3];


    _lq.DataCallSettings = {
        SelectedContestName: '',
        SelectedCall: '', 
        SelectedStationName: '', 
        CallGroup: '', 
        SelectedRadioType: '',
        LogId: '', 
        Disabled: 0, 
        StationNames: '', 
        ContestNames: '',
        RadioNames: '' ,
    };

    _lq.DataCalls = {
        CallGroup: '',
        SelectedCall: '',
        Calls:
            {
                CallsignID: '',
                Call: ''
            }
    };

        // use this transport for "binary" data type
        //http://www.henryalgus.com/reading-binary-files-using-jquery-ajax/
    $.ajaxTransport("+binary", function (options, originalOptions, jqXHR) {
        // check for conditions and support for blob / arraybuffer response type
        if (window.FormData && ((options.dataType && (options.dataType == 'binary')) || (options.data && ((window.ArrayBuffer && options.data instanceof ArrayBuffer) || (window.Blob && options.data instanceof Blob))))) {
            return {
                // create new XMLHttpRequest
                send: function (headers, callback) {
                    // setup all variables
                    var xhr = new XMLHttpRequest(),
            url = options.url,
            type = options.type,
            async = options.async || true,
            // blob or arraybuffer. Default is blob
            dataType = options.responseType || "blob",
            data = options.data || null,
            username = options.username || null,
            password = options.password || null;

                    xhr.addEventListener('load', function () {
                        var data = {};
                        data[options.dataType] = xhr.response;
                        // make callback and send data
                        callback(xhr.status, xhr.statusText, data, xhr.getAllResponseHeaders());
                    });

                    xhr.open(type, url, async, username, password);

                    // setup custom headers
                    for (var i in headers) {
                        xhr.setRequestHeader(i, headers[i]);
                    }

                    xhr.responseType = dataType;
                    xhr.send(data);
                },
                abort: function () {
                    jqXHR.abort();
                }
            };
        }
    });


    _lq.ajaxHelper = function (uri, method, datatype, processdata, data, Function) {
        $.ajax({
            type: method,
            url: uri,
            dataType: datatype,
            processData: processdata,
            contentType: 'application/json',
            beforeSend: function () {
                _lq.ajaxCallCount++;
                $('#updateProgressDiv').show();
            },
            complete: function () {
                _lq.ajaxCallCount--;
                if (_lq.ajaxCallCount == 0) {
                    $('#updateProgressDiv').hide();
                }
            },

            data: data ? JSON.stringify(data) : null,
        })
       .done(Function)
       .fail(function (jqXHR, textStatus, errorThrown) {
           console.log(errorThrown);
       });

    }


    _lq.ContestSelectHandler = function (event) {
        //alert(event.data.test);
        $('#' + event.data.test + ' span.ui-button-text').text(event.currentTarget.textContent);
        $(".js-modal-close, .modal-overlay").trigger('click');
        //call DDL change event
        _lq.DataUpdated(event.data.test, event.currentTarget.textContent);
    };

    _lq.CallSelectHandler = function (event) {
        //alert(event.data.test);
        $('#' + event.data.test + ' span.ui-button-text').text(event.currentTarget.textContent);
        $(".js-modal-close, .modal-overlay").trigger('click');
        var button = $('button[id=' + event.data.test + ']')[0].innerText = event.currentTarget.textContent;;
        //call DDL change event
        _lq.DataUpdated(event.data.test, event.currentTarget.textContent);
    };


    //function for updating graph POST
    _lq.ControlUpdated = function (Controlid, SelectedValue, value) {
        //alert("Control: " + Controlid + "-->Selected:" + SelectedValue);
        var bUpdated = true;
        if (Controlid.indexOf("Cat") >= 0) {
            switch (Controlid) {
                case "CatOp":
                    _lq.ControlCategorySettingsDto.CatOperator = SelectedValue;
                    break;
                case "CatBnd":
                    _lq.ControlCategorySettingsDto.CatBand = SelectedValue;
                    break;
                case "CatPower":
                    _lq.ControlCategorySettingsDto.CatPower = SelectedValue;
                    break;
                case "CatAssist":
                    _lq.ControlCategorySettingsDto.CatAssisted = SelectedValue;
                    break;
                case "CatTX":
                    _lq.ControlCategorySettingsDto.CatNoOfTx = SelectedValue;
                    break;
                default:

            }
        }else if (Controlid.indexOf("Filt")>= 0)  {
            switch (Controlid) {
                case "FiltBand":
                    _lq.ControlFiltersSettingsDto.FiltBand = SelectedValue;
                    break;
                case "FiltContinent":
                    _lq.ControlFiltersSettingsDto.FiltContinent = SelectedValue;
                    break;
                case "FiltCountry":
                    //if (SelectedValue.indexOf("&nbsp") == -1) {
                    //    var val = SelectedValue.IndexOf(" ");
                    //    _lq.ControlFiltersSettingsDto.FiltCountryInnerHTML = SelectedValue.replace(/ /g, '+');
                    //    //_lq.ControlFiltersSettingsDto.FiltCountryInnerHTML = SelectedValue.replace(" ", String.fromCharCode(160) );
                    //} else {
                    //    _lq.ControlFiltersSettingsDto.FiltCountryInnerHTML = SelectedValue;
                    //}
                    _lq.ControlFiltersSettingsDto.FiltCountryInnerHTML.value = SelectedValue;
                    _lq.ControlFiltersSettingsDto.FiltCountryInnerHTML.key = value;
                    //_lq.ControlFiltersSettingsDto.FiltCountryIndex = $('#FiltCountry').prop("selectedIndex");
                    break;
                case "FiltCQZone":
                    _lq.ControlFiltersSettingsDto.FiltCQZone = SelectedValue;
                    break;
                default:
        
            }
        }else if (Controlid.indexOf("Xaxis")>= 0)  {
            switch (Controlid) {
                case "XaxisStarttime":
                    _lq.ControlXaxisSettingsDto.XaxisStarttime = SelectedValue
                    _lq.ControlXaxisSettingsDto.XaxisStarttimeIndex = $('#XaxisStarttime').prop("selectedIndex");
                    break;
                case "XaxisDuration":
                    _lq.ControlXaxisSettingsDto.XaxisDuration = SelectedValue;
                    break;
                default:
        
            }
    
        } else if (Controlid.indexOf("Yaxis") >= 0)   {
            switch (Controlid) {
                case "YaxisFunction":
                    _lq.ControlYaxisSettingsDto.YaxisFunction = SelectedValue;
                    _lq.ControlYaxisSettingsDto.YaxisFunctionIndex = $('#YaxisFunction').prop("selectedIndex");
                    break;
                case "YaxisInterval":
                    _lq.ControlYaxisSettingsDto.YaxisInterval = SelectedValue;
                    break;
                case "YaxisViewType":
                    _lq.ControlYaxisSettingsDto.YaxisViewType = SelectedValue;
                    break;
                default:
        
            }
        } 
        else {
            bUpdated = false;
        }

        if (bUpdated) {
            _lq.SessionSaveControlSettings();
            _lq.UpdateChartData(false);
        }
    }



    //_lq.SendControlSettings = function (save) {
    //    if (save == true) {
    //        _lq.SessionSaveControlSettings();
    //    }

    //    var dataObj = {
    //        ControlCategorySettingsDto: _lq.ControlCategorySettingsDto,
    //        ControlFiltersSettingsDto: _lq.ControlFiltersSettingsDto,
    //        ControlXaxisSettingsDto: _lq.ControlXaxisSettingsDto,
    //        ControlYaxisSettingsDto: _lq.ControlYaxisSettingsDto
    //    };

        //    _lq.ajaxHelper(_lq.controlUri + "/SendControlSelections", 'POST','json', true, dataObj, UpdateControlsLoad);
    //    function UpdateControlsLoad() {
    //        //update controls and graph
    //    };
    //}

    _lq.SessionSaveControlSettings = function () {
        var dataObj = {
            ControlCategorySettingsDto: _lq.ControlCategorySettingsDto,
            ControlFiltersSettingsDto: _lq.ControlFiltersSettingsDto,
            ControlXaxisSettingsDto: _lq.ControlXaxisSettingsDto,
            ControlYaxisSettingsDto: _lq.ControlYaxisSettingsDto
        };
        //get rid of old
        window.sessionStorage.removeItem(_lq.SessionSaveControlSelections);
        window.sessionStorage.setItem(_lq.SessionSaveControlSelections, JSON.stringify(dataObj) );

    }

        //function for updating graph POST
    _lq.DataUpdated = function (Controlid, SelectedValue) {
        //alert("Control: " + Controlid + "-->Selected:" + SelectedValue);
        var bUpdated = true;
        if (Controlid.indexOf("Station") >= 0) {
            switch (Controlid) {
                case "Station1":
                    _lq.DataCallSettingsDto[0].SelectedStationName = SelectedValue;
                    break;
                case "Station2":
                    _lq.DataCallSettingsDto[1].SelectedStationName = SelectedValue;
                    break;
                case "Station3":
                    _lq.DataCallSettingsDto[2].SelectedStationName = SelectedValue;
                    break;
                default:
                    break;
            }
        }else if (Controlid.indexOf("Radio") >= 0) {
            switch (Controlid) {
                case "Radio1":
                    _lq.DataCallSettingsDto[0].SelectedRadioType = SelectedValue;
                    break;
                case "Radio2":
                    _lq.DataCallSettingsDto[1].SelectedRadioType = SelectedValue;
                    break;
                case "Radio3":
                    _lq.DataCallSettingsDto[2].SelectedRadioType = SelectedValue;
                    break;
                default:
                    break;
            }

        } else if (Controlid.indexOf("Contest") >= 0) {
            var tabNo;
            var actDiv;
            switch (Controlid) {
                case "Contest1":
                    _lq.DataCallSettingsDto[0].SelectedContestName = SelectedValue;
                    //remove tab Ol
                    tabNo = 'tabs1';
                    actDiv = 'CTab' + $('button[id=Call1]')[0].innerText[0];
                    _lq.CallReload1 = true;
                    break;
                case "Contest2":
                    _lq.DataCallSettingsDto[1].SelectedContestName = SelectedValue;
                    tabNo = 'tabs2';
                    actDiv = 'CTab' + $('button[id=Call2]')[0].innerText[0];
                    _lq.CallReload2 = true;
                    break;
                case "Contest3":
                    _lq.DataCallSettingsDto[2].SelectedContestName = SelectedValue;
                    tabNo = 'tabs3';
                    actDiv = 'CTab' + $('button[id=Call3]')[0].innerText[0];
                    _lq.CallReload3 = true;
                    break;
                default:
                    break;
            }
            $('div[id =' + tabNo + '] div[id=' + actDiv + ']')
            .each(function (indexInArray, valueOfElement) {
                $(this).empty();
            });

        }
        else if (Controlid.indexOf("Call") >= 0) {
            switch (Controlid) {
                case "Call1":
                    _lq.DataCallSettingsDto[0].SelectedCall = SelectedValue;
                    break;
                case "Call2":
                    _lq.DataCallSettingsDto[1].SelectedCall = SelectedValue;
                    break;
                case "Call3":
                    _lq.DataCallSettingsDto[2].SelectedCall = SelectedValue;
                    break;
                default:
                    break;

            }
        } else {
            bUpdated = false;
        }

        if (bUpdated) {
            _lq.SessionSaveDataSettings();
            _lq.UpdateChartData(false);
        }
    }

    _lq.UpdateChartData = function (save) {
        if (save == true) {
            _lq.SessionSaveDataSettings();
        }

        var dataObj = {
            DataCallSettingsDto: _lq.DataCallSettingsDto,
            ControlSettingsDto: _lq.ControlSettingsDto=  {
                ControlCategorySettingsDto: _lq.ControlCategorySettingsDto,
                ControlFiltersSettingsDto: _lq.ControlFiltersSettingsDto,
                ControlXaxisSettingsDto: _lq.ControlXaxisSettingsDto,
                ControlYaxisSettingsDto: _lq.ControlYaxisSettingsDto
            }
        };



        _lq.ajaxHelper(_lq.dataUri + "/UpdateChart", 'POST', 'binary', false, dataObj, _lq.UpdateChartLoad);
    }

    _lq.UpdateChartLoad = function (data) {
        //http://stackoverflow.com/questions/23851685/webapi-return-binary-image-to-be-displayed-using-jquery-ajax-method
        $('#ChartRate').attr('src', window.URL.createObjectURL(data));

    }


    _lq.SessionSaveDataSettings = function () {
        var dataObj = {
            DataCallSettingsDto: _lq.DataCallSettingsDto
        };
        window.sessionStorage.removeItem(_lq.DataCallSettingsDto);
        window.sessionStorage.setItem(_lq.DataCallSettingsDto, JSON.stringify(dataObj));

    }

        //get calls
    _lq.GetCallData = function (CallGroup, SelectedTabName) {
        var CallIndex;
        switch (CallGroup) {
            case 'Call1':
                CallIndex = 0;
                _lq.CallReload1 = false;
                break;
            case 'Call2':
                CallIndex = 1;
                _lq.CallReload2 = false;
                break;
            case 'Call3':
                CallIndex = 2;
                _lq.CallReload3 = false;
                break;
            default:

        }
        var DataCallSettings0 = _lq.DataCallSettingsDto[CallIndex];
        if (SelectedTabName != null) {
            DataCallSettings0.SelectedCall = SelectedTabName;
        }

        var dataObj = {
            DataCallSetting: DataCallSettings0,
            ControlCategorySettingsDTO: _lq.ControlCategorySettingsDto
    }

        //_lq.ajaxHelper(_lq.dataUri + '/PostCallsRequest', 'POST', 'json', false, _lq.ControlCategorySettingsDto, _lq.UpdateCallTab);
        //_lq.ajaxHelper(_lq.dataUri + '/PostDataCallsRequest', 'POST', 'json', false, _lq.DataCallSettingsDto[CallIndex], _lq.UpdateCallTab);
        _lq.ajaxHelper(_lq.dataUri + '/CallsRequest', 'POST', 'json', false, dataObj, _lq.UpdateCallTab);

        };

    _lq.UpdateCallTab = function (data) {
        var tab;
        switch (data.CallGroup) {
            case 1:
                tabNo = 'tabs1';
                break;
            case 2:
                tabNo = 'tabs2';
                break;
            case 3:
                tabNo = 'tabs3';
                break;
            default:

        }
        var actDiv = 'CTab' + data.SelectedCall.substring(0, 1);;
        var Tabdiv = $('div[id =' + tabNo + '] div[id=' + actDiv + ']')
        Tabdiv.addClass('TabDivLiCol');
        var list = "list" + actDiv;


//Vertical LIST
        var i, k;
        var colLiCnt;
        var columnCnt = 5;
        var TotalCalls = data.Calls.length;
        if (TotalCalls > 5) {
            colLiCnt = Math.ceil(TotalCalls / columnCnt);
        } else {
            colLiCnt = TotalCalls;
        }
        var colWidth = Math.floor(100 / columnCnt) + "%"
        var CallIndex = 0;
        var column = 1;

        //empty previous calls
        var TabClrOl = $('div[id =' + tabNo + '] ol[id^=' + list + ']')
            .each(function (indexInArray, valueOfElement) {
                $(this).empty();
            });
        //empty div
        $('div[id =' + tabNo + '] div[id=' + actDiv + ']')
            .each(function (indexInArray, valueOfElement) {
                $(this).empty();
            });

        //$('div[id =' + tabNo + '] div[id=' + actDiv + ']')
        //    .each(function (indexInArray, valueOfElement) {
        //        $(this).empty();
        //    });

        if (TotalCalls != 0) {
            for (var i = 0; i < TotalCalls; i += colLiCnt) {
                Tabdiv.append("<ol id ='list" + actDiv + column + "' class='liCol'></ol>");
                var TabOl = $('div[id =' + tabNo + '] ol[id=' + list + column + ']');
                for (var k = CallIndex; k < colLiCnt * column; k++) {
                    if (k == TotalCalls) {
                        break;
                    }
                    TabOl.append('<li value = ' + data.Calls[k].CallSignID + '>' + data.Calls[k].Call + '</li>');
                }
                CallIndex += colLiCnt;
                column++;
            }

        }

        $(".liCol").css("width", colWidth)
        $('div[id=' + actDiv + '] ol.liCol li').off('click').on("click",
            {
                test: _lq.parent_modal_box_id,
                callNo: _lq.parent_modal_box_id
            }, _lq.CallSelectHandler);

//Horizontal LIST
        ////Tabdiv.append("<ol id ='list" + actDiv + "' class='five-col-list'></ol>");
        ////var TabOl = $('div[id =' + tabNo + '] ol[id=' + list + ']');
        ////for (var i = 0; i < data.Calls.length; i++) {
        ////    TabOl.append('<li value = ' + data.Calls[i].CallSignID + '>' +  data.Calls[i].Call + '</li>');
        ////}


        ////$('div[id=' + actDiv + '] ol.five-col-list li').off('click').on("click",
        ////    {
        ////        test: _lq.parent_modal_box_id,
        ////        callNo: _lq.parent_modal_box_id
        ////    }, _lq.CallSelectHandler);


    };


} (window._lq = window._lq || {}, jQuery));






//$(window).on('resize', showSize);

//showSize();

//function showSize() {
//    var height = $("div.navbar div.container").height();
//    var width = $("div.navbar div.container").width();
//    $('#size').html('HEIGHT : ' + $(window).height() + '<br>WIDTH : ' + $(window).width());
//    //$('#size2').html('HEIGHT : ' + screen.height + '<br>WIDTH : ' + screen.width);
//    $('#size2').html('HEIGHT : ' + height + '<br>WIDTH : ' + width);

//}


