package org.msgpack.template.builder;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.logging.Logger;
import javassist.CannotCompileException;
import javassist.CtClass;
import javassist.CtMethod;
import javassist.CtNewMethod;
import javassist.NotFoundException;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;
import org.msgpack.template.Template;
import org.msgpack.template.builder.FieldEntry;
import org.msgpack.unpacker.Unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/BuildContext.class */
public abstract class BuildContext<T extends FieldEntry> {
    private static Logger LOG = Logger.getLogger(BuildContext.class.getName());
    protected JavassistTemplateBuilder director;
    protected String tmplName;
    protected CtClass tmplCtClass;
    protected StringBuilder stringBuilder = null;

    protected abstract Template buildTemplate(Class<?> cls, T[] tArr, Template[] templateArr);

    protected abstract void setSuperClass() throws CannotCompileException, NotFoundException;

    protected abstract void buildConstructor() throws CannotCompileException, NotFoundException;

    protected abstract Template buildInstance(Class<?> cls) throws NoSuchMethodException, InstantiationException, IllegalAccessException, InvocationTargetException;

    protected abstract String buildWriteMethodBody();

    protected abstract String buildReadMethodBody();

    protected abstract void writeTemplate(Class<?> cls, T[] tArr, Template[] templateArr, String str);

    protected abstract Template loadTemplate(Class<?> cls, T[] tArr, Template[] templateArr);

    public BuildContext(JavassistTemplateBuilder director) {
        this.director = director;
    }

    protected Template build(String className) {
        try {
            reset(className, false);
            LOG.fine(String.format("started generating template class %s for original class %s", this.tmplCtClass.getName(), className));
            buildClass();
            buildConstructor();
            buildMethodInit();
            buildWriteMethod();
            buildReadMethod();
            LOG.fine(String.format("finished generating template class %s for original class %s", this.tmplCtClass.getName(), className));
            return buildInstance(createClass());
        } catch (Exception e) {
            String code = getBuiltString();
            if (code != null) {
                LOG.severe("builder: " + code);
                throw new TemplateBuildException("Cannot compile: " + code, e);
            }
            throw new TemplateBuildException(e);
        }
    }

    protected void reset(String className, boolean isWritten) {
        String tmplName;
        if (!isWritten) {
            tmplName = className + "_$$_Template_" + this.director.hashCode() + "_" + this.director.nextSeqId();
        } else {
            tmplName = className + "_$$_Template";
        }
        this.tmplCtClass = this.director.makeCtClass(tmplName);
    }

    protected void buildClass() throws CannotCompileException, NotFoundException {
        setSuperClass();
        this.tmplCtClass.addInterface(this.director.getCtClass(Template.class.getName()));
    }

    protected void buildMethodInit() {
    }

    protected void buildWriteMethod() throws CannotCompileException, NotFoundException {
        LOG.fine(String.format("started generating write method in template class %s", this.tmplCtClass.getName()));
        String mbody = buildWriteMethodBody();
        CtClass returnType = CtClass.voidType;
        CtClass[] paramTypes = {this.director.getCtClass(Packer.class.getName()), this.director.getCtClass(Object.class.getName()), CtClass.booleanType};
        CtClass[] exceptTypes = {this.director.getCtClass(IOException.class.getName())};
        LOG.fine(String.format("compiling write method body: %s", mbody));
        CtMethod newCtMethod = CtNewMethod.make(1, returnType, "write", paramTypes, exceptTypes, mbody, this.tmplCtClass);
        this.tmplCtClass.addMethod(newCtMethod);
        LOG.fine(String.format("finished generating write method in template class %s", this.tmplCtClass.getName()));
    }

    protected void buildReadMethod() throws CannotCompileException, NotFoundException {
        LOG.fine(String.format("started generating read method in template class %s", this.tmplCtClass.getName()));
        String mbody = buildReadMethodBody();
        CtClass returnType = this.director.getCtClass(Object.class.getName());
        CtClass[] paramTypes = {this.director.getCtClass(Unpacker.class.getName()), this.director.getCtClass(Object.class.getName()), CtClass.booleanType};
        CtClass[] exceptTypes = {this.director.getCtClass(MessageTypeException.class.getName())};
        LOG.fine(String.format("compiling read method body: %s", mbody));
        CtMethod newCtMethod = CtNewMethod.make(1, returnType, "read", paramTypes, exceptTypes, mbody, this.tmplCtClass);
        this.tmplCtClass.addMethod(newCtMethod);
        LOG.fine(String.format("finished generating read method in template class %s", this.tmplCtClass.getName()));
    }

    protected Class<?> createClass() throws CannotCompileException {
        return this.tmplCtClass.toClass(this.director.getClassLoader(), getClass().getProtectionDomain());
    }

    protected void saveClass(String directoryName) throws CannotCompileException, IOException {
        this.tmplCtClass.writeFile(directoryName);
    }

    protected void resetStringBuilder() {
        this.stringBuilder = new StringBuilder();
    }

    protected void buildString(String str) {
        this.stringBuilder.append(str);
    }

    protected void buildString(String format, Object... args) {
        this.stringBuilder.append(String.format(format, args));
    }

    protected String getBuiltString() {
        if (this.stringBuilder == null) {
            return null;
        }
        return this.stringBuilder.toString();
    }

    protected String primitiveWriteName(Class<?> type) {
        return "write";
    }

    protected String primitiveReadName(Class<?> type) {
        if (type == Boolean.TYPE) {
            return "readBoolean";
        }
        if (type == Byte.TYPE) {
            return "readByte";
        }
        if (type == Short.TYPE) {
            return "readShort";
        }
        if (type == Integer.TYPE) {
            return "readInt";
        }
        if (type == Long.TYPE) {
            return "readLong";
        }
        if (type == Float.TYPE) {
            return "readFloat";
        }
        if (type == Double.TYPE) {
            return "readDouble";
        }
        if (type == Character.TYPE) {
            return "readInt";
        }
        return null;
    }

    protected void write(String className, String directoryName) {
        try {
            reset(className, true);
            buildClass();
            buildConstructor();
            buildMethodInit();
            buildWriteMethod();
            buildReadMethod();
            saveClass(directoryName);
        } catch (Exception e) {
            String code = getBuiltString();
            if (code != null) {
                LOG.severe("builder: " + code);
                throw new TemplateBuildException("Cannot compile: " + code, e);
            }
            throw new TemplateBuildException(e);
        }
    }

    protected Template load(String className) {
        String tmplName = className + "_$$_Template";
        try {
            Class<?> tmplClass = getClass().getClassLoader().loadClass(tmplName);
            return buildInstance(tmplClass);
        } catch (ClassNotFoundException e) {
            return null;
        } catch (Exception e2) {
            String code = getBuiltString();
            if (code != null) {
                LOG.severe("builder: " + code);
                throw new TemplateBuildException("Cannot compile: " + code, e2);
            }
            throw new TemplateBuildException(e2);
        }
    }
}
