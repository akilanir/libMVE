package org.mozilla.javascript;

/* compiled from: JavaMembers.java */
/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/BeanProperty.class */
class BeanProperty {
    MemberBox getter;
    MemberBox setter;
    NativeJavaMethod setters;

    BeanProperty(MemberBox getter, MemberBox setter, NativeJavaMethod setters) {
        this.getter = getter;
        this.setter = setter;
        this.setters = setters;
    }
}
