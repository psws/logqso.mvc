
$(function () {
    _lq.parent_modal_box_id = undefined;
    _lq.SessionSaveControlSelections = "SessionSaveControlSettings";
    var btn = $.fn.button.noConflict();

    //$("select[name^='Contest']").selectmenu();
    //$("select[name^='Contest']").selectmenu('menuWidget').addClass('lq-dropdwn');
    //get control data

    // Fetch the initial data.
    //var controlUri = '/api/control/';

    
    getAllControls();

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

    $("input[id^='Call'], input[id^='Station'] ").
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


    $("div.panel-body[id^='bdyPnl']").
each(function (indexInArray, valueOfElement) {
    //$(this).prop('background-color', '#aed7ff');
    $(this).css({
        'padding': '6px 15px 8px 15px'
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
            e.currentTarget.parentNode.style.color = "red";
            switch (e.currentTarget.id) {
                case 'chk1':
                    PropertyColorState("#Call1", "disabled", true, "#a4a3a3");
                    break;
                case 'chk2':
                    PropertyColorState("#Call2", "disabled", true, "#a4a3a3");
                    break;
                case 'chk3':
                    PropertyColorState("#Call3", "disabled", true, "#a4a3a3");
                    break;
                case 'filtercatchk':
                    PropertyColorState("#filtercatchk", "checked", true, "#a4a3a3");
                    SelectMenuState("Select[id^='Cat']", "disable");
                    _lq.ControlCategorySettingsEntity.Disabled = true;
                    break;
                case 'filterQsochk':
                    PropertyColorState("#filterQsochk", "checked", true, "#a4a3a3");
                    SelectMenuState("Select[id^='Filt']", "disable");
                    _lq.ControlFiltersSettingsEntity.Disabled = true;
                    break;

                default:

            }
        } else {
            e.currentTarget.parentNode.style.color = "";
            switch (e.currentTarget.id) {
                case 'chk1':
                    PropertyColorState("#Call1", "disabled", false, "");
                    break;
                case 'chk2':
                    PropertyColorState("#Call2", "disabled", false, "");
                    break;
                case 'chk3':
                    PropertyColorState("#Call3", "disabled", false, "");
                    break;
                case 'filtercatchk':
                    SelectMenuState("Select[id^='Cat']", "enable");
                    _lq.ControlCategorySettingsEntity.Disabled = false;
                    break;
                case 'filterQsochk':
                    SelectMenuState("Select[id^='Filt']", "enable");
                    _lq.ControlFiltersSettingsEntity.Disabled = false;
                default:

            }

        }
        //e.preventDefault();
        _lq.SendControlSettings(true);

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
                    $(this).selectmenu("option", "width", 110);
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
                    break
                case 'YaxisInterval':
                    $(this).selectmenu("option", "width", 70);
                    break
                case 'YaxisViewType':
                    $(this).selectmenu("option", "width", 130);
                    break
                case 'XaxisStarttime':
                    $(this).selectmenu("option", "width", 130);
                    break
                case 'XaxisDuration':
                    $(this).selectmenu("option", "width", 70);
                    break
                default:
                    $(this).selectmenu("option", "width", 100);

            }

        });
    //ElementCount = 5;
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

        // map all choices to ContestSelectHandler()
        $('#' + modalBox + ' ol.two-col-list li').off('click').on("click",
            {
                test: _lq.parent_modal_box_id,
                callNo: _lq.parent_modal_box_id
            }, _lq.ContestSelectHandler);
        $('#' + modalBox).fadeIn($(this).data());
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
        _lq.ajaxHelper(_lq.controlUri + "/GetControlNames", 'GET').done(function (data) {
            //console.log(data.ControlCategoryEntity.CatOperator);

            $select = $('#CatOp');
            //clear the current content of the select
            $select.html('');
            //iterate over the data and append a select option
            $.each(data.ControlCategoryEntity.CatOperator, function (key, val) {
                //$select.append('<option id="' + val.CatOpr + '">' + val.CatOprName + '</option>');
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#CatBnd');
            $select.html('');
            $.each(data.ControlCategoryEntity.CatBand, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#CatPower');
            $select.html('');
            $.each(data.ControlCategoryEntity.CatPower, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#CatAssist');
            $select.html('');
            $.each(data.ControlCategoryEntity.CatAssisted, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#CatTX');
            $select.html('');
            $.each(data.ControlCategoryEntity.CatNoOfTx, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            //Filter
            $select = $('#FiltBand');
            $select.html('');
            $.each(data.ControlFiltersEntity.FiltBand, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#FiltContinent');
            $select.html('');
            $.each(data.ControlFiltersEntity.FiltContinent, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })

            $select = $('#FiltCountry');
            $select.html('');
            $.each(data.ControlFiltersEntity.FiltCountry, function (key, val) {
                $select.append('<option>' + val + '</option>');
            })
            $ul = $("ul[id^=FiltCountry]");
            if (data.ControlFiltersEntity.FiltCountry.length > 20) {
                $ul.css({
                    //'overflow-y':scroll,
                    'height': (20 * (20)) + "px",
                    'line-height': '16px',
                });
            }

            $select = $('#FiltCQZone');
            $select.html('');
            $.each(data.ControlFiltersEntity.FiltCQZone, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })
            $ul = $("ul[id^=FiltCQZone]");
            if (data.ControlFiltersEntity.FiltCountry.length > 20) {
                $ul.css({
                    //'overflow-y':scroll,
                    'height': (20 * (20)) + "px",
                    'line-height': '16px',
                });
            }


            //Yaxis
            $select = $('#YaxisFunction');
            $select.html('');
            $.each(data.ControlYaxisEntity.YaxisFunction, function (key, val) {
                val = val.replace("  ", "&nbsp;&nbsp;");
                $select.append('<option >' + val + '</option>');
            })
            //make dropup
            $ul = $("ul[id^=YaxisFunction]");
            $ul.css({
                'margin-top': -((data.ControlYaxisEntity.YaxisFunction.length + 1) * (22.5)) + "px",
                'line-height': '16px'
            });

            $select = $('#YaxisInterval');
            $select.html('');
            $.each(data.ControlYaxisEntity.YaxisInterval, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })
            //make dropup
            $ul = $("ul[id^=YaxisInterval]");
            $ul.css({
                'margin-top': -((data.ControlYaxisEntity.YaxisInterval.length + 1) * (23)) + "px",
                'line-height': '16px'
            });

            $select = $('#YaxisViewType');
            $select.html('');
            $.each(data.ControlYaxisEntity.YaxisViewType, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })
            //make dropup
            $ul = $("ul[id^=YaxisViewType]");
            $ul.css({
                'margin-top': -((data.ControlYaxisEntity.YaxisViewType.length + 1) * (23)) + "px",
                'line-height': '16px'
            });

            //Xaxis
            $select = $('#XaxisStarttime');
            $select.html('');
            var Day2HR = false;
            $.each(data.ControlXaxisEntity.XaxisStarttime, function (key, val) {
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
                'margin-top': -((data.ControlXaxisEntity.XaxisStarttime.length + 1) * (23.2)) + "px",
                'line-height': '16px'
            });

            $select = $('#XaxisDuration');
            $select.html('');
            $.each(data.ControlXaxisEntity.XaxisDuration, function (key, val) {
                $select.append('<option >' + val + '</option>');
            })
            //make dropup
            $ul = $("ul[id^=XaxisDuration]");
            $ul.css({
                'margin-top': -((data.ControlXaxisEntity.XaxisDuration.length + 1) * (23)) + "px",
                'line-height': '16px'
            });


            //check if cached
            dataobj = window.sessionStorage.getItem(_lq.SessionSaveControlSelections);
            SessionSaveControlSettings = JSON.parse(dataobj);
            if (SessionSaveControlSettings != null) {
                SetControlCategorySettingsDefaults(SessionSaveControlSettings.ControlCategorySettingsEntity);
                SetControlFiltersSettingsDefaults(SessionSaveControlSettings.ControlFiltersSettingsEntity);
                SetControlXaxisSettingsDefaults(SessionSaveControlSettings.ControlXaxisSettingsEntity);
                SetControlYaxisSettingsDefaults(SessionSaveControlSettings.ControlYaxisSettingsEntity);
                _lq.SessionSaveControlSettings();

                //SetControlDefaults(SessionSaveControlSettings);
            }else {
                GetControlSelections();
            }



        });
    }

    function GetControlSelections() {
        _lq.ajaxHelper(_lq.controlUri + "/GetControlSelections", 'GET')
            .done(function (data) {
                SetControlCategorySettingsDefaults(data.ControlCategorySettingsEntity);
                SetControlFiltersSettingsDefaults(data.ControlFiltersSettingsEntity);
                SetControlXaxisSettingsDefaults(data.ControlXaxisSettingsEntity);
                SetControlYaxisSettingsDefaults(data.ControlYaxisSettingsEntity);

                _lq.SessionSaveControlSettings();

            });  
    }

    $("button[id$= 'Dft']").click(function () {
        var ReqUri = "/GetControlSelection/";
        switch (this.id ) {
            case "CatDft":
                ReqUri += "ControlCategorySettingsEntity";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET')
                   .done(function (ControlCategorySettingsEntity) {
                       SetControlCategorySettingsDefaults(ControlCategorySettingsEntity);
                   });
                break;
            case "QsoDft":
                ReqUri += "ControlFiltersSettingsEntity";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET')
                   .done(function (ControlFiltersSettingsEntity) {
                       SetControlFiltersSettingsDefaults(ControlFiltersSettingsEntity);

                   });
                break;
            case "AxisDft":
                ReqUri += "ControlYaxisSettingsEntity";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET')
                  .done(function (ControlXaxisSettingsEntity) {
                      SetControlYaxisSettingsDefaults(ControlYaxisSettingsEntity);
                  });
                break;
            case "XAxisDft":
                ReqUri += "ControlXaxisSettingsEntity";
                _lq.ajaxHelper(_lq.controlUri + ReqUri, 'GET')
                  .done(function (ControlXaxisSettingsEntity) {
                      SetControlXaxisSettingsDefaults(ControlXaxisSettingsEntity);
                  });
                break;
            default:

        }
        _lq.SessionSaveControlSettings();


    })

    function SetControlCategorySettingsDefaults(ControlCategorySettingsEntity) {
        $select = $('#CatOp').val(ControlCategorySettingsEntity.CatOperator);
        $select.selectmenu("refresh");
        $select = $('#CatBnd').val(ControlCategorySettingsEntity.CatBand);
        $select.selectmenu("refresh");
        $select = $('#CatPower').val(ControlCategorySettingsEntity.CatPower);
        $select.selectmenu("refresh");
        $select = $('#CatAssist').val(ControlCategorySettingsEntity.CatAssisted);
        $select.selectmenu("refresh");
        $select = $('#CatTX').val(ControlCategorySettingsEntity.CatNoOfTx);
        $select.selectmenu("refresh");
        if (ControlCategorySettingsEntity.Disabled) {
            PropertyColorState("#filtercatchk", "checked", true, "#a4a3a3");
            $("#filtercatchk").prev("label").css(
                 { "color": "red" });
            SelectMenuState("Select[id^='Cat']", "disable");
            _lq.ControlCategorySettingsEntity.Disabled = true;
        } else {
            PropertyColorState("#filtercatchk", "checked", false, "");
            $("#filtercatchk").prev("label").css(
                { "color": "" });
            SelectMenuState("Select[id^='Cat']", "enable");
            _lq.ControlCategorySettingsEntity.Disabled = false;
        }
        _lq.ControlCategorySettingsEntity = ControlCategorySettingsEntity;
    }

    function SetControlFiltersSettingsDefaults(ControlFiltersSettingsEntity) {
        $select = $('#FiltBand').val(ControlFiltersSettingsEntity.FiltBand);
        $select.selectmenu("refresh");
        $select = $('#FiltContinent').val(ControlFiltersSettingsEntity.FiltContinent);
        $select.selectmenu("refresh");

        //index = $('#FiltCountry').prop("selectedIndex");
        $('#FiltCountry').prop("selectedIndex", ControlFiltersSettingsEntity.FiltCountryIndex).selectmenu('refresh');
        //$select = $('#FiltCountry').val(ControlFiltersSettingsEntity.FiltCountry);
        //$select.selectmenu("refresh");



        $select = $('#FiltCQZone').val(ControlFiltersSettingsEntity.FiltCQZone);
        $select.selectmenu("refresh");
        if (ControlFiltersSettingsEntity.Disabled) {
            PropertyColorState("#filterQsochk", "checked", true, "#a4a3a3");
            $("#filterQsochk").prev("label").css(
                 { "color": "red" });
            SelectMenuState("Select[id^='Filt']", "disable");
            _lq.ControlFiltersSettingsEntity.Disabled = true;
        } else {
            PropertyColorState("#filterQsochk", "checked", false, "");
            $("#filterQsochk").prev("label").css(
                { "color": "" });
            SelectMenuState("Select[id^='Filt']", "enable");
            _lq.ControlFiltersSettingsEntity.Disabled = false;
        }
        _lq.ControlFiltersSettingsEntity = ControlFiltersSettingsEntity;

    }

    function SetControlXaxisSettingsDefaults(ControlXaxisSettingsEntity) {
        $('#XaxisStarttime').prop("selectedIndex", ControlXaxisSettingsEntity.XaxisStarttimeIndex).selectmenu('refresh');

        //$select = $('#XaxisStarttime').val(ControlXaxisSettingsEntity.XaxisStarttime);
        //$select.selectmenu("refresh");
        $select = $('#XaxisDuration').val(ControlXaxisSettingsEntity.XaxisDuration);
        $select.selectmenu("refresh");
        _lq.ControlXaxisSettingsEntity = ControlXaxisSettingsEntity;
    }

    function SetControlYaxisSettingsDefaults(ControlYaxisSettingsEntity) {
        $('#YaxisFunction').prop("selectedIndex", ControlYaxisSettingsEntity.YaxisFunctionIndex).selectmenu('refresh');

        //$select = $('#YaxisFunction').val(ControlYaxisSettingsEntity.YaxisFunction);
        //$select.selectmenu("refresh");
        $select = $('#YaxisInterval').val(ControlYaxisSettingsEntity.YaxisInterval);
        $select.selectmenu("refresh");
        $select = $('#YaxisViewType').val(ControlYaxisSettingsEntity.YaxisViewType);
        $select.selectmenu("refresh");
        _lq.ControlYaxisSettingsEntity = ControlYaxisSettingsEntity;
    }

  

  

    $(window).resize();
    document.getElementById("body").style.visibility = "visible";

    //set DDL change event
    $("select[id ^='Cat'], select[id ^='Filt'], select[id ^='Yaxis'], select[id ^='Xaxis']").
        each(function (indexInArray, valueOfElement) {
            $(this).on("selectmenuchange", function (event, ui) {
                id = $("#" + ui.item.element[0].parentElement.name + " option:selected");
                _lq.ControlUpdated(ui.item.element[0].parentElement.name, id.text());
            })

        });

    });





    (function (_lq, $, undefined) {
     _lq.controlUri = '/v1/Logqso';

    _lq.parent_modal_box_id;
    _lq.SessionSaveControlSelections;

    _lq.ControlCategorySettingsEntity =  {
        CatOperator: '',
        CatBand: '',
        CatAssisted: '',
        CatNoOfTx: '',
        CatPower: '',
        Disabled: 0
    };

    _lq.ControlFiltersSettingsEntity = {
        FiltBand: '',
        FiltContinent: '',
        FiltCountry: '',
        FiltCountryIndex: '',
        FiltCQZone: '',
        Disabled: 0
    };

    _lq.ControlXaxisSettingsEntity = {
        XaxisDuration: '',
        XaxisStarttime: '',
        XaxisStarttimeIndex: ''
};

    _lq.ControlYaxisSettingsEntity = {
        YaxisFunction: '',
        YaxisFunctionIndex: '',
        YaxisInterval: '',
        YaxisViewType: ''
    };


    _lq.ajaxHelper = function(uri, method, data) {

        return $.ajax({
            type: method,
            url: uri,
            dataType: 'json',
            contentType: 'application/json',
            data: data ? JSON.stringify(data) : null
        }).fail(function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        });

    }


    _lq.ContestSelectHandler = function (event) {
        //alert(event.data.test);
        $('#' + event.data.test + ' span.ui-button-text').text(event.currentTarget.textContent);
        $(".js-modal-close, .modal-overlay").trigger('click');
        //call DDL change event
        _lq.ControlUpdated(event.data.test, event.currentTarget.textContent);
    };

    //function for updating graph POST
    _lq.ControlUpdated = function (Controlid, SelectedValue) {
        //alert("Control: " + Controlid + "-->Selected:" + SelectedValue);
        var bUpdated = true;
        if (Controlid.indexOf("Cat") >= 0) {
            switch (Controlid) {
                case "CatOp":
                    _lq.ControlCategorySettingsEntity.CatOperator = SelectedValue;
                    break;
                case "CatBnd":
                    _lq.ControlCategorySettingsEntity.CatBand = SelectedValue;
                    break;
                case "CatPower":
                    _lq.ControlCategorySettingsEntity.CatPower = SelectedValue;
                    break;
                case "CatAssist":
                    _lq.ControlCategorySettingsEntity.CatAssisted = SelectedValue;
                    break;
                case "CatTX":
                    _lq.ControlCategorySettingsEntity.CatNoOfTx = SelectedValue;
                    break;
                default:

            }
        }else if (Controlid.indexOf("Filt")>= 0)  {
            switch (Controlid) {
                case "FiltBand":
                    _lq.ControlFiltersSettingsEntity.FiltBand = SelectedValue
                    break;
                case "FiltContinent":
                    _lq.ControlFiltersSettingsEntity.FiltContinent = SelectedValue
                    break;
                case "FiltCountry":
                    _lq.ControlFiltersSettingsEntity.FiltCountry = SelectedValue
                    _lq.ControlFiltersSettingsEntity.FiltCountryIndex = $('#FiltCountry').prop("selectedIndex");
                    break;
                case "FiltCQZone":
                    _lq.ControlFiltersSettingsEntity.FiltCQZone = SelectedValue
                    break;
                default:
        
            }
        }else if (Controlid.indexOf("Xaxis")>= 0)  {
            switch (Controlid) {
                case "XaxisStarttime":
                    _lq.ControlXaxisSettingsEntity.XaxisStarttime = SelectedValue
                    _lq.ControlXaxisSettingsEntity.XaxisStarttimeIndex = $('#XaxisStarttime').prop("selectedIndex");
                    break;
                case "XaxisDuration":
                    _lq.ControlXaxisSettingsEntity.XaxisDuration = SelectedValue
                    break;
                default:
        
            }
    
        } else if (Controlid.indexOf("Yaxis") >= 0)   {
            switch (Controlid) {
                case "YaxisFunction":
                    _lq.ControlYaxisSettingsEntity.YaxisFunction = SelectedValue
                    _lq.ControlYaxisSettingsEntity.YaxisFunctionIndex = $('#YaxisFunction').prop("selectedIndex");
                    break;
                case "YaxisInterval":
                    _lq.ControlYaxisSettingsEntity.YaxisInterval = SelectedValue
                    break;
                case "YaxisViewType":
                    _lq.ControlYaxisSettingsEntity.YaxisViewType = SelectedValue
                    break;
                default:
        
            }
        } else if (Controlid.indexOf("Contest") >= 0) {
            switch (Controlid) {
                case "Contest1":
                default:

            }
        }
        else {
            bUpdated = false;
        }

        if (bUpdated) {
            _lq.SessionSaveControlSettings();
            _lq.SendControlSettings(false);
        }
    }

    _lq.SendControlSettings = function (save) {
        if (save == true) {
            _lq.SessionSaveControlSettings();
        }

        var dataObj = {
            ControlCategorySettingsEntity: _lq.ControlCategorySettingsEntity,
            ControlFiltersSettingsEntity: _lq.ControlFiltersSettingsEntity,
            ControlXaxisSettingsEntity: _lq.ControlXaxisSettingsEntity,
            ControlYaxisSettingsEntity: _lq.ControlYaxisSettingsEntity
        };

        _lq.ajaxHelper(_lq.controlUri + "/SendControlSelections", 'POST', dataObj)
        .done(function () {
            //update controls and graph
        });
    }

    _lq.SessionSaveControlSettings = function () {
        var dataObj = {
            ControlCategorySettingsEntity: _lq.ControlCategorySettingsEntity,
            ControlFiltersSettingsEntity: _lq.ControlFiltersSettingsEntity,
            ControlXaxisSettingsEntity: _lq.ControlXaxisSettingsEntity,
            ControlYaxisSettingsEntity: _lq.ControlYaxisSettingsEntity
        };
        window.sessionStorage.setItem(_lq.SessionSaveControlSelections, JSON.stringify(dataObj) );

    }

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


