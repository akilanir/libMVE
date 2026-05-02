package com.bumptech.glide.load.model;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/model/LazyHeaders.class */
public final class LazyHeaders implements Headers {
    private final Map<String, List<LazyHeaderFactory>> headers;
    private volatile Map<String, String> combinedHeaders;

    LazyHeaders(Map<String, List<LazyHeaderFactory>> headers) {
        this.headers = Collections.unmodifiableMap(headers);
    }

    @Override // com.bumptech.glide.load.model.Headers
    public Map<String, String> getHeaders() {
        if (this.combinedHeaders == null) {
            synchronized (this) {
                if (this.combinedHeaders == null) {
                    this.combinedHeaders = Collections.unmodifiableMap(generateHeaders());
                }
            }
        }
        return this.combinedHeaders;
    }

    private Map<String, String> generateHeaders() {
        Map<String, String> combinedHeaders = new HashMap<>();
        for (Map.Entry<String, List<LazyHeaderFactory>> entry : this.headers.entrySet()) {
            StringBuilder sb = new StringBuilder();
            List<LazyHeaderFactory> factories = entry.getValue();
            for (int i = 0; i < factories.size(); i++) {
                LazyHeaderFactory factory = factories.get(i);
                sb.append(factory.buildHeader());
                if (i != factories.size() - 1) {
                    sb.append(',');
                }
            }
            combinedHeaders.put(entry.getKey(), sb.toString());
        }
        return combinedHeaders;
    }

    public String toString() {
        return "LazyHeaders{headers=" + this.headers + '}';
    }

    public boolean equals(Object o) {
        if (o instanceof LazyHeaders) {
            LazyHeaders other = (LazyHeaders) o;
            return this.headers.equals(other.headers);
        }
        return false;
    }

    public int hashCode() {
        return this.headers.hashCode();
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/model/LazyHeaders$Builder.class */
    public static final class Builder {
        private static final String USER_AGENT_HEADER = "User-Agent";
        private static final String DEFAULT_USER_AGENT = System.getProperty("http.agent");
        private static final String ENCODING_HEADER = "Accept-Encoding";
        private static final String DEFAULT_ENCODING = "identity";
        private static final Map<String, List<LazyHeaderFactory>> DEFAULT_HEADERS;
        private boolean copyOnModify = true;
        private Map<String, List<LazyHeaderFactory>> headers = DEFAULT_HEADERS;
        private boolean isEncodingDefault = true;
        private boolean isUserAgentDefault = true;

        static {
            Map<String, List<LazyHeaderFactory>> temp = new HashMap<>(2);
            if (!TextUtils.isEmpty(DEFAULT_USER_AGENT)) {
                temp.put(USER_AGENT_HEADER, Collections.singletonList(new StringHeaderFactory(DEFAULT_USER_AGENT)));
            }
            temp.put(ENCODING_HEADER, Collections.singletonList(new StringHeaderFactory(DEFAULT_ENCODING)));
            DEFAULT_HEADERS = Collections.unmodifiableMap(temp);
        }

        public Builder addHeader(String key, String value) {
            return addHeader(key, new StringHeaderFactory(value));
        }

        public Builder addHeader(String key, LazyHeaderFactory factory) {
            if ((this.isEncodingDefault && ENCODING_HEADER.equalsIgnoreCase(key)) || (this.isUserAgentDefault && USER_AGENT_HEADER.equalsIgnoreCase(key))) {
                return setHeader(key, factory);
            }
            copyIfNecessary();
            getFactories(key).add(factory);
            return this;
        }

        public Builder setHeader(String key, String value) {
            return setHeader(key, value == null ? null : new StringHeaderFactory(value));
        }

        public Builder setHeader(String key, LazyHeaderFactory factory) {
            copyIfNecessary();
            if (factory == null) {
                this.headers.remove(key);
            } else {
                List<LazyHeaderFactory> factories = getFactories(key);
                factories.clear();
                factories.add(factory);
            }
            if (this.isEncodingDefault && ENCODING_HEADER.equalsIgnoreCase(key)) {
                this.isEncodingDefault = false;
            }
            if (this.isUserAgentDefault && USER_AGENT_HEADER.equalsIgnoreCase(key)) {
                this.isUserAgentDefault = false;
            }
            return this;
        }

        private List<LazyHeaderFactory> getFactories(String key) {
            List<LazyHeaderFactory> factories = this.headers.get(key);
            if (factories == null) {
                factories = new ArrayList();
                this.headers.put(key, factories);
            }
            return factories;
        }

        private void copyIfNecessary() {
            if (this.copyOnModify) {
                this.copyOnModify = false;
                this.headers = copyHeaders();
            }
        }

        public LazyHeaders build() {
            this.copyOnModify = true;
            return new LazyHeaders(this.headers);
        }

        private Map<String, List<LazyHeaderFactory>> copyHeaders() {
            Map<String, List<LazyHeaderFactory>> result = new HashMap<>(this.headers.size());
            for (Map.Entry<String, List<LazyHeaderFactory>> entry : this.headers.entrySet()) {
                result.put(entry.getKey(), new ArrayList<>(entry.getValue()));
            }
            return result;
        }
    }

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/model/LazyHeaders$StringHeaderFactory.class */
    static final class StringHeaderFactory implements LazyHeaderFactory {
        private final String value;

        StringHeaderFactory(String value) {
            this.value = value;
        }

        @Override // com.bumptech.glide.load.model.LazyHeaderFactory
        public String buildHeader() {
            return this.value;
        }

        public String toString() {
            return "StringHeaderFactory{value='" + this.value + "'}";
        }

        public boolean equals(Object o) {
            if (o instanceof StringHeaderFactory) {
                StringHeaderFactory other = (StringHeaderFactory) o;
                return this.value.equals(other.value);
            }
            return false;
        }

        public int hashCode() {
            return this.value.hashCode();
        }
    }
}
