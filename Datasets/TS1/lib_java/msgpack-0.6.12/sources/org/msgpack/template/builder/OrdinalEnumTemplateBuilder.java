package org.msgpack.template.builder;

import java.lang.reflect.Type;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.msgpack.template.OrdinalEnumTemplate;
import org.msgpack.template.Template;
import org.msgpack.template.TemplateRegistry;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/OrdinalEnumTemplateBuilder.class */
public class OrdinalEnumTemplateBuilder extends AbstractTemplateBuilder {
    private static final Logger LOG = Logger.getLogger(OrdinalEnumTemplateBuilder.class.getName());

    public OrdinalEnumTemplateBuilder(TemplateRegistry registry) {
        super(registry);
    }

    @Override // org.msgpack.template.builder.TemplateBuilder
    public boolean matchType(Type targetType, boolean hasAnnotation) {
        Class<?> targetClass = (Class) targetType;
        boolean matched = matchAtOrdinalEnumTemplateBuilder(targetClass, hasAnnotation);
        if (matched && LOG.isLoggable(Level.FINE)) {
            LOG.fine("matched type: " + targetClass.getName());
        }
        return matched;
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder
    public <T> Template<T> buildTemplate(Class<T> targetClass, FieldEntry[] entries) {
        throw new UnsupportedOperationException("fatal error: " + targetClass.getName());
    }

    @Override // org.msgpack.template.builder.AbstractTemplateBuilder, org.msgpack.template.builder.TemplateBuilder
    public <T> Template<T> buildTemplate(Type targetType) throws TemplateBuildException {
        Class<?> cls = (Class) targetType;
        checkOrdinalEnumValidation(cls);
        return new OrdinalEnumTemplate(cls);
    }

    protected void checkOrdinalEnumValidation(Class<?> targetClass) {
        if (!targetClass.isEnum()) {
            throw new TemplateBuildException("tried to build ordinal enum template of non-enum class: " + targetClass.getName());
        }
    }
}
