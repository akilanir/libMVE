package com.alibaba.fastjson.asm;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/asm/ClassWriter.class */
public class ClassWriter {
    int version;
    int index;
    final ByteVector pool;
    Item[] items;
    int threshold;
    final Item key;
    final Item key2;
    final Item key3;
    Item[] typeTable;
    private int access;
    private int name;
    String thisName;
    private int superName;
    private int interfaceCount;
    private int[] interfaces;
    FieldWriter firstField;
    FieldWriter lastField;
    MethodWriter firstMethod;
    MethodWriter lastMethod;

    public ClassWriter() {
        this(0);
    }

    private ClassWriter(int flags) {
        this.index = 1;
        this.pool = new ByteVector();
        this.items = new Item[256];
        this.threshold = (int) (0.75d * this.items.length);
        this.key = new Item();
        this.key2 = new Item();
        this.key3 = new Item();
    }

    public void visit(int version, int access, String name, String superName, String[] interfaces) {
        this.version = version;
        this.access = access;
        this.name = newClassItem(name).index;
        this.thisName = name;
        this.superName = superName == null ? 0 : newClassItem(superName).index;
        if (interfaces != null && interfaces.length > 0) {
            this.interfaceCount = interfaces.length;
            this.interfaces = new int[this.interfaceCount];
            for (int i = 0; i < this.interfaceCount; i++) {
                this.interfaces[i] = newClassItem(interfaces[i]).index;
            }
        }
    }

    public byte[] toByteArray() {
        int size = 24 + (2 * this.interfaceCount);
        int nbFields = 0;
        FieldWriter fieldWriter = this.firstField;
        while (true) {
            FieldWriter fb = fieldWriter;
            if (fb == null) {
                break;
            }
            nbFields++;
            size += fb.getSize();
            fieldWriter = fb.next;
        }
        int nbMethods = 0;
        MethodWriter methodWriter = this.firstMethod;
        while (true) {
            MethodWriter mb = methodWriter;
            if (mb == null) {
                break;
            }
            nbMethods++;
            size += mb.getSize();
            methodWriter = mb.next;
        }
        ByteVector out = new ByteVector(size + this.pool.length);
        out.putInt(-889275714).putInt(this.version);
        out.putShort(this.index).putByteArray(this.pool.data, 0, this.pool.length);
        out.putShort(this.access & (393216 ^ (-1))).putShort(this.name).putShort(this.superName);
        out.putShort(this.interfaceCount);
        for (int i = 0; i < this.interfaceCount; i++) {
            out.putShort(this.interfaces[i]);
        }
        out.putShort(nbFields);
        FieldWriter fieldWriter2 = this.firstField;
        while (true) {
            FieldWriter fb2 = fieldWriter2;
            if (fb2 == null) {
                break;
            }
            fb2.put(out);
            fieldWriter2 = fb2.next;
        }
        out.putShort(nbMethods);
        MethodWriter methodWriter2 = this.firstMethod;
        while (true) {
            MethodWriter mb2 = methodWriter2;
            if (mb2 != null) {
                mb2.put(out);
                methodWriter2 = mb2.next;
            } else {
                out.putShort(0);
                return out.data;
            }
        }
    }

    Item newConstItem(Object cst) {
        if (cst instanceof Integer) {
            int val = ((Integer) cst).intValue();
            this.key.set(val);
            Item result = get(this.key);
            if (result == null) {
                this.pool.putByte(3).putInt(val);
                int i = this.index;
                this.index = i + 1;
                result = new Item(i, this.key);
                put(result);
            }
            return result;
        }
        if (cst instanceof String) {
            return newString((String) cst);
        }
        if (cst instanceof Type) {
            Type t = (Type) cst;
            return newClassItem(t.sort == 10 ? t.getInternalName() : t.getDescriptor());
        }
        throw new IllegalArgumentException("value " + cst);
    }

    public int newUTF8(String value) {
        this.key.set(1, value, null, null);
        Item result = get(this.key);
        if (result == null) {
            this.pool.putByte(1).putUTF8(value);
            int i = this.index;
            this.index = i + 1;
            result = new Item(i, this.key);
            put(result);
        }
        return result.index;
    }

    public Item newClassItem(String value) {
        this.key2.set(7, value, null, null);
        Item result = get(this.key2);
        if (result == null) {
            this.pool.put12(7, newUTF8(value));
            int i = this.index;
            this.index = i + 1;
            result = new Item(i, this.key2);
            put(result);
        }
        return result;
    }

    Item newFieldItem(String owner, String name, String desc) {
        this.key3.set(9, owner, name, desc);
        Item result = get(this.key3);
        if (result == null) {
            int s1 = newClassItem(owner).index;
            int s2 = newNameTypeItem(name, desc).index;
            this.pool.put12(9, s1).putShort(s2);
            int i = this.index;
            this.index = i + 1;
            result = new Item(i, this.key3);
            put(result);
        }
        return result;
    }

    Item newMethodItem(String owner, String name, String desc, boolean itf) {
        int type = itf ? 11 : 10;
        this.key3.set(type, owner, name, desc);
        Item result = get(this.key3);
        if (result == null) {
            int s1 = newClassItem(owner).index;
            int s2 = newNameTypeItem(name, desc).index;
            this.pool.put12(type, s1).putShort(s2);
            int i = this.index;
            this.index = i + 1;
            result = new Item(i, this.key3);
            put(result);
        }
        return result;
    }

    private Item newString(String value) {
        this.key2.set(8, value, null, null);
        Item result = get(this.key2);
        if (result == null) {
            this.pool.put12(8, newUTF8(value));
            int i = this.index;
            this.index = i + 1;
            result = new Item(i, this.key2);
            put(result);
        }
        return result;
    }

    public Item newNameTypeItem(String name, String desc) {
        this.key2.set(12, name, desc, null);
        Item result = get(this.key2);
        if (result == null) {
            int s1 = newUTF8(name);
            int s2 = newUTF8(desc);
            this.pool.put12(12, s1).putShort(s2);
            int i = this.index;
            this.index = i + 1;
            result = new Item(i, this.key2);
            put(result);
        }
        return result;
    }

    private Item get(Item key) {
        Item i;
        Item item = this.items[key.hashCode % this.items.length];
        while (true) {
            i = item;
            if (i == null || (i.type == key.type && key.isEqualTo(i))) {
                break;
            }
            item = i.next;
        }
        return i;
    }

    private void put(Item i) {
        if (this.index > this.threshold) {
            int ll = this.items.length;
            int nl = (ll * 2) + 1;
            Item[] newItems = new Item[nl];
            for (int l = ll - 1; l >= 0; l--) {
                Item item = this.items[l];
                while (true) {
                    Item j = item;
                    if (j != null) {
                        int index = j.hashCode % newItems.length;
                        Item k = j.next;
                        j.next = newItems[index];
                        newItems[index] = j;
                        item = k;
                    }
                }
            }
            this.items = newItems;
            this.threshold = (int) (nl * 0.75d);
        }
        int index2 = i.hashCode % this.items.length;
        i.next = this.items[index2];
        this.items[index2] = i;
    }
}
