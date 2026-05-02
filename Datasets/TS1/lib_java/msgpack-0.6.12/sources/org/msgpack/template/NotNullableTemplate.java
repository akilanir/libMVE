package org.msgpack.template;

import java.io.IOException;
import org.msgpack.packer.Packer;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/NotNullableTemplate.class */
public class NotNullableTemplate<T> extends AbstractTemplate<T> {
    private Template<T> tmpl;

    public NotNullableTemplate(Template<T> elementTemplate) {
        this.tmpl = elementTemplate;
    }

    @Override // org.msgpack.template.Template
    public void write(Packer pk, T v, boolean required) throws IOException {
        this.tmpl.write(pk, v, required);
    }

    @Override // org.msgpack.template.AbstractTemplate, org.msgpack.template.Template
    public void write(Packer pk, T v) throws IOException {
        write(pk, v, true);
    }

    @Override // org.msgpack.template.Template
    public T read(Unpacker u, T to, boolean required) throws IOException {
        return this.tmpl.read(u, to, required);
    }

    @Override // org.msgpack.template.AbstractTemplate, org.msgpack.template.Template
    public T read(Unpacker u, T to) throws IOException {
        return read(u, to, true);
    }
}
