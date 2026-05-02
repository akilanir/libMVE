package ch.qos.logback.classic.html;

import ch.qos.logback.core.html.CssBuilder;

/* loaded from: logback-android-classic-1.1.1-3.jar:ch/qos/logback/classic/html/UrlCssBuilder.class */
public class UrlCssBuilder implements CssBuilder {
    String url = "http://logback.qos.ch/css/classic.css";

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String str) {
        this.url = str;
    }

    public void addCss(StringBuilder sb) {
        sb.append("<link REL=StyleSheet HREF=\"");
        sb.append(this.url);
        sb.append("\" TITLE=\"Basic\" />");
    }
}
