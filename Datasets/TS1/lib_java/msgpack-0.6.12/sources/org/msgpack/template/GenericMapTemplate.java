package org.msgpack.template;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/GenericMapTemplate.class */
public class GenericMapTemplate implements GenericTemplate {
    Constructor<? extends Template> constructor;

    public GenericMapTemplate(TemplateRegistry registry, Class<? extends Template> tmpl) {
        try {
            this.constructor = tmpl.getConstructor(Template.class, Template.class);
            this.constructor.newInstance(new AnyTemplate(registry), new AnyTemplate(registry));
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException(e);
        } catch (InstantiationException e2) {
            throw new IllegalArgumentException(e2);
        } catch (NoSuchMethodException e3) {
            throw new IllegalArgumentException(e3);
        } catch (InvocationTargetException e4) {
            throw new IllegalArgumentException(e4);
        }
    }

    @Override // org.msgpack.template.GenericTemplate
    public Template build(Template[] params) {
        try {
            return this.constructor.newInstance(params);
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException(e);
        } catch (InstantiationException e2) {
            throw new IllegalArgumentException(e2);
        } catch (InvocationTargetException e3) {
            throw new IllegalArgumentException(e3);
        }
    }
}
