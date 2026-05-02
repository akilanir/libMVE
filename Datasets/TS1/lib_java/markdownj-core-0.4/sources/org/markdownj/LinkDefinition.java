package org.markdownj;

/* loaded from: markdownj-core-0.4.jar:org/markdownj/LinkDefinition.class */
public class LinkDefinition {
    private String url;
    private String title;

    public LinkDefinition(String url, String title) {
        this.url = url;
        this.title = title;
    }

    public String getUrl() {
        return this.url;
    }

    public String getTitle() {
        return this.title;
    }

    public String toString() {
        return this.url + " (" + this.title + ")";
    }
}
