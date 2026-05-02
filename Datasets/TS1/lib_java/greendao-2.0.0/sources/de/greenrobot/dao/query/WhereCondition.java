package de.greenrobot.dao.query;

import de.greenrobot.dao.DaoException;
import de.greenrobot.dao.Property;
import de.greenrobot.dao.internal.SqlUtils;
import java.util.Date;
import java.util.List;

/* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/query/WhereCondition.class */
public interface WhereCondition {
    void appendTo(StringBuilder sb, String str);

    void appendValuesTo(List<Object> list);

    /* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/query/WhereCondition$AbstractCondition.class */
    public static abstract class AbstractCondition implements WhereCondition {
        protected final boolean hasSingleValue;
        protected final Object value;
        protected final Object[] values;

        public AbstractCondition() {
            this.hasSingleValue = false;
            this.value = null;
            this.values = null;
        }

        public AbstractCondition(Object value) {
            this.value = value;
            this.hasSingleValue = true;
            this.values = null;
        }

        public AbstractCondition(Object[] values) {
            this.value = null;
            this.hasSingleValue = false;
            this.values = values;
        }

        @Override // de.greenrobot.dao.query.WhereCondition
        public void appendValuesTo(List<Object> valuesTarget) {
            if (this.hasSingleValue) {
                valuesTarget.add(this.value);
                return;
            }
            if (this.values != null) {
                Object[] arr$ = this.values;
                for (Object value : arr$) {
                    valuesTarget.add(value);
                }
            }
        }
    }

    /* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/query/WhereCondition$PropertyCondition.class */
    public static class PropertyCondition extends AbstractCondition {
        public final Property property;
        public final String op;

        private static Object checkValueForType(Property property, Object value) {
            if (value != null && value.getClass().isArray()) {
                throw new DaoException("Illegal value: found array, but simple object required");
            }
            Class<?> type = property.type;
            if (type == Date.class) {
                if (value instanceof Date) {
                    return Long.valueOf(((Date) value).getTime());
                }
                if (value instanceof Long) {
                    return value;
                }
                throw new DaoException("Illegal date value: expected java.util.Date or Long for value " + value);
            }
            if (property.type == Boolean.TYPE || property.type == Boolean.class) {
                if (value instanceof Boolean) {
                    return Integer.valueOf(((Boolean) value).booleanValue() ? 1 : 0);
                }
                if (value instanceof Number) {
                    int intValue = ((Number) value).intValue();
                    if (intValue != 0 && intValue != 1) {
                        throw new DaoException("Illegal boolean value: numbers must be 0 or 1, but was " + value);
                    }
                } else if (value instanceof String) {
                    String stringValue = (String) value;
                    if ("TRUE".equalsIgnoreCase(stringValue)) {
                        return 1;
                    }
                    if ("FALSE".equalsIgnoreCase(stringValue)) {
                        return 0;
                    }
                    throw new DaoException("Illegal boolean value: Strings must be \"TRUE\" or \"FALSE\" (case insesnsitive), but was " + value);
                }
            }
            return value;
        }

        private static Object[] checkValuesForType(Property property, Object[] values) {
            for (int i = 0; i < values.length; i++) {
                values[i] = checkValueForType(property, values[i]);
            }
            return values;
        }

        public PropertyCondition(Property property, String op) {
            this.property = property;
            this.op = op;
        }

        public PropertyCondition(Property property, String op, Object value) {
            super(checkValueForType(property, value));
            this.property = property;
            this.op = op;
        }

        public PropertyCondition(Property property, String op, Object[] values) {
            super(checkValuesForType(property, values));
            this.property = property;
            this.op = op;
        }

        @Override // de.greenrobot.dao.query.WhereCondition
        public void appendTo(StringBuilder builder, String tableAlias) {
            SqlUtils.appendProperty(builder, tableAlias, this.property).append(this.op);
        }
    }

    /* loaded from: greendao-2.0.0.jar:de/greenrobot/dao/query/WhereCondition$StringCondition.class */
    public static class StringCondition extends AbstractCondition {
        protected final String string;

        public StringCondition(String string) {
            this.string = string;
        }

        public StringCondition(String string, Object value) {
            super(value);
            this.string = string;
        }

        public StringCondition(String string, Object... values) {
            super(values);
            this.string = string;
        }

        @Override // de.greenrobot.dao.query.WhereCondition
        public void appendTo(StringBuilder builder, String tableAlias) {
            builder.append(this.string);
        }
    }
}
