package org.apache.http.params;

import java.util.HashSet;
import java.util.Set;

/* loaded from: httpcore-4.2.1.jar:org/apache/http/params/DefaultedHttpParams.class */
public final class DefaultedHttpParams extends AbstractHttpParams {
    private final HttpParams local;
    private final HttpParams defaults;

    public DefaultedHttpParams(HttpParams local, HttpParams defaults) {
        if (local == null) {
            throw new IllegalArgumentException("HTTP parameters may not be null");
        }
        this.local = local;
        this.defaults = defaults;
    }

    @Override // org.apache.http.params.HttpParams
    @Deprecated
    public HttpParams copy() {
        HttpParams clone = this.local.copy();
        return new DefaultedHttpParams(clone, this.defaults);
    }

    @Override // org.apache.http.params.HttpParams
    public Object getParameter(String name) {
        Object obj = this.local.getParameter(name);
        if (obj == null && this.defaults != null) {
            obj = this.defaults.getParameter(name);
        }
        return obj;
    }

    @Override // org.apache.http.params.HttpParams
    public boolean removeParameter(String name) {
        return this.local.removeParameter(name);
    }

    @Override // org.apache.http.params.HttpParams
    public HttpParams setParameter(String name, Object value) {
        return this.local.setParameter(name, value);
    }

    @Deprecated
    public HttpParams getDefaults() {
        return this.defaults;
    }

    @Override // org.apache.http.params.AbstractHttpParams, org.apache.http.params.HttpParamsNames
    public Set<String> getNames() {
        Set<String> combined = new HashSet<>(getNames(this.defaults));
        combined.addAll(getNames(this.local));
        return combined;
    }

    public Set<String> getDefaultNames() {
        return new HashSet(getNames(this.defaults));
    }

    public Set<String> getLocalNames() {
        return new HashSet(getNames(this.local));
    }

    private Set<String> getNames(HttpParams params) {
        if (params instanceof HttpParamsNames) {
            return ((HttpParamsNames) params).getNames();
        }
        throw new UnsupportedOperationException("HttpParams instance does not implement HttpParamsNames");
    }
}
