package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import org.simpleframework.xml.Element;
import org.simpleframework.xml.ElementList;
import org.simpleframework.xml.ElementListUnion;
import org.simpleframework.xml.ElementMap;
import org.simpleframework.xml.ElementMapUnion;
import org.simpleframework.xml.ElementUnion;
import org.simpleframework.xml.stream.Format;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ExtractorFactory.class */
class ExtractorFactory {
    private final Annotation label;
    private final Contact contact;
    private final Format format;

    public ExtractorFactory(Contact contact, Annotation label, Format format) {
        this.contact = contact;
        this.format = format;
        this.label = label;
    }

    public Extractor getInstance() throws Exception {
        return (Extractor) getInstance(this.label);
    }

    private Object getInstance(Annotation label) throws Exception {
        ExtractorBuilder builder = getBuilder(label);
        Constructor factory = builder.getConstructor();
        if (!factory.isAccessible()) {
            factory.setAccessible(true);
        }
        return factory.newInstance(this.contact, label, this.format);
    }

    private ExtractorBuilder getBuilder(Annotation label) throws Exception {
        if (label instanceof ElementUnion) {
            return new ExtractorBuilder(ElementUnion.class, ElementExtractor.class);
        }
        if (label instanceof ElementListUnion) {
            return new ExtractorBuilder(ElementListUnion.class, ElementListExtractor.class);
        }
        if (label instanceof ElementMapUnion) {
            return new ExtractorBuilder(ElementMapUnion.class, ElementMapExtractor.class);
        }
        throw new PersistenceException("Annotation %s is not a union", label);
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ExtractorFactory$ExtractorBuilder.class */
    private static class ExtractorBuilder {
        private final Class label;
        private final Class type;

        public ExtractorBuilder(Class label, Class type) {
            this.label = label;
            this.type = type;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Constructor getConstructor() throws Exception {
            return this.type.getConstructor(Contact.class, this.label, Format.class);
        }
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ExtractorFactory$ElementExtractor.class */
    private static class ElementExtractor implements Extractor<Element> {
        private final Contact contact;
        private final ElementUnion union;
        private final Format format;

        public ElementExtractor(Contact contact, ElementUnion union, Format format) throws Exception {
            this.contact = contact;
            this.format = format;
            this.union = union;
        }

        @Override // org.simpleframework.xml.core.Extractor
        public Element[] getAnnotations() {
            return this.union.value();
        }

        @Override // org.simpleframework.xml.core.Extractor
        public Label getLabel(Element element) {
            return new ElementLabel(this.contact, element, this.format);
        }

        @Override // org.simpleframework.xml.core.Extractor
        public Class getType(Element element) {
            Class type = element.type();
            if (type == Void.TYPE) {
                return this.contact.getType();
            }
            return type;
        }
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ExtractorFactory$ElementListExtractor.class */
    private static class ElementListExtractor implements Extractor<ElementList> {
        private final Contact contact;
        private final ElementListUnion union;
        private final Format format;

        public ElementListExtractor(Contact contact, ElementListUnion union, Format format) throws Exception {
            this.contact = contact;
            this.format = format;
            this.union = union;
        }

        @Override // org.simpleframework.xml.core.Extractor
        public ElementList[] getAnnotations() {
            return this.union.value();
        }

        @Override // org.simpleframework.xml.core.Extractor
        public Label getLabel(ElementList element) {
            return new ElementListLabel(this.contact, element, this.format);
        }

        @Override // org.simpleframework.xml.core.Extractor
        public Class getType(ElementList element) {
            return element.type();
        }
    }

    /* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ExtractorFactory$ElementMapExtractor.class */
    private static class ElementMapExtractor implements Extractor<ElementMap> {
        private final Contact contact;
        private final ElementMapUnion union;
        private final Format format;

        public ElementMapExtractor(Contact contact, ElementMapUnion union, Format format) throws Exception {
            this.contact = contact;
            this.format = format;
            this.union = union;
        }

        @Override // org.simpleframework.xml.core.Extractor
        public ElementMap[] getAnnotations() {
            return this.union.value();
        }

        @Override // org.simpleframework.xml.core.Extractor
        public Label getLabel(ElementMap element) {
            return new ElementMapLabel(this.contact, element, this.format);
        }

        @Override // org.simpleframework.xml.core.Extractor
        public Class getType(ElementMap element) {
            return element.valueType();
        }
    }
}
