package org.msgpack.template.builder;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import javassist.CannotCompileException;
import javassist.CtClass;
import javassist.CtConstructor;
import javassist.CtNewConstructor;
import javassist.NotFoundException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.template.Template;
import org.msgpack.template.builder.JavassistTemplateBuilder;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/DefaultBuildContext.class */
public class DefaultBuildContext extends BuildContext<FieldEntry> {
    protected FieldEntry[] entries;
    protected Class<?> origClass;
    protected String origName;
    protected Template<?>[] templates;

    public DefaultBuildContext(JavassistTemplateBuilder director) {
        super(director);
    }

    @Override // org.msgpack.template.builder.BuildContext
    public Template buildTemplate(Class targetClass, FieldEntry[] entries, Template[] templates) {
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
        buildString("\n{\n");
        buildString("  if ($2 == null) {\n");
        buildString("    if ($3) {\n");
        buildString("      throw new %s(\"Attempted to write null\");\n", MessageTypeException.class.getName());
        buildString("    }\n");
        buildString("    $1.writeNil();\n");
        buildString("    return;\n");
        buildString("  }\n");
        buildString("  %s _$$_t = (%s) $2;\n", this.origName, this.origName);
        buildString("  $1.writeArrayBegin(%d);\n", Integer.valueOf(this.entries.length));
        for (int i = 0; i < this.entries.length; i++) {
            FieldEntry e = this.entries[i];
            if (!e.isAvailable()) {
                buildString("  $1.writeNil();\n");
            } else {
                DefaultFieldEntry de = (DefaultFieldEntry) e;
                boolean isPrivate = Modifier.isPrivate(de.getField().getModifiers());
                Class<?> type = de.getType();
                if (type.isPrimitive()) {
                    if (!isPrivate) {
                        buildString("  $1.%s(_$$_t.%s);\n", primitiveWriteName(type), de.getName());
                    } else {
                        buildString("  %s.writePrivateField($1, _$$_t, %s.class, \"%s\", templates[%d]);\n", DefaultBuildContext.class.getName(), de.getField().getDeclaringClass().getName(), de.getName(), Integer.valueOf(i));
                    }
                } else {
                    if (!isPrivate) {
                        buildString("  if (_$$_t.%s == null) {\n", de.getName());
                    } else {
                        buildString("  if (%s.readPrivateField(_$$_t, %s.class, \"%s\") == null) {\n", DefaultBuildContext.class.getName(), de.getField().getDeclaringClass().getName(), de.getName());
                    }
                    if (de.isNotNullable()) {
                        buildString("    throw new %s(\"%s cannot be null by @NotNullable\");\n", MessageTypeException.class.getName(), de.getName());
                    } else {
                        buildString("    $1.writeNil();\n");
                    }
                    buildString("  } else {\n");
                    if (!isPrivate) {
                        buildString("    templates[%d].write($1, _$$_t.%s);\n", Integer.valueOf(i), de.getName());
                    } else {
                        buildString("    %s.writePrivateField($1, _$$_t, %s.class, \"%s\", templates[%d]);\n", DefaultBuildContext.class.getName(), de.getField().getDeclaringClass().getName(), de.getName(), Integer.valueOf(i));
                    }
                    buildString("  }\n");
                }
            }
        }
        buildString("  $1.writeArrayEnd();\n");
        buildString("}\n");
        return getBuiltString();
    }

    public static Object readPrivateField(Object target, Class targetClass, String fieldName) {
        Field field = null;
        try {
            try {
                field = targetClass.getDeclaredField(fieldName);
                field.setAccessible(true);
                Object valueReference = field.get(target);
                if (field != null) {
                    field.setAccessible(false);
                }
                return valueReference;
            } catch (Exception e) {
                throw new MessageTypeException(e);
            }
        } catch (Throwable th) {
            if (field != null) {
                field.setAccessible(false);
            }
            throw th;
        }
    }

