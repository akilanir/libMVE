package org.jsoup.parser;

import org.jsoup.helper.Validate;
import org.jsoup.nodes.Attribute;
import org.jsoup.nodes.Attributes;
import org.jsoup.nodes.BooleanAttribute;

/* loaded from: jsoup-1.9.2.jar:org/jsoup/parser/Token.class */
abstract class Token {
    TokenType type;

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/parser/Token$TokenType.class */
    enum TokenType {
        Doctype,
        StartTag,
        EndTag,
        Comment,
        Character,
        EOF
    }

    abstract Token reset();

    private Token() {
    }

    String tokenType() {
        return getClass().getSimpleName();
    }

    static void reset(StringBuilder sb) {
        if (sb != null) {
            sb.delete(0, sb.length());
        }
    }

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/parser/Token$Doctype.class */
    static final class Doctype extends Token {
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

        @Override // org.jsoup.parser.Token
        Token reset() {
            reset(this.name);
            reset(this.publicIdentifier);
            reset(this.systemIdentifier);
            this.forceQuirks = false;
            return this;
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

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/parser/Token$Tag.class */
    static abstract class Tag extends Token {
        protected String tagName;
        private String pendingAttributeName;
        private StringBuilder pendingAttributeValue;
        private String pendingAttributeValueS;
        private boolean hasEmptyAttributeValue;
        private boolean hasPendingAttributeValue;
        boolean selfClosing;
        Attributes attributes;

        Tag() {
            super();
            this.pendingAttributeValue = new StringBuilder();
            this.hasEmptyAttributeValue = false;
            this.hasPendingAttributeValue = false;
            this.selfClosing = false;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // org.jsoup.parser.Token
        public Tag reset() {
            this.tagName = null;
            this.pendingAttributeName = null;
            reset(this.pendingAttributeValue);
            this.pendingAttributeValueS = null;
            this.hasEmptyAttributeValue = false;
            this.hasPendingAttributeValue = false;
            this.selfClosing = false;
            this.attributes = null;
            return this;
        }

        final void newAttribute() {
            Attribute attribute;
            if (this.attributes == null) {
                this.attributes = new Attributes();
            }
            if (this.pendingAttributeName != null) {
                if (this.hasPendingAttributeValue) {
                    attribute = new Attribute(this.pendingAttributeName, this.pendingAttributeValue.length() > 0 ? this.pendingAttributeValue.toString() : this.pendingAttributeValueS);
                } else if (this.hasEmptyAttributeValue) {
                    attribute = new Attribute(this.pendingAttributeName, "");
                } else {
                    attribute = new BooleanAttribute(this.pendingAttributeName);
                }
                this.attributes.put(attribute);
            }
            this.pendingAttributeName = null;
            this.hasEmptyAttributeValue = false;
            this.hasPendingAttributeValue = false;
            reset(this.pendingAttributeValue);
            this.pendingAttributeValueS = null;
        }

        final void finaliseTag() {
            if (this.pendingAttributeName != null) {
                newAttribute();
            }
        }

        final String name() {
            Validate.isFalse(this.tagName == null || this.tagName.length() == 0);
            return this.tagName;
        }

        final Tag name(String name) {
            this.tagName = name;
            return this;
        }

        final boolean isSelfClosing() {
            return this.selfClosing;
        }

        final Attributes getAttributes() {
            return this.attributes;
        }

        final void appendTagName(String append) {
            this.tagName = this.tagName == null ? append : this.tagName.concat(append);
        }

        final void appendTagName(char append) {
            appendTagName(String.valueOf(append));
        }

        final void appendAttributeName(String append) {
            this.pendingAttributeName = this.pendingAttributeName == null ? append : this.pendingAttributeName.concat(append);
        }

        final void appendAttributeName(char append) {
            appendAttributeName(String.valueOf(append));
        }

        final void appendAttributeValue(String append) {
            ensureAttributeValue();
            if (this.pendingAttributeValue.length() == 0) {
                this.pendingAttributeValueS = append;
            } else {
                this.pendingAttributeValue.append(append);
            }
        }

        final void appendAttributeValue(char append) {
            ensureAttributeValue();
            this.pendingAttributeValue.append(append);
        }

        final void appendAttributeValue(char[] append) {
            ensureAttributeValue();
            this.pendingAttributeValue.append(append);
        }

        final void setEmptyAttributeValue() {
            this.hasEmptyAttributeValue = true;
        }

        private void ensureAttributeValue() {
            this.hasPendingAttributeValue = true;
            if (this.pendingAttributeValueS != null) {
                this.pendingAttributeValue.append(this.pendingAttributeValueS);
                this.pendingAttributeValueS = null;
            }
        }
    }

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/parser/Token$StartTag.class */
    static final class StartTag extends Tag {
        StartTag() {
            this.attributes = new Attributes();
            this.type = TokenType.StartTag;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // org.jsoup.parser.Token.Tag, org.jsoup.parser.Token
        public Tag reset() {
            super.reset();
            this.attributes = new Attributes();
            return this;
        }

        StartTag nameAttr(String name, Attributes attributes) {
            this.tagName = name;
            this.attributes = attributes;
            return this;
        }

        public String toString() {
            if (this.attributes != null && this.attributes.size() > 0) {
                return "<" + name() + " " + this.attributes.toString() + ">";
            }
            return "<" + name() + ">";
        }
    }

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/parser/Token$EndTag.class */
    static final class EndTag extends Tag {
        EndTag() {
            this.type = TokenType.EndTag;
        }

        public String toString() {
            return "</" + name() + ">";
        }
    }

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/parser/Token$Comment.class */
    static final class Comment extends Token {
        final StringBuilder data;
        boolean bogus;

        @Override // org.jsoup.parser.Token
        Token reset() {
            reset(this.data);
            this.bogus = false;
            return this;
        }

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

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/parser/Token$Character.class */
    static final class Character extends Token {
        private String data;

        Character() {
            super();
            this.type = TokenType.Character;
        }

        @Override // org.jsoup.parser.Token
        Token reset() {
            this.data = null;
            return this;
        }

        Character data(String data) {
            this.data = data;
            return this;
        }

        String getData() {
            return this.data;
        }

        public String toString() {
            return getData();
        }
    }

    /* loaded from: jsoup-1.9.2.jar:org/jsoup/parser/Token$EOF.class */
    static final class EOF extends Token {
        EOF() {
            super();
            this.type = TokenType.EOF;
        }

        @Override // org.jsoup.parser.Token
        Token reset() {
            return this;
        }
    }

    final boolean isDoctype() {
        return this.type == TokenType.Doctype;
    }

    final Doctype asDoctype() {
        return (Doctype) this;
    }

    final boolean isStartTag() {
        return this.type == TokenType.StartTag;
    }

    final StartTag asStartTag() {
        return (StartTag) this;
    }

    final boolean isEndTag() {
        return this.type == TokenType.EndTag;
    }

    final EndTag asEndTag() {
        return (EndTag) this;
    }

    final boolean isComment() {
        return this.type == TokenType.Comment;
    }

    final Comment asComment() {
        return (Comment) this;
    }

    final boolean isCharacter() {
        return this.type == TokenType.Character;
    }

    final Character asCharacter() {
        return (Character) this;
    }

    final boolean isEOF() {
        return this.type == TokenType.EOF;
    }
}
