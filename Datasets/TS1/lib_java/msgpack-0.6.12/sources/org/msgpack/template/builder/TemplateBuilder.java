package org.msgpack.template.builder;

import java.lang.reflect.Type;
import org.msgpack.template.FieldList;
import org.msgpack.template.Template;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/TemplateBuilder.class */
public interface TemplateBuilder {
    boolean matchType(Type type, boolean z);

    <T> Template<T> buildTemplate(Type type) throws TemplateBuildException;

    <T> Template<T> buildTemplate(Class<T> cls, FieldList fieldList) throws TemplateBuildException;

    void writeTemplate(Type type, String str);

    <T> Template<T> loadTemplate(Type type);
}
