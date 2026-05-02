package org.apache.commons.beanutils;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/RowSetDynaClass.class */
public class RowSetDynaClass extends JDBCDynaClass implements DynaClass, Serializable {
    protected int limit;
    protected List rows;

    public RowSetDynaClass(ResultSet resultSet) throws SQLException {
        this(resultSet, true, -1);
    }

    public RowSetDynaClass(ResultSet resultSet, int limit) throws SQLException {
        this(resultSet, true, limit);
    }

    public RowSetDynaClass(ResultSet resultSet, boolean lowerCase) throws SQLException {
        this(resultSet, lowerCase, -1);
    }

    public RowSetDynaClass(ResultSet resultSet, boolean lowerCase, int limit) throws SQLException {
        this(resultSet, lowerCase, limit, false);
    }

    public RowSetDynaClass(ResultSet resultSet, boolean lowerCase, boolean useColumnLabel) throws SQLException {
        this(resultSet, lowerCase, -1, useColumnLabel);
    }

    public RowSetDynaClass(ResultSet resultSet, boolean lowerCase, int limit, boolean useColumnLabel) throws SQLException {
        this.limit = -1;
        this.rows = new ArrayList();
        if (resultSet == null) {
            throw new NullPointerException();
        }
        this.lowerCase = lowerCase;
        this.limit = limit;
        setUseColumnLabel(useColumnLabel);
        introspect(resultSet);
        copy(resultSet);
    }

    public List getRows() {
        return this.rows;
    }

    protected void copy(ResultSet resultSet) throws SQLException {
        int cnt = 0;
        while (resultSet.next()) {
            if (this.limit >= 0) {
                int i = cnt;
                cnt++;
                if (i >= this.limit) {
                    return;
                }
            }
            DynaBean bean = createDynaBean();
            for (int i2 = 0; i2 < this.properties.length; i2++) {
                String name = this.properties[i2].getName();
                Object value = getObject(resultSet, name);
                bean.set(name, value);
            }
            this.rows.add(bean);
        }
    }

    protected DynaBean createDynaBean() {
        return new BasicDynaBean(this);
    }
}
