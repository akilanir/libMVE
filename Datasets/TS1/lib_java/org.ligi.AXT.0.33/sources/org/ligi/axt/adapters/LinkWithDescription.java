package org.ligi.axt.adapters;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/adapters/LinkWithDescription.class */
public class LinkWithDescription {
    private String url;
    private String description;

    public LinkWithDescription(String _url, String _description) {
        this.url = _url;
        this.description = _description;
    }

    public String getURL() {
        return this.url;
    }

    public String getDescription() {
        return this.description;
    }
}
