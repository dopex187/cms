(function() {
    function a(text) {
        console.log(text);
    }
    if (!window.bpid || !window.bpid.getValue) try {
        function b() {
            try {
                if (window.ActiveXObject) {
                    var a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
                    if (a) {
                        var b = a.GetVariable("$version").substring(4);
                        b = b.split(","), b = parseFloat(b[0] + "." + b[1]);
                        return b
                    }
                } else if (navigator.plugins && navigator.plugins.length > 0) {
                    var c = "application/x-shockwave-flash",
                        d = navigator.mimeTypes;
                    if (d && d[c] && d[c].enabledPlugin && d[c].enabledPlugin.description) {
                        var e = d[c].enabledPlugin.description,
                            f = e.split(/ +/),
                            g = f[2].split(/\./);
                        return parseFloat(g[0] + "." + g[1])
                    }
                }
            } catch (h) {}
            return null
        }

        function c(a) {
            if (!a) return null;
            var b = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            if (a.length != 32) return null;
            if (a.charAt(31) == "A") {
                for (var c = 8; c < 31; c++)
                    if (b.indexOf(a.charAt(c)) < 0) return null;
                var d = 0;
                for (var c = 0; c < 8; c++) {
                    var e = b.indexOf(a.charAt(c));
                    if (e < 0) return null;
                    d *= 16, d += e
                }
                if (d < 1136102400) return null;
                if (d > 2209017600) return null;
                return d
            }
            if (a.charAt(31) == "B") {
                var f = 0;
                for (var c = 8; c < 30; c++) {
                    var e = b.indexOf(a.charAt(c));
                    if (e < 0) return null;
                    f += e
                }
                if (b.indexOf(a.charAt(30)) != f % b.length) return null;
                var d = 0;
                for (var c = 0; c < 8; c++) {
                    var e = b.indexOf(a.charAt(c));
                    if (e < 0) return null;
                    d *= 16, d += e
                }
                if (d < 1136102400) return null;
                if (d > 2209017600) return null;
                return d
            }
            return null
        }

        function d(b) {
            try {
                var d = window.localStorage.getItem("bpid");
                if (c(d)) {
                    b(d);
                    return
                }
            } catch (e) {
                a("get_localstorage: " + e)
            }
            b(null)
        }

        function e(b) {
            try {
                window.localStorage.setItem("bpid", b)
            } catch (c) {
                a("set_localstorage: " + c)
            }
        }

        function f(d) {
            try {
                if (b()) {
                    var e = "cb_" + Math.round(Math.random() * 1e7),
                        f = null,
                        g = null;

                    function h() {
                        window.clearTimeout(f), delete window[e], g.parentNode.removeChild(g)
                    }
                    window[e] = function(a) {
                        h(), c(a) ? d(a) : d(null)
                    }, f = window.setTimeout(function() {
                        h(), d(null)
                    }, 2e3);
                    // TODO Get bpid.swf from `assets.bpsecure.net/bpid/bpid.swf`
                    var i = "/bpid/bpid.swf?ts=" + Math.floor((new Date).getTime() / 3600 / 1e3),
                        i = "/bpid/bpid.swf?ts=" + Math.random(),
                        j = "pjs=window." + e,
                        k = '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="https://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="1" height="1"><param name="allowScriptAccess" value="always" /><param name="movie" value="' + i + '" />' + '<param name="FlashVars" value="' + j + '" />' + '<param name="wmode" value="transparent" />' + '<embed src="' + i + '" width="1" height="1" allowScriptAccess="always" swLiveConnect="true" type="application/x-shockwave-flash" ' + 'FlashVars="' + j + '" wmode="transparent" />' + "</object>";
                    g = document.createElement("div"), g.innerHTML = k, document.getElementsByTagName("BODY")[0].appendChild(g);
                    return
                }
            } catch (l) {
                a("get_flash: " + l)
            }
            d(null)
        }

        function g(b) {
            try {
                var d = "cb_" + Math.round(Math.random() * 1e7),
                    e = null,
                    f = null;

                function g() {
                    window.clearTimeout(f), delete window[d], e.parentNode.removeChild(e)
                }
                window[d] = function(a) {
                    g(), c(a) ? b(a) : b(null)
                }, f = window.setTimeout(function() {
                    g(), b(null)
                }, 2e3), e = document.createElement("script"), e.setAttribute("language", "javascript"), e.setAttribute("defer", "defer"), e.setAttribute("src", "/data.php?jsonp=window." + d), document.getElementsByTagName("BODY")[0].appendChild(e);
                //TODO Find response of //bpid.bigpoint.net/data.php?jsonp=window.{d}
                return
            } catch (h) {
                a("get_json: " + h)
            }
            b(null)
        }
        var h = [];
        window.bpid = window.bpid || {}, window.bpid.getValue = function(a) {
            window.bpid.value ? a(window.bpid.value) : h.push(a)
        };

        function i(b) {
            b && e(b), window.bpid.value = b;
            var d = c(b);
            a("finish: age: " + d);
            for (var f = 0; f < h.length; f++) try {
                h[f](b, d)
            } catch (g) {
                a("finish: callback: " + g)
            }
            if (window.bpid.callbacks)
                for (var f = 0; f < window.bpid.callbacks.length; f++) try {
                    window.bpid.callbacks[f](b, d)
                } catch (g) {
                    a("finish: callback: " + g)
                }
            window.bpid.callbacks = [], window.bpid.callbacks.push = function(a) {
                a(window.bpid.value, d)
            }
        }
        d(function(a) {
            a ? i(a) : f(function(a) {
                a ? i(a) : g(function(a) {
                    a ? i(a) : i(null)
                })
            })
        })
    } catch (j) {
        a("main: " + j)
    }
})();
