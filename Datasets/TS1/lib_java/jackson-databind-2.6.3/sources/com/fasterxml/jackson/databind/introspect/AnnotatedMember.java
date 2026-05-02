package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.databind.util.ClassUtil;
import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.lang.reflect.Member;
import java.util.Collections;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/introspect/AnnotatedMember.class */
public abstract class AnnotatedMember extends Annotated implements Serializable {
    private static final long serialVersionUID = 1;
    protected final transient AnnotatedClass _context;
    protected final transient AnnotationMap _annotations;

    public abstract Class<?> getDeclaringClass();

    public abstract Member getMember();

    public abstract void setValue(Object obj, Object obj2) throws UnsupportedOperationException, IllegalArgumentException;

    public abstract Object getValue(Object obj) throws UnsupportedOperationException, IllegalArgumentException;

    protected AnnotatedMember(AnnotatedClass ctxt, AnnotationMap annotations) {
        this._context = ctxt;
        this._annotations = annotations;
    }

    protected AnnotatedMember(AnnotatedMember base) {
        this._context = base._context;
        this._annotations = base._annotations;
    }

    public AnnotatedClass getContextClass() {
        return this._context;
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    public Iterable<Annotation> annotations() {
        if (this._annotations == null) {
            return Collections.emptyList();
        }
        return this._annotations.annotations();
    }

    @Override // com.fasterxml.jackson.databind.introspect.Annotated
    protected AnnotationMap getAllAnnotations() {
        return this._annotations;
    }

    public final boolean addOrOverride(Annotation a) {
        return this._annotations.add(a);
    }

    public final boolean addIfNotPresent(Annotation a) {
        return this._annotations.addIfNotPresent(a);
    }

    public final void fixAccess() {
        ClassUtil.checkAndFixAccess(getMember());
    }
}
