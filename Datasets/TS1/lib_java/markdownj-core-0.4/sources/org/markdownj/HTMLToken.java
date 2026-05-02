package org.markdownj;

/* loaded from: markdownj-core-0.4.jar:org/markdownj/HTMLToken.class */
public class HTMLToken {
    private boolean isTag;
    private String text;

    private HTMLToken(boolean tag, String value) {
        this.isTag = tag;
        this.text = value;
    }

    public static HTMLToken tag(String text) {
        return new HTMLToken(true, text);
    }

    public static HTMLToken text(String text) {
        return new HTMLToken(false, text);
    }

    public boolean isTag() {
        return this.isTag;
    }

    public String getText() {
        return this.text;
    }

    public String toString() {
        String type;
        if (isTag()) {
            type = "tag";
        } else {
            type = "text";
        }
        return type + ": " + getText();
    }
}
