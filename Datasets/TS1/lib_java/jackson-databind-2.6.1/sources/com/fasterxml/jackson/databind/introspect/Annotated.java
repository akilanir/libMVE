package com.fasterxml.jackson.databind.introspect;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.type.TypeBindings;
import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/introspect/Annotated.class */
public abstract class Annotated {
    public abstract <A extends Annotation> A getAnnotation(Class<A> cls);

    public abstract Annotated withAnnotations(AnnotationMap annotationMap);

    public abstract AnnotatedElement getAnnotated();

    protected abstract int getModifiers();

    public abstract String getName();

    public abstract Type getGenericType();

    public abstract Class<?> getRawType();

    public abstract Iterable<Annotation> annotations();

    protected abstract AnnotationMap getAllAnnotations();

    public abstract boolean equals(Object obj);

    public abstract int hashCode();

    public abstract String toString();

    protected Annotated() {
    }

    public final <A extends Annotation> boolean hasAnnotation(Class<A> acls) {
        return getAnnotation(acls) != null;
    }

    public final Annotated withFallBackAnnotationsFrom(Annotated annotated) {
        return withAnnotations(AnnotationMap.merge(getAllAnnotations(), annotated.getAllAnnotations()));
    }

    public final boolean isPublic() {
        return Modifier.isPublic(getModifiers());
    }

    public JavaType getType(TypeBindings context) {
        return context.resolveType(getGenericType());
    }
}
