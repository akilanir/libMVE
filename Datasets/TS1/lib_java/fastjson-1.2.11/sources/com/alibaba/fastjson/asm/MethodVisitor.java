package com.alibaba.fastjson.asm;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/asm/MethodVisitor.class */
public interface MethodVisitor {
    void visitInsn(int i);

    void visitIntInsn(int i, int i2);

    void visitVarInsn(int i, int i2);

    void visitTypeInsn(int i, String str);

    void visitFieldInsn(int i, String str, String str2, String str3);

    void visitMethodInsn(int i, String str, String str2, String str3);

    void visitJumpInsn(int i, Label label);

    void visitLabel(Label label);

    void visitLdcInsn(Object obj);

    void visitIincInsn(int i, int i2);

    void visitMaxs(int i, int i2);

    void visitEnd();
}
