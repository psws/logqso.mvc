﻿
$(function () {
    window.URL = window.URL || window.webkitURL;
    _lq.parent_modal_box_id = undefined;
    _lq.SessionSaveControlSelections = "SessionSaveControlSettings";
    var btn = $.fn.button.noConflict();
    //var isIE = /*@cc_on!@*/false || !!document.documentMode;
    _lq.ie11 = window.navigator.userAgent.indexOf('Trident/');


    // Fetch the initial data.
    //var controlUri = '/api/control/';
    var bodyContainer = $("div.body-content ");
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
    });

    _lq.getAllControls();
    //_lq.getAllDat();
    _lq.ActiveView = window.sessionStorage.getItem('_lq.ActiveView');
    if (_lq.ActiveView == null) {
        _lq.ActiveView = $('#TabViewInit')[0].value;
        window.sessionStorage.setItem('_lq.ActiveView', _lq.ActiveView);
    }

    _lq.LoadViewTabs("ALL");

    _lq.LogScrollPosition = window.sessionStorage.getItem('_lq.LogScrollPosition');
    if (_lq.LogScrollPosition != null) {
        _lq.LogScrollUpdateReqd = false; //restored pos on refresh
    } else {
        _lq.LogScrollUpdateReqd = true;
    }

    _lq.UbnScrollPosition = window.sessionStorage.getItem('_lq.UbnScrollPosition');
    if (_lq.UbnScrollPosition != null) {
        _lq.UbnScrollUpdateReqd = false; //restored pos on refresh
    } else {
        _lq.UbnScrollUpdateReqd = true;
    }





    _lq.UBNViewInit();
    _lq.LogViewInit();
    _lq.QsoInit();


    _lq.LoadCallPopupTabs('All');

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

    $("div[id^='hdgPnl'].panel-heading, div[id^='FhdgPnl'].panel-heading").
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
    $("div.panel[id^='FPnl'], div.panel-heading[id^='FhdgPnl'],  div.panel-body[id^='FbdyPnl']").
    each(function (indexInArray, valueOfElement) {
        //$(this).prop('background-color', '#aed7ff');
        $(this).css({
            'background-color': '#cbfcda',
        })
    });



    $("div.panel-body[id^='bdyPnl'], div.panel-body[id^='FbdyPnl']").
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




    $("span[id^='enb_dis'] input").click(function (e) {
        if (e.currentTarget.checked) {
            var DataUpdated = false;
            var ControlUpdated = false;

            e.currentTarget.parentNode.style.color = "red";
            switch (e.currentTarget.id) {
                case 'chk1':
                    _lq.PropertyColorState("#Call1", "disabled", true, "#a4a3a3");
                    _lq.SelectMenuState("#Station1, #Radio1", "disable");
                    _lq.DataCallInfoDTOs[0].Disabled = true;
                    DataUpdated = true;
                    break;
                case 'chk2':
                    _lq.PropertyColorState("#Call2", "disabled", true, "#a4a3a3");
                    _lq.SelectMenuState("#Station2, #Radio2", "disable");
                    _lq.DataCallInfoDTOs[1].Disabled = true;
                    DataUpdated = true;
                    break;
                case 'chk3':
                    _lq.PropertyColorState("#Call3", "disabled", true, "#a4a3a3");
                    _lq.SelectMenuState("#Station3, #Radio3", "disable");
                    _lq.DataCallInfoDTOs[2].Disabled = true;
                    DataUpdated = true;
                    break;
                case 'filtercatchk':
                    _lq.PropertyColorState("#filtercatchk", "checked", true, "#a4a3a3");
                    _lq.SelectMenuState("Select[id^='Cat']", "disable");
                    _lq.ControlCategorySettingsDto.Disabled = true;
                    _lq.removeTabData('tabs1');
                    _lq.removeTabData('tabs2');
                    _lq.removeTabData('tabs3');
                    ControlUpdated = false;
                    break;
                case 'filterQsochk':
                    _lq.PropertyColorState("#filterQsochk", "checked", true, "#a4a3a3");
                    _lq.SelectMenuState("Select[id^='Filt']", "disable");
                    _lq.ControlFiltersSettingsDto.Disabled = true;
                    ControlUpdated = true;
                    break;

                default:

            }
        } else {
            e.currentTarget.parentNode.style.color = "";
            switch (e.currentTarget.id) {
                case 'chk1':
                    _lq.PropertyColorState("#Call1", "disabled", false, "");
                    _lq.SelectMenuState("#Station1, #Radio1", "enable");
                    _lq.DataCallInfoDTOs[0].Disabled = false;
                    DataUpdated = true;
                    break;
                case 'chk2':
                    _lq.PropertyColorState("#Call2", "disabled", false, "");
                    _lq.SelectMenuState("#Station2, #Radio2", "enable");
                    _lq.DataCallInfoDTOs[1].Disabled = false;
                    DataUpdated = true;
                    break;
                case 'chk3':
                    _lq.PropertyColorState("#Call3", "disabled", false, "");
                    _lq.SelectMenuState("#Station3, #Radio3", "enable");
                    _lq.DataCallInfoDTOs[2].Disabled = false;
                    DataUpdated = true;
                    break;
                case 'filtercatchk':
                    _lq.SelectMenuState("Select[id^='Cat']", "enable");
                    _lq.ControlCategorySettingsDto.Disabled = false;
                    _lq.removeTabData('tabs1');
                    _lq.removeTabData('tabs2');
                    _lq.removeTabData('tabs3');
                    _lq.AdjustControlCategorySettings(_lq.ControlCategorySettingsDto);
                    ControlUpdated = false;
                    break;
                case 'filterQsochk':
                    _lq.SelectMenuState("Select[id^='Filt']", "enable");
                    _lq.ControlFiltersSettingsDto.Disabled = false;
                    _lq.AdjustControlFiltersSettings(_lq.ControlFiltersSettingsDto);
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
            //now update graph
            _lq.UpdateChartData(false);
            _lq.LogUpdateReqd = true;
            _lq.GetContestLogs();

        }


    });


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
                        $(this).selectmenu("option", "width", 65);
                        break
                    case 'FiltContinent':
                        $(this).selectmenu("option", "width", 75);
                        break
                    case 'FiltCountry':
                        $(this).selectmenu("option", "width", 160);
                        break
                    case 'FiltCQZone':
                        $(this).selectmenu("option", "width", 70);
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

    _lq.DataDropdownSelectMenu("Station", 80);
    _lq.DataDropdownSelectMenu("Radio", 60);



    //ElementCount = 5;
    //$("ul[id^='Axis']").css({
    //                'margin-top': -(ElementCount * 25)
    //            });

    //set DDL control change event
    $("select[id ^='Cat'], select[id ^='Filt'], select[id ^='Yaxis'], select[id ^='Xaxis']").
        each(function (indexInArray, valueOfElement) {
            //$(this).on("selectmenuopen", function (event, ui) {
            //    _lq.ChartUpdateReqd == true
            //});
            $(this).on("selectmenuselect", function (event, ui) {
                //FOR SOME REASON ID[0].VALUE DOES not WORK IN CHROME OR FIREFOX for the Yaxisfunction  Menu dropdown values
                //MAYBE IT DOES NOT EXIST, BUT SERVER SIDE DEBUGGING SHOWS "QSO  Rate"
                id = $("#" + ui.item.element[0].parentElement.name + " option:selected");
                if (_lq.ChartUpdateReqd == true && event.key != 'F5') {
                    //wierd bug async called when F5 pushed
                    _lq.ControlUpdated(ui.item.element[0].parentElement.name, id[0].innerHTML, id[0].value);
                }
            })

        });

    //set DDL Data change event
    $("select[id ^='Station'], select[id ^='Radio']").
        each(function (indexInArray, valueOfElement) {
            $(this).on("selectmenuselect", function (event, ui) {
                id = $("#" + ui.item.element[0].parentElement.name + " option:selected");
                if (_lq.ChartUpdateReqd == true) {
                    _lq.DataUpdated(ui.item.element[0].parentElement.name, id[0].innerHTML);
                }
            })

        });



    _lq.getAllData();





    $("button[id^= 'Vid']").on( "click", VidClick );

    function VidClick(e) {
        var modalBox = $(this).attr('data-modal-id');
        var popup = $('#' + modalBox);
        var VidTd;
        switch (this.id) {
            case "Vid_Intro":
                VidTd = "VIntroId";
                break;
            case "Vid_Category":
                VidTd = "VCatId";
                break;
            case "Vid_Filter":
                VidTd = "VFiltId";
                break;
            case "Vid_YAxis":
                VidTd = "VYaxisId";
                break;
            case "Vid_XAxis":
                VidTd = "VXaxisId";
                break;
            case "Vid_Call1":
                VidTd = "VCall1Id";
                break;
            case "Vid_Chart":
                VidTd = "VChartId";
                break;
            case "Vid_Log":
                VidTd = "VLogId";
                break;
            case "Vid_Ubn":
                VidTd = "VUbnId";
                break;
            case "Vid_Up":
                VidTd = "VUpId";
                break;
            default:
                VidTd = "VIntroId";
                break;
        }
        var container = $('#' + modalBox + " div[id=VideoCont]");
        if ($('#' + modalBox + ' div[id=VideoBkgnd').length == 0) { //only add once

            popup.append('<div id="VideoBkgnd"></div>');
            $('#' + modalBox + ' div[id=VideoBkgnd').css("background", "#17212a");

            popup.append('<div id="closer_video">&otimes;</div>');
        }

        var vid = $('#' + modalBox + " video[id=" + VidTd + "]");

        $('#' + modalBox + " div[id=closer_video]").on('click', function () {
            if (vid.paused == true) {
                vid.trigger('pause');
            } else {
                vid.trigger('pause');
                vid.currentTime = 0;
            }
            //$("div[id=closer_video]").off('click');
            popup.hide();
            if (modalBox == "puVidIntro") {

            }
        });



        _lq.parent_modal_box_id = e.currentTarget.id;
        var modalBox = $(this).attr('data-modal-id');
        var popup = $('#' + modalBox)

        popup.show();
        vid.trigger('play');


    };




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
        }).css('width', puwidth + 'px');;
        $("body").append(_lq_appendthis);

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
        puwidth = 580;
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
        var c;
        if (call != '') {
            c = call.charCodeAt(0);//.toString(16);
        } else {
            c = 49;//default to 1st tab
        }
        //set active tab 
        var acttab;
        var actDiv;
        if (c > 48 && c <= 57) {
            acttab = 0;
            actDiv = 'CTab1';
        } else {
            acttab = c - 64;
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
            case 'Call4':
                tdiv = $('div[id=tabs4]');
                tabNo = 'tabs4';
                popupNo = 'popupCall4';
                break;
            default:

        }
        $('#' + popupNo).css({
            top: $("button[id=" + _lq.parent_modal_box_id + "]").offset().top + 20,
            left: newleft
        }).css('width', puwidth + 'px');
        $("body").append(_lq_appendthis);

        $(".modal-overlay").fadeTo(500, 0.7);

        //style popup
        var modalBox = $('#' + popupNo + '');
        var popup = $('#' + popupNo + ' h4');
        if (_lq.parent_modal_box_id == 'Call4') {
            popup.html("Select your Call for the Uploaded csv file ");
        } else {
            popup.html("Select a Call for " + _lq.parent_modal_box_id);
        }
        popup.addClass('lq-popup-hdr');

        tdiv.tabs({
            width: 480,
            height: 150,
            active: acttab,
            create: function (event, ui) {
                _lq.InitTab = ui.tab[0].innerText;
                _lq.LoadInitialCallTab(event, ui);

            },
            activate: function (event, ui) {
                //alert(  ui.newTab.index());
                _lq.LoadCallTab(event, ui);
                //alert(ui.newTab.attr('li', "innerHTML")[0].getElementsByTagName("a")[0].innerHTML);
                //alert( this.text);
            }
        });



        //_lq.LoadInitialCallTab() tab is only called once
        //after this first call, InitTabState is set true.
        //Whenever the call? button is pushed, getAllData will be called if the button call[0] is in the InitTab character range.
        //Without this hack the initTab initial tab is never updated again.
        ////if (_lq.InitTabState == 0) {
        ////    _lq.InitTabState = 1;
        ////} else if (_lq.InitTab == call[0]) {
        ////    _lq.GetCallData(_lq.parent_modal_box_id, null);
        ////} else if (_lq.InitTabState == 2) {
        ////    //value 2 indicates contest changed
        ////    _lq.InitTabState = 1;
        ////    _lq.GetCallData(_lq.parent_modal_box_id, null);
        ////}

        ////var TabdivOl = TabdivOl = $('div[id =' + tabNo + '] div[id=' + actDiv + ']')
        ////if (TabdivOl[0].children.length == 0) {
        ////    var tabChar = call[0];
        ////    _lq.GetCallData(_lq.parent_modal_box_id, tabChar);
        ////}


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
    //    $("body").append( _lq_appendthis);
    //    $(".modal-overlay").fadeTo(500, 0.7);
    //    //$(".js-modalbox").fadeIn(500);
    //    var modalBox = $(this).attr('data-modal-id');
    //    $('#' + modalBox).fadeIn($(this).data());

    //});

    var dataobj = window.sessionStorage.getItem('_lq.DataCallInfoDto4');
    if (dataobj != null) {
        _lq.DataCallInfoDto4 = JSON.parse(dataobj);
        if (_lq.DataCallInfoDto4.SelectedContestName != "") {
            $("button[id='Contest4'] span").text(_lq.DataCallInfoDto4.SelectedContestName);
            if (_lq.DataCallInfoDto4.SelectedCall != "") {
                $("button[id='Call4'] ").text(_lq.DataCallInfoDto4.SelectedCall);
                $("#Call4").button("enable");
                $("#FileInputWT").prop('disabled', false);
            }
        }
    } else {
        _lq.DataCallInfoDto4 = { // for upload controls. Not cached
            CallGroup: 4,
            SelectedContestName: '',
            SelectedCall: '',
            SelectedStationName: '',
            QsoRadioType: '',
            LogId: '',
            Disabled: 0,
            StationNames: '',
            ContestNames: '',
            RadioNames: '',
        };
        window.sessionStorage.setItem('_lq.DataCallInfoDto4', JSON.stringify(_lq.DataCallInfoDto4));
    }


    $('.lq-FileInput').each(function () {
        var $input = $(this),
			$label = $input.next('label'),
			labelVal = $label.html();

        $input.on('change', function (e) {
            var fileName = '';

            if (this.files && this.files.length > 1)
                _lq.fileName = (this.getAttribute('data-multiple-caption') || '').replace('{count}', this.files.length);
            else if (e.target.value)
                _lq.fileName = e.target.value.split('\\').pop();
            //_lq.FiletoUpload = e.originalEvent.currentTarget.files[0];



            if (_lq.fileName) {
                //$label.find('span').html(fileName);
                //$label[0].innerHTML = fileName;
                //&nbsp;Select File to Upload&nbsp;
                var filelbl = $('#FileLabelWT');
                filelbl[0].disabled = false;
                filelbl[0].innerHTML = _lq.fileName;

                $("#UploadWintest")[0].disabled = false;
                $("#FileBlkWT").css({
                    'display': 'inline-block'
                });
                $("#FileStskWT").css({
                    'display': 'none'
                });

            }
            else {
                $label.html(labelVal);
            }
        });
    });

    $("#UploadWintest").click(function () {
        //http://stackoverflow.com/questions/25921941/using-html5-filereader-c-and-jquery-to-upload-file
        var formData = new FormData();
        //formData.append(_lq.FiletoUpload.name, _lq.FiletoUpload);
        _lq.FiletoUpload = $('.lq-FileInput').get(0).files;

        formData.append("UploadInfo", JSON.stringify(_lq.DataCallInfoDto4));
        formData.append("UploadedFile", _lq.FiletoUpload[0]);

        _lq.ajaxHelperNoJsonData(_lq.dataUri + '/UploadWintestFile', 'POST', 'json', false, false, formData, FileUploaded, FileUploadedError);

        // Firefox bug fix
        //$input
        //.on('focus', function () { $input.addClass('has-focus'); })
        //.on('blur', function () { $input.removeClass('has-focus'); });
    });

    FileUploaded = function (responseData, textStatus, jqXHR) {
        if (textStatus == 'success') {
            $('#updateProgressDiv').hide();
            updateProgressDiv.css({
                position: "absolute",
                top: y + "px",
                left: x + "px"
            });

            if (responseData != null) {
                alert(responseData);
                $("#FileStskWT").css({
                    'display': 'inline-block'
                });
                $('#FileSelectedWT')[0].innerHTML = "File Upload Complete";
                $("#UploadWintest")[0].disabled = true;

            }
        } else {
            alert(responseData);
            $('#FileLabelWT')[0].innerHTML = "File Upload Error";
        }
        $("#FileInputWT").prop('disabled', false);

    };
    FileUploadedError = function (responseData, textStatus, errorThrown) {
        if (textStatus == 'error') {
            alert(responseData.responseJSON);
            $('#FileLabelWT')[0].innerHTML = "File Upload Error";
        }
    };

    $(".modal-box").draggable();

    $(".js-modal-close, .modal-overlay").click(function (e) {
        $(this).tooltip();
        $(".modal-box, .modal-overlay").fadeOut(500, function () {
            $(".modal-overlay").remove();
        });
        e.preventDefault(); //keeps window from scrolling to the top
        _lq.parent_modal_box_id = undefined;
        //return false;  //keeps window from scrolling to the top

    });


    $(window).resize(function () {
        var curWidth = $(window).width(); //store the window's current width

        if (_lq.parent_modal_box_id !== undefined && _lq.parent_modal_box_di != null) {
            if (_lq.parent_modal_box_id.indexOf('jqGrid') < 0) {

                parent = $("button[id=" + _lq.parent_modal_box_id + "]");
                if (parent !== undefined && parent !== null) {
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
            }

        }

        //$(".modal-box").css({
        //    top: ($(window).height() - $(".modal-box").outerHeight()) / 2,
        //    left: ($(window).width() - $(".modal-box").outerWidth()) / 2
        //    //top: e.clientY +5,
        //    //left: e.clientX-$(this).width()
        //});
    });




    $("button[id$= 'Dft']").click(function () {
        var ReqUri = "/GetControlSelection/";
        switch (this.id) {
            case "CatDft":
                ReqUri += "ControlCategorySettingsDto";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET', 'json', true, 'application/json', null, ControlCategorySettingsDtoLoad);
                function ControlCategorySettingsDtoLoad(ControlCategorySettingsDto) {
                    _lq.SetControlCategorySettings(ControlCategorySettingsDto, true);
                    _lq.removeTabData('tabs1');
                    _lq.removeTabData('tabs2');
                    _lq.removeTabData('tabs3');
                    _lq.SessionSaveControlSettings();
                    _lq.LogUpdateReqd = false;
                    //_lq.GetContestLogs();

                };
                break;
            case "QsoDft":
                ReqUri += "ControlFiltersSettingsDto";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET', 'json', true, 'application/json', null, SetControlFiltersSettingsDtoLoad);
                function SetControlFiltersSettingsDtoLoad(ControlFiltersSettingsDto) {
                    _lq.SetControlFiltersSettings(ControlFiltersSettingsDto, true);
                    _lq.SessionSaveControlSettings();
                    _lq.LogUpdateReqd = true;
                    _lq.GetContestLogs();
                };
                break;
            case "AxisDft":
                ReqUri += "ControlYaxisSettingsDto";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET', 'json', true, 'application/json', null, ControlYaxisSettingsDtoLoad);
                function ControlYaxisSettingsDtoLoad(ControlYaxisSettingsDto) {
                    _lq.SetControlYaxisSettings(ControlYaxisSettingsDto, true);
                    _lq.SessionSaveControlSettings();
                    _lq.LogUpdateReqd = true;
                    _lq.GetContestLogs();
                };
                break;
            case "XAxisDft":
                ReqUri += "ControlXaxisSettingsDto";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET', 'json', true, 'application/json', null, SetControlXaxisSettingsDtoLoad);
                function SetControlXaxisSettingsDtoLoad(ControlXaxisSettingsDto) {
                    _lq.SetControlXaxisSettings(ControlXaxisSettingsDto, true);
                    _lq.SessionSaveControlSettings();
                    _lq.LogUpdateReqd = true;
                    _lq.GetContestLogs();
                };
                break;
            default:

        }
        _lq.SessionSaveControlSettings();

    })








    $(window).resize();
    document.getElementById("body").style.visibility = "visible";

    $(window).on("resize", function () {
        var $grid = $("#jqGridLog"),
            newWidth = $grid.closest(".ui-jqgrid").parent().width();
        $grid.jqGrid("setGridWidth", newWidth, true);

        $grid = $("#jqGridUBN"),
           newWidth = $grid.closest(".ui-jqgrid").parent().width();
        $grid.jqGrid("setGridWidth", newWidth, true);
    });


});


