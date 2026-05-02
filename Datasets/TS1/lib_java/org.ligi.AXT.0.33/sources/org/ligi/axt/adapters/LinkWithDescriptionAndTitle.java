package org.ligi.axt.adapters;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/adapters/LinkWithDescriptionAndTitle.class */
public class LinkWithDescriptionAndTitle extends LinkWithDescription {
    private String title;

    public LinkWithDescriptionAndTitle(String _url, String _description, String title) {
        super(_url, _description);
        setTitle(title);
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
