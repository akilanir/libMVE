package org.apache.commons.beanutils;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/JDBCDynaClass.class */
abstract class JDBCDynaClass implements DynaClass, Serializable {
    private boolean useColumnLabel;
    private Map columnNameXref;
    static Class class$java$sql$Date;
    static Class class$java$sql$Timestamp;
    static Class class$java$sql$Time;
    static Class class$java$lang$Object;
    protected boolean lowerCase = true;
    protected DynaProperty[] properties = null;
    protected Map propertiesMap = new HashMap();

    JDBCDynaClass() {
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public String getName() {
        return getClass().getName();
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public DynaProperty getDynaProperty(String name) {
        if (name == null) {
            throw new IllegalArgumentException("No property name specified");
        }
        return (DynaProperty) this.propertiesMap.get(name);
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public DynaProperty[] getDynaProperties() {
        return this.properties;
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public DynaBean newInstance() throws IllegalAccessException, InstantiationException {
        throw new UnsupportedOperationException("newInstance() not supported");
    }

    public void setUseColumnLabel(boolean useColumnLabel) {
        this.useColumnLabel = useColumnLabel;
    }

    protected Class loadClass(String className) throws SQLException {
        try {
            ClassLoader cl = Thread.currentThread().getContextClassLoader();
            if (cl == null) {
                cl = getClass().getClassLoader();
            }
            return Class.forName(className, false, cl);
        } catch (Exception e) {
            throw new SQLException(new StringBuffer().append("Cannot load column class '").append(className).append("': ").append(e).toString());
        }
    }

    protected DynaProperty createDynaProperty(ResultSetMetaData metadata, int i) throws SQLException {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        String columnName = null;
        if (this.useColumnLabel) {
            columnName = metadata.getColumnLabel(i);
        }
        if (columnName == null || columnName.trim().length() == 0) {
            columnName = metadata.getColumnName(i);
        }
        String name = this.lowerCase ? columnName.toLowerCase() : columnName;
        if (!name.equals(columnName)) {
            if (this.columnNameXref == null) {
                this.columnNameXref = new HashMap();
            }
            this.columnNameXref.put(name, columnName);
        }
        String className = null;
        try {
            int sqlType = metadata.getColumnType(i);
            switch (sqlType) {
                case PropertyUtils.INDEXED_DELIM /* 91 */:
                    if (class$java$sql$Date == null) {
                        cls4 = class$("java.sql.Date");
                        class$java$sql$Date = cls4;
                    } else {
                        cls4 = class$java$sql$Date;
                    }
                    return new DynaProperty(name, cls4);
                case 92:
                    if (class$java$sql$Time == null) {
                        cls2 = class$("java.sql.Time");
                        class$java$sql$Time = cls2;
                    } else {
                        cls2 = class$java$sql$Time;
                    }
                    return new DynaProperty(name, cls2);
                case PropertyUtils.INDEXED_DELIM2 /* 93 */:
                    if (class$java$sql$Timestamp == null) {
                        cls3 = class$("java.sql.Timestamp");
                        class$java$sql$Timestamp = cls3;
                    } else {
                        cls3 = class$java$sql$Timestamp;
                    }
                    return new DynaProperty(name, cls3);
                default:
                    className = metadata.getColumnClassName(i);
                    break;
            }
        } catch (SQLException e) {
        }
        if (class$java$lang$Object == null) {
            cls = class$("java.lang.Object");
            class$java$lang$Object = cls;
        } else {
            cls = class$java$lang$Object;
        }
        Class clazz = cls;
        if (className != null) {
            clazz = loadClass(className);
        }
        return new DynaProperty(name, clazz);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    protected void introspect(ResultSet resultSet) throws SQLException {
        ArrayList list = new ArrayList();
        ResultSetMetaData metadata = resultSet.getMetaData();
        int n = metadata.getColumnCount();
        for (int i = 1; i <= n; i++) {
            DynaProperty dynaProperty = createDynaProperty(metadata, i);
            if (dynaProperty != null) {
                list.add(dynaProperty);
            }
        }
        this.properties = (DynaProperty[]) list.toArray(new DynaProperty[list.size()]);
        for (int i2 = 0; i2 < this.properties.length; i2++) {
            this.propertiesMap.put(this.properties[i2].getName(), this.properties[i2]);
        }
    }

    protected Object getObject(ResultSet resultSet, String name) throws SQLException {
        Class cls;
        Class cls2;
        Class cls3;
        DynaProperty property = getDynaProperty(name);
        if (property == null) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid name '").append(name).append("'").toString());
        }
        String columnName = getColumnName(name);
        Class type = property.getType();
        if (class$java$sql$Date == null) {
            cls = class$("java.sql.Date");
            class$java$sql$Date = cls;
        } else {
            cls = class$java$sql$Date;
        }
        if (type.equals(cls)) {
            return resultSet.getDate(columnName);
        }
        if (class$java$sql$Timestamp == null) {
            cls2 = class$("java.sql.Timestamp");
            class$java$sql$Timestamp = cls2;
        } else {
            cls2 = class$java$sql$Timestamp;
        }
        if (type.equals(cls2)) {
            return resultSet.getTimestamp(columnName);
        }
        if (class$java$sql$Time == null) {
            cls3 = class$("java.sql.Time");
            class$java$sql$Time = cls3;
        } else {
            cls3 = class$java$sql$Time;
        }
        if (type.equals(cls3)) {
            return resultSet.getTime(columnName);
        }
        return resultSet.getObject(columnName);
    }

    protected String getColumnName(String name) {
        if (this.columnNameXref != null && this.columnNameXref.containsKey(name)) {
            return (String) this.columnNameXref.get(name);
        }
        return name;
    }
}
