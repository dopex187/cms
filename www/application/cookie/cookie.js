(function(f) {
    f.cookie = function(g, b, a) {
        if (arguments.length > 1 && (!/Object/.test(Object.prototype.toString.call(b)) || b === null || b === void 0)) {
            a = f.extend({}, a);
            if (typeof a.expires === "number") {
                var c = a.expires * 1E3,
                    c = (new Date).getTime() + c;
                (a.expires = new Date).setTime(c)
            }
            b = String(b);
            return document.cookie = [encodeURIComponent(g), "=", a.raw ? b : encodeURIComponent(b), a.expires ? "; expires=" + a.expires.toUTCString() : "", a.path ? "; path=" + a.path : "", a.domain ? "; domain=" + a.domain : "", a.secure ? "; secure" : ""].join("")
        }
        for (var a =
                b || {}, c = a.raw ? function(a) {
                    return a
                } : decodeURIComponent, h = document.cookie.split("; "), d = 0, e; e = h[d] && h[d].split("="); d++)
            if (c(e[0]) === g) return c(e[1] || "");
        return null
    }
})(jQuery);
