package org.dmfs.android.xmlmagic.builder;

import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder.class */
public class BooleanOperationObjectBuilder extends BaseAndroidObjectBuilder<Boolean> {
    private static final QualifiedName ATTR_INVERT = QualifiedName.get("invert");
    private final BooleanOperation mOperation;

    /* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/builder/BooleanOperationObjectBuilder$BooleanOperation.class */
    public enum BooleanOperation {
        or { // from class: org.dmfs.android.xmlmagic.builder.BooleanOperationObjectBuilder.BooleanOperation.1
            @Override // org.dmfs.android.xmlmagic.builder.BooleanOperationObjectBuilder.BooleanOperation
            public boolean calculate(boolean z, boolean z2) {
                return z || z2;
            }
        },
        and { // from class: org.dmfs.android.xmlmagic.builder.BooleanOperationObjectBuilder.BooleanOperation.2
            @Override // org.dmfs.android.xmlmagic.builder.BooleanOperationObjectBuilder.BooleanOperation
            public boolean calculate(boolean z, boolean z2) {
                return z && z2;
            }
        },
        xor { // from class: org.dmfs.android.xmlmagic.builder.BooleanOperationObjectBuilder.BooleanOperation.3
            @Override // org.dmfs.android.xmlmagic.builder.BooleanOperationObjectBuilder.BooleanOperation
            public boolean calculate(boolean z, boolean z2) {
                return z != z2;
            }
        };

        public abstract boolean calculate(boolean z, boolean z2);
    }

    public BooleanOperationObjectBuilder(BooleanOperation booleanOperation) {
        this.mOperation = booleanOperation;
    }

    public Boolean get(ElementDescriptor<Boolean> elementDescriptor, Boolean bool, ParserContext parserContext) throws XmlObjectPullParserException {
        parserContext.setState(false);
        return null;
    }

    public Boolean update(ElementDescriptor<Boolean> elementDescriptor, Boolean bool, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        if (qualifiedName == ATTR_INVERT) {
            parserContext.setState(Boolean.valueOf(getBooleanAttr(qualifiedName, parserContext)));
        }
        return bool;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public <V> Boolean update(ElementDescriptor<Boolean> elementDescriptor, Boolean bool, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        return !(v instanceof Boolean) ? bool : bool == null ? (Boolean) v : Boolean.valueOf(this.mOperation.calculate(bool.booleanValue(), ((Boolean) v).booleanValue()));
    }

    public Boolean finish(ElementDescriptor<Boolean> elementDescriptor, Boolean bool, ParserContext parserContext) throws XmlObjectPullParserException {
        if (bool == null) {
            bool = false;
        }
        return Boolean.valueOf(((Boolean) parserContext.getState()).booleanValue() ? !bool.booleanValue() : bool.booleanValue());
    }

    public /* bridge */ /* synthetic */ Object finish(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return finish((ElementDescriptor<Boolean>) elementDescriptor, (Boolean) obj, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, ElementDescriptor elementDescriptor2, Object obj2, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Boolean>) elementDescriptor, (Boolean) obj, (ElementDescriptor<ElementDescriptor>) elementDescriptor2, (ElementDescriptor) obj2, parserContext);
    }

    public /* bridge */ /* synthetic */ Object update(ElementDescriptor elementDescriptor, Object obj, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        return update((ElementDescriptor<Boolean>) elementDescriptor, (Boolean) obj, qualifiedName, str, parserContext);
    }

    public /* bridge */ /* synthetic */ Object get(ElementDescriptor elementDescriptor, Object obj, ParserContext parserContext) throws XmlObjectPullParserException {
        return get((ElementDescriptor<Boolean>) elementDescriptor, (Boolean) obj, parserContext);
    }
}
