var BPLayertool2 = {};
BPLayertool2.paymentLink = String();
BPLayertool2.userId = Number();
BPLayertool2.requestTime = Number();
BPLayertool2.projectOffset = Number();
BPLayertool2.serviceLinkCount = Number();
BPLayertool2.serviceLinks = [];
BPLayertool2.JSONPRequest = function() {
    var a = this;
    this.requestURL = String();
    this.response = {};
    this.timeout = Number();
    this.active = this.callback = null;
    this.timeout = 5E3;
    this._getRequestURL = function() {
        return this.requestURL
    };
    this._setResponse = function(b) {
        a.response = b
    };
    return {
        setRequestURL: function(b) {
            a.requestURL = b;
            return !0
        },
        getResponse: function() {
            return a.response
        },
        doRequest: function(b) {
            if ("function" === typeof b) a.callback = b;
            BPLayertool2.active = setTimeout("BPLayertool2.JSONPRequest.error()", a.timeout);
            try {
                var c =
                    document.createElement("script");
                c.setAttribute("src", a._getRequestURL());
                c.type = "text/javascript";
                c.charset = "utf-8";
                document.getElementsByTagName("body")[0].appendChild(c)
            } catch (d) {
                return clearTimeout(BPLayertool2.active), !0 === Boolean(console.log) && console.log("BPLayertool2.js - Method: BPLayertool2.JSONPRequest.doRequest() - perform jsonp request failed!"), !1
            }
            return !0
        },
        success: function(b) {
            clearTimeout(BPLayertool2.active);
            a._setResponse(b);
            "function" === typeof a.callback && a.callback(b)
        },
        error: function() {
            !0 ===
                Boolean(console.log) && console.log("BPLayertool2.js - Method: BPLayertool2.JSONPRequest.doRequest() - loading data timed out!")
        }
    }
}();
BPLayertool2.CookieHandler = function() {
    var a = this;
    this.cookieNameSpace = String("bp_lts_");
    this._getCookieNameSpace = function(b, c, d) {
        return String(a.cookieNameSpace + c + "_" + b + "_" + d)
    };
    return {
        checkCookie: function(b, c, d) {
            return jQueryLts.cookie(a._getCookieNameSpace(b, c, d))
        },
        setCookie: function(b, c, d, f) {
            return jQueryLts.cookie(a._getCookieNameSpace(b, c, f), a._getCookieNameSpace(b, c, f), {
                expires: d
            })
        }
    }
}();
BPLayertool2.LayerView = function() {
    var a = this;
    this.viewData = {};
    this.layerCount = Number();
    this.displayCount = Number();
    this.serviceCount = Number();
    return {
        prepareView: function(b) {
            a.viewData = b;
            a.layerCount = a.viewData.length - 1;
            BPLayertool2.LayerView.display()
        },
        display: function() {
            if ("object" == typeof a.viewData[a.displayCount]) {
                var b = !1,
                    c = a.viewData[a.displayCount],
                    d = BPLayertool2.CookieHandler.checkCookie(c.layer_id, c.project_id, BPLayertool2.Helper.getUserId()),
                    f = BPLayertool2.Helper.getRequestTime();
                "EMAIL" !=
                c.type ? c.timestamp_start_utc <= f && c.timestamp_end_utc >= f && (b = !0) : b = !0;
                if (null === d && !0 == b) {
                    jQueryLts.BPFancybox(BPLayertool2.Helper.decodeUtf(c.html), {
                        overlayColor: "#000",
                        padding: 0,
                        scrolling: "no",
                        hideOnOverlayClick: !1,
                        showCloseButton: !1,
                        autoScale: !1,
                        onClosed: function() {
                            window.setTimeout("BPLayertool2.LayerView.closeLayer()", 250)
                        }
                    });
                    jQueryLts("object").css("visibility", "hidden");
                    b = parseInt(BPLayertool2.Helper.getHighestZIndex() + 1);
                    d = parseInt(b + 1);
                    jQueryLts("#BPFancybox-overlay").css("z-index", b);
                    jQueryLts("#BPFancybox-wrap").css("z-index",
                        d);
                    jQueryLts("div[id^=lts_close_area_]").click(function() {
                        jQueryLts.BPFancybox.close()
                    });
                    jQueryLts("#BPFancybox-outer").css("background", "transparent");
                    "payment" == c.link_type && "undefined" != typeof c.payment_link_preselect && 0 < c.payment_link_preselect ? (b = jQueryLts("#lts_id_" + c.layer_id), b.css("cursor", "pointer"), b.click(function(a) {
                        e = a || window.event;
                        ele = e.target || e.srcElement;
                        "" == ele.id && (a = window.open(BPLayertool2.Helper.getPreparedPaymentLink(c.payment_link_preselect), "paymentglobal", "width=1300,height=680,left=100,top=200"),
                            BPLayertool2.LayerView.closeLayer(), a.focus());
                        return !1
                    })) : "manual_static" == c.link_type && (b = jQueryLts("#lts_id_" + c.layer_id), b.css("cursor", "pointer"), b.click(function(a) {
                        e = a || window.event;
                        ele = e.target || e.srcElement;
                        "" == ele.id && BPLayertool2.LayerView.closeLayer()
                    }));
                    var g = jQueryLts("#layerDivClose");
                    g && g.click(function(a) {
                        a.preventDefault();
                        var b = g.attr("rel");
                        window.setTimeout(function() {
                            window.location.href = b
                        }, 250);
                        BPLayertool2.LayerView.closeLayer()
                    });
                    "HAPPYHOUR" == c.type && 0 != jQueryLts("#lts_hh_countdown") &&
                        BPLayertool2.Helper.getCountdown(c.timestamp_end)
                } else a.displayCount++, a.displayCount <= a.layerCount ? BPLayertool2.LayerView.display() : BPLayertool2.serviceLinkCount > 0 && a.serviceCount < BPLayertool2.serviceLinkCount ? (a.serviceCount++, a.layerCount = Number(), a.displayCount = Number(), BPLayertool2.JSONPRequest.setRequestURL(BPLayertool2.serviceLinks[a.serviceCount]), BPLayertool2.JSONPRequest.doRequest(BPLayertool2.LayerView.prepareView)) : jQueryLts("object").css("visibility", "visible")
            } else BPLayertool2.serviceLinkCount >
                0 && a.displayCount >= a.layerCount && a.serviceCount < BPLayertool2.serviceLinkCount ? (a.serviceCount++, a.layerCount = Number(), a.displayCount = Number(), BPLayertool2.JSONPRequest.setRequestURL(BPLayertool2.serviceLinks[a.serviceCount]), BPLayertool2.JSONPRequest.doRequest(BPLayertool2.LayerView.prepareView)) : jQueryLts("object").css("visibility", "visible");
            return !0
        },
        closeLayer: function() {
            if ("object" == typeof a.viewData[a.displayCount]) {
                var b = a.viewData[a.displayCount],
                    c = parseInt(b.cookie_lifetime); - 1 == c && (c = 900);
                0 !== c && BPLayertool2.CookieHandler.setCookie(b.layer_id, b.project_id, c, BPLayertool2.Helper.getUserId());
                "HAPPYHOUR" == b.type && 0 != jQueryLts("#lts_hh_countdown") && BPLayertool2.Helper.clearCountdown();
                a.displayCount++;
                a.displayCount <= a.layerCount ? BPLayertool2.LayerView.display() : BPLayertool2.serviceLinkCount > 0 && a.serviceCount < BPLayertool2.serviceLinkCount ? (a.serviceCount++, a.layerCount = Number(), a.displayCount = Number(), BPLayertool2.JSONPRequest.setRequestURL(BPLayertool2.serviceLinks[a.serviceCount]), BPLayertool2.JSONPRequest.doRequest(BPLayertool2.LayerView.prepareView)) :
                    (jQueryLts.BPFancybox.close(), jQueryLts("object").css("visibility", "visible"))
            } else jQueryLts("object").css("visibility", "visible");
            return !0
        }
    }
}();
BPLayertool2.Helper = {
    getHighestZIndex: function() {
        return Math.max.apply(null, jQueryLts.map(jQueryLts("body > *"), function(a) {
            if ("absolute" == jQueryLts(a).css("position")) return parseInt(jQueryLts(a).css("z-index")) || 1
        }))
    },
    setUserId: function(a) {
        BPLayertool2.userId = a;
        return !0
    },
    setServices: function(a) {
        BPLayertool2.serviceLinkCount = a.length - 1;
        BPLayertool2.serviceLinks = a
    },
    getUserId: function() {
        return BPLayertool2.userId
    },
    setPaymentLink: function(a) {
        BPLayertool2.paymentLink = a;
        return !0
    },
    setRequestTime: function(a) {
        BPLayertool2.requestTime =
            Number(a);
        return !0
    },
    getRequestTime: function() {
        return BPLayertool2.requestTime
    },
    getPreparedPaymentLink: function(a) {
        return String(BPLayertool2.paymentLink + "&itemGroup=" + a)
    },
    clearCountdown: function() {
        clearInterval(this.interval);
        return !0
    },
    getCountdown: function(a) {
        this.interval = null;
        this.interval = setInterval("BPLayertool2.Helper.calculateCountdown(" + a + ")", 990);
        return !0
    },
    calculateCountdown: function(a) {
        this.dateNow = parseInt((new Date).getTime() / 1E3);
        this.difference = parseInt(a - this.dateNow);
        this.hours = Math.floor(this.difference /
            3600);
        this.minutes = Math.floor(this.difference % 3600 / 60);
        this.seconds = Math.floor(this.difference % 3600 % 60);
        if (this.hours >= 0 && this.minutes >= 0 && this.seconds >= 0) {
            if (this.hours < 10) this.hours = String("0" + this.hours);
            if (this.minutes < 10) this.minutes = String("0" + this.minutes);
            if (this.seconds < 10) this.seconds = String("0" + this.seconds);
            a = String((this.hours === "00" ? "" : this.hours + ":") + this.minutes + ":" + this.seconds);
            jQueryLts("div[id^=lts_hh_countdown]").html(a)
        } else jQueryLts("div[id^=lts_hh_countdown]").html("00:00:00");
        return !0
    },
    decodeUtf: function(a) {
        for (var b = "", c = 0, d = c1 = c2 = 0; c < a.length;) d = a.charCodeAt(c), d < 128 ? (b += String.fromCharCode(d), c++) : d > 191 && d < 224 ? (c2 = a.charCodeAt(c + 1), b += String.fromCharCode((d & 31) << 6 | c2 & 63), c += 2) : (c2 = a.charCodeAt(c + 1), c3 = a.charCodeAt(c + 2), b += String.fromCharCode((d & 15) << 12 | (c2 & 63) << 6 | c3 & 63), c += 3);
        return b
    }
};
