package com.alibaba.fastjson.asm;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/asm/FieldWriter.class */
public final class FieldWriter {
    FieldWriter next;
    private final int access;
    private final int name;
    private final int desc;

    public FieldWriter(ClassWriter cw, int access, String name, String desc) {
        if (cw.firstField == null) {
            cw.firstField = this;
        } else {
            cw.lastField.next = this;
        }
        cw.lastField = this;
        this.access = access;
        this.name = cw.newUTF8(name);
        this.desc = cw.newUTF8(desc);
    }

    public void visitEnd() {
    }

    int getSize() {
        return 8;
    }

    void put(ByteVector out) {
        out.putShort(this.access & (-393217)).putShort(this.name).putShort(this.desc);
        out.putShort(0);
    }
}
