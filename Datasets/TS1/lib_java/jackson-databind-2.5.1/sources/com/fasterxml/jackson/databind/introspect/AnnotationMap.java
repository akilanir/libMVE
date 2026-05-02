package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.databind.util.Annotations;
import java.lang.annotation.Annotation;
import java.util.Collections;
import java.util.HashMap;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/introspect/AnnotationMap.class */
public final class AnnotationMap implements Annotations {
    protected HashMap<Class<? extends Annotation>, Annotation> _annotations;

    public AnnotationMap() {
    }

    private AnnotationMap(HashMap<Class<? extends Annotation>, Annotation> a) {
        this._annotations = a;
    }

    @Override // com.fasterxml.jackson.databind.util.Annotations
    public <A extends Annotation> A get(Class<A> cls) {
        if (this._annotations == null) {
            return null;
        }
        return (A) this._annotations.get(cls);
    }

    public Iterable<Annotation> annotations() {
        if (this._annotations == null || this._annotations.size() == 0) {
            return Collections.emptyList();
        }
        return this._annotations.values();
    }

    public static AnnotationMap merge(AnnotationMap primary, AnnotationMap secondary) {
        if (primary == null || primary._annotations == null || primary._annotations.isEmpty()) {
            return secondary;
        }
        if (secondary == null || secondary._annotations == null || secondary._annotations.isEmpty()) {
            return primary;
        }
        HashMap<Class<? extends Annotation>, Annotation> annotations = new HashMap<>();
        for (Annotation ann : secondary._annotations.values()) {
            annotations.put(ann.annotationType(), ann);
        }
        for (Annotation ann2 : primary._annotations.values()) {
            annotations.put(ann2.annotationType(), ann2);
        }
        return new AnnotationMap(annotations);
    }

    @Override // com.fasterxml.jackson.databind.util.Annotations
    public int size() {
        if (this._annotations == null) {
            return 0;
        }
        return this._annotations.size();
    }

    public boolean addIfNotPresent(Annotation ann) {
        if (this._annotations == null || !this._annotations.containsKey(ann.annotationType())) {
            _add(ann);
            return true;
        }
        return false;
    }

    public boolean add(Annotation ann) {
        return _add(ann);
    }

    public String toString() {
        if (this._annotations == null) {
            return "[null]";
        }
        return this._annotations.toString();
    }

    protected final boolean _add(Annotation ann) {
        if (this._annotations == null) {
            this._annotations = new HashMap<>();
        }
        Annotation previous = this._annotations.put(ann.annotationType(), ann);
        return previous != null && previous.equals(ann);
    }
}
