package org.jsoup.nodes;

import java.io.IOException;
import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.jsoup.SerializationException;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Document;

/* loaded from: jsoup-1.9.1.jar:org/jsoup/nodes/Attributes.class */
public class Attributes implements Iterable<Attribute>, Cloneable {
    protected static final String dataPrefix = "data-";
    private LinkedHashMap<String, Attribute> attributes = null;

    public String get(String key) {
        Attribute attr;
        Validate.notEmpty(key);
        return (this.attributes == null || (attr = this.attributes.get(key.toLowerCase())) == null) ? "" : attr.getValue();
    }

    public void put(String key, String value) {
        Attribute attr = new Attribute(key, value);
        put(attr);
    }

    public void put(String key, boolean value) {
        if (value) {
            put(new BooleanAttribute(key));
        } else {
            remove(key);
        }
    }

    public void put(Attribute attribute) {
        Validate.notNull(attribute);
        if (this.attributes == null) {
            this.attributes = new LinkedHashMap<>(2);
        }
        this.attributes.put(attribute.getKey(), attribute);
    }

    public void remove(String key) {
        Validate.notEmpty(key);
        if (this.attributes == null) {
            return;
        }
        this.attributes.remove(key.toLowerCase());
    }

    public boolean hasKey(String key) {
        return this.attributes != null && this.attributes.containsKey(key.toLowerCase());
    }

    public int size() {
        if (this.attributes == null) {
            return 0;
        }
        return this.attributes.size();
    }

    public void addAll(Attributes incoming) {
        if (incoming.size() == 0) {
            return;
        }
        if (this.attributes == null) {
            this.attributes = new LinkedHashMap<>(incoming.size());
        }
        this.attributes.putAll(incoming.attributes);
    }

    @Override // java.lang.Iterable
    public Iterator<Attribute> iterator() {
        return asList().iterator();
    }

    public List<Attribute> asList() {
        if (this.attributes == null) {
            return Collections.emptyList();
        }
        List<Attribute> list = new ArrayList<>(this.attributes.size());
        for (Map.Entry<String, Attribute> entry : this.attributes.entrySet()) {
            list.add(entry.getValue());
        }
        return Collections.unmodifiableList(list);
    }

    public Map<String, String> dataset() {
        return new Dataset();
    }

    public String html() {
        StringBuilder accum = new StringBuilder();
        try {
            html(accum, new Document("").outputSettings());
            return accum.toString();
        } catch (IOException e) {
            throw new SerializationException(e);
        }
    }

    void html(Appendable accum, Document.OutputSettings out) throws IOException {
        if (this.attributes == null) {
            return;
        }
        for (Map.Entry<String, Attribute> entry : this.attributes.entrySet()) {
            Attribute attribute = entry.getValue();
            accum.append(" ");
            attribute.html(accum, out);
        }
    }

    public String toString() {
        return html();
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof Attributes)) {
            return false;
        }
        Attributes that = (Attributes) o;
        return this.attributes == null ? that.attributes == null : this.attributes.equals(that.attributes);
    }

    public int hashCode() {
        if (this.attributes != null) {
            return this.attributes.hashCode();
        }
        return 0;
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public Attributes m6clone() {
        if (this.attributes == null) {
            return new Attributes();
        }
        try {
            Attributes clone = (Attributes) super.clone();
            clone.attributes = new LinkedHashMap<>(this.attributes.size());
            Iterator<Attribute> it = iterator();
            while (it.hasNext()) {
                Attribute attribute = it.next();
                clone.attributes.put(attribute.getKey(), attribute.m5clone());
            }
            return clone;
        } catch (CloneNotSupportedException e) {
            throw new RuntimeException(e);
        }
    }

    /* loaded from: jsoup-1.9.1.jar:org/jsoup/nodes/Attributes$Dataset.class */
    private class Dataset extends AbstractMap<String, String> {
        private Dataset() {
            if (Attributes.this.attributes == null) {
                Attributes.this.attributes = new LinkedHashMap(2);
            }
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Set<Map.Entry<String, String>> entrySet() {
            return new EntrySet();
        }

        @Override // java.util.AbstractMap, java.util.Map
        public String put(String key, String value) {
            String dataKey = Attributes.dataKey(key);
            String oldValue = Attributes.this.hasKey(dataKey) ? ((Attribute) Attributes.this.attributes.get(dataKey)).getValue() : null;
            Attribute attr = new Attribute(dataKey, value);
            Attributes.this.attributes.put(dataKey, attr);
            return oldValue;
        }

        /* loaded from: jsoup-1.9.1.jar:org/jsoup/nodes/Attributes$Dataset$EntrySet.class */
        private class EntrySet extends AbstractSet<Map.Entry<String, String>> {
            private EntrySet() {
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
            public Iterator<Map.Entry<String, String>> iterator() {
                return new DatasetIterator();
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
            public int size() {
                int count = 0;
                Iterator iter = new DatasetIterator();
                while (iter.hasNext()) {
                    count++;
                }
                return count;
            }
        }

        /* loaded from: jsoup-1.9.1.jar:org/jsoup/nodes/Attributes$Dataset$DatasetIterator.class */
        private class DatasetIterator implements Iterator<Map.Entry<String, String>> {
            private Iterator<Attribute> attrIter;
            private Attribute attr;

            private DatasetIterator() {
                this.attrIter = Attributes.this.attributes.values().iterator();
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                while (this.attrIter.hasNext()) {
                    this.attr = this.attrIter.next();
                    if (this.attr.isDataAttribute()) {
                        return true;
                    }
                }
                return false;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.Iterator
            public Map.Entry<String, String> next() {
                return new Attribute(this.attr.getKey().substring(Attributes.dataPrefix.length()), this.attr.getValue());
            }

            @Override // java.util.Iterator
            public void remove() {
                Attributes.this.attributes.remove(this.attr.getKey());
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String dataKey(String key) {
        return dataPrefix + key;
    }
}
