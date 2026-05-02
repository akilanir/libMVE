package org.apache.commons.beanutils;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/ResultSetIterator.class */
public class ResultSetIterator implements DynaBean, Iterator {
    protected ResultSetDynaClass dynaClass;
    protected boolean current = false;
    protected boolean eof = false;

    ResultSetIterator(ResultSetDynaClass dynaClass) {
        this.dynaClass = null;
        this.dynaClass = dynaClass;
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public boolean contains(String name, String key) {
        throw new UnsupportedOperationException("FIXME - mapped properties not currently supported");
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name) {
        if (this.dynaClass.getDynaProperty(name) == null) {
            throw new IllegalArgumentException(name);
        }
        try {
            return this.dynaClass.getObjectFromResultSet(name);
        } catch (SQLException e) {
            throw new RuntimeException(new StringBuffer().append("get(").append(name).append("): SQLException: ").append(e).toString());
        }
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name, int index) {
        throw new UnsupportedOperationException("FIXME - indexed properties not currently supported");
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name, String key) {
        throw new UnsupportedOperationException("FIXME - mapped properties not currently supported");
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public DynaClass getDynaClass() {
        return this.dynaClass;
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void remove(String name, String key) {
        throw new UnsupportedOperationException("FIXME - mapped operations not currently supported");
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, Object value) {
        if (this.dynaClass.getDynaProperty(name) == null) {
            throw new IllegalArgumentException(name);
        }
        try {
            this.dynaClass.getResultSet().updateObject(name, value);
        } catch (SQLException e) {
            throw new RuntimeException(new StringBuffer().append("set(").append(name).append("): SQLException: ").append(e).toString());
        }
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, int index, Object value) {
        throw new UnsupportedOperationException("FIXME - indexed properties not currently supported");
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, String key, Object value) {
        throw new UnsupportedOperationException("FIXME - mapped properties not currently supported");
    }

    @Override // java.util.Iterator
    public boolean hasNext() {
        try {
            advance();
            return !this.eof;
        } catch (SQLException e) {
            throw new RuntimeException(new StringBuffer().append("hasNext():  SQLException:  ").append(e).toString());
        }
    }

    @Override // java.util.Iterator
    public Object next() {
        try {
            advance();
            if (this.eof) {
                throw new NoSuchElementException();
            }
            this.current = false;
            return this;
        } catch (SQLException e) {
            throw new RuntimeException(new StringBuffer().append("next():  SQLException:  ").append(e).toString());
        }
    }

    @Override // java.util.Iterator
    public void remove() {
        throw new UnsupportedOperationException("remove()");
    }

    protected void advance() throws SQLException {
        if (!this.current && !this.eof) {
            if (this.dynaClass.getResultSet().next()) {
                this.current = true;
                this.eof = false;
            } else {
                this.current = false;
                this.eof = true;
            }
        }
    }
}
