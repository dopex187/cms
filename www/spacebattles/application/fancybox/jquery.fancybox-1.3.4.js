(function(a) {
    var l, q, r, e, y, k, z, g, v, w, o = 0,
        d = {},
        m = [],
        n = 0,
        c = {},
        j = [],
        B = null,
        s = new Image,
        D = /\.(jpg|gif|png|bmp|jpeg)(.*)?$/i,
        O = /[^\.]\.(swf)\s*$/i,
        E, F = 1,
        u = 0,
        t = "",
        p, h, i = !1,
        x = a.extend(a("<div/>")[0], {
            prop: 0
        }),
        G = a.browser.msie && a.browser.version < 7 && !window.XMLHttpRequest,
        H = function() {
            q.hide();
            s.onerror = s.onload = null;
            B && B.abort();
            l.empty()
        },
        I = function() {
            !1 === d.onError(m, o, d) ? (q.hide(), i = !1) : (d.titleShow = !1, d.width = "auto", d.height = "auto", l.html('<p id="BPFancybox-error">The requested content cannot be loaded.<br />Please try again later.</p>'),
                A())
        },
        C = function() {
            var b = m[o],
                f, c, e, h, j, g;
            H();
            d = a.extend({}, a.fn.BPFancybox.defaults, typeof a(b).data("BPFancybox") == "undefined" ? d : a(b).data("BPFancybox"));
            g = d.onStart(m, o, d);
            if (g === !1) i = !1;
            else {
                typeof g == "object" && (d = a.extend(d, g));
                e = d.title || (b.nodeName ? a(b).attr("title") : b.title) || "";
                if (b.nodeName && !d.orig) d.orig = a(b).children("img:first").length ? a(b).children("img:first") : a(b);
                e === "" && d.orig && d.titleFromAlt && (e = d.orig.attr("alt"));
                f = d.href || (b.nodeName ? a(b).attr("href") : b.href) || null;
                if (/^(?:javascript)/i.test(f) ||
                    f == "#") f = null;
                if (d.type) {
                    if (c = d.type, !f) f = d.content
                } else d.content ? c = "html" : f && (c = f.match(D) ? "image" : f.match(O) ? "swf" : a(b).hasClass("iframe") ? "iframe" : f.indexOf("#") === 0 ? "inline" : "ajax");
                if (c) {
                    c == "inline" && (b = f.substr(f.indexOf("#")), c = a(b).length > 0 ? "inline" : "ajax");
                    d.type = c;
                    d.href = f;
                    d.title = e;
                    if (d.autoDimensions) d.type == "html" || d.type == "inline" || d.type == "ajax" ? (d.width = "auto", d.height = "auto") : d.autoDimensions = !1;
                    if (d.modal) d.overlayShow = !0, d.hideOnOverlayClick = !1, d.hideOnContentClick = !1, d.enableEscapeButton = !1, d.showCloseButton = !1;
                    d.padding = parseInt(d.padding, 10);
                    d.margin = parseInt(d.margin, 10);
                    l.css("padding", d.padding + d.margin);
                    a(".BPFancybox-inline-tmp").unbind("BPFancybox-cancel").bind("BPFancybox-change", function() {
                        a(this).replaceWith(k.children())
                    });
                    switch (c) {
                        case "html":
                            l.html(d.content);
                            A();
                            break;
                        case "inline":
                            if (a(b).parent().is("#BPFancybox-content") === !0) {
                                i = !1;
                                break
                            }
                            a('<div class="BPFancybox-inline-tmp" />').hide().insertBefore(a(b)).bind("BPFancybox-cleanup", function() {
                                a(this).replaceWith(k.children())
                            }).bind("BPFancybox-cancel",
                                function() {
                                    a(this).replaceWith(l.children())
                                });
                            a(b).appendTo(l);
                            A();
                            break;
                        case "image":
                            i = !1;
                            a.BPFancybox.showActivity();
                            s = new Image;
                            s.onerror = function() {
                                I()
                            };
                            s.onload = function() {
                                i = !0;
                                s.onerror = s.onload = null;
                                d.width = s.width;
                                d.height = s.height;
                                a("<img />").attr({
                                    id: "BPFancybox-img",
                                    src: s.src,
                                    alt: d.title
                                }).appendTo(l);
                                J()
                            };
                            s.src = f;
                            break;
                        case "swf":
                            d.scrolling = "no";
                            h = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="' + d.width + '" height="' + d.height + '"><param name="movie" value="' + f + '"></param>';
                            j = "";
                            a.each(d.swf, function(b, a) {
                                h += '<param name="' + b + '" value="' + a + '"></param>';
                                j += " " + b + '="' + a + '"'
                            });
                            h += '<embed src="' + f + '" type="application/x-shockwave-flash" width="' + d.width + '" height="' + d.height + '"' + j + "></embed></object>";
                            l.html(h);
                            A();
                            break;
                        case "ajax":
                            i = !1;
                            a.BPFancybox.showActivity();
                            d.ajax.win = d.ajax.success;
                            // Not trusting AJAX request, sorry BP, I'll enable it once I take a closer look ;)
                            /*
                            B = a.ajax(a.extend({}, d.ajax, {
                                url: f,
                                data: d.ajax.data || {},
                                error: function(b) {
                                    b.status > 0 && I()
                                },
                                success: function(b, a, c) {
                                    if ((typeof c == "object" ? c : B).status == 200) {
                                        if (typeof d.ajax.win == "function")
                                            if (g =
                                                d.ajax.win(f, b, a, c), g === !1) {
                                                q.hide();
                                                return
                                            } else if (typeof g == "string" || typeof g == "object") b = g;
                                        l.html(b);
                                        A()
                                    }
                                }
                            }));*/
                            break;
                        case "iframe":
                            J()
                    }
                } else I()
            }
        },
        A = function() {
            var b = d.width,
                c = d.height,
                b = b.toString().indexOf("%") > -1 ? parseInt((a(window).width() - d.margin * 2) * parseFloat(b) / 100, 10) + "px" : b == "auto" ? "auto" : b + "px",
                c = c.toString().indexOf("%") > -1 ? parseInt((a(window).height() - d.margin * 2) * parseFloat(c) / 100, 10) + "px" : c == "auto" ? "auto" : c + "px";
            l.wrapInner('<div style="width:' + b + ";height:" + c + ";overflow: " + (d.scrolling ==
                "auto" ? "auto" : d.scrolling == "yes" ? "scroll" : "hidden") + ';position:relative;"></div>');
            d.width = l.width();
            d.height = l.height();
            J()
        },
        J = function() {
            var b, f;
            q.hide();
            if (e.is(":visible") && !1 === c.onCleanup(j, n, c)) a.event.trigger("BPFancybox-cancel"), i = !1;
            else {
                i = !0;
                a(k.add(r)).unbind();
                a(window).unbind("resize.fb scroll.fb");
                a(document).unbind("keydown.fb");
                e.is(":visible") && c.titlePosition !== "outside" && e.css("height", e.height());
                j = m;
                n = o;
                c = d;
                if (c.overlayShow) {
                    if (r.css({
                            "background-color": c.overlayColor,
                            opacity: c.overlayOpacity,
                            cursor: c.hideOnOverlayClick ? "pointer" : "auto",
                            height: a(document).height()
                        }), !r.is(":visible")) {
                        if (G) a("select:not(#BPFancybox-tmp select)").filter(function() {
                            return this.style.visibility !== "hidden"
                        }).css({
                            visibility: "hidden"
                        }).one("BPFancybox-cleanup", function() {
                            this.style.visibility = "inherit"
                        });
                        r.show()
                    }
                } else r.hide();
                h = P();
                t = c.title || "";
                u = 0;
                g.empty().removeAttr("style").removeClass();
                if (c.titleShow !== !1 && (b = a.isFunction(c.titleFormat) ? c.titleFormat(t, j, n, c) : t && t.length ? c.titlePosition == "float" ? '<table id="BPFancybox-title-float-wrap" cellpadding="0" cellspacing="0"><tr><td id="BPFancybox-title-float-left"></td><td id="BPFancybox-title-float-main">' +
                        t + '</td><td id="BPFancybox-title-float-right"></td></tr></table>' : '<div id="BPFancybox-title-' + c.titlePosition + '">' + t + "</div>" : !1, (t = b) && t !== "")) switch (g.addClass("BPFancybox-title-" + c.titlePosition).html(t).appendTo("body").show(), c.titlePosition) {
                    case "inside":
                        g.css({
                            width: h.width - c.padding * 2,
                            marginLeft: c.padding,
                            marginRight: c.padding
                        });
                        u = g.outerHeight(!0);
                        g.appendTo(y);
                        h.height += u;
                        break;
                    case "over":
                        g.css({
                            marginLeft: c.padding,
                            width: h.width - c.padding * 2,
                            bottom: c.padding
                        }).appendTo(y);
                        break;
                    case "float":
                        g.css("left",
                            parseInt((g.width() - h.width - 40) / 2, 10) * -1).appendTo(e);
                        break;
                    default:
                        g.css({
                            width: h.width - c.padding * 2,
                            paddingLeft: c.padding,
                            paddingRight: c.padding
                        }).appendTo(e)
                }
                g.hide();
                if (e.is(":visible")) a(z.add(v).add(w)).hide(), b = e.position(), p = {
                    top: b.top,
                    left: b.left,
                    width: e.width(),
                    height: e.height()
                }, f = p.width == h.width && p.height == h.height, k.fadeTo(c.changeFade, 0.3, function() {
                    var b = function() {
                        k.html(l.contents()).fadeTo(c.changeFade, 1, K)
                    };
                    a.event.trigger("BPFancybox-change");
                    k.empty().removeAttr("filter").css({
                        "border-width": c.padding,
                        width: h.width - c.padding * 2,
                        height: d.autoDimensions ? "auto" : h.height - u - c.padding * 2
                    });
                    f ? b() : (x.prop = 0, a(x).animate({
                        prop: 1
                    }, {
                        duration: c.changeSpeed,
                        easing: c.easingChange,
                        step: L,
                        complete: b
                    }))
                });
                else if (e.removeAttr("style"), k.css("border-width", c.padding), c.transitionIn == "elastic") {
                    p = N();
                    k.html(l.contents());
                    e.show();
                    if (c.opacity) h.opacity = 0;
                    x.prop = 0;
                    a(x).animate({
                        prop: 1
                    }, {
                        duration: c.speedIn,
                        easing: c.easingIn,
                        step: L,
                        complete: K
                    })
                } else c.titlePosition == "inside" && u > 0 && g.show(), k.css({
                    width: h.width - c.padding *
                        2,
                    height: d.autoDimensions ? "auto" : h.height - u - c.padding * 2
                }).html(l.contents()), e.css(h).fadeIn(c.transitionIn == "none" ? 0 : c.speedIn, K)
            }
        },
        Q = function() {
            (c.enableEscapeButton || c.enableKeyboardNav) && a(document).bind("keydown.fb", function(b) {
                if (b.keyCode == 27 && c.enableEscapeButton) b.preventDefault(), a.BPFancybox.close();
                else if ((b.keyCode == 37 || b.keyCode == 39) && c.enableKeyboardNav && b.target.tagName !== "INPUT" && b.target.tagName !== "TEXTAREA" && b.target.tagName !== "SELECT") b.preventDefault(), a.BPFancybox[b.keyCode ==
                    37 ? "prev" : "next"]()
            });
            c.showNavArrows ? ((c.cyclic && j.length > 1 || n !== 0) && v.show(), (c.cyclic && j.length > 1 || n != j.length - 1) && w.show()) : (v.hide(), w.hide())
        },
        K = function() {
            a.support.opacity || (k.get(0).style.removeAttribute("filter"), e.get(0).style.removeAttribute("filter"));
            d.autoDimensions && k.css("height", "auto");
            e.css("height", "auto");
            t && t.length && g.show();
            c.showCloseButton && z.show();
            Q();
            c.hideOnContentClick && k.bind("click", a.BPFancybox.close);
            c.hideOnOverlayClick && r.bind("click", a.BPFancybox.close);
            a(window).bind("resize.fb",
                a.BPFancybox.resize);
            c.centerOnScroll && a(window).bind("scroll.fb", a.BPFancybox.center);
            c.type == "iframe" && a('<iframe id="BPFancybox-frame" name="BPFancybox-frame' + (new Date).getTime() + '" frameborder="0" hspace="0" ' + (a.browser.msie ? 'allowtransparency="true""' : "") + ' scrolling="' + d.scrolling + '" src="' + c.href + '"></iframe>').appendTo(k);
            e.show();
            i = !1;
            a.BPFancybox.center();
            c.onComplete(j, n, c);
            var b, f;
            if (j.length - 1 > n && (b = j[n + 1].href, typeof b !== "undefined" && b.match(D))) f = new Image, f.src = b;
            if (n > 0 && (b = j[n -
                    1].href, typeof b !== "undefined" && b.match(D))) f = new Image, f.src = b
        },
        L = function(b) {
            var a = {
                width: parseInt(p.width + (h.width - p.width) * b, 10),
                height: parseInt(p.height + (h.height - p.height) * b, 10),
                top: parseInt(p.top + (h.top - p.top) * b, 10),
                left: parseInt(p.left + (h.left - p.left) * b, 10)
            };
            if (typeof h.opacity !== "undefined") a.opacity = b < 0.5 ? 0.5 : b;
            e.css(a);
            k.css({
                width: a.width - c.padding * 2,
                height: a.height - u * b - c.padding * 2
            })
        },
        M = function() {
            return [a(window).width() - c.margin * 2, a(window).height() - c.margin * 2, a(document).scrollLeft() +
                c.margin, a(document).scrollTop() + c.margin
            ]
        },
        P = function() {
            var b = M(),
                a = {},
                e = c.autoScale,
                g = c.padding * 2;
            a.width = c.width.toString().indexOf("%") > -1 ? parseInt(b[0] * parseFloat(c.width) / 100, 10) : c.width + g;
            a.height = c.height.toString().indexOf("%") > -1 ? parseInt(b[1] * parseFloat(c.height) / 100, 10) : c.height + g;
            if (e && (a.width > b[0] || a.height > b[1]))
                if (d.type == "image" || d.type == "swf") {
                    e = c.width / c.height;
                    if (a.width > b[0]) a.width = b[0], a.height = parseInt((a.width - g) / e + g, 10);
                    if (a.height > b[1]) a.height = b[1], a.width = parseInt((a.height -
                        g) * e + g, 10)
                } else a.width = Math.min(a.width, b[0]), a.height = Math.min(a.height, b[1]);
            a.top = parseInt(Math.max(b[3] - 20, b[3] + (b[1] - a.height - 40) * 0.5), 10);
            a.left = parseInt(Math.max(b[2] - 20, b[2] + (b[0] - a.width - 40) * 0.5), 10);
            return a
        },
        N = function() {
            var b = d.orig ? a(d.orig) : !1,
                f = {};
            b && b.length ? (f = b.offset(), f.top += parseInt(b.css("paddingTop"), 10) || 0, f.left += parseInt(b.css("paddingLeft"), 10) || 0, f.top += parseInt(b.css("border-top-width"), 10) || 0, f.left += parseInt(b.css("border-left-width"), 10) || 0, f.width = b.width(), f.height =
                b.height(), f = {
                    width: f.width + c.padding * 2,
                    height: f.height + c.padding * 2,
                    top: f.top - c.padding - 20,
                    left: f.left - c.padding - 20
                }) : (b = M(), f = {
                width: c.padding * 2,
                height: c.padding * 2,
                top: parseInt(b[3] + b[1] * 0.5, 10),
                left: parseInt(b[2] + b[0] * 0.5, 10)
            });
            return f
        },
        R = function() {
            q.is(":visible") ? (a("div", q).css("top", F * -40 + "px"), F = (F + 1) % 12) : clearInterval(E)
        };
    a.fn.BPFancybox = function(b) {
        if (!a(this).length) return this;
        a(this).data("BPFancybox", a.extend({}, b, a.metadata ? a(this).metadata() : {})).unbind("click.fb").bind("click.fb",
            function(b) {
                b.preventDefault();
                i || (i = !0, a(this).blur(), m = [], o = 0, b = a(this).attr("rel") || "", !b || b == "" || b === "nofollow" ? m.push(this) : (m = a("a[rel=" + b + "], area[rel=" + b + "]"), o = m.index(this)), C())
            });
        return this
    };
    a.BPFancybox = function(b, c) {
        var d;
        if (!i) {
            i = !0;
            d = typeof c !== "undefined" ? c : {};
            m = [];
            o = parseInt(d.index, 10) || 0;
            if (a.isArray(b)) {
                for (var e = 0, g = b.length; e < g; e++) typeof b[e] == "object" ? a(b[e]).data("BPFancybox", a.extend({}, d, b[e])) : b[e] = a({}).data("BPFancybox", a.extend({
                    content: b[e]
                }, d));
                m = a.merge(m, b)
            } else typeof b ==
                "object" ? a(b).data("BPFancybox", a.extend({}, d, b)) : b = a({}).data("BPFancybox", a.extend({
                    content: b
                }, d)), m.push(b);
            if (o > m.length || o < 0) o = 0;
            C()
        }
    };
    a.BPFancybox.showActivity = function() {
        clearInterval(E);
        q.show();
        E = setInterval(R, 66)
    };
    a.BPFancybox.hideActivity = function() {
        q.hide()
    };
    a.BPFancybox.next = function() {
        return a.BPFancybox.pos(n + 1)
    };
    a.BPFancybox.prev = function() {
        return a.BPFancybox.pos(n - 1)
    };
    a.BPFancybox.pos = function(a) {
        i || (a = parseInt(a), m = j, a > -1 && a < j.length ? (o = a, C()) : c.cyclic && j.length > 1 && (o = a >= j.length ?
            0 : j.length - 1, C()))
    };
    a.BPFancybox.cancel = function() {
        i || (i = !0, a.event.trigger("BPFancybox-cancel"), H(), d.onCancel(m, o, d), i = !1)
    };
    a.BPFancybox.close = function() {
        function b() {
            r.fadeOut("fast");
            g.empty().hide();
            e.hide();
            a.event.trigger("BPFancybox-cleanup");
            k.empty();
            c.onClosed(j, n, c);
            j = d = [];
            n = o = 0;
            c = d = {};
            i = !1
        }
        if (!i && !e.is(":hidden"))
            if (i = !0, c && !1 === c.onCleanup(j, n, c)) i = !1;
            else if (H(), a(z.add(v).add(w)).hide(), a(k.add(r)).unbind(), a(window).unbind("resize.fb scroll.fb"), a(document).unbind("keydown.fb"), k.find("iframe").attr("src",
                G && /^https/i.test(window.location.href || "") ? "javascript:void(false)" : "about:blank"), c.titlePosition !== "inside" && g.empty(), e.stop(), c.transitionOut == "elastic") {
            p = N();
            var f = e.position();
            h = {
                top: f.top,
                left: f.left,
                width: e.width(),
                height: e.height()
            };
            if (c.opacity) h.opacity = 1;
            g.empty().hide();
            x.prop = 1;
            a(x).animate({
                prop: 0
            }, {
                duration: c.speedOut,
                easing: c.easingOut,
                step: L,
                complete: b
            })
        } else e.fadeOut(c.transitionOut == "none" ? 0 : c.speedOut, b)
    };
    a.BPFancybox.resize = function() {
        r.is(":visible") && r.css("height", a(document).height());
        a.BPFancybox.center(!0)
    };
    a.BPFancybox.center = function(a) {
        var d, g;
        if (!i && (g = a === !0 ? 1 : 0, d = M(), g || !(e.width() > d[0] || e.height() > d[1]))) e.stop().animate({
            top: parseInt(Math.max(d[3] - 20, d[3] + (d[1] - k.height() - 40) * 0.5 - c.padding)),
            left: parseInt(Math.max(d[2] - 20, d[2] + (d[0] - k.width() - 40) * 0.5 - c.padding))
        }, typeof a == "number" ? a : 200)
    };
    a.BPFancybox.init = function() {
        a("#BPFancybox-wrap").length || (a("body").append(l = a('<div id="BPFancybox-tmp"></div>'), q = a('<div id="BPFancybox-loading"><div></div></div>'), r = a('<div id="BPFancybox-overlay"></div>'),
                e = a('<div id="BPFancybox-wrap"></div>')), y = a('<div id="BPFancybox-outer"></div>').append('<div class="BPFancybox-bg" id="BPFancybox-bg-n"></div><div class="BPFancybox-bg" id="BPFancybox-bg-ne"></div><div class="BPFancybox-bg" id="BPFancybox-bg-e"></div><div class="BPFancybox-bg" id="BPFancybox-bg-se"></div><div class="BPFancybox-bg" id="BPFancybox-bg-s"></div><div class="BPFancybox-bg" id="BPFancybox-bg-sw"></div><div class="BPFancybox-bg" id="BPFancybox-bg-w"></div><div class="BPFancybox-bg" id="BPFancybox-bg-nw"></div>').appendTo(e),
            y.append(k = a('<div id="BPFancybox-content"></div>'), z = a('<a id="BPFancybox-close"></a>'), g = a('<div id="BPFancybox-title"></div>'), v = a('<a href="javascript:;" id="BPFancybox-left"><span class="fancy-ico" id="BPFancybox-left-ico"></span></a>'), w = a('<a href="javascript:;" id="BPFancybox-right"><span class="fancy-ico" id="BPFancybox-right-ico"></span></a>')), z.click(a.BPFancybox.close), q.click(a.BPFancybox.cancel), v.click(function(b) {
                b.preventDefault();
                a.BPFancybox.prev()
            }), w.click(function(b) {
                b.preventDefault();
                a.BPFancybox.next()
            }), a.fn.mousewheel && e.bind("mousewheel.fb", function(b, c) {
                if (i) b.preventDefault();
                else if (a(b.target).get(0).clientHeight == 0 || a(b.target).get(0).scrollHeight === a(b.target).get(0).clientHeight) b.preventDefault(), a.BPFancybox[c > 0 ? "prev" : "next"]()
            }), a.support.opacity || e.addClass("BPFancybox-ie"), G && (q.addClass("BPFancybox-ie6"), e.addClass("BPFancybox-ie6"), a('<iframe id="BPFancybox-hide-sel-frame" src="' + (/^https/i.test(window.location.href || "") ? "javascript:void(false)" : "about:blank") +
                '" scrolling="no" border="0" frameborder="0" tabindex="-1"></iframe>').prependTo(y)))
    };
    a.fn.BPFancybox.defaults = {
        padding: 10,
        margin: 40,
        opacity: !1,
        modal: !1,
        cyclic: !1,
        scrolling: "auto",
        width: 560,
        height: 340,
        autoScale: !0,
        autoDimensions: !0,
        centerOnScroll: !1,
        ajax: {},
        swf: {
            wmode: "transparent"
        },
        hideOnOverlayClick: !0,
        hideOnContentClick: !1,
        overlayShow: !0,
        overlayOpacity: 0.7,
        overlayColor: "#777",
        titleShow: !0,
        titlePosition: "float",
        titleFormat: null,
        titleFromAlt: !1,
        transitionIn: "fade",
        transitionOut: "fade",
        speedIn: 300,
        speedOut: 300,
        changeSpeed: 300,
        changeFade: "fast",
        easingIn: "swing",
        easingOut: "swing",
        showCloseButton: !0,
        showNavArrows: !0,
        enableEscapeButton: !0,
        enableKeyboardNav: !0,
        onStart: function() {},
        onCancel: function() {},
        onComplete: function() {},
        onCleanup: function() {},
        onClosed: function() {},
        onError: function() {}
    };
    a(document).ready(function() {
        a.BPFancybox.init()
    })
})(jQuery);
