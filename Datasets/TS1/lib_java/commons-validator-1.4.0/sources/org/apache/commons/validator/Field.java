package org.apache.commons.validator;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.collections.FastHashMap;
import org.apache.commons.validator.util.ValidatorUtils;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/Field.class */
public class Field implements Cloneable, Serializable {
    private static final long serialVersionUID = -8502647722530192185L;
    private static final String DEFAULT_ARG = "org.apache.commons.validator.Field.DEFAULT";
    public static final String TOKEN_INDEXED = "[]";
    protected static final String TOKEN_START = "${";
    protected static final String TOKEN_END = "}";
    protected static final String TOKEN_VAR = "var:";
    protected String property = null;
    protected String indexedProperty = null;
    protected String indexedListProperty = null;
    protected String key = null;
    protected String depends = null;
    protected int page = 0;
    protected boolean clientValidation = true;
    protected int fieldOrder = 0;
    private List dependencyList = Collections.synchronizedList(new ArrayList());
    protected FastHashMap hVars = new FastHashMap();
    protected FastHashMap hMsgs = new FastHashMap();
    protected Map[] args = new Map[0];

    public int getPage() {
        return this.page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getFieldOrder() {
        return this.fieldOrder;
    }

    public void setFieldOrder(int fieldOrder) {
        this.fieldOrder = fieldOrder;
    }

    public String getProperty() {
        return this.property;
    }

    public void setProperty(String property) {
        this.property = property;
    }

    public String getIndexedProperty() {
        return this.indexedProperty;
    }

    public void setIndexedProperty(String indexedProperty) {
        this.indexedProperty = indexedProperty;
    }

    public String getIndexedListProperty() {
        return this.indexedListProperty;
    }

    public void setIndexedListProperty(String indexedListProperty) {
        this.indexedListProperty = indexedListProperty;
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

    public void addMsg(Msg msg) {
        this.hMsgs.put(msg.getName(), msg);
    }

    public String getMsg(String key) {
        Msg msg = getMessage(key);
        if (msg == null) {
            return null;
        }
        return msg.getKey();
    }

    public Msg getMessage(String key) {
        return (Msg) this.hMsgs.get(key);
    }

    public Map getMessages() {
        return Collections.unmodifiableMap(this.hMsgs);
    }

    public boolean isClientValidation() {
        return this.clientValidation;
    }

    public void setClientValidation(boolean clientValidation) {
        this.clientValidation = clientValidation;
    }

    public void addArg(Arg arg) {
        if (arg == null || arg.getKey() == null || arg.getKey().length() == 0) {
            return;
        }
        determineArgPosition(arg);
        ensureArgsCapacity(arg);
        Map argMap = this.args[arg.getPosition()];
        if (argMap == null) {
            argMap = new HashMap();
            this.args[arg.getPosition()] = argMap;
        }
        if (arg.getName() == null) {
            argMap.put(DEFAULT_ARG, arg);
        } else {
            argMap.put(arg.getName(), arg);
        }
    }

    private void determineArgPosition(Arg arg) {
        int position = arg.getPosition();
        if (position >= 0) {
            return;
        }
        if (this.args == null || this.args.length == 0) {
            arg.setPosition(0);
            return;
        }
        String key = arg.getName() == null ? DEFAULT_ARG : arg.getName();
        int lastPosition = -1;
        int lastDefault = -1;
        for (int i = 0; i < this.args.length; i++) {
            if (this.args[i] != null && this.args[i].containsKey(key)) {
                lastPosition = i;
            }
            if (this.args[i] != null && this.args[i].containsKey(DEFAULT_ARG)) {
                lastDefault = i;
            }
        }
        if (lastPosition < 0) {
            lastPosition = lastDefault;
        }
        arg.setPosition(lastPosition + 1);
    }

    private void ensureArgsCapacity(Arg arg) {
        if (arg.getPosition() >= this.args.length) {
            Map[] newArgs = new Map[arg.getPosition() + 1];
            System.arraycopy(this.args, 0, newArgs, 0, this.args.length);
            this.args = newArgs;
        }
    }

    public Arg getArg(int position) {
        return getArg(DEFAULT_ARG, position);
    }

    public Arg getArg(String key, int position) {
        if (position >= this.args.length || this.args[position] == null) {
            return null;
        }
        Arg arg = (Arg) this.args[position].get(key);
        if (arg == null && key.equals(DEFAULT_ARG)) {
            return null;
        }
        return arg == null ? getArg(position) : arg;
    }

    public Arg[] getArgs(String key) {
        Arg[] args = new Arg[this.args.length];
        for (int i = 0; i < this.args.length; i++) {
            args[i] = getArg(key, i);
        }
        return args;
    }

    public void addVar(Var v) {
        this.hVars.put(v.getName(), v);
    }

    public void addVar(String name, String value, String jsType) {
        addVar(new Var(name, value, jsType));
    }

    public Var getVar(String mainKey) {
        return (Var) this.hVars.get(mainKey);
    }

    public String getVarValue(String mainKey) {
        String value = null;
        Object o = this.hVars.get(mainKey);
        if (o != null && (o instanceof Var)) {
            Var v = (Var) o;
            value = v.getValue();
        }
        return value;
    }

    public Map getVars() {
        return Collections.unmodifiableMap(this.hVars);
    }

    public String getKey() {
        if (this.key == null) {
            generateKey();
        }
        return this.key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public boolean isIndexed() {
        return this.indexedListProperty != null && this.indexedListProperty.length() > 0;
    }

    public void generateKey() {
        if (isIndexed()) {
            this.key = new StringBuffer().append(this.indexedListProperty).append(TOKEN_INDEXED).append(".").append(this.property).toString();
        } else {
            this.key = this.property;
        }
    }

    void process(Map globalConstants, Map constants) {
        this.hMsgs.setFast(false);
        this.hVars.setFast(true);
        generateKey();
        for (Map.Entry entry : constants.entrySet()) {
            String key2 = new StringBuffer().append(TOKEN_START).append((String) entry.getKey()).append(TOKEN_END).toString();
            String replaceValue = (String) entry.getValue();
            this.property = ValidatorUtils.replace(this.property, key2, replaceValue);
            processVars(key2, replaceValue);
            processMessageComponents(key2, replaceValue);
        }
        for (Map.Entry entry2 : globalConstants.entrySet()) {
            String key22 = new StringBuffer().append(TOKEN_START).append((String) entry2.getKey()).append(TOKEN_END).toString();
            String replaceValue2 = (String) entry2.getValue();
            this.property = ValidatorUtils.replace(this.property, key22, replaceValue2);
            processVars(key22, replaceValue2);
            processMessageComponents(key22, replaceValue2);
        }
        for (String key : this.hVars.keySet()) {
            String key23 = new StringBuffer().append("${var:").append(key).append(TOKEN_END).toString();
            Var var = getVar(key);
            processMessageComponents(key23, var.getValue());
        }
        this.hMsgs.setFast(true);
    }

    private void processVars(String key, String replaceValue) {
        for (String varKey : this.hVars.keySet()) {
            Var var = getVar(varKey);
            var.setValue(ValidatorUtils.replace(var.getValue(), key, replaceValue));
        }
    }

    private void processMessageComponents(String key, String replaceValue) {
        if (key != null && !key.startsWith("${var:")) {
            for (Msg msg : this.hMsgs.values()) {
                msg.setKey(ValidatorUtils.replace(msg.getKey(), key, replaceValue));
            }
        }
        processArg(key, replaceValue);
    }

    private void processArg(String key, String replaceValue) {
        for (int i = 0; i < this.args.length; i++) {
            Map argMap = this.args[i];
            if (argMap != null) {
                for (Arg arg : argMap.values()) {
                    if (arg != null) {
                        arg.setKey(ValidatorUtils.replace(arg.getKey(), key, replaceValue));
                    }
                }
            }
        }
    }

    public boolean isDependency(String validatorName) {
        return this.dependencyList.contains(validatorName);
    }

    public List getDependencyList() {
        return Collections.unmodifiableList(this.dependencyList);
    }

    public Object clone() {
        try {
            Field field = (Field) super.clone();
            field.args = new Map[this.args.length];
            for (int i = 0; i < this.args.length; i++) {
                if (this.args[i] != null) {
                    Map argMap = new HashMap(this.args[i]);
                    for (Map.Entry entry : argMap.entrySet()) {
                        String validatorName = (String) entry.getKey();
                        Arg arg = (Arg) entry.getValue();
                        argMap.put(validatorName, arg.clone());
                    }
                    field.args[i] = argMap;
                }
            }
            field.hVars = ValidatorUtils.copyFastHashMap(this.hVars);
            field.hMsgs = ValidatorUtils.copyFastHashMap(this.hMsgs);
            return field;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e.toString());
        }
    }

    public String toString() {
        StringBuffer results = new StringBuffer();
        results.append(new StringBuffer().append("\t\tkey = ").append(this.key).append("\n").toString());
        results.append(new StringBuffer().append("\t\tproperty = ").append(this.property).append("\n").toString());
        results.append(new StringBuffer().append("\t\tindexedProperty = ").append(this.indexedProperty).append("\n").toString());
        results.append(new StringBuffer().append("\t\tindexedListProperty = ").append(this.indexedListProperty).append("\n").toString());
        results.append(new StringBuffer().append("\t\tdepends = ").append(this.depends).append("\n").toString());
        results.append(new StringBuffer().append("\t\tpage = ").append(this.page).append("\n").toString());
        results.append(new StringBuffer().append("\t\tfieldOrder = ").append(this.fieldOrder).append("\n").toString());
        if (this.hVars != null) {
            results.append("\t\tVars:\n");
            for (Object key : this.hVars.keySet()) {
                results.append("\t\t\t");
                results.append(key);
                results.append("=");
                results.append(this.hVars.get(key));
                results.append("\n");
            }
        }
        return results.toString();
    }

    Object[] getIndexedProperty(Object bean) throws ValidatorException {
        try {
            Object indexedProperty = PropertyUtils.getProperty(bean, getIndexedListProperty());
            if (indexedProperty instanceof Collection) {
                return ((Collection) indexedProperty).toArray();
            }
            if (indexedProperty.getClass().isArray()) {
                return (Object[]) indexedProperty;
            }
            throw new ValidatorException(new StringBuffer().append(getKey()).append(" is not indexed").toString());
        } catch (IllegalAccessException e) {
            throw new ValidatorException(e.getMessage());
        } catch (NoSuchMethodException e2) {
            throw new ValidatorException(e2.getMessage());
        } catch (InvocationTargetException e3) {
            throw new ValidatorException(e3.getMessage());
        }
    }

    private int getIndexedPropertySize(Object bean) throws ValidatorException {
        try {
            Object indexedProperty = PropertyUtils.getProperty(bean, getIndexedListProperty());
            if (indexedProperty == null) {
                return 0;
            }
            if (indexedProperty instanceof Collection) {
                return ((Collection) indexedProperty).size();
            }
            if (indexedProperty.getClass().isArray()) {
                return ((Object[]) indexedProperty).length;
            }
            throw new ValidatorException(new StringBuffer().append(getKey()).append(" is not indexed").toString());
        } catch (IllegalAccessException e) {
            throw new ValidatorException(e.getMessage());
        } catch (NoSuchMethodException e2) {
            throw new ValidatorException(e2.getMessage());
        } catch (InvocationTargetException e3) {
            throw new ValidatorException(e3.getMessage());
        }
    }

    private boolean validateForRule(ValidatorAction va, ValidatorResults results, Map actions, Map params, int pos) throws ValidatorException {
        ValidatorResult result = results.getValidatorResult(getKey());
        if (result != null && result.containsAction(va.getName())) {
            return result.isValid(va.getName());
        }
        if (!runDependentValidators(va, results, actions, params, pos)) {
            return false;
        }
        return va.executeValidationMethod(this, params, results, pos);
    }

    private boolean runDependentValidators(ValidatorAction va, ValidatorResults results, Map actions, Map params, int pos) throws ValidatorException {
        List<String> dependentValidators = va.getDependencyList();
        if (dependentValidators.isEmpty()) {
            return true;
        }
        for (String depend : dependentValidators) {
            ValidatorAction action = (ValidatorAction) actions.get(depend);
            if (action == null) {
                handleMissingAction(depend);
            }
            if (!validateForRule(action, results, actions, params, pos)) {
                return false;
            }
        }
        return true;
    }

    public ValidatorResults validate(Map params, Map actions) throws ValidatorException {
        if (getDepends() == null) {
            return new ValidatorResults();
        }
        ValidatorResults allResults = new ValidatorResults();
        Object bean = params.get(Validator.BEAN_PARAM);
        int numberOfFieldsToValidate = isIndexed() ? getIndexedPropertySize(bean) : 1;
        for (int fieldNumber = 0; fieldNumber < numberOfFieldsToValidate; fieldNumber++) {
            ValidatorResults results = new ValidatorResults();
            for (String depend : this.dependencyList) {
                ValidatorAction action = (ValidatorAction) actions.get(depend);
                if (action == null) {
                    handleMissingAction(depend);
                }
                boolean good = validateForRule(action, results, actions, params, fieldNumber);
                if (!good) {
                    allResults.merge(results);
                    return allResults;
                }
            }
            allResults.merge(results);
        }
        return allResults;
    }

    private void handleMissingAction(String name) throws ValidatorException {
        throw new ValidatorException(new StringBuffer().append("No ValidatorAction named ").append(name).append(" found for field ").append(getProperty()).toString());
    }

    protected Map getMsgMap() {
        return this.hMsgs;
    }

    protected Map getVarMap() {
        return this.hVars;
    }
}
