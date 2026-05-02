package org.apache.commons.validator;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.validator.util.ValidatorUtils;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/ValidatorAction.class */
public class ValidatorAction implements Serializable {
    private static final long serialVersionUID = 1339713700053204597L;
    private transient Log log;
    private String name;
    private String classname;
    private Class validationClass;
    private String method;
    private Method validationMethod;
    private String methodParams;
    private Class[] parameterClasses;
    private String depends;
    private String msg;
    private String jsFunctionName;
    private String jsFunction;
    private String javascript;
    private Object instance;
    private List dependencyList;
    private List methodParameterList;
    static Class class$org$apache$commons$validator$ValidatorAction;

    public ValidatorAction() {
        Class cls;
        if (class$org$apache$commons$validator$ValidatorAction == null) {
            cls = class$(Validator.VALIDATOR_ACTION_PARAM);
            class$org$apache$commons$validator$ValidatorAction = cls;
        } else {
            cls = class$org$apache$commons$validator$ValidatorAction;
        }
        this.log = LogFactory.getLog(cls);
        this.name = null;
        this.classname = null;
        this.validationClass = null;
        this.method = null;
        this.validationMethod = null;
        this.methodParams = "java.lang.Object,org.apache.commons.validator.ValidatorAction,org.apache.commons.validator.Field";
        this.parameterClasses = null;
        this.depends = null;
        this.msg = null;
        this.jsFunctionName = null;
        this.jsFunction = null;
        this.javascript = null;
        this.instance = null;
        this.dependencyList = Collections.synchronizedList(new ArrayList());
        this.methodParameterList = new ArrayList();
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError().initCause(x1);
        }
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClassname() {
        return this.classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public String getMethod() {
        return this.method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getMethodParams() {
        return this.methodParams;
    }

    public void setMethodParams(String methodParams) {
        this.methodParams = methodParams;
        this.methodParameterList.clear();
        StringTokenizer st = new StringTokenizer(methodParams, ",");
        while (st.hasMoreTokens()) {
            String value = st.nextToken().trim();
            if (value != null && value.length() > 0) {
                this.methodParameterList.add(value);
            }
        }
    }

    public String getDepends() {
        return this.depends;
    }

    public void setDepends(String depends) {
        this.depends = depends;
        this.dependencyList.clear();
        StringTokenizer st = new StringTokenizer(depends, ",");
        while (st.hasMoreTokens()) {
            String depend = st.nextToken().trim();
            if (depend != null && depend.length() > 0) {
                this.dependencyList.add(depend);
            }
        }
    }

    public String getMsg() {
        return this.msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getJsFunctionName() {
        return this.jsFunctionName;
    }

    public void setJsFunctionName(String jsFunctionName) {
        this.jsFunctionName = jsFunctionName;
    }

    public void setJsFunction(String jsFunction) {
        if (this.javascript != null) {
            throw new IllegalStateException("Cannot call setJsFunction() after calling setJavascript()");
        }
        this.jsFunction = jsFunction;
    }

    public String getJavascript() {
        return this.javascript;
    }

    public void setJavascript(String javascript) {
        if (this.jsFunction != null) {
            throw new IllegalStateException("Cannot call setJavascript() after calling setJsFunction()");
        }
        this.javascript = javascript;
    }

    protected void init() {
        loadJavascriptFunction();
    }

    protected synchronized void loadJavascriptFunction() {
        if (javascriptAlreadyLoaded()) {
            return;
        }
        if (getLog().isTraceEnabled()) {
            getLog().trace("  Loading function begun");
        }
        if (this.jsFunction == null) {
            this.jsFunction = generateJsFunction();
        }
        String javascriptFileName = formatJavascriptFileName();
        if (getLog().isTraceEnabled()) {
            getLog().trace(new StringBuffer().append("  Loading js function '").append(javascriptFileName).append("'").toString());
        }
        this.javascript = readJavascriptFile(javascriptFileName);
        if (getLog().isTraceEnabled()) {
            getLog().trace("  Loading javascript function completed");
        }
    }

    private String readJavascriptFile(String javascriptFileName) {
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        if (classLoader == null) {
            classLoader = getClass().getClassLoader();
        }
        InputStream is = classLoader.getResourceAsStream(javascriptFileName);
        if (is == null) {
            is = getClass().getResourceAsStream(javascriptFileName);
        }
        if (is == null) {
            getLog().debug(new StringBuffer().append("  Unable to read javascript name ").append(javascriptFileName).toString());
            return null;
        }
        StringBuffer buffer = new StringBuffer();
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        while (true) {
            try {
                try {
                    String line = reader.readLine();
                    if (line == null) {
                        break;
                    }
                    buffer.append(line).append("\n");
                } catch (IOException e) {
                    getLog().error("Error reading javascript file.", e);
                    try {
                        reader.close();
                    } catch (IOException e2) {
                        getLog().error("Error closing stream to javascript file.", e2);
                    }
                }
            } catch (Throwable th) {
                try {
                    reader.close();
                } catch (IOException e3) {
                    getLog().error("Error closing stream to javascript file.", e3);
                }
                throw th;
            }
        }
        try {
            reader.close();
        } catch (IOException e4) {
            getLog().error("Error closing stream to javascript file.", e4);
        }
        String function = buffer.toString();
        if (function.equals("")) {
            return null;
        }
        return function;
    }

    private String formatJavascriptFileName() {
        String name = this.jsFunction.substring(1);
        if (!this.jsFunction.startsWith("/")) {
            name = new StringBuffer().append(this.jsFunction.replace('.', '/')).append(".js").toString();
        }
        return name;
    }

    private boolean javascriptAlreadyLoaded() {
        return this.javascript != null;
    }

    private String generateJsFunction() {
        StringBuffer jsName = new StringBuffer("org.apache.commons.validator.javascript");
        jsName.append(".validate");
        jsName.append(this.name.substring(0, 1).toUpperCase());
        jsName.append(this.name.substring(1, this.name.length()));
        return jsName.toString();
    }

    public boolean isDependency(String validatorName) {
        return this.dependencyList.contains(validatorName);
    }

    public List getDependencyList() {
        return Collections.unmodifiableList(this.dependencyList);
    }

    public String toString() {
        StringBuffer results = new StringBuffer("ValidatorAction: ");
        results.append(this.name);
        results.append("\n");
        return results.toString();
    }

    boolean executeValidationMethod(Field field, Map params, ValidatorResults results, int pos) throws ValidatorException {
        params.put(Validator.VALIDATOR_ACTION_PARAM, this);
        try {
            if (this.validationMethod == null) {
                synchronized (this) {
                    ClassLoader loader = getClassLoader(params);
                    loadValidationClass(loader);
                    loadParameterClasses(loader);
                    loadValidationMethod();
                }
            }
            Object[] paramValues = getParameterValues(params);
            if (field.isIndexed()) {
                handleIndexedField(field, pos, paramValues);
            }
            Object result = null;
            try {
                try {
                    try {
                        result = this.validationMethod.invoke(getValidationClassInstance(), paramValues);
                    } catch (InvocationTargetException e) {
                        if (e.getTargetException() instanceof Exception) {
                            throw ((Exception) e.getTargetException());
                        }
                        if (e.getTargetException() instanceof Error) {
                            throw ((Error) e.getTargetException());
                        }
                    }
                    boolean valid = isValid(result);
                    if (!valid || (valid && !onlyReturnErrors(params))) {
                        results.add(field, this.name, valid, result);
                    }
                    if (!valid) {
                        return false;
                    }
                    return true;
                } catch (IllegalAccessException e2) {
                    throw new ValidatorException(e2.getMessage());
                }
            } catch (IllegalArgumentException e3) {
                throw new ValidatorException(e3.getMessage());
            }
        } catch (Exception e4) {
            if (e4 instanceof ValidatorException) {
                throw ((ValidatorException) e4);
            }
            getLog().error(new StringBuffer().append("Unhandled exception thrown during validation: ").append(e4.getMessage()).toString(), e4);
            results.add(field, this.name, false);
            return false;
        }
    }

    private void loadValidationMethod() throws ValidatorException {
        if (this.validationMethod != null) {
            return;
        }
        try {
            this.validationMethod = this.validationClass.getMethod(this.method, this.parameterClasses);
        } catch (NoSuchMethodException e) {
            throw new ValidatorException(new StringBuffer().append("No such validation method: ").append(e.getMessage()).toString());
        }
    }

    private void loadValidationClass(ClassLoader loader) throws ValidatorException {
        if (this.validationClass != null) {
            return;
        }
        try {
            this.validationClass = loader.loadClass(this.classname);
        } catch (ClassNotFoundException e) {
            throw new ValidatorException(e.toString());
        }
    }

    private void loadParameterClasses(ClassLoader loader) throws ValidatorException {
        if (this.parameterClasses != null) {
            return;
        }
        Class[] parameterClasses = new Class[this.methodParameterList.size()];
        for (int i = 0; i < this.methodParameterList.size(); i++) {
            String paramClassName = (String) this.methodParameterList.get(i);
            try {
                parameterClasses[i] = loader.loadClass(paramClassName);
            } catch (ClassNotFoundException e) {
                throw new ValidatorException(e.getMessage());
            }
        }
        this.parameterClasses = parameterClasses;
    }

    private Object[] getParameterValues(Map params) {
        Object[] paramValue = new Object[this.methodParameterList.size()];
        for (int i = 0; i < this.methodParameterList.size(); i++) {
            String paramClassName = (String) this.methodParameterList.get(i);
            paramValue[i] = params.get(paramClassName);
        }
        return paramValue;
    }

    private Object getValidationClassInstance() throws ValidatorException {
        if (Modifier.isStatic(this.validationMethod.getModifiers())) {
            this.instance = null;
        } else if (this.instance == null) {
            try {
                this.instance = this.validationClass.newInstance();
            } catch (IllegalAccessException e) {
                String msg = new StringBuffer().append("Couldn't create instance of ").append(this.classname).append(".  ").append(e.getMessage()).toString();
                throw new ValidatorException(msg);
            } catch (InstantiationException e2) {
                String msg2 = new StringBuffer().append("Couldn't create instance of ").append(this.classname).append(".  ").append(e2.getMessage()).toString();
                throw new ValidatorException(msg2);
            }
        }
        return this.instance;
    }

    private void handleIndexedField(Field field, int pos, Object[] paramValues) throws ValidatorException {
        int beanIndex = this.methodParameterList.indexOf(Validator.BEAN_PARAM);
        int fieldIndex = this.methodParameterList.indexOf(Validator.FIELD_PARAM);
        Object[] indexedList = field.getIndexedProperty(paramValues[beanIndex]);
        paramValues[beanIndex] = indexedList[pos];
        Field indexedField = (Field) field.clone();
        indexedField.setKey(ValidatorUtils.replace(indexedField.getKey(), Field.TOKEN_INDEXED, new StringBuffer().append("[").append(pos).append("]").toString()));
        paramValues[fieldIndex] = indexedField;
    }

    private boolean isValid(Object result) {
        if (!(result instanceof Boolean)) {
            return result != null;
        }
        Boolean valid = (Boolean) result;
        return valid.booleanValue();
    }

    private ClassLoader getClassLoader(Map params) {
        Validator v = (Validator) params.get(Validator.VALIDATOR_PARAM);
        return v.getClassLoader();
    }

    private boolean onlyReturnErrors(Map params) {
        Validator v = (Validator) params.get(Validator.VALIDATOR_PARAM);
        return v.getOnlyReturnErrors();
    }

    private Log getLog() {
        Class cls;
        if (this.log == null) {
            if (class$org$apache$commons$validator$ValidatorAction == null) {
                cls = class$(Validator.VALIDATOR_ACTION_PARAM);
                class$org$apache$commons$validator$ValidatorAction = cls;
            } else {
                cls = class$org$apache$commons$validator$ValidatorAction;
            }
            this.log = LogFactory.getLog(cls);
        }
        return this.log;
    }
}
