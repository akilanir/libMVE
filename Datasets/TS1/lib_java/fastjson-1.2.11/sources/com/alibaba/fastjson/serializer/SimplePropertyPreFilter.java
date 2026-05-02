package com.alibaba.fastjson.serializer;

import java.util.HashSet;
import java.util.Set;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/SimplePropertyPreFilter.class */
public class SimplePropertyPreFilter implements PropertyPreFilter {
    private final Class<?> clazz;
    private final Set<String> includes;
    private final Set<String> excludes;
    private int maxLevel;

    public SimplePropertyPreFilter(String... properties) {
        this(null, properties);
    }

    public SimplePropertyPreFilter(Class<?> clazz, String... properties) {
        this.includes = new HashSet();
        this.excludes = new HashSet();
        this.maxLevel = 0;
        this.clazz = clazz;
        for (String item : properties) {
            if (item != null) {
                this.includes.add(item);
            }
        }
    }

    public int getMaxLevel() {
        return this.maxLevel;
    }

    public void setMaxLevel(int maxLevel) {
        this.maxLevel = maxLevel;
    }

    public Class<?> getClazz() {
        return this.clazz;
    }

    public Set<String> getIncludes() {
        return this.includes;
    }

    public Set<String> getExcludes() {
        return this.excludes;
    }

    @Override // com.alibaba.fastjson.serializer.PropertyPreFilter
    public boolean apply(JSONSerializer serializer, Object source, String name) {
        if (source == null) {
            return true;
        }
        if (this.clazz != null && !this.clazz.isInstance(source)) {
            return true;
        }
        if (this.excludes.contains(name)) {
            return false;
        }
        if (this.maxLevel > 0) {
            int level = 0;
            SerialContext serialContext = serializer.context;
            while (true) {
                SerialContext context = serialContext;
                if (context == null) {
                    break;
                }
                level++;
                if (level > this.maxLevel) {
                    return false;
                }
                serialContext = context.parent;
            }
        }
        if (this.includes.size() == 0 || this.includes.contains(name)) {
            return true;
        }
        return false;
    }
}
