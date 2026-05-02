package javassist;

import javassist.CtField;

/* compiled from: CtClassType.java */
/* loaded from: javassist-3.18.1-GA.jar:javassist/FieldInitLink.class */
class FieldInitLink {
    FieldInitLink next = null;
    CtField field;
    CtField.Initializer init;

    FieldInitLink(CtField f, CtField.Initializer i) {
        this.field = f;
        this.init = i;
    }
}