//END OF $FUNCTION

// encapsuleted _lq class
(function (_lq, $, undefined) {
    _lq.controlUri = '/v1/Control';
    _lq.dataUri = '/v1/Data';
    _lq_appendthis = ("<div class='modal-overlay js-modal-close'></div>");

    _lq.ie11 = 0;
    _lq.parent_modal_box_id;
    _lq.CallReload1 = true;
    _lq.CallReload2 = true;
    _lq.CallReload3 = true;
    _lq.CallReload4 = true;
    _lq.fileName;
    _lq.FiletoUpload;
    _lq.InitTab;
    _lq.InitTabState = 0;
    _lq.ajaxCallCount = 0;
    _lq.ChartUpdateReqd = false;
    _lq.ChartInitialUpdateReqd = true;
    _lq.ChartDataLoaded = false;
    _lq.ChartControlLoaded = false;
    _lq.minWidth = '992px';
    _lq.ActiveView;
    _lq.LogUpdateReqd = true;
    _lq.LogScrollUpdateReqd = true;
    _lq.LogScrollPosition = 0;
    _lq.UbnScrollUpdateReqd = true;
    _lq.UbnScrollPosition = 0;


    _lq.I1Cnt;
    _lq.I2Cnt;
    _lq.I3Cnt;
    //for Zone/prefix switching
    _lq.PZLabel = 'Z';
    _lq.PZName = 'Z';
    _lq.PZLabel1 = 'Z';
    _lq.PZName1 = 'Z1';
    _lq.PZLabel2 = 'Z';
    _lq.PZName2 = 'Z2';
    _lq.PZLabel3 = 'Z';
    _lq.PZName3 = 'Z3';


    _lq.SessionSaveControlSelections;

    _lq.ControlCategorySettingsDto = {
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
        XaxisStarttimeIndex: 1
    };

    _lq.ControlYaxisSettingsDto = {
        YaxisFunction: '',
        YaxisFunctionIndex: 1,
        YaxisInterval: '',
        YaxisViewType: ''
    };

    _lq.ControlSettingsDto = [_lq.ControlCategorySettingsDto, _lq.ControlFiltersSettingsDto, _lq.ControlXaxisSettingsDto, _lq.ControlYaxisSettingsDto];


    _lq.DataCallInfoDto1 = {
        CallGroup: '',
        SelectedContestName: '',
        SelectedCall: '',
        SelectedStationName: '',
        QsoRadioType: '',
        LogId: '',
        Disabled: 0,
        StationNames: [],
        ContestNames: [],
        RadioNames: [],
    };
    _lq.DataCallInfoDto2 = {
        CallGroup: '',
        SelectedContestName: '',
        SelectedCall: '',
        SelectedStationName: '',
        QsoRadioType: '',
        LogId: '',
        Disabled: 0,
        StationNames: [],
        ContestNames: [],
        RadioNames: [],
    };
    _lq.DataCallInfoDto3 = {
        CallGroup: '',
        SelectedContestName: '',
        SelectedCall: '',
        SelectedStationName: '',
        QsoRadioType: '',
        LogId: '',
        Disabled: 0,
        StationNames: [],
        ContestNames: [],
        RadioNames: [],
    };


    _lq.DataCallInfoDTOs = [_lq.DataCallInfoDto1, _lq.DataCallInfoDto2, _lq.DataCallInfoDto3];


    _lq.DataCallInfoDTO = {
        SelectedContestName: '',
        SelectedCall: '',
        SelectedStationName: '',
        CallGroup: '',
        QsoRadioType: '',
        LogId: '',
        Disabled: 0,
        StationNames: '',
        ContestNames: '',
        RadioNames: '',
    };

    _lq.DataCallInfoDto4 = { // for upload controls. Not cached
        CallGroup: 4,
        SelectedContestName: '',
        SelectedCall: '',
        SelectedStationName: '',
        QsoRadioType: '',
        LogId: '',
        Disabled: 0,
        StationNames: '',
        ContestNames: '',
        RadioNames: '',
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

    _lq.LogPageRequestDTO = {
        sidx: '',
        sord: '',
        page: 0,
        rows: 0,
        _search: 0,
    }

    _lq.LogPageDTO = {
        total: '',
        page: '',
        records: '',
        rows: '',
        C1Cnt: 0,
        C2Cnt: 0,
        C3Cnt: 0,

    }

    _lq.QsoInfoRequest = {
        call: '',
        freq: '',
        day: '',
        time: '',
    }

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


    _lq.ajaxHelper = function (uri, method, datatype, processdata, contentType, data, Function) {
        $.ajax({
            type: method,
            url: uri,
            dataType: datatype,
            processData: processdata,
            contentType: contentType,
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


    _lq.ajaxHelperNoJsonData = function (uri, method, datatype, processdata, contentType, data, Function, FunctionError) {
        $.ajax({
            type: method,
            url: uri,
            dataType: datatype,
            processData: processdata,
            contentType: contentType,
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

            data: data,
        })
       .done(Function)
        .error(FunctionError)
        .fail(function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        });

    }


    _lq.LoadCallPopupTabs = function (Tabsel) {
        var tab;
        if (Tabsel == 'All') {
            tab = 'tab';
        } else {
            tab = Tabsel;
        }
        $('div[id^=' + tab + ']').each(function () {
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
        })

    }


    _lq.LoadViewTabs = function (Tabsel) {
        var tab;
        var tdiv;
        if (Tabsel == 'ALL') {
            tab = 'TabViews';
            tdiv = $('div[id=TabViews]');

        } else {
            tab = Tabsel;
        }
        //_lq.ActiveView = $('#TabViewInit')[0].value;

        //$('div[id^=' + tab + ']').each(function () {
        //    var tab = this.id;
        //    var TabUl = $('div[id=' + tab + '] ul');
        //    var DivUl = $('div[id=' + tab + ']');

        //    if ($('div[id=' + tab + '] ul li').length == 0) {

        //        TabUl.append('<li ><a href="#TabViewchart">View Chart</a></li>');
        //        DivUl.append('<div id="TabViewchart"></div>');

        //    }
        //})
        $('div[id^=' + tab + ']').each(function () {
            tdiv.tabs({
                //width: 1170,
                //height: 600,
                active: 0,
                create: function (event, ui) {
                    //_lq.InitTab = ui.tab[0].innerText;
                    _lq.LoadInitialViewTab(event, ui);

                },
                activate: function (event, ui) {
                    _lq.LoadViewTab(event, ui);
                }

            });
            $(this).css({
                //'margin-top': '-20px',
                'padding': '0px',
                'background': '#aed7ff',
            });
        })

        $('#graph').css({
            'margin-top': '-20px',
            'width': '100%'
        });
        $('#graphcon').css({
            'max-width': '100%' // for s2 tablet

        });

        $("#" + tab + " ul.ui-tabs-nav li a").
            each(function (indexInArray, valueOfElement) {
                //console.log(indexInArray + ": " + valueOfElement);
                $(this).addClass('Viewtabs-tab-button');
                $(this).css('padding', '1px 1px 1px 1px');
            });
        $("#" + tab + " ul.ui-tabs-nav li").
         each(function (indexInArray, valueOfElement) {
             $(this).css('margin', '0');
         });

        //get rid of outer padding
        $("div[id = 'TabViews'] div[id^='TabView']").
             each(function (indexInArray, valueOfElement) {
                 //$(this).css('padding', '0');
                 valueOfElement.style.padding = "0px";
             });

        $.jgrid.defaults.responsive = true;
        $.jgrid.defaults.styleUI = 'Bootstrap';
    }

    _lq.LoadInitialViewTab = function (event, ui) {
        var x = 5;

    }


    _lq.LoadViewTab = function (event, ui) {
        //http://stackoverflow.com/questions/300078/jquery-ui-tabs-get-currently-selected-tab-index/12973370#12973370
        //_lq.ActiveView = ui.newTab.index().toString();
        _lq.ActiveView = ui.newTab[0].textContent;
        window.sessionStorage.setItem('_lq.ActiveView', _lq.ActiveView);
        if (ui.newTab[0].textContent == 'Chart') {

            //ui.newPanel[0].innerText = text;
        }
        else {

            //$.jgrid.defaults.width = 900;

            //set to current call
            var dataobj = window.sessionStorage.getItem('_lq.DataCallInfoDTOs');
            if (dataobj != null) {
                _lq.DataCallInfoDTOs = JSON.parse(dataobj);
            }


            //_lq.LogViewDraw();
            var view = ui.newTab[0].textContent;
            if (view == 'Log') {
                _lq.SetLogCallGroupdCalls(_lq.DataCallInfoDTOs, _lq.ActiveView);
                var grid = $("#jqGridLog");
                var newWidth = grid.closest(".ui-jqgrid").parent().width();
                grid.jqGrid("setGridWidth", newWidth, true);

                // var tdiv = $('div[id=TabViews]');
                //var active = tdiv.tabs('option', 'active');
                if (ui.oldTab[0].textContent != 'Log') {
                    if (_lq.LogUpdateReqd == true) {
                        //console.log('_lq.LoadViewTab Log _lq.GetContestLogs() ');
                        _lq.GetContestLogs();
                    } else {
                        //_lq.LogScrollPosition = window.sessionStorage.getItem('_lq.LogScrollPosition');
                        //if (_lq.LogScrollPosition == null) {
                        //    _lq.LogScrollPosition = 0;
                        //}
                        grid.closest(".ui-jqgrid-bdiv").scrollTop(_lq.LogScrollPosition);
                        //grid.trigger("reloadGrid", [{ page: 49 }]);
                    }
                }
            } else if (view == 'UBN') {
                _lq.SetLogCallGroupdCalls(_lq.DataCallInfoDTOs, _lq.ActiveView);
                var grid = $("#jqGridUBN");
                var newWidth = grid.closest(".ui-jqgrid").parent().width();
                grid.jqGrid("setGridWidth", newWidth, true);

                // var tdiv = $('div[id=TabViews]');
                //var active = tdiv.tabs('option', 'active');
                if (ui.oldTab[0].textContent != 'UBN') {
                    if (_lq.LogUpdateReqd == true) {
                        //console.log('_lq.LoadViewTab Ubn _lq.GetContestLogs() ');
                        _lq.GetContestLogs();
                    } else {
                        //_lq.LogScrollPosition = window.sessionStorage.getItem('_lq.LogScrollPosition');
                        //if (_lq.LogScrollPosition == null) {
                        //    _lq.LogScrollPosition = 0;
                        //}
                        //$('.ui-jqgrid .ui-jqgrid-bdiv').css({ 'overflow-y': 'scroll' });

                        //_lq.UBNViewInit();
                        //_lq.SetLogCallGroupdCalls(_lq.DataCallInfoDTOs, 'UBN');
                        //var mq = window.matchMedia("(min-width:" + _lq.minWidth + " )");
                        //WidthChange(mq);  //set grid height after reload
                        //grid.trigger('reloadGrid');

                        //_lq.UBNViewInit();
                        //grid.trigger('reloadGrid');
                        grid.closest(".ui-jqgrid-bdiv").scrollTop(_lq.UbnScrollPosition);

                        //grid.trigger("reloadGrid", [{ page: 49 }]);
                    }
                }
            }
            var mq = window.matchMedia("(min-width:" + _lq.minWidth + " )");
            WidthChange(mq);
            //_lq.LogViewDraw2();

        }

    }


    _lq.TabVieweSelectTab = function () {
        _lq.SetLogCallGroupdCalls(_lq.DataCallInfoDTOs, _lq.ActiveView);

        //http://stackoverflow.com/questions/7244549/jquery-ui-tabs-switching-to-a-new-tab-programatically
        var tdiv = $('div[id=TabViews]');
        //var index = $('#TabViews a:contains("' + _lq.ActiveView + '") ').parent().index();
        var index = $('#TabViews a[href$="' + _lq.ActiveView + '"] ').parent().index();
        tdiv.tabs("option", "active", index.toString());
    }


    _lq.GetContestLogs = function () {
        var grid;
        if (_lq.ActiveView == 'Log') {
            grid = $("#jqGridLog");
        } else if (_lq.ActiveView == 'UBN') {
            grid = $("#jqGridUBN");
        }

        if (grid != undefined) {
            var postDataValues = grid.jqGrid('getGridParam', 'postData');
            _lq.LogPageRequestDTO.page = postDataValues.page;
            _lq.LogPageRequestDTO.sidx = postDataValues.sidx;
            _lq.LogPageRequestDTO.sord = postDataValues.sord;
            _lq.LogPageRequestDTO.rows = postDataValues.rows;
            _lq.LogPageRequestDTO._search = postDataValues._search;
        }

        var dataObj = {
            DataCallInfoDtos: _lq.DataCallInfoDTOs,
            ControlSettingsDto: _lq.ControlSettingsDto = {
                ControlCategorySettingsDto: _lq.ControlCategorySettingsDto,
                ControlFiltersSettingsDto: _lq.ControlFiltersSettingsDto,
                ControlXaxisSettingsDto: _lq.ControlXaxisSettingsDto,
                ControlYaxisSettingsDto: _lq.ControlYaxisSettingsDto
            },
            LogPageRequestDTO: _lq.LogPageRequestDTO,

        }

        _lq.ajaxHelper(_lq.dataUri + '/GetContestLogs', 'POST', 'json', false, 'application/json', dataObj, _lq.LogViewDraw2);

    }


    // media query event handler
    if (matchMedia) {
        var mq = window.matchMedia("(min-width:" + _lq.minWidth + " )");
        mq.addListener(WidthChange);
        WidthChange(mq);
    }

    // media query change
    function WidthChange(mq) {
        if (_lq.ActiveView == 'Log' || _lq.ActiveView == 'UBN') {
            var grid;
            if (_lq.ActiveView == 'Log') {
                grid = $("#jqGridLog");
            } else if (_lq.ActiveView == 'UBN') {
                grid = $("#jqGridUBN");
            }
            if (mq.matches) {
                // window width is at least 500px
                grid.parents('div.ui-jqgrid-bdiv').css("max-height", "388px");
                //$('div[id^= LCall]').
                //        each(function () {
                //            $(this).css(
                //     { "width": "30.0%" });
                //        });
                //grid.jqGrid('showCol', "B1");
                //grid.jqGrid('showCol', "B2");
                //grid.jqGrid('showCol', "B3");
                //var CallW = grid.jqGrid('getColProp', 'I1');
                //var BW = grid.jqGrid('getColProp', 'B1');
                //var newWidth = 35;
                //grid.jqGrid('setColProp', 'I1', { width: newWidth });
                ////grid.jqGrid('setColProp', 'I2', { width: 35 });
                ////grid.jqGrid('setColProp', 'I3', { width: 35 });
            } else {
                // window width is less than 500px
                grid.parents('div.ui-jqgrid-bdiv').css("max-height", "224px");
                //var I = $('div[id^= LCall]').
                //        each(function () {
                //            $(this).css(
                //     { "width": "29.0%" });
                //        });
                //grid.jqGrid('hideCol', "B1");
                //grid.jqGrid('hideCol', "B2");
                //grid.jqGrid('hideCol', "B3");
                //var CallW = grid.jqGrid('getColProp', 'I1');
                //var BW = grid.jqGrid('getColProp', 'B1');
                //var newWidth = 50;
                //grid.jqGrid('setColProp', 'I1', { width: newWidth });
                ////grid.jqGrid('setColProp', 'I2', { width: 50 });
                ////grid.jqGrid('setColProp', 'I3', { width: 50 });
            }
        }

    }


    _lq.SetLogCallGroupdCalls = function (DataCallInfoDTOs, View) {
        var grid = null;
        if (View == 'Log') {
            grid = $('#TabViewLog .jqg-second-row-header th[colspan=6]')
        } else if (View == 'UBN') {
            grid = $('#TabViewUBN .jqg-second-row-header th[colspan=7]')
        }
        if (grid != null) {

            $.each(grid, function (indexInArray, valueOfElement) {
                switch (indexInArray) {
                    case 0:
                        valueOfElement.innerText = DataCallInfoDTOs[0].SelectedCall;
                        break;
                    case 1:
                        valueOfElement.innerText = DataCallInfoDTOs[1].SelectedCall;
                        break;
                    case 2:
                        valueOfElement.innerText = DataCallInfoDTOs[2].SelectedCall;
                        break;
                    default:

                }
            });
        }
    }


    var setSorting = function (colName, sortOrder) {
        var $self = $(this),
            colModel = $self.jqGrid("getGridParam", "colModel"),
            headers = $self[0].grid.headers,
            showSortIconsInAllCols = $self.jqGrid("getGridParam", "viewsortcols")[0],
            cmLength = colModel.length,
            cm,
            $sortSpan,
            i;
        for (i = 0; i < cmLength; i++) {
            cm = colModel[i];
            if (cm.name === colName) {
                cm.lso = String(sortOrder).toLowerCase() === "desc" ? "desc" : "asc";
            }
            $sortSpan = $(headers[i].el).find(">div.ui-jqgrid-sortable>span.s-ico");
            if (showSortIconsInAllCols || cm.lso) {
                $sortSpan.show();
                if (cm.lso) {
                    $sortSpan.find(">span.ui-icon-" + cm.lso)
                        .removeClass("ui-state-disabled");
                }
            }
        }
    };

    _lq.UBNViewInit = function () {
        var grid = $('#jqGridUBN');

        grid.jqGrid({
            //onSelectRow: function (rowid, status, e) {
            //    grid.jqGrid('setSelection', rowid, false);
            //},
            onSortCol: function (index, columnIndex, sortOrder) {
                // when sorting log C or P you need to restore by click to get ubm ubndx to work

                var grid = $('#jqGridUBN');
                //http://stackoverflow.com/questions/25801755/multiple-column-sorting-jqgrid
                var arr = ["U1", "U2", "U3", "B1", "B2", "B3", "N1", "N2", "N3", "D1", "D2", "D3", "X1", "X2", "X3"];
                if ($.inArray(index, arr) != -1) {
                    setSorting.call(grid, index, "asc");
                    setSorting.call(grid, "W", "asc");
                    setSorting.call(grid, "T", "asc");

                    grid.jqGrid("setGridParam", {
                        multiSort: true//,
                        //sortorder: 'asc'//,
                        //sortname: index //+' asc, W asc, T'
                    }).trigger("reloadGrid", [{ current: true }]);
                    //return 'stop';
                } else {

                    grid.jqGrid('setGridParam', {
                        multiSort: false//,
                        //sortorder: 'asc',
                        //sortname: index //'U1 asc, W asc, T'
                    }).trigger('reloadGrid', [{ current: true }]);
                    //return 'stop';//needed to block scroll to top
                }

                //http://stackoverflow.com/questions/5706703/how-to-reload-jquery-grid-keeping-scroll-position-and-collapse-elements-open               //this code is needed because jgqrid always wants to return the grid to the prevoius scroled position
                //every sort click will goto top of grid. The stop  is needed
                _lq.UbnScrollPosition = 0;
                window.sessionStorage.setItem('_lq.UbnScrollPosition', _lq.UbnScrollPosition);
                // _lq.UbnScrollUpdateReqd == true;
                grid.closest(".ui-jqgrid-bdiv").scrollTop(_lq.UbnScrollPosition);
                return 'stop';
            },
            onPaging: function (pgButton) {
                _lq.GetContestLogs();
                return 'stop';
            },
            loadComplete: function () {
                if (grid[0].textContent != "") {
                    _lq.gridHighlight('UBN');
                    var tmp = grid.closest(".ui-jqgrid-bdiv").scrollTop();
                }

            },
            gridComplete: function () {
                if (grid[0].textContent != "") {
                    var tmp = grid.closest(".ui-jqgrid-bdiv").scrollTop();
                    if (_lq.UbnScrollUpdateReqd == true) {
                        _lq.UbnScrollPosition = grid.closest(".ui-jqgrid-bdiv").scrollTop();
                        window.sessionStorage.setItem('_lq.UbnScrollPosition', _lq.UbnScrollPosition);
                    } else {
                        _lq.UbnScrollPosition = window.sessionStorage.getItem('_lq.UbnScrollPosition');
                        grid.closest(".ui-jqgrid-bdiv").scrollTop(_lq.UbnScrollPosition);
                        _lq.UbnScrollUpdateReqd = true;

                    }
                }

                //return 'stop';
            },
            onCellSelect: function (rowId, iCol, content, event) {
                _lq.CellSelect($(this), rowId, iCol, content, event);
            },


            colModel: [
                  {
                      label: 'D',
                      name: 'W',
                      width: 6,
                      align: 'center',
                      title: false,
                      resizable: false  //required for IE11 multiple calls to this init()
                  },

                {
                    label: 'Time',
                    name: 'T',
                    width: 16,
                    cellattr: _lq.cellBrdBlk,
                    align: 'center',
                    title: false,
                    resizable: false
                },
                {
                    label: 'Call',
                    name: 'I1',
                    formatter: _lq.formatCall,
                    cellattr: _lq.cellBrdBlkDbl,
                    width: 34,
                    firstsortorder: 'asc',
                    sorttype: function (cellObj, rowObj) {
                        var grid = $('#jqGridUBN');
                        var sortColumnName = grid.jqGrid('getGridParam', 'sortname');
                        var sortOrder = grid.jqGrid('getGridParam', 'sortorder');
                        if (sortOrder === 'desc') {
                            return ((cellObj === null || cellObj === '') ? '-1000' : cellObj);
                        }
                        else if (sortOrder === 'asc') {
                            return ((cellObj === null || cellObj === '') ? 'zzz50000' : cellObj);
                        }
                    },
                    title: false,
                    resizable: false
                },
                {
                    label: 'Freq',
                    name: 'F1',
                    width: 16,
                    formatter: _lq.formatFreq,
                    cellattr: _lq.cellBrdBrn,
                    align: 'right',
                    sorttype: 'number',
                    firstsortorder: 'asc',
                    title: false,
                    resizable: false
                },
                {
                    label: 'U',
                    name: 'U1',
                    width: 7,
                    formatter: _lq.formatBNTF,
                    cellattr: _lq.cellU,
                    align: 'center',
                    firstsortorder: 'asc', //no good with multiSort
                    sorttype: _lq.SortUBNDXTF,
                    title: false,
                    resizable: false
                },
                 {
                     label: 'B',
                     name: 'B1',
                     width: 7,
                     formatter: _lq.formatBNTF,
                     cellattr: _lq.cellBN,
                     align: 'center',
                     firstsortorder: 'asc',
                     sorttype: _lq.SortUBNDXTF,
                     resizable: false
                 },

                {
                    label: 'N',
                    name: 'N1',
                    width: 7,
                    formatter: _lq.formatBNTF,
                    cellattr: _lq.cellBN,
                    align: 'center',
                    firstsortorder: 'asc',
                    sorttype: _lq.SortUBNDXTF,
                    title: false,
                    resizable: false
                },
                 {
                     label: 'D',
                     name: 'D1',
                     width: 7,
                     formatter: _lq.formatBNTF,
                     cellattr: _lq.cellBN,
                     align: 'center',
                     firstsortorder: 'asc',
                     sorttype: _lq.SortUBNDXTF,
                     title: false,
                     resizable: false
                 },
                  {
                      label: 'X',
                      name: 'X1',
                      width: 7,
                      formatter: _lq.formatBNTF,
                      cellattr: _lq.cellBN,
                      align: 'center',
                      firstsortorder: 'asc',
                      sorttype: _lq.SortUBNDXTF,
                      resizable: false
                  },
               {
                   label: 'Call',
                   name: 'I2',
                   formatter: _lq.formatCall,
                   cellattr: _lq.cellBrdBlkDbl,
                   width: 34,
                   firstsortorder: 'asc',
                   sorttype: function (cellObj, rowObj) {
                       var grid = $('#jqGridUBN');
                       var sortColumnName = grid.jqGrid('getGridParam', 'sortname');
                       var sortOrder = grid.jqGrid('getGridParam', 'sortorder');
                       if (sortOrder === 'desc') {
                           return ((cellObj === null || cellObj === '') ? '-1000' : cellObj);
                       }
                       else if (sortOrder === 'asc') {
                           return ((cellObj === null || cellObj === '') ? 'zzz50000' : cellObj);
                       }
                   },
                   title: false,

                   resizable: false
               },
                {
                    label: 'Freq',
                    name: 'F2',
                    width: 16,
                    formatter: _lq.formatFreq,
                    cellattr: _lq.cellBrdBrn,
                    //formatter: 'number',
                    //formatoptions: { decimalSeparator: ".", thousandsSeparator: "", decimalPlaces: 1, },
                    align: 'right',
                    sorttype: 'number',
                    firstsortorder: 'asc',
                    title: false,
                    resizable: false
                },
                {
                    label: 'U',
                    name: 'U2',
                    width: 7,
                    formatter: _lq.formatBNTF,
                    cellattr: _lq.cellU,
                    align: 'center',
                    firstsortorder: 'asc',
                    sorttype: _lq.SortUBNDXTF,
                    title: false,
                    resizable: false
                },
                 {
                     label: 'B',
                     name: 'B2',
                     width: 7,
                     formatter: _lq.formatBNTF,
                     cellattr: _lq.cellBN,
                     align: 'center',
                     firstsortorder: 'asc',
                     sorttype: _lq.SortUBNDXTF,
                     resizable: false
                 },

                {
                    label: 'N',
                    name: 'N2',
                    width: 7,
                    formatter: _lq.formatBNTF,
                    cellattr: _lq.cellBN,
                    align: 'center',
                    firstsortorder: 'asc',
                    sorttype: _lq.SortUBNDXTF,
                    title: false,
                    resizable: false
                },
                 {
                     label: 'D',
                     name: 'D2',
                     width: 7,
                     formatter: _lq.formatBNTF,
                     cellattr: _lq.cellBN,
                     align: 'center',
                     firstsortorder: 'asc',
                     sorttype: _lq.SortUBNDXTF,
                     title: false,
                     resizable: false
                 },
                  {
                      label: 'X',
                      name: 'X2',
                      width: 7,
                      formatter: _lq.formatBNTF,
                      cellattr: _lq.cellBN,
                      align: 'center',
                      firstsortorder: 'asc',
                      sorttype: _lq.SortUBNDXTF,
                      resizable: false
                  },
                  {
                      label: 'Call',
                      name: 'I3',
                      formatter: _lq.formatCall,
                      cellattr: _lq.cellBrdBlkDbl,
                      width: 34,
                      firstsortorder: 'asc',
                      sorttype: function (cellObj, rowObj) {
                          var grid = $('#jqGridUBN');
                          var sortColumnName = grid.jqGrid('getGridParam', 'sortname');
                          var sortOrder = grid.jqGrid('getGridParam', 'sortorder');
                          if (sortOrder === 'desc') {
                              return ((cellObj === null || cellObj === '') ? '-1000' : cellObj);
                          }
                          else if (sortOrder === 'asc') {
                              return ((cellObj === null || cellObj === '') ? 'zzz50000' : cellObj);
                          }
                      },
                      title: false,

                      resizable: false
                  },
                {
                    label: 'Freq',
                    name: 'F3',
                    width: 16,
                    formatter: _lq.formatFreq,
                    cellattr: _lq.cellBrdBrn,
                    align: 'right',
                    sorttype: 'number',
                    firstsortorder: 'asc',
                    title: false,
                    resizable: false
                },
                {
                    label: 'U',
                    name: 'U3',
                    width: 7,
                    formatter: _lq.formatBNTF,
                    cellattr: _lq.cellU,
                    align: 'center',
                    firstsortorder: 'asc',
                    sorttype: _lq.SortUBNDXTF,
                    title: false,
                    resizable: false
                },
                 {
                     label: 'B',
                     name: 'B3',
                     width: 7,
                     formatter: _lq.formatBNTF,
                     cellattr: _lq.cellBN,
                     align: 'center',
                     firstsortorder: 'asc',
                     sorttype: _lq.SortUBNDXTF,
                     resizable: false
                 },

                {
                    label: 'N',
                    name: 'N3',
                    width: 7,
                    formatter: _lq.formatBNTF,
                    cellattr: _lq.cellBN,
                    align: 'center',
                    firstsortorder: 'asc',
                    title: false,
                    sorttype: _lq.SortUBNDXTF,
                    resizable: false
                },
                 {
                     label: 'D',
                     name: 'D3',
                     width: 7,
                     formatter: _lq.formatBNTF,
                     cellattr: _lq.cellBN,
                     align: 'center',
                     firstsortorder: 'asc',
                     sorttype: _lq.SortUBNDXTF,
                     title: false,
                     resizable: false
                 },
                  {
                      label: 'X',
                      name: 'X3',
                      width: 7,
                      formatter: _lq.formatBNTF,
                      cellattr: _lq.cellBN,
                      align: 'center',
                      firstsortorder: 'asc',
                      sorttype: _lq.SortUBNDXTF,
                      resizable: false
                  }

            ],

            viewrecords: false, // show the current page, data rang and total records on the toolbar
            scroll: true,
            scrollrows: true,
            //scroll: 1,
            //shrinkToFit: true,
            sortorder: 'asc',
            width: '100%',
            height: 388,
            //height: 'auto',
            //loadonce: true,
            rowNum: 19,
            datatype: 'local',
            //data:_lq.mydata,
            pager: "#jqGridUBNPager",
            pgtext: null
            //pgbuttons: true,
            //pginput: true,
            //autowidth: true,
            //height: "auto",
            //caption: "Load live data from stackoverflow"
        });
        //_lq.LogPageInfo.page = 1;
        //_lq.LogPageInfo.


        grid.jqGrid('setLabel', 'W', '', { 'text-align': 'center' },
               { 'title': '1st or 2nd day of contest' });
        grid.jqGrid('setLabel', 'T', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'I1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'I2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'I3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'F1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'F2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'F3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'U1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'U2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'U3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'B1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'B2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'B3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'N1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'N2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'N3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'D1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'D2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'D3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'X1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'X2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'X3', '', { 'text-align': 'center' });


        grid.setGroupHeaders(
               {
                   useColSpanStyle: true,

                   groupHeaders: [
                       { "numberOfColumns": 2, "titleText": "Date", "startColumnName": "W" },
                       { "numberOfColumns": 7, "titleText": "Call1", "startColumnName": "I1" },
                       { "numberOfColumns": 7, "titleText": "Call2", "startColumnName": "I2" },
                       { "numberOfColumns": 7, "titleText": "Call3", "startColumnName": "I3" }]
               });

        $('.jqg-second-row-header th[colspan=7]')
           .each(function (indexInArray, valueOfElement) {
               switch (indexInArray) {
                   case 0:
                       $(this).css(
                       {
                           "background": "blue",
                           "color": "white"
                       });
                       break;
                   case 1:
                       $(this).css(
                       {
                           "background": "#ff6a00",
                           "color": "white"
                       });
                       break;
                   case 2:
                       $(this).css(
                       {
                           "background": "green",
                           "color": "white"
                       });
                       break;
                   default:

               }
           });


        $(".ui-jqgrid-bdiv").each(function () {
            $(this).css( //chrome
                 { "overflow-x": "hidden" });
        });

        grid.closest(".ui-jqgrid-bdiv").scroll(function (e) {
            if (_lq.UbnScrollUpdateReqd == true) {
                _lq.UbnScrollPosition = grid.closest(".ui-jqgrid-bdiv").scrollTop();
                window.sessionStorage.setItem('_lq.UbnScrollPosition', _lq.UbnScrollPosition);
            }
        });

    }



    //LOG View
    _lq.LogViewInit = function () {
        var grid = $('#jqGridLog');

        grid.jqGrid({
            //onSelectRow: function (rowid, status, e) {
            //    grid.jqGrid('setSelection', rowid, false);
            //},
            onSortCol: function (index, columnIndex, sortOrder) {
                // when sorting log C or P you need torestore by click to get ubm ubndx to work

                var grid = $('#jqGridLog');
                //http://stackoverflow.com/questions/25801755/multiple-column-sorting-jqgrid
                var arr = ['C1', 'C2', 'C3', 'Z1', 'Z2', 'Z3', 'P1', 'P2', 'P3'];
                if ($.inArray(index, arr) != -1) {
                    setSorting.call(grid, index, "desc");
                    setSorting.call(grid, "W", "asc");
                    setSorting.call(grid, "T", "asc");
                    grid.jqGrid("setGridParam", {
                        multiSort: true//,
                        //sortorder: 'desc'//,
                        //sortname: index //+' asc, W asc, T'
                    }).trigger("reloadGrid");
                    //return 'stop';
                } else {
                    grid.jqGrid('setGridParam', {
                        multiSort: false//,
                        //sortorder: 'asc',
                        //sortname: index //'U1 asc, W asc, T'
                    }).trigger('reloadGrid');
                    //return 'stop';
                }
                http://stackoverflow.com/questions/5706703/how-to-reload-jquery-grid-keeping-scroll-position-and-collapse-elements-open                //this code is needed because jgqrid always wants to return the grid to the prevoius scroled position
                //every sort click will goto top of grid. The stop  is needed
                    _lq.LogScrollPosition = 0;
                window.sessionStorage.setItem('_lq.LogScrollPosition', _lq.LogScrollPosition);
                // _lq.LogScrollUpdateReqd == true;
                grid.closest(".ui-jqgrid-bdiv").scrollTop(_lq.LogScrollPosition);
                return 'stop';  //needed to block scroll to top
            },
            onPaging: function (pgButton) {
                _lq.GetContestLogs();
                return 'stop';
            },
            loadComplete: function () {
                if (grid[0].textContent != "") {

                    _lq.gridHighlight('Log');
                }
            },
            gridComplete: function () {
                if (grid[0].textContent != "") {
                    if (_lq.LogScrollUpdateReqd == true) {
                        _lq.LogScrollPosition = grid.closest(".ui-jqgrid-bdiv").scrollTop();
                        window.sessionStorage.setItem('_lq.LogScrollPosition', _lq.LogScrollPosition);
                    } else {
                        _lq.LogScrollPosition = window.sessionStorage.getItem('_lq.LogScrollPosition');
                        grid.closest(".ui-jqgrid-bdiv").scrollTop(_lq.LogScrollPosition);
                        _lq.LogScrollUpdateReqd = true;
                    }
                }
                //return 'stop';
            },
            onCellSelect: function (rowId, iCol, content, event) {
                _lq.CellSelect($(this), rowId, iCol, content, event);
            },



            colModel: [
                  {
                      label: 'D',
                      name: 'W',
                      width: 6,
                      align: 'center',
                      title: false,
                      resizable: false  //required for IE11 multiple calls to this init()
                  },

                {
                    label: 'Time',
                    name: 'T',
                    width: 16,
                    cellattr: _lq.cellBrdBlk,
                    align: 'center',
                    title: false,
                    resizable: false
                },
                {
                    label: 'Call',
                    name: 'I1',
                    formatter: _lq.formatCall,
                    cellattr: _lq.cellBrdBlkDbl,
                    width: 34,
                    firstsortorder: 'asc',
                    sorttype: function (cellObj, rowObj) {
                        var grid = $('#jqGridLog');
                        var sortColumnName = grid.jqGrid('getGridParam', 'sortname');
                        var sortOrder = grid.jqGrid('getGridParam', 'sortorder');
                        if (sortOrder === 'desc') {
                            return ((cellObj === null || cellObj === '') ? '-1000' : cellObj);
                        }
                        else if (sortOrder === 'asc') {
                            return ((cellObj === null || cellObj === '') ? 'zzz50000' : cellObj);
                        }
                    },
                    title: false,

                    resizable: false
                },
                {
                    label: 'Freq',
                    name: 'F1',
                    width: 16,
                    formatter: _lq.formatFreq,
                    cellattr: _lq.cellBrdBrn,
                    //formatter:'number',
                    //formatoptions: { decimalSeparator: ".", thousandsSeparator: " ", decimalPlaces: 1 },
                    align: 'right',
                    sorttype: 'number',
                    firstsortorder: 'asc',
                    title: false,
                    resizable: false
                },
                {
                    label: 'C',
                    name: 'C1',
                    width: 7,
                    formatter: _lq.formatTF,
                    cellattr: _lq.cellTF,
                    align: 'center',
                    firstsortorder: 'desc',
                    title: false,
                    resizable: false
                },
                 {
                     label: _lq.PZLabel1,
                     name: _lq.PZName1,
                     width: 7,
                     formatter: _lq.formatTF,
                     cellattr: _lq.cellTF,
                     title: false,
                     align: 'center',
                     resizable: false
                 },

                {
                    label: 'R',
                    name: 'R1',
                    width: 7,
                    formatter: _lq.formatR,
                    cellattr: _lq.cellR,
                    align: 'center',
                    firstsortorder: 'desc',
                    title: false,
                    resizable: false
                },
                 {
                     label: 'Stn',
                     name: 'S1',
                     width: 14,
                     formatter: _lq.formatS,
                     cellattr: _lq.cellS,
                     align: 'left',
                     firstsortorder: 'desc',
                     title: false,
                     resizable: false
                 },
               {
                   label: 'Call',
                   name: 'I2',
                   formatter: _lq.formatCall,
                   cellattr: _lq.cellBrdBlkDbl,
                   width: 34,
                   firstsortorder: 'asc',
                   sorttype: function (cellObj, rowObj) {
                       var grid = $('#jqGridLog');
                       var sortColumnName = grid.jqGrid('getGridParam', 'sortname');
                       var sortOrder = grid.jqGrid('getGridParam', 'sortorder');
                       if (sortOrder === 'desc') {
                           return ((cellObj === null || cellObj === '') ? '-1000' : cellObj);
                       }
                       else if (sortOrder === 'asc') {
                           return ((cellObj === null || cellObj === '') ? 'zzz50000' : cellObj);
                       }
                   },
                   title: false,

                   resizable: false
               },
                {
                    label: 'Freq',
                    name: 'F2',
                    width: 16,
                    formatter: _lq.formatFreq,
                    cellattr: _lq.cellBrdBrn,
                    align: 'right',
                    sorttype: 'number',
                    firstsortorder: 'asc',
                    title: false,
                    resizable: false
                },
                {
                    label: 'C',
                    name: 'C2',
                    width: 7,
                    formatter: _lq.formatTF,
                    cellattr: _lq.cellTF,
                    align: 'center',
                    firstsortorder: 'desc',
                    title: false,
                    resizable: false
                },
                 {
                     label: _lq.PZLabel2,
                     name: _lq.PZName2,
                     width: 7,
                     formatter: _lq.formatTF,
                     cellattr: _lq.cellTF,
                     align: 'center',
                     firstsortorder: 'desc',
                     title: false,
                     resizable: false
                 },
                 {
                     label: 'R',
                     name: 'R2',
                     width: 7,
                     formatter: _lq.formatR,
                     cellattr: _lq.cellR,
                     align: 'center',
                     firstsortorder: 'desc',
                     title: false,
                     resizable: false
                 },
                 {
                     label: 'Stn',
                     name: 'S2',
                     width: 14,
                     formatter: _lq.formatS,
                     cellattr: _lq.cellS,
                     align: 'left',
                     firstsortorder: 'desc',
                     title: false,
                     resizable: false
                 },

                {
                    label: 'Call',
                    name: 'I3',
                    formatter: _lq.formatCall,
                    cellattr: _lq.cellBrdBlkDbl,
                    width: 34,
                    firstsortorder: 'asc',
                    sorttype: function (cellObj, rowObj) {
                        var grid = $('#jqGridLog');
                        var sortColumnName = grid.jqGrid('getGridParam', 'sortname');
                        var sortOrder = grid.jqGrid('getGridParam', 'sortorder');
                        if (sortOrder === 'desc') {
                            return ((cellObj === null || cellObj === '') ? '-1000' : cellObj);
                        }
                        else if (sortOrder === 'asc') {
                            return ((cellObj === null || cellObj === '') ? 'zzz50000' : cellObj);
                        }
                    },
                    title: false,

                    resizable: false
                },
                {
                    label: 'Freq',
                    name: 'F3',
                    width: 16,
                    formatter: _lq.formatFreq,
                    cellattr: _lq.cellBrdBrn,
                    align: 'right',
                    sorttype: 'number',
                    firstsortorder: 'asc',
                    title: false,
                    resizable: false
                },
                {
                    label: 'C',
                    name: 'C3',
                    width: 7,
                    formatter: _lq.formatTF,
                    cellattr: _lq.cellTF,
                    align: 'center',
                    firstsortorder: 'desc',
                    title: false,
                    resizable: false
                },
                 {
                     label: _lq.PZLabel3,
                     name: _lq.PZName3,
                     width: 7,
                     formatter: _lq.formatTF,
                     cellattr: _lq.cellTF,
                     align: 'center',
                     firstsortorder: 'desc',
                     title: false,
                     resizable: false
                 },
                 {
                     label: 'R',
                     name: 'R3',
                     width: 7,
                     formatter: _lq.formatR,
                     cellattr: _lq.cellR,
                     align: 'center',
                     firstsortorder: 'desc',
                     title: false,
                     resizable: false
                 },
                 {
                     label: 'Stn',
                     name: 'S3',
                     width: 14,
                     formatter: _lq.formatS,
                     cellattr: _lq.cellS,
                     align: 'left',
                     firstsortorder: 'desc',
                     title: false,
                     resizable: false
                 },

            ],

            viewrecords: false, // show the current page, data rang and total records on the toolbar
            scroll: true,
            scrollrows: true,
            //scrollTimeout: 100,
            //gridview: true,
            //shrinkToFit: false,
            //loadonce: true,
            //scroll: 1,
            width: '100%',
            height: 388,
            //height: 'auto',
            rowNum: 19,
            datatype: 'local',
            //data:_lq.mydata,
            pager: "#jqGridPager",
            pgtext: null
            //pgbuttons: true,
            //pginput: true,
            //autowidth: true,
            //height: "auto",
            //caption: "Load live data from stackoverflow"
        });
        //_lq.LogPageInfo.page = 1;
        //_lq.LogPageInfo.

        grid.jqGrid('setLabel', 'W', '', { 'text-align': 'center' },
               { 'title': '1st or 2nd day of contest' });
        grid.jqGrid('setLabel', 'T', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'I1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'I2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'I3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'F1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'F2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'F3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'C1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'C2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'C3', '', { 'text-align': 'center' });
        //grid.jqGrid('setLabel', _lq.PZName1, '', { 'text-align': 'center' });
        //grid.jqGrid('setLabel', _lq.PZName2, '', { 'text-align': 'center' });
        //grid.jqGrid('setLabel', _lq.PZName3, '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'Z1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'Z2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'Z3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'P1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'P2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'P3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'R1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'R2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'R3', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'S1', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'S2', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'S3', '', { 'text-align': 'center' });

        grid.setGroupHeaders(
               {
                   useColSpanStyle: true,

                   groupHeaders: [
                       { "numberOfColumns": 2, "titleText": "Date", "startColumnName": "W" },
                       { "numberOfColumns": 6, "titleText": "Call1", "startColumnName": "I1" },
                       { "numberOfColumns": 6, "titleText": "Call2", "startColumnName": "I2" },
                       { "numberOfColumns": 6, "titleText": "Call3", "startColumnName": "I3" }]
               });

        $('.jqg-second-row-header th[colspan=6]')
           .each(function (indexInArray, valueOfElement) {
               switch (indexInArray) {
                   case 0:
                       $(this).css(
                       {
                           "background": "blue",
                           "color": "white"
                       });
                       break;
                   case 1:
                       $(this).css(
                       {
                           "background": "#ff6a00",
                           "color": "white"
                       });
                       break;
                   case 2:
                       $(this).css(
                       {
                           "background": "green",
                           "color": "white"
                       });
                       break;
                   default:

               }
           });


        $(".ui-jqgrid-bdiv").each(function () {
            $(this).css( //chrome
                 { "overflow-x": "hidden" });
        });

        grid.closest(".ui-jqgrid-bdiv").scroll(function (e) {
            //e.preventDefault();;
            //console.log("_lq.LogViewInit scroll");
            if (_lq.LogScrollUpdateReqd == true) {
                _lq.LogScrollPosition = grid.closest(".ui-jqgrid-bdiv").scrollTop();
                window.sessionStorage.setItem('_lq.LogScrollPosition', _lq.LogScrollPosition);
            }
        });

        //uses lodash.js
        //https://css-tricks.com/debouncing-throttling-explained-examples/
        //grid.closest(".ui-jqgrid-bdiv").scroll(function (e) { _.throttle(function () {
        //    if (_lq.LogScrollUpdateReqd == true) {
        //        _lq.LogScrollPosition = grid.closest(".ui-jqgrid-bdiv").scrollTop();
        //        window.sessionStorage.setItem('_lq.LogScrollPosition', _lq.LogScrollPosition);
        //    }
        //}, 10)});

    }


    //Highlight
    _lq.time = '59:59';
    _lq.shade = 'rowchangedOdd';

    _lq.gridHighlight = function (view) {
        var grid;
        if (view == 'Log') {
            grid = $("#jqGridLog tbody tr td[aria-describedby='jqGridLog_T']")
        } else if (view == 'UBN') {
            grid = $("#jqGridUBN tbody tr td[aria-describedby='jqGridUBN_T']")
        }


        $.each(grid, function (indexInArray, valueOfElement) {
            if (valueOfElement.innerText != _lq.time) {
                _lq.time = valueOfElement.innerText;
                if (_lq.shade == 'rowchangedEven') {
                    _lq.shade = 'rowchangedOdd';
                } else {
                    _lq.shade = 'rowchangedEven';
                }
                time = valueOfElement.innerText;
            }
            $(this).parent("tr").addClass(_lq.shade)

        })
        _lq.time = '59:59';
        _lq.shade = 'rowchangedOdd';

    }


    _lq.QsoInit = function () {
        var grid = $('#jqGridQso');

        grid.jqGrid({
            //onSelectRow: function (rowid, status, e) {
            //    grid.jqGrid('setSelection', rowid, false);
            //},
            colModel: [
                        {
                            label: 'D',
                            name: 'W',
                            width: 20,
                            align: 'center',
                            title: false,
                            resizable: false  //required for IE11 multiple calls to this init()
                        },

                        {
                            label: 'Time',
                            name: 'T',
                            width: 48,
                            cellattr: _lq.cellBrdBlk,
                            align: 'center',
                            title: false,
                            resizable: false
                        },
                        {
                            label: 'Call',
                            name: 'I',
                            formatter: _lq.formatCall,
                            cellattr: _lq.cellBrdBlkDbl,
                            width: 93,
                            firstsortorder: 'asc',
                            title: false,
                            resizable: false
                        },
                        {
                            label: 'Freq',
                            name: 'F',
                            width: 48,
                            formatter: _lq.formatFreq,
                            cellattr: _lq.cellBrdBrn,
                            //formatter:'number',
                            //formatoptions: { decimalSeparator: ".", thousandsSeparator: " ", decimalPlaces: 1 },
                            align: 'right',
                            sorttype: 'number',
                            firstsortorder: 'asc',
                            title: false,
                            resizable: false
                        },
                        {
                            label: 'Xchg',
                            name: 'XR',
                            width: 38,
                            cellattr: _lq.cellLogBrdRed,
                            title: false,
                            align: 'right',
                            resizable: false
                        },
                       {
                           label: 'C',
                           name: 'C',
                           width: 20,
                           formatter: _lq.formatTF,
                           cellattr: _lq.cellTF,
                           align: 'center',
                           firstsortorder: 'desc',
                           title: false,
                           resizable: false
                       },
                        //{
                        //    label: _lq.PZLabel,
                        //    name: _lq.PZName,
                        //    width: 20,
                        //    formatter: _lq.formatTF,
                        //    cellattr: _lq.cellTF,
                        //    title: false,
                        //    align: 'center',
                        //    resizable: false
                        //},

                        {
                            label: 'Z',
                            name: 'Z',
                            width: 20,
                            formatter: _lq.formatTF,
                            cellattr: _lq.cellTF,
                            title: false,
                            align: 'center',
                            resizable: false
                        },
                         {
                             label: 'P',
                             name: 'P',
                             width: 20,
                             formatter: _lq.formatTF,
                             cellattr: _lq.cellTF,
                             title: false,
                             align: 'center',
                             resizable: false
                         },
                      {
                          label: 'R',
                          name: 'R',
                          width: 24,
                          formatter: _lq.formatR,
                          cellattr: _lq.cellR,
                          align: 'center',
                          firstsortorder: 'desc',
                          title: false,
                          resizable: false
                      },
                        {
                            label: 'Stn',
                            name: 'S',
                            width: 64,
                            formatter: _lq.formatS,
                            cellattr: _lq.cellS,
                            align: 'left',
                            firstsortorder: 'desc',
                            title: false,
                            resizable: false
                        },
                        {
                            label: 'U',
                            name: 'U',
                            width: 20,
                            formatter: _lq.formatBNTF,
                            cellattr: _lq.cellU,
                            align: 'center',
                            firstsortorder: 'asc', //no good with multiSort
                            sorttype: _lq.SortUBNDXTF,
                            title: false,
                            resizable: false
                        },
                         {
                             label: 'B',
                             name: 'B',
                             width: 20,
                             formatter: _lq.formatBNTF,
                             cellattr: _lq.cellBN,
                             align: 'center',
                             firstsortorder: 'asc',
                             sorttype: _lq.SortUBNDXTF,
                             resizable: false
                         },
                        {
                            label: 'Correct Call',
                            name: 'BC',
                            formatter: _lq.formatCall,
                            cellattr: _lq.cellBrdBlkDbl,
                            width: 93,
                            firstsortorder: 'asc',
                            align: 'left',
                            title: false,
                            resizable: false
                        },

                        {
                            label: 'N',
                            name: 'N',
                            width: 20,
                            formatter: _lq.formatBNTF,
                            cellattr: _lq.cellBN,
                            align: 'center',
                            firstsortorder: 'asc',
                            sorttype: _lq.SortUBNDXTF,
                            title: false,
                            resizable: false
                        },
                         {
                             label: 'D',
                             name: 'D',
                             width: 20,
                             formatter: _lq.formatBNTF,
                             cellattr: _lq.cellBN,
                             align: 'center',
                             firstsortorder: 'asc',
                             sorttype: _lq.SortUBNDXTF,
                             title: false,
                             resizable: false
                         },
                          {
                              label: 'X',
                              name: 'X',
                              width: 20,
                              formatter: _lq.formatBNTF,
                              cellattr: _lq.cellBN,
                              align: 'center',
                              firstsortorder: 'asc',
                              sorttype: _lq.SortUBNDXTF,
                              resizable: false
                          },
                        {
                            label: 'XC',
                            name: 'XC',
                            width: 38,
                            cellattr: _lq.cellLogBrdRed,
                            title: 'Correct Zone',
                            align: 'right',
                            title: false,
                            resizable: false
                        },

            ],

            viewrecords: false, // show the current page, data rang and total records on the toolbar
            scroll: 'false',
            scrollrows: false,
            //scroll: 1,
            width: '592px',
            height: 18,
            //height: 'auto',
            rowNum: 1,
            datatype: 'local',
            //data:_lq.mydata,
            pager: "#jqGridQsoPager",
            pgtext: null
            //pgbuttons: true,
            //pginput: true,
            //autowidth: true,
            //height: "auto",
            //caption: "Load live data from stackoverflow"
        });
        //_lq.LogPageInfo.page = 1;
        //_lq.LogPageInfo.

        grid.jqGrid('setLabel', 'W', '', { 'text-align': 'center' },
               { 'title': '1st or 2nd day of contest' });
        grid.jqGrid('setLabel', 'T', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'I', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'F', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'XR', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'C', '', { 'text-align': 'center' });
        //grid.jqGrid('setLabel', _lq.PZName, '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'Z', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'p', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'R', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'S', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'U', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'B', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'BC', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'N', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'D', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'X', '', { 'text-align': 'center' });
        grid.jqGrid('setLabel', 'XC', '', { 'text-align': 'center' },
               { 'title': 'Correct Zone' });

        //var defaultData = [
        //     {
        //         W: 2, T: "02:28", I: "DL0SQ", F: 14170.1, XR: 1005, C: 1, Z: 0, P: 0, R: "R2", S: "STN2", U: 1, B: 1, BC: "DL0HQ", N: 1, D: 0, X: 1, XC: 1004,
        //     },
        //];


        //var gridArrayData = [];
        //var item = defaultData;
        //gridArrayData.push({
        //    W: item.W,
        //    T: item.T,
        //    I: item.I,
        //    F: item.F,
        //    XR: item.XR,
        //    C: item.C,
        //    Z: item.Z,
        //    P: item.P,
        //    R: item.R,
        //    S: item.S,
        //    U: item.U,
        //    B: item.B,
        //    BC: item.BC,
        //    N: item.N,
        //    D: item.D,
        //    X: item.X,
        //    XC: item.XC,
        //});
        ////}

        //// set the default data
        //grid.jqGrid('setGridParam', { data: gridArrayData });

        $(".ui-jqgrid-bdiv").each(function () {
            $(this).css( //chrome
                 { "overflow-x": "hidden" });
        });


    }


    // _lq.gridHighlight = function () {
    //    var x = $("#jqGridLog tbody tr td[aria-describedby='jqGridLog_T']")
    //        .filter(_lq.filterCells).parent("tr").addClass(_lq.shade);
    //}

    // _lq.filterCells = function (index) {
    //     var result = false;
    //     if ($(this).text() != _lq.time) {
    //         _lq.time = $(this).text();
    //         result = true;
    //     }
    //     return result;
    // }



    _lq.LogViewDraw2 = function (data) {

        var grid = $("#jqGridUBN");
        var gridLog = $('#jqGridLog');

        grid.jqGrid("clearGridData");
        gridLog.jqGrid("clearGridData");

        var reInit = false;
        var test1 = $("button[id='Contest1']  span.ui-button-text ")[0].innerText;

        if (test1.indexOf('wpx') > 0) {
            //prefix column
            if (_lq.PZLabel1 == 'Z') {
                reInit = true; _lq.PZLabel1 = 'P'; _lq.PZName1 = 'P1';
            }

        } else {
            // Zone column
            if (_lq.PZLabel1 == 'P') {
                reInit = true; _lq.PZLabel1 = 'Z'; _lq.PZName1 = 'Z1';
            }
        }

        test1 = $("button[id='Contest2']  span.ui-button-text ")[0].innerText;
        if (test1.indexOf('wpx') > 0) {
            //prefix column
            if (_lq.PZLabel2 == 'Z') {
                reInit = true; _lq.PZLabel2 = 'P'; _lq.PZName2 = 'P2';
            }

        } else {
            // Zone column
            if (_lq.PZLabel2 == 'P') {
                reInit = true; _lq.PZLabel2 = 'Z'; _lq.PZName2 = 'Z2';
            }
        }
        test1 = $("button[id='Contest3']  span.ui-button-text ")[0].innerText;
        if (test1.indexOf('wpx') > 0) {
            //prefix column
            if (_lq.PZLabel3 == 'Z') {
                reInit = true; _lq.PZLabel3 = 'P'; _lq.PZName3 = 'P3';
            }

        } else {
            // Zone column
            if (_lq.PZLabel3 == 'P') {
                reInit = true; _lq.PZLabel3 = 'Z'; _lq.PZName3 = 'Z3';
            }
        }

        if (reInit == true) {
            //grid.jqGrid('destroyGroupHeader');
            // needed for switching P and Z column
            //console.log('_lq.LogViewDraw2 Log reInit ');
            gridLog.jqGrid("GridUnload");
            //grid.jqGrid("GridDestroy");
            //grid.jqGrid('destroyGroupHeader');
            _lq.LogUpdateReqd = true;
            _lq.LogScrollPosition = window.sessionStorage.getItem('_lq.LogScrollPosition');
            if (_lq.LogScrollPosition != null) {
                _lq.LogScrollUpdateReqd = false; //restored pos on refresh
            } else {
                _lq.LogScrollUpdateReqd = true;
                _lq.LogScrollPosition = 0;
            }

            //selects P or Z column
            //cannot use grideCik becauise of 2 level header
            //console.log('_lq.LogViewDraw2 Log reInit LogViewInit()');
            _lq.LogViewInit();
            _lq.SetLogCallGroupdCalls(_lq.DataCallInfoDTOs, 'Log');
            var mq = window.matchMedia("(min-width:" + _lq.minWidth + " )");
            WidthChange(mq);  //set grid height after reload

            //grid = $("#jqGridUBN");
            //disable zone filter if any wpx
            _lq.AdjustControlFiltersSettings(_lq.ControlFiltersSettingsDto);

        } else {
            if (_lq.LogScrollUpdateReqd != false) {
                //reset scroll position if it is not a page refresh
                _lq.LogScrollPosition = 0;
                window.sessionStorage.setItem('_lq.LogScrollPosition', _lq.LogScrollPosition);
                _lq.LogScrollUpdateReqd = false;
            }
        }


        // set the new data
        var save = _lq.ActiveView;
        if (save == 'Log') { //required for non IE
            //chrome firefox do not add scrollbar in trigger('reloadGrid') if jquery-ui is not display:block
            var tab = $("#TabViewUBN")
            tab.css({
                display: 'block',
            });
            //var block = tab.css("display");
            //console.log('_lq.LogViewDraw2 UBN: block style ' + block);
            //console.log('_lq.LogViewDraw2 UBN: visible style ' + tab.css("visibility") );
        }

        grid.jqGrid('setGridParam', { data: data.records });
        //refresh the grid
        grid.trigger('reloadGrid');

        if (save == 'Log') {
            var tab = $("#TabViewUBN")
            tab.css({ display: 'none' });
        }

        _lq.SetLogCallGroupdCalls(_lq.DataCallInfoDTOs, 'UBN');


        //_lq.LogScrollUpdateReqd == false; //use saved


        if (save == 'UBN') {//required for non IE
            var tab = $("#TabViewLog")
            tab.css({
                display: 'block',
            });
        }
        gridLog.jqGrid('setGridParam', { data: data.records });
        gridLog.trigger('reloadGrid');
        //gridLog.jqGrid("gridResize");

        if (save == 'UBN') {
            var tab = $("#TabViewLog")
            tab.css({ display: 'none' });
        }

        //console.log('_lq.LogViewDraw2 Log reload grid');
        //var rowcnt = gridLog.jqGrid("getGridParam", "records");
        //console.log('_lq.LogViewDraw2 Log records ' + rowcnt);

        _lq.SetLogCallGroupdCalls(_lq.DataCallInfoDTOs, 'Log');


        //grid.trigger('reloadGrid', [{current:true}]); 
        _lq.I1Cnt = data.I1Cnt;
        _lq.I2Cnt = data.I2Cnt;
        _lq.I3Cnt = data.I3Cnt;
        var C1Cnt = 0, C2Cnt = 0, C3Cnt = 0;
        var PZ1Cnt = 0, PZ2Cnt = 0, PZ3Cnt = 0;
        var PZ1Lbl = 'Zn', PZ2Lbl = 'Zn', PZ3Lbl = 'Zn';
        var U1Cnt = 0, U2Cnt = 0, U3Cnt = 0;
        var B1Cnt = 0, B2Cnt = 0, B3Cnt = 0;
        var N1Cnt = 0, N2Cnt = 0, N3Cnt = 0;
        var D1Cnt = 0, D2Cnt = 0, D3Cnt = 0;
        var X1Cnt = 0, X2Cnt = 0, X3Cnt = 0;
        for (var i = 0; i < data.records.length; i++) {
            var item = data.records[i];
            if (item.C1 == true) {
                C1Cnt++;
            }
            if (item.C2 == true) {
                C2Cnt++;
            }
            if (item.C3 == true) {
                C3Cnt++;
            }
            if (_lq.PZLabel1 == 'Z') {

                if (item.Z1 == true) {
                    PZ1Cnt++;
                    PZ1Lbl = 'Zn';
                }
            } else {
                if (item.P1 == true) {
                    PZ1Cnt++;
                    PZ1Lbl = 'Pre';
                }
            }

            if (_lq.PZLabel2 == 'Z') {
                if (item.Z2 == true) {
                    PZ2Cnt++;
                    PZ2Lbl = 'Zn';
                }
            } else {
                if (item.P2 == true) {
                    PZ2Cnt++;
                    PZ2Lbl = 'Pre';
                }
            }

            if (_lq.PZLabel3 == 'Z') {
                if (item.Z3 == true) {
                    PZ3Cnt++;
                    PZ3Lbl = 'Zn';
                }
            } else {
                if (item.P3 == true) {
                    PZ3Cnt++;
                    PZ3Lbl = 'Pre';
                }
            }

            if (item.U1 == true) {
                U1Cnt++;
            }
            if (item.U2 == true) {
                U2Cnt++;
            }
            if (item.U3 == true) {
                U3Cnt++;
            }
            if (item.B1 == true) {
                B1Cnt++;
            }
            if (item.B2 == true) {
                B2Cnt++;
            }
            if (item.B3 == true) {
                B3Cnt++;
            }
            if (item.N1 == true) {
                N1Cnt++;
            }
            if (item.N2 == true) {
                N2Cnt++;
            }
            if (item.N3 == true) {
                N3Cnt++;
            }
            if (item.D1 == true) {
                D1Cnt++;
            }
            if (item.D2 == true) {
                D2Cnt++;
            }
            if (item.D3 == true) {
                D3Cnt++;
            }
            if (item.X1 == true) {
                X1Cnt++;
            }
            if (item.X2 == true) {
                X2Cnt++;
            }
            if (item.X3 == true) {
                X3Cnt++;
            }

        }


        //_lq.gridHighlight();
        $('#jqGridUBNPager table.ui-pg-table td[id^=jqGridUBNPager_]').
           each(function (indexInArray, valueOfElement) {
               switch (valueOfElement.id) {
                   case 'jqGridUBNPager_left':
                       valueOfElement.innerHTML = '<span style="float: left;padding-left:30%;color:blue;font-size:.785em">' +
                           /*_lq.DataCallInfoDTOs[0].SelectedCall +*/ 'U:' + U1Cnt.toString() +
                               '&nbsp;&nbsp;B:' + B1Cnt.toString() +
                               '&nbsp;&nbsp;N:' + N1Cnt.toString() +
                               '&nbsp;&nbsp;X:' + X1Cnt.toString() +
                               '&nbsp;&nbsp;&nbsp;D:' + D1Cnt.toString() + ' </span>';
                       break;
                   case 'jqGridUBNPager_center':
                       valueOfElement.innerHTML = '<span style="float: left;padding-left:20%;color:#ff6a00;font-size:.785em">' +
                          /* _lq.DataCallInfoDTOs[1].SelectedCall +*/ 'U:' + U2Cnt.toString() +
                               '&nbsp;&nbsp;B:' + B2Cnt.toString() +
                               '&nbsp;&nbsp;N:' + N2Cnt.toString() +
                               '&nbsp;&nbsp;X:' + X2Cnt.toString() +
                               '&nbsp;&nbsp;&nbsp;D:' + D2Cnt.toString() + ' </span>';
                       break;
                   case 'jqGridUBNPager_right':
                       valueOfElement.innerHTML = '<span style="float: left;padding-left:10%;color:green;font-size:.785em">' +
                               /*_lq.DataCallInfoDTOs[2].SelectedCall +*/ 'U:' + U3Cnt.toString() +
                               '&nbsp;&nbsp;B:' + B3Cnt.toString() +
                               '&nbsp;&nbsp;N:' + N3Cnt.toString() +
                               '&nbsp;&nbsp;X:' + X3Cnt.toString() +
                               '&nbsp;&nbsp;&nbsp;D:' + D3Cnt.toString() + ' </span>';

                       break;
                   default:

               };
           })
        $('#jqGridPager table.ui-pg-table td[id^=jqGridPager_]').
            each(function (indexInArray, valueOfElement) {
                switch (valueOfElement.id) {
                    case 'jqGridPager_left':
                        valueOfElement.innerHTML = '<span style="float: left;padding-left:30%;color:blue;font-size:.785em">' +
                            /*_lq.DataCallInfoDTOs[0].SelectedCall +*/ 'Qso:' + _lq.I1Cnt.toString() +
                                '&nbsp;&nbsp;Cty:' + C1Cnt.toString() +
                                '&nbsp;&nbsp;' + PZ1Lbl + ':' + PZ1Cnt.toString() + ' </span>';
                        break;
                    case 'jqGridPager_center':
                        valueOfElement.innerHTML = '<span style="float: left;padding-left:20%;color:#ff6a00;font-size:.785em">' +
                           /* _lq.DataCallInfoDTOs[1].SelectedCall +*/ 'Qso:' + _lq.I2Cnt.toString() +
                                '&nbsp;&nbsp;Cty:' + C2Cnt.toString() +
                                '&nbsp;&nbsp;' + PZ2Lbl + ':' + PZ2Cnt.toString() + ' </span>';
                        break;
                    case 'jqGridPager_right':
                        valueOfElement.innerHTML = '<span style="float: left;padding-left:10%;color:green;font-size:.785em">' +
                                /*_lq.DataCallInfoDTOs[2].SelectedCall +*/ 'Qso:' + _lq.I3Cnt.toString() +
                                '&nbsp;&nbsp;Cty:' + C3Cnt.toString() +
                                '&nbsp;&nbsp;' + PZ3Lbl + ':' + PZ3Cnt.toString() + ' </span>';

                        break;
                    default:

                };
            })

        $(window).resize();

        _lq.LogUpdateReqd = false;


    }

    //Formatters
    _lq.formatCall = function (cellValue, options, rowObject) {
        if (cellValue != null) {
            if (_lq.ie11 > 0) {
                //ie11 doesnot load ArialSlashZero fontface 
                //see ArialSlashZero font-family.txt
                cellValue = "<span style= 'font-family: ArialSlashZero,  Consolas; font-size:1.1em;' >" + cellValue + "</span>";
            } else {
                cellValue = "<span style= 'font-family: ArialSlashZero;' >" + cellValue + "</span>";
                //cellValue = "<span style= 'font-family: ArialSlashZero,  Consolas; font-size:1.0em;' >" + cellValue + "</span>";
            }
        } else {
            //cellValue = "<span style= 'font-family: ArialSlashZero,  Arial; '>" + cellValue + "</span>";
            cellValue = "";
        }
        return cellValue;

    }

    _lq.formatFreq = function (cellValue, options, rowObject) {
        if (cellValue != null) {
            cellValue = Math.round(cellValue);
        } else {
            cellValue = "";
        }
        return cellValue;

    }


    _lq.formatTF = function (cellValue, options, rowObject) {
        if (cellValue == 1) {
            cellValue = "\u2295";
            // cellValue = "<span style='background: #cff3c1; '></span>"; //+ "<input type ='radio'  checked /></span>";

            //$("#jqGridLog").setCell(options.rowId, options.colModel.Name, '', { 'background': '#ff0000' });
        } else {
            cellValue = "";
        }
        return cellValue;
    };
    _lq.formatR = function (cellValue, options, rowObject) {
        switch (cellValue) {
            case 'Run':
                cellValue = "R";
                break;
            case 'Mult':
                cellValue = "M";
                break;
            case "R1":
                cellValue = "R1";
                break;
            case "R2":
                cellValue = "R2";
                break;
            case "S_P":
                cellValue = "S_P";
                break;
            default:
                cellValue = "";
                break;
        }
        return cellValue;
    };

    _lq.formatS = function (cellValue, options, rowObject) {
        if (cellValue == null) {
            cellValue = "";
        }
        return cellValue;
    };

    _lq.formatUTF = function (cellValue, options, rowObject) {
        if (cellValue == 1) {
            cellValue = "\u2297";
            //cellValue = "<span style='background: #fef90d; '></span>" + "<input type ='radio'  checked /></span>";
            //cellValue = "<style='background-color: #fef90d; '>";// + "<input type ='radio'  checked /></span>";
        } else {
            cellValue = "";
        }
        return cellValue;
    };

    _lq.formatBNTF = function (cellValue, options, rowObject) {
        if (cellValue == 1) {
            cellValue = "\u2297";
            //cellValue = "<span style='background: lightcoral; '></span>";// + "<input type ='radio'  checked /></span>";
        } else {
            cellValue = "";
        }
        return cellValue;
    };

    _lq.cellTF = function (rowid, val, rawObject, cm, rdata) {
        var cellValue;
        var name = cm.name;
        var val = 0;
        switch (cm.name) {
            case 'C1':
                val = rdata.C1;
                break;
            case 'C2':
                val = rdata.C2;
                break;
            case 'C3':
                val = rdata.C3;
                break;
            case 'Z1':
                val = rdata.Z1;
                //Title = rawObject.XC1;
                break;
            case 'Z2':
                val = rdata.Z2;
                break;
            case 'Z3':
                val = rdata.Z3;
                break;
            case 'P1':
                val = rdata.P1;
                break;
            case 'P2':
                val = rdata.P2;
                break;
            case 'P3':
                val = rdata.P3;
                break;
            case 'C':
                val = rdata.C;
                break;
            case 'Z':
                val = rdata.Z;
                break;
            case 'P':
                val = rdata.P;
                break;

            default:

        }
        if (val == 1) {
            cellValue = ' class="lq-LogBrdRed " ' + 'style="background:#cff3c1;"';
        } else {
            cellValue = ' class="lq-LogBrdRed " ';;
        }
        return cellValue;
    };

    _lq.cellLogBrdRed = function (rowid, val, rawObject, cm, rdata) {
        var cellValue;
        return cellValue = ' class="lq-LogBrdRed" ';
    }

    _lq.cellBrdBlkDbl = function (rowid, val, rawObject, cm, rdata) {
        var cellValue;
        return cellValue = ' class="lq-LogVBrdDbl" ';
    }

    _lq.cellBrdBlk = function (rowid, val, rawObject, cm, rdata) {
        var cellValue;
        return cellValue = ' class="lq-LogBrdBlk" ';
    }

    _lq.cellBrdBrn = function (rowid, val, rawObject, cm, rdata) {
        var cellValue;
        return cellValue = ' class="lq-LogBrdBrn" ';
    }

    _lq.cellU = function (rowid, val, rawObject, cm, rdata) {
        var cellValue;
        var name = cm.name;
        var val = 0;
        switch (cm.name) {
            case 'U1':
                val = rdata.U1;
                break;
            case 'U2':
                val = rdata.U2;
                break;
            case 'U3':
                val = rdata.U3;
                break;
            case 'U':
                val = rdata.U;
                break;
            default:

        }
        if (val == 1) {
            cellValue = ' class="lq-LogBrdRed"' + 'style="background:#fef90d;"';
        } else {
            cellValue = ' class="lq-LogBrdRed " ';
        }
        return cellValue;

    }

    _lq.cellBN = function (rowid, val, rawObject, cm, rdata) {
        var cellValue;
        var name = cm.name;
        var val = 0;
        var Title = null;
        switch (cm.name) {
            case 'B1':
                val = rdata.B1;
                Title = rawObject.BC1;
                break;
            case 'B2':
                val = rdata.B2;
                Title = rawObject.BC2;
                break;
            case 'B3':
                val = rdata.B3;
                Title = rawObject.BC3;
                break;
            case 'B':
                val = rdata.B;
                Title = rawObject.BC;
                break;
            case 'N1':
                val = rdata.N1;
                break;
            case 'N2':
                val = rdata.N2;
                break;
            case 'N3':
                val = rdata.N3;
                break;
            case 'N':
                val = rdata.N;
                break;
            case 'D1':
                val = rdata.D1;
                break;
            case 'D2':
                val = rdata.D2;
                break;
            case 'D3':
                val = rdata.D3;
                break;
            case 'D':
                val = rdata.D;
                break;
            case 'X1':
                val = rdata.X1;
                Title = rawObject.XC1;
                break;
            case 'X2':
                val = rdata.X2;
                Title = rawObject.XC2;
                break;
            case 'X3':
                val = rdata.X3;
                Title = rawObject.XC3;
                break;
            case 'X':
                val = rdata.X;
                Title = '';
                break;
            default:

        }
        if (val == 1) {
            if (Title != null) {
                cellValue = 'title= "' + Title + '" class=" lq-LogBrdRed " ' + 'style="background:lightcoral;"';
            } else {
                cellValue = 'title= "" class=" lq-LogBrdRed " ' + 'style="background:lightcoral;"';
            }
        } else {
            cellValue = 'title= "" class="lq-LogBrdRed " ';
        }
        return cellValue;

    }

    _lq.cellR = function (rowid, val, rawObject, cm, rdata) {
        var name = cm.name;
        var cellValue = ' class="lq-LogBrdRed " ';
        if (cm.label == 'R') {
            switch (name) {
                case "R1":
                    switch (rdata.R1) {
                        case 'Run':
                            cellValue += 'style="background:#fcae77;font-size:.643em;"';
                            break;
                        case 'Mult':
                            cellValue += 'style="background:#b18989;font-size:.643em;"';
                            break;
                        case "R1":
                            cellValue += 'style="background:#afd3f7;font-size:.643em;"';
                            break;
                        case "R2":
                            cellValue += 'style="background:#e29efe;font-size:.643em;"';
                            break;
                        case "S_P":
                            cellValue += 'style="background:#fbfb9b;font-size:.643em;"';
                            break;
                        default:
                    }
                    break;
                case "R2":
                    switch (rdata.R2) {
                        case 'Run':
                            cellValue += 'style="background:#fcae77;font-size:.643em;"';
                            break;
                        case 'Mult':
                            cellValue += 'style="background:#b18989;font-size:.643em;"';
                            break;
                        case "R1":
                            cellValue += 'style="background:#afd3f7;font-size:.643em;"';
                            break;
                        case "R2":
                            cellValue += 'style="background:#e29efe;font-size:.643em;"';
                            break;
                        case "S_P":
                            cellValue += 'style="background:#fbfb9b;font-size:.643em;"';
                            break;
                        default:
                    }
                    break;
                case "R3":
                    switch (rdata.R3) {
                        case 'Run':
                            cellValue += 'style="background:#fcae77;font-size:.643em;"';
                            break;
                        case 'Mult':
                            cellValue += 'style="background:#b18989;font-size:.643em;"';
                            break;
                        case "R1":
                            cellValue += 'style="background:#afd3f7;font-size:.643em;"';
                            break;
                        case "R2":
                            cellValue += 'style="background:#e29efe;font-size:.643em;"';
                            break;
                        case "S_P":
                            cellValue += 'style="background:#fbfb9b;font-size:.643em;"';
                            break;
                        default:
                    }
                    break;
                default:
            }
        }
        return cellValue;

    }

    _lq.cellS = function (rowid, val, rawObject, cm, rdata) {
        var cellValue = ' class="lq-LogBrdRed " ';
        switch (cm.name) {
            case "S1":
                cellValue += 'style="font-size:.643em;"';
                break;
            case "S2":
                cellValue += 'style="font-size:.643em;"';
                break;
            case "S3":
                cellValue += 'style="font-size:.643em;"';
                break;
            default:
        }
        return cellValue;

    }

    _lq.SortUBNDXTF = function (cellObj, rowObj) {
        var grid = $('#jqGridLog');
        ///var sortColumnName = grid.jqGrid('getGridParam', 'sortname');
        var sortOrder = grid.jqGrid('getGridParam', 'sortorder');
        if (sortOrder === 'asc') {
            if (cellObj == true) {
                cellObj = false;
            } else {
                cellObj = true;
            }
        } else {
            if (cellObj == false) {
                cellObj = true;
            } else {
                cellObj = true;
            }
        }
        return cellObj;
    }

    _lq.CellSelect = function (obj, rowId, iCol, content, event) {
        //http://stackoverflow.com/questions/27633524/jqgrid-how-to-write-cell-click-event
        var $self = obj, colModel = $self.jqGrid("getGridParam", "colModel");
        //var rowcnt = $self.jqGrid("getGridParam", "reccount");
        var rowData = $self.jqGrid("getRowData", rowId);
        if (content != '') {
            var call = jQuery.parseHTML(content)[0].innerText;

            if (colModel[iCol].label === "Call") {
                _lq.QsoInfoRequest = {
                    call: call,
                    freq: '',
                    day: rowData.W,
                    time: rowData.T,
                }

                switch (colModel[iCol].name) {
                    case 'I1':
                        //var test = _lq.DataCallInfoDTOs[0].SelectedContestName;
                        //alert("OK on " + test + ": " + call);
                        _lq.QsoInfoRequest.freq = rowData.F1;
                        _lq.ShowCallQsoPopup(call, 'Call1', _lq.QsoInfoRequest, rowId, iCol, event);
                        break;
                    case 'I2':
                        _lq.QsoInfoRequest.freq = rowData.F2;
                        _lq.ShowCallQsoPopup(call, 'Call2', _lq.QsoInfoRequest, rowId, iCol, event);
                        break;
                    case 'I3':
                        _lq.QsoInfoRequest.freq = rowData.F3;
                        _lq.ShowCallQsoPopup(call, 'Call3', _lq.QsoInfoRequest, rowId, iCol, event);
                        break;

                    default:
                }

            }
        }
    };


    _lq.LogViewDraw = function () {

        var gridArrayData = [];
        // show loading message
        $("#jqGridLog")[0].grid.beginReq();
        $.ajax({
            url: "http://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=jqgrid&site=stackoverflow",
            success: function (result) {
                for (var i = 0; i < result.items.length; i++) {
                    var item = result.items[i];
                    gridArrayData.push({
                        Title: item.title,
                        Link: item.link,
                        CreationDate: item.creation_date,
                        ViewCount: item.view_count,
                        AnswerCount: item.answer_count
                    });
                }
                // set the new data
                $("#jqGridLog").jqGrid('setGridParam', { data: gridArrayData });
                // hide the show message
                $("#jqGridLog")[0].grid.endReq();
                //refresh the grid
                $("#jqGridLog").trigger('reloadGrid');
            }
        });
        var $grid = $("#jqGridLog"),
        newWidth = $grid.closest(".ui-jqgrid").parent().width();
        $grid.jqGrid("setGridWidth", newWidth, true);

    }

    _lq.formatTitle = function (cellValue, options, rowObject) {
        return cellValue.substring(0, 50) + "...";
    };

    _lq.formatLink = function (cellValue, options, rowObject) {
        return "<a href='" + cellValue + "'>" + cellValue.substring(0, 25) + "..." + "</a>";
    };







    // CONTROL
    _lq.getAllControls = function () {
        _lq.ajaxHelper(_lq.controlUri + "/GetControlNames", 'GET', 'json', true, 'application/json', null, getAllControlsLoad);

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
            if (dataobj != null) {
                SessionSaveControlSettings = JSON.parse(dataobj);
                _lq.SetControlCategorySettings(SessionSaveControlSettings.ControlCategorySettingsDto, false);
                _lq.SetControlFiltersSettings(SessionSaveControlSettings.ControlFiltersSettingsDto, false);
                _lq.SetControlXaxisSettings(SessionSaveControlSettings.ControlXaxisSettingsDto, false);
                _lq.SetControlYaxisSettings(SessionSaveControlSettings.ControlYaxisSettingsDto, false);
                _lq.SessionSaveControlSettings();
                _lq.ChartControlLoaded = true;
                if ((_lq.ChartInitialUpdateReqd == true && _lq.ChartDataLoaded == true && _lq.ChartControlLoaded == true)) {
                    _lq.ChartInitialUpdateReqd = false;
                    _lq.UpdateChartData(false);

                    _lq.TabVieweSelectTab();
                }

                //SetControlDefaults(SessionSaveControlSettings);
            } else {
                _lq.GetControlSelections();
            }
        };

    }

    _lq.GetControlSelections = function () {
        _lq.ajaxHelper(_lq.controlUri + "/GetControlSelections", 'GET', 'json', true, 'application/json', null, GetControlSelectionsLoad);
        function GetControlSelectionsLoad(data) {
            _lq.SetControlCategorySettings(data.ControlCategorySettingsDto, false);
            _lq.SetControlFiltersSettings(data.ControlFiltersSettingsDto, false);
            _lq.SetControlXaxisSettings(data.ControlXaxisSettingsDto, false);
            _lq.SetControlYaxisSettings(data.ControlYaxisSettingsDto, false);

            _lq.SessionSaveControlSettings();
            _lq.ChartControlLoaded = true;
            if ((_lq.ChartInitialUpdateReqd == true && _lq.ChartDataLoaded == true && _lq.ChartControlLoaded == true)) {
                _lq.ChartInitialUpdateReqd = false;
                _lq.UpdateChartData(false);

                _lq.TabVieweSelectTab();
            }
        };
    }



    _lq.ContestSelectHandler = function (event) {
        //alert(event.data.test);
        $('#' + event.data.test + ' span.ui-button-text').text(event.currentTarget.textContent);
        $(".js-modal-close, .modal-overlay").trigger('click');
        //call DDL change event
        //_lq.DataUpdated(event.data.test, event.currentTarget.textContent);
        _lq.PostUpdateContestCall(event.data.test, event.currentTarget.textContent);
    };

    _lq.CallSelectHandler = function (event) {
        //alert(event.data.test);
        $('#' + event.data.test + ' span.ui-button-text').text(event.currentTarget.textContent);
        $(".js-modal-close, .modal-overlay").trigger('click');
        var button = $('button[id=' + event.data.test + ']')[0].innerText = event.currentTarget.textContent;;
        //call DDL change event
        _lq.PostUpdateContestCall(event.data.test, event.currentTarget.textContent);
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
            _lq.removeTabData('tabs1');
            _lq.removeTabData('tabs2');
            _lq.removeTabData('tabs3');
            _lq.AdjustControlCategorySettings(_lq.ControlCategorySettingsDto);
            bUpdated = false; // no server trip

        } else if (Controlid.indexOf("Filt") >= 0) {
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
            _lq.AdjustControlFiltersSettings(_lq.ControlFiltersSettingsDto);
        } else if (Controlid.indexOf("Xaxis") >= 0) {
            switch (Controlid) {
                case "XaxisStarttime":
                    _lq.ControlXaxisSettingsDto.XaxisStarttime = value
                    _lq.ControlXaxisSettingsDto.XaxisStarttimeIndex = $('#XaxisStarttime').prop("selectedIndex");
                    break;
                case "XaxisDuration":
                    _lq.ControlXaxisSettingsDto.XaxisDuration = SelectedValue;
                    break;
                default:

            }
            var save = _lq.ChartUpdateReqd;
            _lq.ChartUpdateReqd = false;//hold off selectmenu chart load
            _lq.AdjustControlXaxisSettings(_lq.ControlXaxisSettingsDto, true);
            _lq.ChartUpdateReqd = save;
        } else if (Controlid.indexOf("Yaxis") >= 0) {
            switch (Controlid) {
                case "YaxisFunction":
                    var val = SelectedValue.replace("&nbsp;&nbsp;", "  ");
                    _lq.ControlYaxisSettingsDto.YaxisFunction = val;
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
            var save = _lq.ChartUpdateReqd;
            _lq.ChartUpdateReqd = false;//hold off selectmenu chart load
            _lq.AdjustControlYaxisSettings(_lq.ControlYaxisSettingsDto, true);
            _lq.ChartUpdateReqd = save;
        }
        else {
            bUpdated = false;
        }
        _lq.LogUpdateReqd = true;

        if (bUpdated) {
            //scroll to top
            if (_lq.LogScrollUpdateReqd == true) {
                _lq.LogScrollPosition = 0;
                window.sessionStorage.setItem('_lq.LogScrollPosition', _lq.LogScrollPosition);
                _lq.LogScrollUpdateReqd = false;  //force stored position
            }

            //scroll Ubn to top
            if (_lq.UbnScrollUpdateReqd == true) {
                _lq.UbnScrollPosition = 0;
                window.sessionStorage.setItem('_lq.UbnScrollPosition', _lq.UbnScrollPosition);
                _lq.UbnScrollUpdateReqd = false;  //force stored position
            }

            _lq.SessionSaveControlSettings();
            _lq.UpdateChartData(false);
            if (_lq.ActiveView == 'Log' || _lq.ActiveView == 'UBN') {
                if (_lq.LogUpdateReqd == true) {
                    _lq.GetContestLogs();
                }
            }

        }
    }

    _lq.AdjustControlCategorySettings = function (ControlCategorySettingsDto) {
        if (ControlCategorySettingsDto.Disabled == false) {
            if (ControlCategorySettingsDto.CatOperator == 'SINGLE-OP') {
                _lq.SelectMenuState("#CatBnd, #CatPower, #CatAssist", "enable");
                _lq.SelectMenuState("#CatTX", "disable");

            } else if (ControlCategorySettingsDto.CatOperator == 'MULTI-OP') {
                _lq.SelectMenuState("#CatBnd, #CatAssist", "disable");
                if (ControlCategorySettingsDto.CatNoOfTx == 'ONE') {
                    _lq.SelectMenuState("#CatPower", "enable");
                } else {
                    _lq.SelectMenuState("#CatPower", "disable");
                }
                _lq.SelectMenuState("#CatTX", "enable");
            }
            else if (ControlCategorySettingsDto.CatOperator == 'CHECKLOG') {
                _lq.SelectMenuState("#CatBnd, #CatPower, #CatAssist, #CatTX", "disable");
            }
            else {
                _lq.SelectMenuState("#CatBnd, #CatPower, #CatAssist, #CatTX", "enable");

            }
        }

    }

    _lq.AdjustControlFiltersSettings = function (ControlFiltersSettingsDto) {
        var NoZone = false;
        //if WPX contest no zone sort
        $("button[id^='Contest']  span.ui-button-text ").each(
           function (indexInArray, valueOfElement) {
               if (valueOfElement.innerText.indexOf('wpx') > 0) {
                   NoZone = true;
                   return false;
               }
           }
        );

        if (ControlFiltersSettingsDto.Disabled == false) {
            _lq.SelectMenuState("#FiltBand, #FiltContinent, #FiltCountry, #FiltCQZone", "enable");
            if (ControlFiltersSettingsDto.FiltContinent != 'ALL') {
                _lq.SelectMenuState("#FiltCountry, #FiltCQZone", "disable");
            }
            if (ControlFiltersSettingsDto.FiltCountryInnerHTML.value.indexOf("ALL&") == -1) {
                _lq.SelectMenuState("#FiltContinent,#FiltCQZone", "disable");
            }
            if (NoZone == true) {
                _lq.SelectMenuState("#FiltCQZone", "disable");
            } else {
                if (ControlFiltersSettingsDto.FiltCQZone != 'ALL') {
                    _lq.SelectMenuState("#FiltCountry, #FiltContinent", "disable");
                }
            }
        }
    }

    _lq.AdjustControlXaxisSettings = function (ControlXaxisSettingsDto, ctlUpdate) {
        var starttime = ControlXaxisSettingsDto.XaxisStarttime;
        var dur = ControlXaxisSettingsDto.XaxisDuration;
        var val = Number(starttime.substring(0, 2));
        var day2;
        if (starttime.indexOf('Day2') != -1) {
            day2 = true;
        }
        if (day2 == true) {
            if (val == 0) {
                if (dur > 24) {
                    dur = '24';
                }
            } else if (val >= 4 && val < 8) {
                if (dur > 20) {
                    dur = '20';
                }
            } else if (val >= 8 && val < 12) {
                if (dur > 16) {
                    dur = '16';
                }
            } else if (val >= 12 && val < 16) {
                if (dur > 12) {
                    dur = '12';
                }
            } else if (val >= 16 && val < 20) {
                if (dur > 8) {
                    dur = '8';
                }
            } else if (val >= 20 && val < 22) {
                if (dur > 4) {
                    dur = '4';
                }
            } else if (val >= 22) {
                if (dur > 2) {
                    dur = '2';
                }
            }
            ControlXaxisSettingsDto.XaxisDuration = dur;
            if (ctlUpdate == true) {
                $select = $('#XaxisDuration').val(ControlXaxisSettingsDto.XaxisDuration);
                $select.selectmenu("refresh");
            }


        }
    }


    _lq.AdjustControlYaxisSettings = function (ControlYaxisSettingsDto, ctlUpdate) {
        var value = ControlYaxisSettingsDto.YaxisFunction;
        if (value.indexOf('Sum') != -1 && ControlYaxisSettingsDto.YaxisViewType == 'Column') {
            ControlYaxisSettingsDto.YaxisViewType = 'Spline';
        } else if (value.indexOf('Sum') == -1 && ControlYaxisSettingsDto.YaxisViewType == 'Spline') {
            ControlYaxisSettingsDto.YaxisViewType = 'Column';
        }
        if (ctlUpdate == true) {
            $select = $('#YaxisViewType').val(ControlYaxisSettingsDto.YaxisViewType);
            $select.selectmenu("refresh");
        }
    }

    _lq.SetControlCategorySettings = function (ControlCategorySettingsDto, bUpdateChart) {
        if (ControlCategorySettingsDto.Disabled) {
            _lq.PropertyColorState("#filtercatchk", "checked", true, "#a4a3a3");
            $("#filtercatchk").prev("label").css(
                 { "color": "red" });
            _lq.SelectMenuState("Select[id^='Cat']", "disable");
            _lq.ControlCategorySettingsDto.Disabled = true;
        } else {
            _lq.PropertyColorState("#filtercatchk", "checked", false, "");
            $("#filtercatchk").prev("label").css(
                { "color": "" });
            _lq.SelectMenuState("Select[id^='Cat']", "enable");
            _lq.ControlCategorySettingsDto.Disabled = false;
            _lq.AdjustControlCategorySettings(ControlCategorySettingsDto);
        }
        var save = _lq.ChartUpdateReqd;
        _lq.ChartUpdateReqd = false;//hold off selectmenu chart load
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

        _lq.ControlCategorySettingsDto = ControlCategorySettingsDto;
        if (bUpdateChart) {
            _lq.UpdateChartData(false);
        }
        _lq.ChartUpdateReqd = save;


    }

    _lq.SetControlFiltersSettings = function (ControlFiltersSettingsDto, bUpdateChart) {
        if (ControlFiltersSettingsDto.Disabled) {
            _lq.PropertyColorState("#filterQsochk", "checked", true, "#a4a3a3");
            $("#filterQsochk").prev("label").css(
                 { "color": "red" });
            _lq.SelectMenuState("Select[id^='Filt']", "disable");
            _lq.ControlFiltersSettingsDto.Disabled = true;
        } else {
            _lq.PropertyColorState("#filterQsochk", "checked", false, "");
            $("#filterQsochk").prev("label").css(
                { "color": "" });
            _lq.SelectMenuState("Select[id^='Filt']", "enable");
            _lq.ControlFiltersSettingsDto.Disabled = false;
            _lq.AdjustControlFiltersSettings(ControlFiltersSettingsDto);
        }
        _lq.ControlFiltersSettingsDto = ControlFiltersSettingsDto;
        var save = _lq.ChartUpdateReqd;
        _lq.ChartUpdateReqd = false;//hold off selectmenu chart load
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



        $select = $('#FiltCQZone').val(ControlFiltersSettingsDto.FiltCQZone, bUpdateChart);
        $select.selectmenu("refresh");

        if (bUpdateChart) {
            _lq.UpdateChartData(false);
        }

        _lq.ChartUpdateReqd = save;

    }


    _lq.SetControlXaxisSettings = function (ControlXaxisSettingsDto, bUpdateChart) {
        var save = _lq.ChartUpdateReqd;
        _lq.ChartUpdateReqd = false;//hold off selectmenu chart load
        _lq.AdjustControlXaxisSettings(ControlXaxisSettingsDto, false);
        $('#XaxisStarttime').prop("selectedIndex", ControlXaxisSettingsDto.XaxisStarttimeIndex).selectmenu('refresh');
        //$select = $('#XaxisStarttime').val(ControlXaxisSettingsDto.XaxisStarttime);
        //$select.selectmenu("refresh");
        $select = $('#XaxisDuration').val(ControlXaxisSettingsDto.XaxisDuration);
        $select.selectmenu("refresh");
        _lq.ControlXaxisSettingsDto = ControlXaxisSettingsDto;
        if (bUpdateChart) {
            _lq.UpdateChartData(false);
        }
        _lq.ChartUpdateReqd = save;

    }


    _lq.SetControlYaxisSettings = function (ControlYaxisSettingsDto, bUpdateChart) {
        var save = _lq.ChartUpdateReqd;
        _lq.ChartUpdateReqd = false;//hold off selectmenu chart load
        _lq.AdjustControlYaxisSettings(ControlYaxisSettingsDto, false);

        $('#YaxisFunction').prop("selectedIndex", ControlYaxisSettingsDto.YaxisFunctionIndex).selectmenu('refresh');
        //$select = $('#YaxisFunction').val(ControlYaxisSettingsDto.YaxisFunction);
        //$select.selectmenu("refresh");
        $select = $('#YaxisInterval').val(ControlYaxisSettingsDto.YaxisInterval);
        $select.selectmenu("refresh");
        $select = $('#YaxisViewType').val(ControlYaxisSettingsDto.YaxisViewType);
        $select.selectmenu("refresh");
        _lq.ControlYaxisSettingsDto = ControlYaxisSettingsDto;
        if (bUpdateChart) {
            _lq.UpdateChartData(false);
        }
        _lq.ChartUpdateReqd = save;

    }




    _lq.PropertyColorState = function (Selector, property, state, color) {
        $(Selector).prop(property, state);
        $(Selector).css("color", color);
    }

    _lq.SelectMenuState = function (Selector, property) {
        $Select = $(Selector);
        $.each($Select, function (indexInArray, valueOfElement) {
            $(this).selectmenu(property);
        });
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

    //    _lq.ajaxHelper(_lq.controlUri + "/SendControlSelections", 'POST','json', true, 'application/json', dataObj, UpdateControlsLoad);
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
        window.sessionStorage.setItem(_lq.SessionSaveControlSelections, JSON.stringify(dataObj));

    }


    //DATA

    _lq.getAllData = function () {
        //check if cached
        dataobj = window.sessionStorage.getItem('_lq.DataCallInfoDTOs');
        if (dataobj != null) {
            _lq.DataCallInfoDTOs = JSON.parse(dataobj);
            _lq.SetCallInfoObjDataSettings(_lq.DataCallInfoDTOs);
        } else {
            _lq.ajaxHelper(_lq.dataUri + "/GetDataCallInfoSelections", 'GET', 'json', true, 'application/json', null, _lq.SetCallInfoObjDataSettings);
        }

    }

    _lq.SetCallInfoObjDataSettings = function (data) {
        if (data.length > 3) {
            //popup dialog selection box, to select whivh saved session
            //noy implemented yet
        } else {
            _lq.SetContestinfo(1, data[0]); //only once for one popup
            for (var i = 0; i < data.length; i++) {

                var CGroup = data[i].CallGroup -1;

                for (var j = 0; j < data[CGroup].ContestNames.length; j++) {
                    _lq.DataCallInfoDTOs[CGroup].ContestNames[j] = data[CGroup].ContestNames[j];
                }
                for (var l = 0; l < data[CGroup].RadioNames.length; l++) {
                    _lq.DataCallInfoDTOs[CGroup].RadioNames[l] = data[CGroup].RadioNames[l];
                }
                for (var k = 0; k < data[CGroup].StationNames.length; k++) {
                    _lq.DataCallInfoDTOs[CGroup].StationNames[k] = data[CGroup].StationNames[k];
                }
                switch (data[i].CallGroup) {
                    case 1:
                        _lq.SetCallinfo(1, data[i]);
                        _lq.SetDataCallInfoDTO(data[i]);
                        break;
                    case 2:
                        _lq.SetCallinfo(2, data[i]);
                        _lq.SetDataCallInfoDTO(data[i]);
                        break;
                    case 3:
                        _lq.SetCallinfo(3, data[i]);
                        _lq.SetDataCallInfoDTO(data[i]);
                        break;
                    default:

                }
            }

        }
        //SetDataSettingsDefaults(data);
        _lq.SessionSaveDataSettings();
        _lq.ChartDataLoaded = true;
        if ((_lq.ChartInitialUpdateReqd == true && _lq.ChartDataLoaded == true && _lq.ChartControlLoaded == true)) {
            _lq.ChartInitialUpdateReqd = false;
            _lq.UpdateChartData(false);

            _lq.TabVieweSelectTab();
        }

    }

    _lq.SetContestinfo = function (index, data) {
        var olWWs = $("div[id= WWssblist] ol.two-col-list")
        var olWWc = $("div[id= WWcwlist] ol.two-col-list")
        var olWPX = $("div[id= WPXlist] ol.two-col-list")
        olWWs.html('');
        olWWc.html('');
        olWPX.html('');
        $.each(data.ContestNames, function (key, val) {
            if (val.value.indexOf('Cqww S') != -1) {
                olWWs.append('<li value = ' + val.key + '>' + val.value + '</li>');
            } else if (val.value.indexOf('Cqww C') != -1) {
                olWWc.append('<li value = ' + val.key + '>' + val.value + '</li>');
            } else if (val.value.indexOf('Cqwpx') != -1) {
                olWPX.append('<li value = ' + val.key + '>' + val.value + '</li>');
            }
        })
    }



    _lq.SetCallinfo = function (index, data) {

        $select = $("div[id^= bdyPnl] #Station" + index)
        $select.html('');
        $.each(data.StationNames, function (key, val) {
            $select.append('<option value = ' + val.value + '>' + val.value + '</option>');
        })

        $select = $("div[id^= bdyPnl] #Radio" + index)
        $select.html('');
        $.each(data.RadioNames, function (key, val) {
            if (val.disabled == false) {
                $select.append('<option value = ' + val.value + '>' + val.value + '</option>');

            } else {
                $select.append('<option value = ' + val.value + ' disabled >' + val.value + '</option>');

            }
        })
    }

    _lq.SetDataCallInfoDTO = function (DataCallInfoObj) {
        if (DataCallInfoObj.CallGroup != 4) { //not upload, not cacbed in LQ
            i = DataCallInfoObj.CallGroup - 1;
            _lq.DataCallInfoDTOs[i].CallGroup = DataCallInfoObj.CallGroup;
            _lq.DataCallInfoDTOs[i].SelectedContestName = DataCallInfoObj.SelectedContestName;
            _lq.DataCallInfoDTOs[i].SelectedCall = DataCallInfoObj.SelectedCall;
            _lq.DataCallInfoDTOs[i].QsoRadioType = DataCallInfoObj.QsoRadioType;
            //_lq.DataCallInfoDTOs[i].SelectedStationName = DataCallInfoObj.SelectedStationName;
            _lq.DataCallInfoDTOs[i].Disabled = DataCallInfoObj.Disabled;
            _lq.DataCallInfoDTOs[i].LogId = DataCallInfoObj.LogId;
        }

        _lq.ChartUpdateReqd = false;
        switch (DataCallInfoObj.CallGroup) {
            case 1:
                //http://stackoverflow.com/questions/5580616/jquery-change-button-text
                $("button[id='Call1'] ").text(DataCallInfoObj.SelectedCall);
                $("button[id='Contest1'] span").text(DataCallInfoObj.SelectedContestName);
                if (DataCallInfoObj.SelectedStationName != null) {
                    $select = $('#Station1').val(DataCallInfoObj.SelectedStationName).selectmenu("refresh");
                    _lq.DataCallInfoDTOs[0].SelectedStationName = DataCallInfoObj.SelectedStationName;
                } else {
                    $select = $('#Station1').val("ALL").selectmenu("refresh");
                    _lq.DataCallInfoDTOs[0].SelectedStationName = "ALL";
                }
                var chk = $("input[id='chk1'] ")
                if (chk.length != 0) {
                    if (DataCallInfoObj.Disabled == true) {
                        chk[0].checked = true;
                    } else {
                        chk[0].checked = false;
                    }
                }
                var bfound = false;
                for (var j = 0; j < DataCallInfoObj.RadioNames.length; j++) {
                    if (DataCallInfoObj.RadioNames[j].key == DataCallInfoObj.QsoRadioType) {
                        bfound = true;
                        break;
                    }
                }
                if (bfound == true) {
                    $select = $('#Radio1').val(DataCallInfoObj.RadioNames[j].value).selectmenu("refresh");
                    //$select = $('#Radio1').prop("selectedIndex", DataCallInfoObj.QsoRadioType).selectmenu('refresh');
                    //$select = $('#Call1').val(DataCallInfoObj.SelectedCall).selectmenu("refresh");
                    //_lq.DataCallInfoDTOs.SelectedCall = DataCallInfoObj.SelectedCall;
                } else {
                    $select = $('#Radio1').val("ALL").selectmenu("refresh");
                }

                break;
            case 2:
                //http://stackoverflow.com/questions/5580616/jquery-change-button-text
                $("button[id='Call2'] ").text(DataCallInfoObj.SelectedCall);
                $("button[id='Contest2'] span").text(DataCallInfoObj.SelectedContestName);
                if (DataCallInfoObj.SelectedStationName != null) {
                    $select = $('#Station2').val(DataCallInfoObj.SelectedStationName).selectmenu("refresh");
                    _lq.DataCallInfoDTOs[1].SelectedStationName = DataCallInfoObj.SelectedStationName;
                } else {
                    $select = $('#Station2').val("ALL").selectmenu("refresh");
                    _lq.DataCallInfoDTOs[1].SelectedStationName = DataCallInfoObj.SelectedStationName;
                }
                var chk = $("input[id='chk2'] ")
                if (chk.length != 0) {
                    if (DataCallInfoObj.Disabled == true) {
                        chk[0].checked = true;
                    } else {
                        chk[0].checked = false;
                    }
                }
                var bfound = false;
                for (var j = 0; j < DataCallInfoObj.RadioNames.length; j++) {
                    if (DataCallInfoObj.RadioNames[j].key == DataCallInfoObj.QsoRadioType) {
                        bfound = true;
                        break;
                    }
                }
                if (bfound == true) {
                    $select = $('#Radio2').val(DataCallInfoObj.RadioNames[j].value).selectmenu("refresh");
                } else {
                    $select = $('#Radio2').val("ALL").selectmenu("refresh");
                }
                break;
            case 3:
                //http://stackoverflow.com/questions/5580616/jquery-change-button-text
                $("button[id='Call3'] ").text(DataCallInfoObj.SelectedCall);
                $("button[id='Contest3'] span").text(DataCallInfoObj.SelectedContestName);
                if (DataCallInfoObj.SelectedStationName != null) {
                    $select = $('#Station3').val(DataCallInfoObj.SelectedStationName).selectmenu("refresh");
                    _lq.DataCallInfoDTOs[2].SelectedStationName = DataCallInfoObj.SelectedStationName;
                } else {
                    $select = $('#Station3').val("ALL").selectmenu("refresh");
                    _lq.DataCallInfoDTOs[2].SelectedStationName = DataCallInfoObj.SelectedStationName;
                }
                var chk = $("input[id='chk3'] ")
                if (chk.length != 0) {
                    if (DataCallInfoObj.Disabled == true) {
                        chk[0].checked = true;
                    } else {
                        chk[0].checked = false;
                    }
                }
                var bfound = false;
                for (var j = 0; j < DataCallInfoObj.RadioNames.length; j++) {
                    if (DataCallInfoObj.RadioNames[j].key == DataCallInfoObj.QsoRadioType) {
                        bfound = true;
                        break;
                    }
                }
                if (bfound == true) {
                    $select = $('#Radio3').val(DataCallInfoObj.RadioNames[j].value).selectmenu("refresh");
                } else {
                    $select = $('#Radio3').val("ALL").selectmenu("refresh");
                }
                break;
            case 4:
                //http://stackoverflow.com/questions/5580616/jquery-change-button-text
                $("button[id='Call4'] ").text(DataCallInfoObj.SelectedCall);
                $("button[id='Contest4'] span").text(DataCallInfoObj.SelectedContestName);
                break;
            default:

        }
        _lq.ChartUpdateReqd = true;


    }



    //function for Call info if Contest or Call Changes
    _lq.PostUpdateContestCall = function (Controlid, SelectedValue) {
        if (Controlid.indexOf("Contest") >= 0 || Controlid.indexOf("Call") >= 0) {
            var tabNo;
            var actDiv;
            var DataCallInfoDto1;
            switch (Controlid) {
                case "Contest1":
                    _lq.DataCallInfoDTOs[0].SelectedContestName = SelectedValue;
                    DataCallInfoDto1 = _lq.DataCallInfoDTOs[0];
                    //remove tab Ol
                    tabNo = 'tabs1';
                    //actDiv = 'CTab' + $('button[id=Call1]')[0].innerText[0];
                    break;
                case "Contest2":
                    _lq.DataCallInfoDTOs[1].SelectedContestName = SelectedValue;
                    DataCallInfoDto1 = _lq.DataCallInfoDTOs[1];
                    tabNo = 'tabs2';
                    //actDiv = 'CTab' + $('button[id=Call2]')[0].innerText[0];
                    break;
                case "Contest3":
                    _lq.DataCallInfoDTOs[2].SelectedContestName = SelectedValue;
                    DataCallInfoDto1 = _lq.DataCallInfoDTOs[2];
                    tabNo = 'tabs3';
                    //actDiv = 'CTab' + $('button[id=Call3]')[0].innerText[0];
                    break;
                case "Contest4":
                    _lq.DataCallInfoDto4.SelectedContestName = SelectedValue;
                    DataCallInfoDto1 = _lq.DataCallInfoDto4;
                    tabNo = 'tabs4';
                    $("#Call4").button("enable");
                    break;
                case "Call1":
                    _lq.DataCallInfoDTOs[0].SelectedCall = SelectedValue;
                    DataCallInfoDto1 = _lq.DataCallInfoDTOs[0];
                    //remove tab Ol
                    tabNo = 'tabs1';
                    //actDiv = 'CTab' + $('button[id=Call1]')[0].innerText[0];
                    break;
                case "Call2":
                    _lq.DataCallInfoDTOs[1].SelectedCall = SelectedValue;
                    DataCallInfoDto1 = _lq.DataCallInfoDTOs[1];
                    tabNo = 'tabs2';
                    // actDiv = 'CTab' + $('button[id=Call2]')[0].innerText[0];
                    break;
                case "Call3":
                    _lq.DataCallInfoDTOs[2].SelectedCall = SelectedValue;
                    DataCallInfoDto1 = _lq.DataCallInfoDTOs[2];
                    tabNo = 'tabs3';
                    //actDiv = 'CTab' + $('button[id=Call3]')[0].innerText[0];
                    break;
                case "Call4":
                    _lq.DataCallInfoDto4.SelectedCall = SelectedValue;
                    DataCallInfoDto1 = _lq.DataCallInfoDto4;
                    tabNo = 'tabs4';
                    var File = $("#FileInputWT");
                    $("#FileInputWT").prop('disabled', false);

                    //actDiv = 'CTab' + $('button[id=Call3]')[0].innerText[0];
                    break;
                default:
                    break;
            }

            var dataObj = DataCallInfoDto1;
            _lq.LogUpdateReqd = true;


            _lq.ajaxHelper(_lq.dataUri + "/GetUpdatedContestCall", 'POST', 'json', false, 'application/json', dataObj, _lq.UpdateContestCall);

            _lq.removeTabData(tabNo);
        }
    }

    _lq.UpdateContestCall = function (DataCallInfoDto) {
        var bUpdateChart = true;
        var CGroup = DataCallInfoDto.CallGroup - 1;
        for (var j = 0; j < DataCallInfoDto.ContestNames.length; j++) {
            _lq.DataCallInfoDTOs[CGroup].ContestNames[j] = DataCallInfoDto.ContestNames[j];
        }
        for (var l = 0; l < DataCallInfoDto.RadioNames.length; l++) {
            _lq.DataCallInfoDTOs[CGroup].RadioNames[l] = DataCallInfoDto.RadioNames[l];
        }
        for (var k = 0; k < DataCallInfoDto.StationNames.length; k++) {
            _lq.DataCallInfoDTOs[CGroup].StationNames[k] = DataCallInfoDto.StationNames[k];
        }

        switch (DataCallInfoDto.CallGroup) {
            case 1:
                _lq.SetCallinfo(1, DataCallInfoDto);
                _lq.SetDataCallInfoDTO(DataCallInfoDto);
                break;
            case 2:
                _lq.SetCallinfo(2, DataCallInfoDto);
                _lq.SetDataCallInfoDTO(DataCallInfoDto);
                break;
            case 3:
                _lq.SetCallinfo(3, DataCallInfoDto);
                _lq.SetDataCallInfoDTO(DataCallInfoDto);
                break;
            case 4:
                _lq.DataCallInfoDto4 = DataCallInfoDto;
                _lq.SetDataCallInfoDTO(DataCallInfoDto);
                window.sessionStorage.removeItem('_lq.DataCallInfoDto4');
                window.sessionStorage.setItem('_lq.DataCallInfoDto4', JSON.stringify(_lq.DataCallInfoDto4));
                bUpdateChart = false;
                break;
            default:

        }
        if (bUpdateChart == true) {

            //SetDataSettingsDefaults(data);
            _lq.SessionSaveDataSettings();

            //now update graph
            _lq.UpdateChartData(false);
            if (_lq.ActiveView == "UBN" || (_lq.ActiveView == "Log")) {
                if (_lq.LogUpdateReqd == true) {
                    _lq.GetContestLogs();
                } else {
                    _lq.SetLogCallGroupdCalls(_lq.DataCallInfoDTOs, _lq.ActiveView);
                }
            }
        }


    }

    _lq.LoadInitialCallTab = function (event, ui) {
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

    _lq.LoadCallTab = function (event, ui) {
        //function _lq.LoadCallTab(actDiv, Callgroup) {
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
                break;
            case 'Call3':
                if (_lq.CallReload3 == true) {
                    ReloadCalltab = true;
                }
                break;
            case 'Call4':
                if (_lq.CallReload4 == true) {
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



    //function for updating graph POST
    _lq.DataUpdated = function (Controlid, SelectedValue) {
        //alert("Control: " + Controlid + "-->Selected:" + SelectedValue);
        var bUpdated = true;
        if (Controlid.indexOf("Station") >= 0) {
            switch (Controlid) {
                case "Station1":
                    _lq.DataCallInfoDTOs[0].SelectedStationName = SelectedValue;
                    break;
                case "Station2":
                    _lq.DataCallInfoDTOs[1].SelectedStationName = SelectedValue;
                    break;
                case "Station3":
                    _lq.DataCallInfoDTOs[2].SelectedStationName = SelectedValue;
                    break;
                default:
                    break;
            }
            _lq.LogUpdateReqd = true;

        } else if (Controlid.indexOf("Radio") >= 0) {
            switch (Controlid) {
                case "Radio1":
                    _lq.DataCallInfoDTOs[0].QsoRadioType = SelectedValue;
                    break;
                case "Radio2":
                    _lq.DataCallInfoDTOs[1].QsoRadioType = SelectedValue;
                    break;
                case "Radio3":
                    _lq.DataCallInfoDTOs[2].QsoRadioType = SelectedValue;
                    break;
                default:
                    break;
            }
            _lq.LogUpdateReqd = true;
        } else if (Controlid.indexOf("Contest") >= 0) {
            var tabNo;
            var actDiv;
            switch (Controlid) {
                case "Contest1":
                    _lq.DataCallInfoDTOs[0].SelectedContestName = SelectedValue;
                    //remove tab Ol
                    tabNo = 'tabs1';
                    actDiv = 'CTab' + $('button[id=Call1]')[0].innerText[0];
                    _lq.CallReload1 = true;
                    break;
                case "Contest2":
                    _lq.DataCallInfoDTOs[1].SelectedContestName = SelectedValue;
                    tabNo = 'tabs2';
                    actDiv = 'CTab' + $('button[id=Call2]')[0].innerText[0];
                    _lq.CallReload2 = true;
                    break;
                case "Contest3":
                    _lq.DataCallInfoDTOs[2].SelectedContestName = SelectedValue;
                    tabNo = 'tabs3';
                    actDiv = 'CTab' + $('button[id=Call3]')[0].innerText[0];
                    _lq.CallReload3 = true;
                    break;
                default:
                    break;
            }
            ////$('div[id =' + tabNo + '] div[id=' + actDiv + ']')
            ////.each(function (indexInArray, valueOfElement) {
            ////    $(this).empty();
            ////});

            _lq.removeTabData(tabNo);

        }
        else if (Controlid.indexOf("Call") >= 0) {
            switch (Controlid) {
                case "Call1":
                    _lq.DataCallInfoDTOs[0].SelectedCall = SelectedValue;
                    break;
                case "Call2":
                    _lq.DataCallInfoDTOs[1].SelectedCall = SelectedValue;
                    break;
                case "Call3":
                    _lq.DataCallInfoDTOs[2].SelectedCall = SelectedValue;
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
            if (_lq.ActiveView == "Log" || _lq.ActiveView == "UBN") {
                if (_lq.LogUpdateReqd == true) {
                    _lq.GetContestLogs();
                }
            }
        }
    }

    _lq.removeTabData = function (tabNo) {
        var seltab = $('div[id=' + tabNo + ']');
        if (seltab.tabs("instance") != undefined) {
            seltab.tabs("destroy");
            //empty all ol
            var TabClrOl = $('div[id =' + tabNo + ']  ol ')
                .each(function (indexInArray, valueOfElement) {
                    $(this).remove();
                });
            //_lq.LoadCallPopupTabs(tabNo);

        }
    }


    _lq.UpdateChartData = function (save) {
        if (save == true) {
            _lq.SessionSaveDataSettings();
        }

        var dataObj = {
            DataCallInfoDto: _lq.DataCallInfoDTOs,
            ControlSettingsDto: _lq.ControlSettingsDto = {
                force: false,
                ControlCategorySettingsDto: _lq.ControlCategorySettingsDto,
                ControlFiltersSettingsDto: _lq.ControlFiltersSettingsDto,
                ControlXaxisSettingsDto: _lq.ControlXaxisSettingsDto,
                ControlYaxisSettingsDto: _lq.ControlYaxisSettingsDto
            }
        };
        _lq.ajaxHelper(_lq.dataUri + "/UpdateChart", 'POST', 'binary', false, 'application/json', dataObj, _lq.UpdateChartLoad);
    }

    _lq.UpdateChartLoad = function (data) {
        //http://stackoverflow.com/questions/23851685/webapi-return-binary-image-to-be-displayed-using-jquery-ajax-method
        $('#ChartRate').attr('src', window.URL.createObjectURL(data));
    }


    _lq.SessionSaveDataSettings = function () {
        var dataObj = _lq.DataCallInfoDTOs;
        window.sessionStorage.removeItem('_lq.DataCallInfoDTOs');
        window.sessionStorage.setItem('_lq.DataCallInfoDTOs', JSON.stringify(dataObj));

    }

    _lq.DataDropdownSelectMenu = function (control) {
        var width;
        switch (control) {
            case "Station":
                width = 80;
                break;
            case "Radio":
                width = 60;
                break;
            default:

        }
        $("select[name^='" + control + "']").selectmenu().
        each(function (indexInArray, valueOfElement) {
            $(this).selectmenu('menuWidget').addClass('lq-dropdwn');
            $(this).selectmenu("option", "width", width);
            $(this).selectmenu('widget').addClass('lq-dropdwn');

        });
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
            case 'Call4':
                CallIndex = 3;
                _lq.CallReload4 = false;
                break;
            default:

        }

        var DataCallInfoDto0;
        if (CallIndex != 3) {

            DataCallInfoDto0 = _lq.DataCallInfoDTOs[CallIndex];
            if (SelectedTabName == null) {
                if (DataCallInfoDto0.SelectedCall == "") {
                    SelectedTabName = "1";
                } else {
                    SelectedTabName = DataCallInfoDto0.SelectedCall;
                }
            }
        } else { //for upload tab
            DataCallInfoDto0 = _lq.DataCallInfoDto4;
            if (SelectedTabName == null) {
                if (DataCallInfoDto0.SelectedCall == "") {
                    SelectedTabName = "1";
                } else {
                    SelectedTabName = DataCallInfoDto0.SelectedCall;
                }
            }

        }

        var dataObj = {
            DataCallInfoDto: DataCallInfoDto0,
            ControlCategorySettingsDTO: _lq.ControlCategorySettingsDto,
            CallTab: SelectedTabName
        }

        //_lq.ajaxHelper(_lq.dataUri + '/PostCallsRequest', 'POST', 'json', false, 'application/json', _lq.ControlCategorySettingsDto, _lq.UpdateCallTab);
        //_lq.ajaxHelper(_lq.dataUri + '/PostDataCallsRequest', 'POST', 'json', false, 'application/json', _lq.DataCallInfoDTOs[CallIndex], _lq.UpdateCallTab);
        _lq.ajaxHelper(_lq.dataUri + '/CallsRequest', 'POST', 'json', false, 'application/json', dataObj, _lq.UpdateCallTab);

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
            case 4:
                tabNo = 'tabs4';
                break;
            default:

        }

        //set active tab 
        var c = data.SelectedCall.charCodeAt(0);//.toString(16);
        var actDiv;
        if (c > 48 && c <= 57) {
            actDiv = 'CTab1'
        } else {
            actDiv = 'CTab' + data.SelectedCall.substring(0, 1);
        }



        var Tabdiv = $('div[id =' + tabNo + '] div[id=' + actDiv + ']')
        Tabdiv.addClass('TabDivLiCol');
        var list = "list" + actDiv;


        //Vertical LIST
        var i, k;
        var colLiCnt;
        var columnCnt = 5;
        if (data.Calls != null) {

            var TotalCalls = data.Calls.length;
            if (TotalCalls > 5) {
                colLiCnt = Math.ceil(TotalCalls / columnCnt);
            } else {
                colLiCnt = TotalCalls;
            }
            var colWidth = Math.floor(100 / columnCnt) + "%";
            var CallIndex = 0;
            var column = 1;

            ////empty previous calls
            //var TabClrOl = $('div[id =' + tabNo + '] ol[id^=' + list + ']')
            //    .each(function (indexInArray, valueOfElement) {
            //        $(this).empty();
            //    });
            ////empty div
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
        }

    };

    //get calls
    _lq.GetQsoData = function (QsoInfo, CallGroup) {
        var CallIndex;
        switch (CallGroup) {
            case 'Call1':
                CallIndex = 0;
                break;
            case 'Call2':
                CallIndex = 1;
                break;
            case 'Call3':
                CallIndex = 2;
                break;
            default:

        }

        var DataCallInfoDto0 = _lq.DataCallInfoDTOs[CallIndex];
        if (_lq.DataCallInfoDTOs[CallIndex].SelectedContestName.indexOf('wpx') > 0) {
            //prefix column
            if (_lq.PZLabel == 'Z') {
                _lq.PZLabel = 'P'; _lq.PZName = 'P';
            }
        } else {
            // Zone column
            if (_lq.PZLabel == 'P') {
                _lq.PZLabel = 'Z'; _lq.PZName = 'Z';
            }
        }

        var dataObj = {
            DataCallInfoDto: DataCallInfoDto0,
            //ControlSettingsDto: _lq.ControlSettingsDto,
            QsoInfoRequest: QsoInfo
        }


        _lq.ajaxHelper(_lq.dataUri + '/GetQsoInfoRequest', 'POST', 'json', false, 'application/json', dataObj, _lq.UpdateQsoGrid);
        return _lq.DataCallInfoDTOs[CallIndex].SelectedCall;
    };

    //TEST DATA
    _lq.mydata = [
         {
             W: 2, T: "02:28", I: "DL0SQ", F: 14170.1, XR: 1005, C: 1, Z: 0, P: 0, R: "R2", S: "STN2", U: 1, B: 1, BC: "DL0HQ", N: 1, D: 0, X: 1, XC: 1004,
         },
         //{
         //    D: "1", Time: "00:00", Call1: "F6ARC", Freq1: "14171", C1: "0", Z1: "1",
         //},

    ];

    _lq.UpdateQsoGrid = function (dataobj) {
        var gridArrayData = [];
        var grid = $("#jqGridQso");
        ////for (var i = 0; i < dataobj.length; i++) {
        var item = dataobj;
        gridArrayData.push({
            W: item.W,
            T: item.T,
            I: item.I,
            F: item.F,
            XR: item.XR,
            C: item.C,
            Z: item.Z,
            P: item.P,
            R: item.R,
            S: item.S,
            U: item.U,
            B: item.B,
            BC: item.BC,
            N: item.N,
            D: item.D,
            X: item.X,
            XC: item.XC,
        });
        //}

        // set the new data
        grid.jqGrid('setGridParam', { data: gridArrayData });

        //grid.jqGrid('setGridParam', { data: dataobj });
        // hide the show message
        //grid[0].grid.endReq();
        //refresh the grid

        grid.trigger('reloadGrid');


    }




    _lq.ShowCallQsoPopup = function (Call, CallGroup, QsoInfo, rowId, iCol, e) {
        e.preventDefault();

        _lq.parent_modal_box_id = e.currentTarget.id;
        puwidth = 608;
        var SelectedCall = _lq.GetQsoData(QsoInfo, CallGroup);
        //$("#jqGridQso").jqGrid("clearGridData");

        //CONCLUSION
        // IF YOU HIDE Z OR P COLUMN ON NOTE2 CHROME, SCRREN JUMPS ON 1st TAP OF CALL
        //on chrome note 2 the screen jumps to the top when you touch a call
        // thus happens with hidecols here followed by a QsoInit()
        //  after you scroll down, the screen does not jump, if you tap another call in the same callgroup
        // or all call groups point to the sam contest
        // in addition, if you do not hide colums and only call QsiInit() on line 50
        // the phone does not jump on first touch

        if (_lq.PZName == 'P') {
            $("#jqGridQso").jqGrid('hideCol', ["Z"]);
            $("#jqGridQso").jqGrid('showCol', ["P"]);
        } else {
            $("#jqGridQso").jqGrid('hideCol', ["P"]);
            $("#jqGridQso").jqGrid('showCol', ["Z"]);
        }

        //$("#jqGridQso").jqGrid("GridUnload");

        //_lq.QsoInit();
        var bodywidth = $('#body')[0].clientWidth;
        if (puwidth + 10 > bodywidth) {
            puwidth = bodywidth - 10;
        }
        var cell = $("table[id=" + _lq.parent_modal_box_id + "]" + " tr[id=" + rowId + "]");
        //http://stackoverflow.com/questions/9945454/edit-cell-properties-in-jqgrid/9946955#9946955
        //var $dest = $(e.target), td = $dest.closest('td');
        //var hdr = $("div[id= jqgh_jqGridUBN_W]");

        var table = $("table[id=" + _lq.parent_modal_box_id + "]");
        var Offsets = table.offset();
        //var rects = table[0].getClientRects();
        //var newleft = e.clientX - puwidth;
        //newleft = (newleft < 0) ? Offsets.left : newleft;

        //var newTop = e.clientY + 20;
        //newTop = (newTop > (table[0].clientHeight - 100) ? e.clientY - 80 : newTop);
        //newleft = Offsets.left;
        //newTop = Offsets.top;


        //var r = hdr[0].getBoundingClientRect();
        //newleft = r.left;
        //newTop = r.top;

        /       ///This works
        ////var pageX = e.pageX;
        ////var pageY = e.pageY;
        ////if (pageX === undefined) {
        ////    pageX = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
        ////    pageY = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
        ////}
        ////newleft = pageX - puwidth;
        ////newleft = (newleft < 0) ? Offsets.left : newleft;
        ////newTop = pageY + cell[0].clientHeight;

        //http://www.jacklmoore.com/notes/mouse-position/
        e = jQuery.event.fix(e);


        newleft = e.pageX - puwidth;
        newleft = (newleft < 0) ? Offsets.left : newleft;
        newTop = e.pageY + cell[0].clientHeight;
        //newTop = (newTop > (cell[0].clientHeight * 18) ? newTop - 40 : newTop);


        var Qdiv = $('div[id=gridQso]');
        var popupNo = 'popupQso';

        $('#' + popupNo).css({
            position: "absolute",
            top: newTop + "px",
            left: newleft + "px"

            //top: newTop,
            //left: newleft,
        }).css('width', puwidth + 'px');
        $("body").append(_lq_appendthis);

        $('#' + popupNo + ' div.ui-jqgrid-hdiv').css('width', puwidth - 10 + 'px');
        $('#' + popupNo + ' div[id=gbox_jqGridQso').css('width', puwidth - 10 + 'px');

        $(".modal-overlay").fadeTo(500, 0.7);

        //style popup
        var modalBox = $('#' + popupNo + '');
        var popup = $('#' + popupNo + ' h5');


        popup.html(SelectedCall + " Qso \u27af   " + Call);
        popup.addClass('lq-popup-hdr');

        //var msg = $('#' + popupNo + ' h5');
        //msg.html("Offsets.left/Top: " + Offsets.left + " / " + Math.round(Offsets.top) + "--- " + 'clientX/Y: ' + e.clientX + " / " + e.clientY
        //    + "--- " + 'PageX/Y: ' + e.pageX + " / " + e.pageY  );


        $('#' + popupNo).fadeIn($(this).data());
        //$('#' + popupNo).css(
        //    'display', "inline-block"
        //    );
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


