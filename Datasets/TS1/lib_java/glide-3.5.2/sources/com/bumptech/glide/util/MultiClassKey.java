package com.bumptech.glide.util;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/util/MultiClassKey.class */
public class MultiClassKey {
    private Class<?> first;
    private Class<?> second;

    public MultiClassKey() {
    }

    public MultiClassKey(Class<?> first, Class<?> second) {
        set(first, second);
    }

    public void set(Class<?> first, Class<?> second) {
        this.first = first;
        this.second = second;
    }

    public String toString() {
        return "MultiClassKey{first=" + this.first + ", second=" + this.second + '}';
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        MultiClassKey that = (MultiClassKey) o;
        if (!this.first.equals(that.first) || !this.second.equals(that.second)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        int result = this.first.hashCode();
        return (31 * result) + this.second.hashCode();
    }
}
