package org.simpleframework.xml.stream;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/CamelCaseBuilder.class */
class CamelCaseBuilder implements Style {
    protected final boolean attribute;
    protected final boolean element;

    public CamelCaseBuilder(boolean element, boolean attribute) {
        this.attribute = attribute;
        this.element = element;
    }

    @Override // org.simpleframework.xml.stream.Style
    public String getAttribute(String name) {
        if (name != null) {
            return new Attribute(name).process();
        }
        return null;
    }

    @Override // org.simpleframework.xml.stream.Style
    public String getElement(String name) {
        if (name != null) {
            return new Element(name).process();
        }
        return null;
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/CamelCaseBuilder$Attribute.class */
    private class Attribute extends Splitter {
        private boolean capital;

        private Attribute(String source) {
            super(source);
        }

        @Override // org.simpleframework.xml.stream.Splitter
        protected void parse(char[] text, int off, int len) {
            if (CamelCaseBuilder.this.attribute || this.capital) {
                text[off] = toUpper(text[off]);
            }
            this.capital = true;
        }

        @Override // org.simpleframework.xml.stream.Splitter
        protected void commit(char[] text, int off, int len) {
            this.builder.append(text, off, len);
        }
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/stream/CamelCaseBuilder$Element.class */
    private class Element extends Attribute {
        private boolean capital;

        private Element(String source) {
            super(source);
        }

        @Override // org.simpleframework.xml.stream.CamelCaseBuilder.Attribute, org.simpleframework.xml.stream.Splitter
        protected void parse(char[] text, int off, int len) {
            if (CamelCaseBuilder.this.element || this.capital) {
                text[off] = toUpper(text[off]);
            }
            this.capital = true;
        }
    }
}