    public static void writePrivateField(Packer packer, Object target, Class targetClass, String fieldName, Template tmpl) {
        Field field = null;
        try {
            try {
                field = targetClass.getDeclaredField(fieldName);
                field.setAccessible(true);
                Object valueReference = field.get(target);
                tmpl.write(packer, valueReference);
                if (field != null) {
                    field.setAccessible(false);
                }
            } catch (Exception e) {
                throw new MessageTypeException(e);
            }
        } catch (Throwable th) {
            if (field != null) {
                field.setAccessible(false);
            }
            throw th;
        }
    }

    @Override // org.msgpack.template.builder.BuildContext
    protected String buildReadMethodBody() {
        resetStringBuilder();
        buildString("\n{\n");
        buildString("  if (!$3 && $1.trySkipNil()) {\n");
        buildString("    return null;\n");
        buildString("  }\n");
        buildString("  %s _$$_t;\n", this.origName);
        buildString("  if ($2 == null) {\n");
        buildString("    _$$_t = new %s();\n", this.origName);
        buildString("  } else {\n");
        buildString("    _$$_t = (%s) $2;\n", this.origName);
        buildString("  }\n");
        buildString("  $1.readArrayBegin();\n");
        for (int i = 0; i < this.entries.length; i++) {
            FieldEntry e = this.entries[i];
            if (!e.isAvailable()) {
                buildString("  $1.skip();\n");
            } else {
                if (e.isOptional()) {
                    buildString("  if ($1.trySkipNil()) {");
                    buildString("  } else {\n");
                }
                DefaultFieldEntry de = (DefaultFieldEntry) e;
                boolean isPrivate = Modifier.isPrivate(de.getField().getModifiers());
                Class<?> type = de.getType();
                if (type.isPrimitive()) {
                    if (!isPrivate) {
                        buildString("    _$$_t.%s = $1.%s();\n", de.getName(), primitiveReadName(type));
                    } else {
                        buildString("    %s.readPrivateField($1, _$$_t, %s.class, \"%s\", templates[%d]);\n", DefaultBuildContext.class.getName(), de.getField().getDeclaringClass().getName(), de.getName(), Integer.valueOf(i));
                    }
                } else if (!isPrivate) {
                    buildString("    _$$_t.%s = (%s) this.templates[%d].read($1, _$$_t.%s);\n", de.getName(), de.getJavaTypeName(), Integer.valueOf(i), de.getName());
                } else {
                    buildString("    %s.readPrivateField($1, _$$_t, %s.class, \"%s\", templates[%d]);\n", DefaultBuildContext.class.getName(), de.getField().getDeclaringClass().getName(), de.getName(), Integer.valueOf(i));
                }
                if (de.isOptional()) {
                    buildString("  }\n");
                }
            }
        }
        buildString("  $1.readArrayEnd();\n");
        buildString("  return _$$_t;\n");
        buildString("}\n");
        return getBuiltString();
    }

    public static void readPrivateField(Unpacker unpacker, Object target, Class targetClass, String fieldName, Template tmpl) {
        Field field = null;
        try {
            try {
                field = targetClass.getDeclaredField(fieldName);
                field.setAccessible(true);
                Object fieldReference = field.get(target);
                Object valueReference = tmpl.read(unpacker, fieldReference);
                if (valueReference != fieldReference) {
                    field.set(target, valueReference);
                }
                if (field != null) {
                    field.setAccessible(false);
                }
            } catch (Exception e) {
                throw new MessageTypeException(e);
            }
        } catch (Throwable th) {
            if (field != null) {
                field.setAccessible(false);
            }
            throw th;
        }
    }

    @Override // org.msgpack.template.builder.BuildContext
    public void writeTemplate(Class<?> targetClass, FieldEntry[] entries, Template[] templates, String directoryName) {
        this.entries = entries;
        this.templates = templates;
        this.origClass = targetClass;
        this.origName = this.origClass.getName();
        write(this.origName, directoryName);
    }

    @Override // org.msgpack.template.builder.BuildContext
    public Template loadTemplate(Class<?> targetClass, FieldEntry[] entries, Template[] templates) {
        this.entries = entries;
        this.templates = templates;
        this.origClass = targetClass;
        this.origName = this.origClass.getName();
        return load(this.origName);
    }
}
