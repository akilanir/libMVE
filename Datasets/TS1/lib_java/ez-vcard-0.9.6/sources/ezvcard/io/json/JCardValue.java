package ezvcard.io.json;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/json/JCardValue.class */
public class JCardValue {
    private final List<JsonValue> values;

    public JCardValue(List<JsonValue> values) {
        this.values = Collections.unmodifiableList(values);
    }

    public JCardValue(JsonValue... values) {
        this.values = Arrays.asList(values);
    }

    public static JCardValue single(Object value) {
        return new JCardValue(new JsonValue(value));
    }

    public static JCardValue multi(Object... values) {
        return multi((List<?>) Arrays.asList(values));
    }

    public static JCardValue multi(List<?> values) {
        List<JsonValue> multiValues = new ArrayList<>(values.size());
        for (Object value : values) {
            multiValues.add(new JsonValue(value));
        }
        return new JCardValue(multiValues);
    }

    public static JCardValue structured(Object... values) {
        List<List<?>> valuesList = new ArrayList<>(values.length);
        for (Object value : values) {
            List<?> list = value instanceof List ? (List) value : Arrays.asList(value);
            valuesList.add(list);
        }
        return structured(valuesList);
    }

    public static JCardValue structured(List<List<?>> values) {
        List<JsonValue> array = new ArrayList<>(values.size());
        for (List<?> list : values) {
            if (list.isEmpty()) {
                array.add(new JsonValue(""));
            } else if (list.size() == 1) {
                Object value = list.get(0);
                if (value == null) {
                    value = "";
                }
                array.add(new JsonValue(value));
            } else {
                List<JsonValue> subArray = new ArrayList<>(list.size());
                for (Object value2 : list) {
                    if (value2 == null) {
                        value2 = "";
                    }
                    subArray.add(new JsonValue(value2));
                }
                array.add(new JsonValue(subArray));
            }
        }
        return new JCardValue(new JsonValue(array));
    }

    public List<JsonValue> getValues() {
        return this.values;
    }

    public String asSingle() {
        Object obj;
        if (this.values.isEmpty()) {
            return "";
        }
        JsonValue first = this.values.get(0);
        if (first.isNull()) {
            return "";
        }
        Object obj2 = first.getValue();
        if (obj2 != null) {
            return obj2.toString();
        }
        List<JsonValue> array = first.getArray();
        if (array != null && !array.isEmpty() && (obj = array.get(0).getValue()) != null) {
            return obj.toString();
        }
        return "";
    }

    public List<List<String>> asStructured() {
        if (this.values.isEmpty()) {
            return Collections.emptyList();
        }
        JsonValue first = this.values.get(0);
        List<JsonValue> array = first.getArray();
        if (array != null) {
            List<List<String>> valuesStr = new ArrayList<>(array.size());
            for (JsonValue value : array) {
                if (value.isNull()) {
                    valuesStr.add(Arrays.asList(""));
                } else {
                    Object obj = value.getValue();
                    if (obj != null) {
                        valuesStr.add(Arrays.asList(obj.toString()));
                    } else {
                        List<JsonValue> subArray = value.getArray();
                        if (subArray != null) {
                            List<String> subValuesStr = new ArrayList<>(subArray.size());
                            for (JsonValue subArrayValue : subArray) {
                                if (subArrayValue.isNull()) {
                                    subValuesStr.add("");
                                } else {
                                    Object obj2 = subArrayValue.getValue();
                                    if (obj2 != null) {
                                        subValuesStr.add(obj2.toString());
                                    }
                                }
                            }
                            valuesStr.add(subValuesStr);
                        }
                    }
                }
            }
            return valuesStr;
        }
        Object obj3 = first.getValue();
        if (obj3 != null) {
            List<List<String>> values = new ArrayList<>(1);
            values.add(Arrays.asList(obj3.toString()));
            return values;
        }
        if (first.isNull()) {
            List<List<String>> values2 = new ArrayList<>(1);
            values2.add(Arrays.asList(""));
            return values2;
        }
        return Collections.emptyList();
    }

    public List<String> asMulti() {
        if (this.values.isEmpty()) {
            return Collections.emptyList();
        }
        List<String> multi = new ArrayList<>(this.values.size());
        for (JsonValue value : this.values) {
            if (value.isNull()) {
                multi.add("");
            } else {
                Object obj = value.getValue();
                if (obj != null) {
                    multi.add(obj.toString());
                }
            }
        }
        return multi;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        JCardValue that = (JCardValue) o;
        if (this.values != null) {
            if (!this.values.equals(that.values)) {
                return false;
            }
            return true;
        }
        if (that.values != null) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        if (this.values != null) {
            return this.values.hashCode();
        }
        return 0;
    }
}
