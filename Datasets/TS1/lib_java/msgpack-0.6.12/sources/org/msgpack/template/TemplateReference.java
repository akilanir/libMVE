package org.msgpack.template;

import java.io.IOException;
import java.lang.reflect.Type;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/TemplateReference.class */
public class TemplateReference<T> extends AbstractTemplate<T> {
    private TemplateRegistry registry;
    private Type targetType;
    private Template<T> actualTemplate;

    public TemplateReference(TemplateRegistry registry, Type targetType) {
        this.registry = registry;
        this.targetType = targetType;
    }

    private void validateActualTemplate() {
        if (this.actualTemplate == null) {
            this.actualTemplate = (Template) this.registry.cache.get(this.targetType);
            if (this.actualTemplate == null) {
                throw new MessageTypeException("Actual template have not been created");
            }
        }
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, T v, boolean required) throws IOException {
        validateActualTemplate();
        this.actualTemplate.write(pk, v, required);
    }

    @Override // org.msgpack.template.AbstractTemplate, org.msgpack.template.Template
    public void write(Packer pk, T v) throws IOException {
        validateActualTemplate();
        this.actualTemplate.write(pk, v, false);
    }

    @Override // org.msgpack.template.Template
    public T read(Unpacker u, T to, boolean required) throws IOException {
        validateActualTemplate();
        return this.actualTemplate.read(u, to, required);
    }

    @Override // org.msgpack.template.AbstractTemplate, org.msgpack.template.Template
    public T read(Unpacker u, T to) throws IOException {
        validateActualTemplate();
        return this.actualTemplate.read(u, to, false);
    }
}
