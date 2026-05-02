package org.msgpack.template.builder;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import javassist.CannotCompileException;
import javassist.CtClass;
import javassist.CtConstructor;
import javassist.CtNewConstructor;
import javassist.NotFoundException;
import org.msgpack.MessageTypeException;
import org.msgpack.template.Template;
import org.msgpack.template.builder.JavassistTemplateBuilder;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/BeansBuildContext.class */
public class BeansBuildContext extends BuildContext<BeansFieldEntry> {
    protected BeansFieldEntry[] entries;
    protected Class<?> origClass;
    protected String origName;
    protected Template<?>[] templates;

    @Override // org.msgpack.template.builder.BuildContext
    public /* bridge */ /* synthetic */ Template loadTemplate(Class x0, FieldEntry[] x1, Template[] x2) {
        return loadTemplate((Class<?>) x0, (BeansFieldEntry[]) x1, x2);
    }

    @Override // org.msgpack.template.builder.BuildContext
    public /* bridge */ /* synthetic */ void writeTemplate(Class x0, FieldEntry[] x1, Template[] x2, String x3) {
        writeTemplate((Class<?>) x0, (BeansFieldEntry[]) x1, x2, x3);
    }

    @Override // org.msgpack.template.builder.BuildContext
    public /* bridge */ /* synthetic */ Template buildTemplate(Class x0, FieldEntry[] x1, Template[] x2) {
        return buildTemplate((Class<?>) x0, (BeansFieldEntry[]) x1, x2);
    }

    public BeansBuildContext(JavassistTemplateBuilder director) {
        super(director);
    }

    public Template buildTemplate(Class<?> targetClass, BeansFieldEntry[] entries, Template[] templates) {
        this.entries = entries;
        this.templates = templates;
        this.origClass = targetClass;
        this.origName = this.origClass.getName();
        return build(this.origName);
    }

    @Override // org.msgpack.template.builder.BuildContext
    protected void setSuperClass() throws CannotCompileException, NotFoundException {
        this.tmplCtClass.setSuperclass(this.director.getCtClass(JavassistTemplateBuilder.JavassistTemplate.class.getName()));
    }

    @Override // org.msgpack.template.builder.BuildContext
    protected void buildConstructor() throws CannotCompileException, NotFoundException {
        CtConstructor newCtCons = CtNewConstructor.make(new CtClass[]{this.director.getCtClass(Class.class.getName()), this.director.getCtClass(Template.class.getName() + "[]")}, new CtClass[0], this.tmplCtClass);
        this.tmplCtClass.addConstructor(newCtCons);
    }

    @Override // org.msgpack.template.builder.BuildContext
    protected Template buildInstance(Class<?> c) throws NoSuchMethodException, InstantiationException, IllegalAccessException, InvocationTargetException {
        Constructor<?> cons = c.getConstructor(Class.class, Template[].class);
        Object tmpl = cons.newInstance(this.origClass, this.templates);
        return (Template) tmpl;
    }

    @Override // org.msgpack.template.builder.BuildContext
    protected void buildMethodInit() {
    }

    @Override // org.msgpack.template.builder.BuildContext
    protected String buildWriteMethodBody() {
        resetStringBuilder();
        buildString("{");
        buildString("if($2 == null) {");
        buildString("  if($3) {");
        buildString("    throw new %s(\"Attempted to write null\");", MessageTypeException.class.getName());
        buildString("  }");
        buildString("  $1.writeNil();");
        buildString("  return;");
        buildString("}");
        buildString("%s _$$_t = (%s)$2;", this.origName, this.origName);
        buildString("$1.writeArrayBegin(%d);", Integer.valueOf(this.entries.length));
        for (int i = 0; i < this.entries.length; i++) {
            BeansFieldEntry e = this.entries[i];
            if (!e.isAvailable()) {
                buildString("$1.writeNil();");
            } else {
                Class<?> type = e.getType();
                if (type.isPrimitive()) {
                    buildString("$1.%s(_$$_t.%s());", primitiveWriteName(type), e.getGetterName());
                } else {
                    buildString("if(_$$_t.%s() == null) {", e.getGetterName());
                    if (e.isNotNullable()) {
                        buildString("throw new %s();", MessageTypeException.class.getName());
                    } else {
                        buildString("$1.writeNil();");
                    }
                    buildString("} else {");
                    buildString("  this.templates[%d].write($1, _$$_t.%s());", Integer.valueOf(i), e.getGetterName());
                    buildString("}");
                }
            }
        }
        buildString("$1.writeArrayEnd();");
        buildString("}");
        return getBuiltString();
    }

    @Override // org.msgpack.template.builder.BuildContext
    protected String buildReadMethodBody() {
        resetStringBuilder();
        buildString("{ ");
        buildString("if(!$3 && $1.trySkipNil()) {");
        buildString("  return null;");
        buildString("}");
        buildString("%s _$$_t;", this.origName);
        buildString("if($2 == null) {");
        buildString("  _$$_t = new %s();", this.origName);
        buildString("} else {");
        buildString("  _$$_t = (%s)$2;", this.origName);
        buildString("}");
        buildString("$1.readArrayBegin();");
        for (int i = 0; i < this.entries.length; i++) {
            BeansFieldEntry e = this.entries[i];
            if (!e.isAvailable()) {
                buildString("$1.skip();");
            } else {
                if (e.isOptional()) {
                    buildString("if($1.trySkipNil()) {");
                    buildString("_$$_t.%s(null);", e.getSetterName());
                    buildString("} else {");
                }
                Class<?> type = e.getType();
                if (type.isPrimitive()) {
                    buildString("_$$_t.%s( $1.%s() );", e.getSetterName(), primitiveReadName(type));
                } else {
                    buildString("_$$_t.%s( (%s)this.templates[%d].read($1, _$$_t.%s()) );", e.getSetterName(), e.getJavaTypeName(), Integer.valueOf(i), e.getGetterName());
                }
                if (e.isOptional()) {
                    buildString("}");
                }
            }
        }
        buildString("$1.readArrayEnd();");
        buildString("return _$$_t;");
        buildString("}");
        return getBuiltString();
    }

    public void writeTemplate(Class<?> targetClass, BeansFieldEntry[] entries, Template[] templates, String directoryName) {
        throw new UnsupportedOperationException(targetClass.getName());
    }

    public Template loadTemplate(Class<?> targetClass, BeansFieldEntry[] entries, Template[] templates) {
        return null;
    }
}
