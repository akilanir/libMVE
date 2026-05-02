package org.dmfs.xmlobjects.pull;

import java.io.IOException;
import java.util.LinkedList;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.XmlContext;
import org.dmfs.xmlobjects.builder.IObjectBuilder;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/pull/XmlObjectPull.class */
public class XmlObjectPull {
    private final XmlPullParser mParser;
    private final XmlPath mCurrentElementDescriptorPath;
    private final LinkedList<Object> mObjectStack;
    private IObjectBuilder<?> mCurrentBuilder;
    private XmlContext mContext;
    private ParserContext mParserContext;

    public XmlObjectPull(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        this(xmlPullParser, new ParserContext());
    }

    public XmlObjectPull(XmlPullParser xmlPullParser, ParserContext parserContext) throws XmlPullParserException, IOException {
        this.mCurrentElementDescriptorPath = new XmlPath((ElementDescriptor<?>[]) new ElementDescriptor[0]);
        this.mObjectStack = new LinkedList<>();
        this.mParser = xmlPullParser;
        this.mParserContext = parserContext;
        this.mParserContext.setXmlPullParser(xmlPullParser);
        this.mParserContext.setObjectPullParser(this);
        xmlPullParser.next();
    }

    public void setContext(XmlContext xmlContext) {
        this.mContext = xmlContext;
    }

    public <T> boolean moveToNext(ElementDescriptor<T> elementDescriptor, XmlPath xmlPath) throws XmlPullParserException, XmlObjectPullParserException, IOException {
        pullInternal(elementDescriptor, null, xmlPath, true, false);
        return !isEndOfDocument();
    }

    public <T> boolean moveToNextSibling(ElementDescriptor<T> elementDescriptor, XmlPath xmlPath) throws XmlPullParserException, XmlObjectPullParserException, IOException {
        return pullInternal(elementDescriptor, null, xmlPath, true, true) != null || this.mParser.getDepth() == xmlPath.length() + 1;
    }

    public boolean isEndOfDocument() throws XmlPullParserException {
        return this.mParser.getEventType() == 1;
    }

    public QualifiedName getCurrentElementQualifiedName() {
        XmlPullParser xmlPullParser = this.mParser;
        return QualifiedName.get(xmlPullParser.getNamespace(), xmlPullParser.getName());
    }

    public ElementDescriptor<?> getCurrentElementDescriptor() {
        return this.mCurrentElementDescriptorPath.peek();
    }

    public int getCurrentDepth() {
        return this.mCurrentElementDescriptorPath.length();
    }

    public <T> T pull(ElementDescriptor<T> elementDescriptor, T t, XmlPath xmlPath) throws XmlPullParserException, IOException, XmlObjectPullParserException {
        return (T) pullInternal(elementDescriptor, t, xmlPath, false, false);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v84, types: [java.lang.Object] */
    private <T, U, V> T pullInternal(ElementDescriptor<T> elementDescriptor, T t, XmlPath xmlPath, boolean z, boolean z2) throws XmlPullParserException, IOException, XmlObjectPullParserException {
        if (elementDescriptor.getContext() != this.mContext && elementDescriptor.getContext() != ElementDescriptor.DEFAULT_CONTEXT) {
            throw new IllegalArgumentException("type is from an invalid context");
        }
        ParserContext parserContext = this.mParserContext;
        XmlPullParser xmlPullParser = this.mParser;
        IObjectBuilder<?> iObjectBuilder = this.mCurrentBuilder;
        XmlPath xmlPath2 = this.mCurrentElementDescriptorPath;
        LinkedList<Object> linkedList = this.mObjectStack;
        ElementDescriptor peek = this.mCurrentElementDescriptorPath.peek();
        int i = Integer.MAX_VALUE;
        T t2 = t;
        Object peek2 = linkedList.peek();
        while (true) {
            int eventType = xmlPullParser.getEventType();
            int depth = xmlPullParser.getDepth();
            switch (eventType) {
                case 1:
                    return null;
                case 2:
                    if (depth < i) {
                        ElementDescriptor elementDescriptor2 = ElementDescriptor.get(QualifiedName.get(xmlPullParser.getNamespace(), xmlPullParser.getName()), peek, this.mContext);
                        if (elementDescriptor2 == null) {
                            i = depth;
                            break;
                        } else {
                            peek = elementDescriptor2;
                            if (!z || elementDescriptor != peek || !xmlPath.matches(xmlPath2)) {
                                if (t2 == null) {
                                    t2 = parserContext.getRecycled(peek);
                                }
                                xmlPath2.append(peek);
                                IObjectBuilder<T> iObjectBuilder2 = peek.builder;
                                this.mCurrentBuilder = iObjectBuilder2;
                                iObjectBuilder = iObjectBuilder2;
                                peek2 = iObjectBuilder.get(peek, t2, parserContext);
                                t2 = null;
                                int attributeCount = xmlPullParser.getAttributeCount();
                                for (int i2 = 0; i2 < attributeCount; i2++) {
                                    peek2 = iObjectBuilder.update((ElementDescriptor<ElementDescriptor>) peek, (ElementDescriptor) peek2, QualifiedName.get(xmlPullParser.getAttributeNamespace(i2), xmlPullParser.getAttributeName(i2)), xmlPullParser.getAttributeValue(i2), parserContext);
                                }
                                linkedList.addFirst(peek2);
                                break;
                            } else {
                                return null;
                            }
                        }
                    } else {
                        continue;
                    }
                case 3:
                    if (depth < i) {
                        if (z2 && depth - 1 < xmlPath.length()) {
                            return null;
                        }
                        T t3 = (T) iObjectBuilder.finish(peek, peek2, parserContext);
                        ElementDescriptor elementDescriptor3 = peek;
                        xmlPath2.pop();
                        linkedList.removeFirst();
                        peek = xmlPath2.peek();
                        Object peek3 = linkedList.peek();
                        if (peek != null) {
                            IObjectBuilder<T> iObjectBuilder3 = peek.builder;
                            this.mCurrentBuilder = iObjectBuilder3;
                            iObjectBuilder = iObjectBuilder3;
                        }
                        if (elementDescriptor != elementDescriptor3 || z || !xmlPath2.matches(xmlPath)) {
                            peek2 = iObjectBuilder.update((ElementDescriptor<ElementDescriptor>) peek, (ElementDescriptor) peek3, (ElementDescriptor<ElementDescriptor>) elementDescriptor3, (ElementDescriptor) t3, parserContext);
                            break;
                        } else {
                            xmlPullParser.next();
                            return t3;
                        }
                    } else if (depth == i) {
                        i = Integer.MAX_VALUE;
                        break;
                    } else {
                        break;
                    }
                    break;
                case 4:
                    if (depth < i) {
                        peek2 = iObjectBuilder.update(peek, peek2, xmlPullParser.getText(), parserContext);
                        break;
                    } else {
                        break;
                    }
            }
            xmlPullParser.next();
        }
    }
}
