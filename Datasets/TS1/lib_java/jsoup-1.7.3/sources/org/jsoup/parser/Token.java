package org.jsoup.parser;

import org.jsoup.helper.Validate;
import org.jsoup.nodes.Attribute;
import org.jsoup.nodes.Attributes;

/* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/Token.class */
abstract class Token {
    TokenType type;

    /* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/Token$TokenType.class */
    enum TokenType {
        Doctype,
        StartTag,
        EndTag,
        Comment,
        Character,
        EOF
    }

    private Token() {
    }

    String tokenType() {
        return getClass().getSimpleName();
    }

    /* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/Token$Doctype.class */
    static class Doctype extends Token {
        final StringBuilder name;
        final StringBuilder publicIdentifier;
        final StringBuilder systemIdentifier;
        boolean forceQuirks;

        Doctype() {
            super();
            this.name = new StringBuilder();
            this.publicIdentifier = new StringBuilder();
            this.systemIdentifier = new StringBuilder();
            this.forceQuirks = false;
            this.type = TokenType.Doctype;
        }

        String getName() {
            return this.name.toString();
        }

        String getPublicIdentifier() {
            return this.publicIdentifier.toString();
        }

        public String getSystemIdentifier() {
            return this.systemIdentifier.toString();
        }

        public boolean isForceQuirks() {
            return this.forceQuirks;
        }
    }

    /* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/Token$Tag.class */
    static abstract class Tag extends Token {
        protected String tagName;
        private String pendingAttributeName;
        private StringBuilder pendingAttributeValue;
        boolean selfClosing;
        Attributes attributes;

        Tag() {
            super();
            this.selfClosing = false;
        }

        void newAttribute() {
            Attribute attribute;
            if (this.attributes == null) {
                this.attributes = new Attributes();
            }
            if (this.pendingAttributeName != null) {
                if (this.pendingAttributeValue == null) {
                    attribute = new Attribute(this.pendingAttributeName, "");
                } else {
                    attribute = new Attribute(this.pendingAttributeName, this.pendingAttributeValue.toString());
                }
                this.attributes.put(attribute);
            }
            this.pendingAttributeName = null;
            if (this.pendingAttributeValue != null) {
                this.pendingAttributeValue.delete(0, this.pendingAttributeValue.length());
            }
        }

        void finaliseTag() {
            if (this.pendingAttributeName != null) {
                newAttribute();
            }
        }

        String name() {
            Validate.isFalse(this.tagName.length() == 0);
            return this.tagName;
        }

        Tag name(String name) {
            this.tagName = name;
            return this;
        }

        boolean isSelfClosing() {
            return this.selfClosing;
        }

        Attributes getAttributes() {
            return this.attributes;
        }

        void appendTagName(String append) {
            this.tagName = this.tagName == null ? append : this.tagName.concat(append);
        }

        void appendTagName(char append) {
            appendTagName(String.valueOf(append));
        }

        void appendAttributeName(String append) {
            this.pendingAttributeName = this.pendingAttributeName == null ? append : this.pendingAttributeName.concat(append);
        }

        void appendAttributeName(char append) {
            appendAttributeName(String.valueOf(append));
        }

        void appendAttributeValue(String append) {
            ensureAttributeValue();
            this.pendingAttributeValue.append(append);
        }

        void appendAttributeValue(char append) {
            ensureAttributeValue();
            this.pendingAttributeValue.append(append);
        }

        void appendAttributeValue(char[] append) {
            ensureAttributeValue();
            this.pendingAttributeValue.append(append);
        }

        private final void ensureAttributeValue() {
            if (this.pendingAttributeValue == null) {
                this.pendingAttributeValue = new StringBuilder();
            }
        }
    }

    /* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/Token$StartTag.class */
    static class StartTag extends Tag {
        StartTag() {
            this.attributes = new Attributes();
            this.type = TokenType.StartTag;
        }

        StartTag(String name) {
            this();
            this.tagName = name;
        }

        StartTag(String name, Attributes attributes) {
            this();
            this.tagName = name;
            this.attributes = attributes;
        }

        public String toString() {
            if (this.attributes != null && this.attributes.size() > 0) {
                return "<" + name() + " " + this.attributes.toString() + ">";
            }
            return "<" + name() + ">";
        }
    }

    /* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/Token$EndTag.class */
    static class EndTag extends Tag {
        EndTag() {
            this.type = TokenType.EndTag;
        }

        EndTag(String name) {
            this();
            this.tagName = name;
        }

        public String toString() {
            return "</" + name() + ">";
        }
    }

    /* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/Token$Comment.class */
    static class Comment extends Token {
        final StringBuilder data;
        boolean bogus;

        Comment() {
            super();
            this.data = new StringBuilder();
            this.bogus = false;
            this.type = TokenType.Comment;
        }

        String getData() {
            return this.data.toString();
        }

        public String toString() {
            return "<!--" + getData() + "-->";
        }
    }

    /* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/Token$Character.class */
    static class Character extends Token {
        private final String data;

        Character(String data) {
            super();
            this.type = TokenType.Character;
            this.data = data;
        }

        String getData() {
            return this.data;
        }

        public String toString() {
            return getData();
        }
    }

    /* loaded from: jsoup-1.7.3.jar:org/jsoup/parser/Token$EOF.class */
    static class EOF extends Token {
        EOF() {
            super();
            this.type = TokenType.EOF;
        }
    }

    boolean isDoctype() {
        return this.type == TokenType.Doctype;
    }

    Doctype asDoctype() {
        return (Doctype) this;
    }

    boolean isStartTag() {
        return this.type == TokenType.StartTag;
    }

    StartTag asStartTag() {
        return (StartTag) this;
    }

    boolean isEndTag() {
        return this.type == TokenType.EndTag;
    }

    EndTag asEndTag() {
        return (EndTag) this;
    }

    boolean isComment() {
        return this.type == TokenType.Comment;
    }

    Comment asComment() {
        return (Comment) this;
    }

    boolean isCharacter() {
        return this.type == TokenType.Character;
    }

    Character asCharacter() {
        return (Character) this;
    }

    boolean isEOF() {
        return this.type == TokenType.EOF;
    }
}
