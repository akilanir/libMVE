package freemarker.template;

import freemarker.ext.beans.BeansWrapper;
import java.io.Serializable;
import java.util.ConcurrentModificationException;
import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleHash.class */
public class SimpleHash extends WrappingTemplateModel implements TemplateHashModelEx, Serializable {
    private Map map;
    private boolean putFailed;
    private Map unwrappedMap;

    /* renamed from: freemarker.template.SimpleHash$1, reason: invalid class name */
    /* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleHash$1.class */
    static class AnonymousClass1 {
    }

    public SimpleHash() {
        this((ObjectWrapper) null);
    }

    public SimpleHash(Map map) {
        this(map, null);
    }

    public SimpleHash(ObjectWrapper wrapper) {
        super(wrapper);
        this.map = new HashMap();
    }

    public SimpleHash(Map map, ObjectWrapper wrapper) {
        super(wrapper);
        try {
            this.map = copyMap(map);
        } catch (ConcurrentModificationException e) {
            try {
                Thread.sleep(5L);
            } catch (InterruptedException e2) {
            }
            synchronized (map) {
                this.map = copyMap(map);
            }
        }
    }

    protected Map copyMap(Map map) {
        if (map instanceof HashMap) {
            return (Map) ((HashMap) map).clone();
        }
        if (map instanceof SortedMap) {
            if (map instanceof TreeMap) {
                return (Map) ((TreeMap) map).clone();
            }
            return new TreeMap((SortedMap) map);
        }
        return new HashMap(map);
    }

    public void put(String key, Object obj) {
        this.map.put(key, obj);
        this.unwrappedMap = null;
    }

    public void put(String key, boolean b) {
        put(key, b ? TemplateBooleanModel.TRUE : TemplateBooleanModel.FALSE);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v25, types: [java.lang.Character, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r0v27, types: [java.util.Map] */
    /* JADX WARN: Type inference failed for: r0v35, types: [java.util.Map] */
    public TemplateModel get(String key) throws TemplateModelException {
        String str;
        Object result = this.map.get(key);
        if (result == null) {
            if (key.length() == 1) {
                ?? ch = new Character(key.charAt(0));
                result = this.map.get(ch);
                if (result == null && !this.map.containsKey(key) && !this.map.containsKey(ch)) {
                    return null;
                }
                str = ch;
            } else {
                if (!this.map.containsKey(key)) {
                    return null;
                }
                str = key;
            }
        } else {
            str = key;
        }
        if (result instanceof TemplateModel) {
            return (TemplateModel) result;
        }
        TemplateModel tm = wrap(result);
        if (!this.putFailed) {
            try {
                this.map.put(str, tm);
            } catch (Exception e) {
                this.putFailed = true;
            }
        }
        return tm;
    }

    public boolean containsKey(String key) {
        return this.map.containsKey(key);
    }

    public void remove(String key) {
        this.map.remove(key);
    }

    public void putAll(Map m) {
        for (Map.Entry entry : m.entrySet()) {
            put((String) entry.getKey(), entry.getValue());
        }
    }

    public Map toMap() throws TemplateModelException {
        if (this.unwrappedMap == null) {
            Class mapClass = this.map.getClass();
            try {
                Map m = (Map) mapClass.newInstance();
                BeansWrapper bw = BeansWrapper.getDefaultInstance();
                for (Map.Entry entry : this.map.entrySet()) {
                    Object key = entry.getKey();
                    Object value = entry.getValue();
                    if (value instanceof TemplateModel) {
                        value = bw.unwrap((TemplateModel) value);
                    }
                    m.put(key, value);
                }
                this.unwrappedMap = m;
            } catch (Exception e) {
                throw new TemplateModelException(new StringBuffer().append("Error instantiating map of type ").append(mapClass.getName()).append("\n").append(e.getMessage()).toString());
            }
        }
        return this.unwrappedMap;
    }

    public String toString() {
        return this.map.toString();
    }

    @Override // freemarker.template.TemplateHashModelEx
    public int size() {
        return this.map.size();
    }

    @Override // freemarker.template.TemplateHashModel
    public boolean isEmpty() {
        return this.map == null || this.map.isEmpty();
    }

    @Override // freemarker.template.TemplateHashModelEx
    public TemplateCollectionModel keys() {
        return new SimpleCollection(this.map.keySet(), getObjectWrapper());
    }

    @Override // freemarker.template.TemplateHashModelEx
    public TemplateCollectionModel values() {
        return new SimpleCollection(this.map.values(), getObjectWrapper());
    }

    public SimpleHash synchronizedWrapper() {
        return new SynchronizedHash(this, null);
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/SimpleHash$SynchronizedHash.class */
    private class SynchronizedHash extends SimpleHash {
        private final SimpleHash this$0;

        private SynchronizedHash(SimpleHash simpleHash) {
            this.this$0 = simpleHash;
        }

        SynchronizedHash(SimpleHash x0, AnonymousClass1 x1) {
            this(x0);
        }

        @Override // freemarker.template.SimpleHash, freemarker.template.TemplateHashModel
        public boolean isEmpty() {
            boolean isEmpty;
            synchronized (this.this$0) {
                isEmpty = this.this$0.isEmpty();
            }
            return isEmpty;
        }

        @Override // freemarker.template.SimpleHash
        public void put(String key, Object obj) {
            synchronized (this.this$0) {
                this.this$0.put(key, obj);
            }
        }

        @Override // freemarker.template.SimpleHash, freemarker.template.TemplateHashModel
        public TemplateModel get(String key) throws TemplateModelException {
            TemplateModel templateModel;
            synchronized (this.this$0) {
                templateModel = this.this$0.get(key);
            }
            return templateModel;
        }

        @Override // freemarker.template.SimpleHash
        public void remove(String key) {
            synchronized (this.this$0) {
                this.this$0.remove(key);
            }
        }

        @Override // freemarker.template.SimpleHash, freemarker.template.TemplateHashModelEx
        public int size() {
            int size;
            synchronized (this.this$0) {
                size = this.this$0.size();
            }
            return size;
        }

        @Override // freemarker.template.SimpleHash, freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel keys() {
            TemplateCollectionModel keys;
            synchronized (this.this$0) {
                keys = this.this$0.keys();
            }
            return keys;
        }

        @Override // freemarker.template.SimpleHash, freemarker.template.TemplateHashModelEx
        public TemplateCollectionModel values() {
            TemplateCollectionModel values;
            synchronized (this.this$0) {
                values = this.this$0.values();
            }
            return values;
        }

        @Override // freemarker.template.SimpleHash
        public Map toMap() throws TemplateModelException {
            Map map;
            synchronized (this.this$0) {
                map = this.this$0.toMap();
            }
            return map;
        }
    }
}
