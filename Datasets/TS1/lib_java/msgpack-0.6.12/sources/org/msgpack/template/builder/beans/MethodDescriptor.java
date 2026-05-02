package org.msgpack.template.builder.beans;

import java.lang.reflect.Method;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/MethodDescriptor.class */
public class MethodDescriptor extends FeatureDescriptor {
    private Method method;
    private ParameterDescriptor[] parameterDescriptors;

    public MethodDescriptor(Method method, ParameterDescriptor[] parameterDescriptors) {
        if (method == null) {
            throw new NullPointerException();
        }
        this.method = method;
        this.parameterDescriptors = parameterDescriptors;
        setName(method.getName());
    }

    public MethodDescriptor(Method method) {
        if (method == null) {
            throw new NullPointerException();
        }
        this.method = method;
        setName(method.getName());
    }

    public Method getMethod() {
        return this.method;
    }

    public ParameterDescriptor[] getParameterDescriptors() {
        return this.parameterDescriptors;
    }

    void merge(MethodDescriptor anotherMethod) {
        super.merge((FeatureDescriptor) anotherMethod);
        if (this.method == null) {
            this.method = anotherMethod.method;
        }
        if (this.parameterDescriptors == null) {
            this.parameterDescriptors = anotherMethod.parameterDescriptors;
        }
    }
}
