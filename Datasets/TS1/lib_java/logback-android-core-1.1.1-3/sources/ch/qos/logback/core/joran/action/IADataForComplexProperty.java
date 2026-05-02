package ch.qos.logback.core.joran.action;

import ch.qos.logback.core.joran.util.PropertySetter;
import ch.qos.logback.core.util.AggregationType;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/action/IADataForComplexProperty.class */
public class IADataForComplexProperty {
    final PropertySetter parentBean;
    final AggregationType aggregationType;
    final String complexPropertyName;
    private Object nestedComplexProperty;
    boolean inError;

    public IADataForComplexProperty(PropertySetter propertySetter, AggregationType aggregationType, String str) {
        this.parentBean = propertySetter;
        this.aggregationType = aggregationType;
        this.complexPropertyName = str;
    }

    public AggregationType getAggregationType() {
        return this.aggregationType;
    }

    public Object getNestedComplexProperty() {
        return this.nestedComplexProperty;
    }

    public String getComplexPropertyName() {
        return this.complexPropertyName;
    }

    public void setNestedComplexProperty(Object obj) {
        this.nestedComplexProperty = obj;
    }
}
