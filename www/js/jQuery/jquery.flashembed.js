(function() {
    function e(e, t) {
        if (t) {
            for (var n in t) {
                if (t.hasOwnProperty(n)) {
                    e[n] = t[n]
                }
            }
        }
        return e
    }

    function t(e, t) {
        var n = [];
        for (var r in e) {
            if (e.hasOwnProperty(r)) {
                n[r] = t(e[r])
            }
        }
        return n
    }

    function n(t, n, s) {
        if (a.isSupported(n.version)) {
            t.innerHTML = a.getHTML(n, s)
        } else if (n.expressInstall && a.isSupported([6, 0, 65])) {
            t.innerHTML = a.getHTML(e(n, {
                src: n.expressInstall
            }), {
                MMredirectURL: location.href,
                MMplayerType: "PlugIn",
                MMdoctitle: document.title
            })
        } else {
            if (!t.innerHTML.replace(/\s/g, "")) {
                t.innerHTML = "<h2>Flash version " + n.version + " or greater is required</h2>" + "<h3>" + (f[0] > 0 ? "Your version is " + f : "You have no flash plugin installed") + "</h3>" + (t.tagName == "A" ? "<p>Click here to download latest version</p>" : "<p>Download latest version from <a href='" + i + "'>here</a></p>");
                if (t.tagName == "A") {
                    t.onclick = function() {
                        location.href = i
                    }
                }
            }
            if (n.onFail) {
                var o = n.onFail.call(this);
                if (typeof o == "string") {
                    t.innerHTML = o
                }
            }
        }
        if (r) {
            window[n.id] = document.getElementById(n.id)
        }
        e(this, {
            getRoot: function() {
                return t
            },
            getOptions: function() {
                return n
            },
            getConf: function() {
                return s
            },
            getApi: function() {
                return t.firstChild
            }
        })
    }
    var r = document.all,
        i = "http://www.adobe.com/go/getflashplayer",
        s = typeof jQuery == "function",
        o = /(\d+)[^\d]+(\d+)[^\d]*(\d*)/,
        u = {
            width: "100%",
            height: "100%",
            id: "_" + ("" + Math.random()).slice(9),
            allowfullscreen: true,
            allowscriptaccess: "always",
            quality: "high",
            version: [3, 0],
            onFail: null,
            expressInstall: null,
            w3c: false,
            cachebusting: false
        };
    if (window.attachEvent) {
        window.attachEvent("onbeforeunload", function() {
            __flash_unloadHandler = function() {};
            __flash_savedUnloadHandler = function() {}
        })
    }
    window.flashembed = function(t, r, i) {
        if (typeof t == "string") {
            t = document.getElementById(t.replace("#", ""))
        }
        if (!t) {
            return
        }
        if (typeof r == "string") {
            r = {
                src: r
            }
        }
        return new n(t, e(e({}, u), r), i)
    };
    var a = e(window.flashembed, {
        conf: u,
        getVersion: function() {
            var e, t;
            try {
                t = navigator.plugins["Shockwave Flash"].description.slice(16)
            } catch (n) {
                try {
                    e = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
                    t = e && e.GetVariable("$version")
                } catch (r) {
                    try {
                        e = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
                        t = e && e.GetVariable("$version")
                    } catch (i) {}
                }
            }
            t = o.exec(t);
            return t ? [parseInt(t[1], 10), parseInt(t[2], 10), parseInt(t[3], 10)] : [0, 0, 0]
        },
        asString: function(e) {
            if (e === null || e === undefined) {
                return null
            }
            var n = typeof e;
            if (n == "object" && e.push) {
                n = "array"
            }
            switch (n) {
                case "string":
                    e = e.replace(new RegExp('(["\\\\])', "g"), "\\$1");
                    e = e.replace(/^\s?(\d+\.?\d*)%/, "$1pct");
                    return '"' + e + '"';
                case "array":
                    return "[" + t(e, function(e) {
                        return a.asString(e)
                    }).join(",") + "]";
                case "function":
                    return '"function()"';
                case "object":
                    var r = [];
                    for (var i in e) {
                        if (e.hasOwnProperty(i)) {
                            r.push('"' + i + '":' + a.asString(e[i]))
                        }
                    }
                    return "{" + r.join(",") + "}"
            }
            return String(e).replace(/\s/g, " ").replace(/\'/g, '"')
        },
        getHTML: function(t, n) {
            t = e({}, t);
            var i = '<object width="' + t.width + '" height="' + t.height + '" id="' + t.id + '" name="' + t.id + '"';
            if (t.cachebusting) {
                t.src += (t.src.indexOf("?") != -1 ? "&" : "?") + Math.random()
            }
            if (t.w3c || !r) {
                i += ' data="' + t.src + '" type="application/x-shockwave-flash"'
            } else {
                i += ' classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'
            }
            i += ">";
            if (t.w3c || r) {
                i += '<param name="movie" value="' + t.src + '" />'
            }
            t.width = t.height = t.id = t.w3c = t.src = null;
            t.onFail = t.version = t.expressInstall = null;
            for (var s in t) {
                if (t[s]) {
                    i += '<param name="' + s + '" value="' + t[s] + '" />'
                }
            }
            var o = "";
            if (n) {
                for (var u in n) {
                    if (n[u]) {
                        var f = n[u];
                        o += u + "=" + (/function|object/.test(typeof f) ? a.asString(f) : f) + "&"
                    }
                }
                o = o.slice(0, -1);
                i += '<param name="flashvars" value=\'' + o + "' />"
            }
            i += "</object>";
            return i
        },
        isSupported: function(e) {
            var t;
            if (e && e.length > 0) {
                for (t = 0; t < e.length && t < f.length; ++t) {
                    if (f[t] > e[t]) {
                        return true
                    } else if (f[t] < e[t]) {
                        return false
                    }
                }
                return true
            }
            return f[0] > 0
        }
    });
    var f = a.getVersion();
    if (s) {
        jQuery.tools = jQuery.tools || {
            version: "@VERSION"
        };
        jQuery.tools.flashembed = {
            conf: u
        };
        jQuery.fn.flashembed = function(e, t) {
            return this.each(function() {
                jQuery(this).data("flashembed", flashembed(this, e, t))
            })
        }
    }
})()
