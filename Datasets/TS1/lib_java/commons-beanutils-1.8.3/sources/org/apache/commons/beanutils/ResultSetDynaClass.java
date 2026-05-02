package org.apache.commons.beanutils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/ResultSetDynaClass.class */
public class ResultSetDynaClass extends JDBCDynaClass implements DynaClass {
    protected ResultSet resultSet;

    public ResultSetDynaClass(ResultSet resultSet) throws SQLException {
        this(resultSet, true);
    }

    public ResultSetDynaClass(ResultSet resultSet, boolean lowerCase) throws SQLException {
        this(resultSet, lowerCase, false);
    }

    public ResultSetDynaClass(ResultSet resultSet, boolean lowerCase, boolean useColumnLabel) throws SQLException {
        this.resultSet = null;
        if (resultSet == null) {
            throw new NullPointerException();
        }
        this.resultSet = resultSet;
        this.lowerCase = lowerCase;
        setUseColumnLabel(useColumnLabel);
        introspect(resultSet);
    }

    public Iterator iterator() {
        return new ResultSetIterator(this);
    }

    public Object getObjectFromResultSet(String name) throws SQLException {
        return getObject(getResultSet(), name);
    }

    ResultSet getResultSet() {
        return this.resultSet;
    }

    @Override // org.apache.commons.beanutils.JDBCDynaClass
    protected Class loadClass(String className) throws SQLException {
        try {
            return getClass().getClassLoader().loadClass(className);
        } catch (Exception e) {
            throw new SQLException(new StringBuffer().append("Cannot load column class '").append(className).append("': ").append(e).toString());
        }
    }
}
