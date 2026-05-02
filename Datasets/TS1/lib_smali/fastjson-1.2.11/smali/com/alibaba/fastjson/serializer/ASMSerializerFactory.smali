.class public Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;
.super Ljava/lang/Object;
.source "ASMSerializerFactory.java"

# interfaces
.implements Lcom/alibaba/fastjson/asm/Opcodes;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    }
.end annotation


# static fields
.field static final JSONSerializer:Ljava/lang/String;

.field static final JavaBeanSerializer:Ljava/lang/String;

.field static final JavaBeanSerializer_desc:Ljava/lang/String;

.field static final ObjectSerializer:Ljava/lang/String;

.field static final ObjectSerializer_desc:Ljava/lang/String;

.field static final SerialContext_desc:Ljava/lang/String;

.field static final SerializeFilterable_desc:Ljava/lang/String;

.field static final SerializeWriter:Ljava/lang/String;

.field static final SerializeWriter_desc:Ljava/lang/String;


# instance fields
.field protected final classLoader:Lcom/alibaba/fastjson/util/ASMClassLoader;

.field private final seed:Ljava/util/concurrent/atomic/AtomicLong;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 42
    const-class v0, Lcom/alibaba/fastjson/serializer/JSONSerializer;

    invoke-static {v0}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    .line 43
    const-class v0, Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    invoke-static {v0}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer:Ljava/lang/String;

    .line 44
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "L"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    .line 45
    const-class v0, Lcom/alibaba/fastjson/serializer/SerializeWriter;

    invoke-static {v0}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "L"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter_desc:Ljava/lang/String;

    .line 47
    const-class v0, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    invoke-static {v0}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "L"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-class v1, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    invoke-static {v1}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer_desc:Ljava/lang/String;

    .line 49
    const-class v0, Lcom/alibaba/fastjson/serializer/SerialContext;

    invoke-static {v0}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerialContext_desc:Ljava/lang/String;

    .line 50
    const-class v0, Lcom/alibaba/fastjson/serializer/SerializeFilterable;

    invoke-static {v0}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeFilterable_desc:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Lcom/alibaba/fastjson/util/ASMClassLoader;

    invoke-direct {v0}, Lcom/alibaba/fastjson/util/ASMClassLoader;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->classLoader:Lcom/alibaba/fastjson/util/ASMClassLoader;

    .line 40
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->seed:Ljava/util/concurrent/atomic/AtomicLong;

    .line 52
    return-void
.end method

.method private _after(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 8
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    const/16 v1, 0x19

    .line 1690
    const/4 v0, 0x1

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1691
    const/4 v0, 0x0

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1692
    const/4 v0, 0x2

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1693
    const/16 v0, 0x15

    const-string v1, "seperator"

    invoke-virtual {p2, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1694
    const/16 v0, 0xb6

    sget-object v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v2, "writeAfter"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeFilterable_desc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Ljava/lang/Object;C)C"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1696
    const/16 v0, 0x36

    const-string v1, "seperator"

    invoke-virtual {p2, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1697
    return-void
.end method

.method private _apply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 10
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p3, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    const/4 v5, 0x2

    const/16 v3, 0x15

    const/16 v4, 0xb8

    const/16 v2, 0x19

    .line 1743
    iget-object v0, p2, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 1745
    .local v0, "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x1

    invoke-interface {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1746
    const/4 v1, 0x0

    invoke-interface {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1747
    invoke-interface {p1, v2, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1748
    sget v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1750
    sget-object v1, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_54

    .line 1751
    const-string v1, "byte"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v3, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1752
    const-string v1, "java/lang/Byte"

    const-string v2, "valueOf"

    const-string v3, "(B)Ljava/lang/Byte;"

    invoke-interface {p1, v4, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1785
    :goto_2f
    const/16 v1, 0xb6

    sget-object v2, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v3, "apply"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeFilterable_desc:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1788
    return-void

    .line 1753
    :cond_54
    sget-object v1, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_6b

    .line 1754
    const-string v1, "short"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v3, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1755
    const-string v1, "java/lang/Short"

    const-string v2, "valueOf"

    const-string v3, "(S)Ljava/lang/Short;"

    invoke-interface {p1, v4, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2f

    .line 1756
    :cond_6b
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_82

    .line 1757
    const-string v1, "int"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v3, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1758
    const-string v1, "java/lang/Integer"

    const-string v2, "valueOf"

    const-string v3, "(I)Ljava/lang/Integer;"

    invoke-interface {p1, v4, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2f

    .line 1759
    :cond_82
    sget-object v1, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_99

    .line 1760
    const-string v1, "char"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v3, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1761
    const-string v1, "java/lang/Character"

    const-string v2, "valueOf"

    const-string v3, "(C)Ljava/lang/Character;"

    invoke-interface {p1, v4, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2f

    .line 1762
    :cond_99
    sget-object v1, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_b3

    .line 1763
    const/16 v1, 0x16

    const-string v2, "long"

    invoke-virtual {p3, v2, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;I)I

    move-result v2

    invoke-interface {p1, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1764
    const-string v1, "java/lang/Long"

    const-string v2, "valueOf"

    const-string v3, "(J)Ljava/lang/Long;"

    invoke-interface {p1, v4, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2f

    .line 1765
    :cond_b3
    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_cd

    .line 1766
    const/16 v1, 0x17

    const-string v2, "float"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1767
    const-string v1, "java/lang/Float"

    const-string v2, "valueOf"

    const-string v3, "(F)Ljava/lang/Float;"

    invoke-interface {p1, v4, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2f

    .line 1768
    :cond_cd
    sget-object v1, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_e7

    .line 1769
    const/16 v1, 0x18

    const-string v2, "double"

    invoke-virtual {p3, v2, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;I)I

    move-result v2

    invoke-interface {p1, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1770
    const-string v1, "java/lang/Double"

    const-string v2, "valueOf"

    const-string v3, "(D)Ljava/lang/Double;"

    invoke-interface {p1, v4, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2f

    .line 1771
    :cond_e7
    sget-object v1, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_ff

    .line 1772
    const-string v1, "boolean"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v3, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1773
    const-string v1, "java/lang/Boolean"

    const-string v2, "valueOf"

    const-string v3, "(Z)Ljava/lang/Boolean;"

    invoke-interface {p1, v4, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2f

    .line 1774
    :cond_ff
    const-class v1, Ljava/math/BigDecimal;

    if-ne v0, v1, :cond_10e

    .line 1775
    const-string v1, "decimal"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_2f

    .line 1776
    :cond_10e
    const-class v1, Ljava/lang/String;

    if-ne v0, v1, :cond_11d

    .line 1777
    const-string v1, "string"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_2f

    .line 1778
    :cond_11d
    invoke-virtual {v0}, Ljava/lang/Class;->isEnum()Z

    move-result v1

    if-eqz v1, :cond_12e

    .line 1779
    const-string v1, "enum"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_2f

    .line 1780
    :cond_12e
    const-class v1, Ljava/util/List;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_141

    .line 1781
    const-string v1, "list"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_2f

    .line 1783
    :cond_141
    const-string v1, "object"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_2f
.end method

.method private _before(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 8
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    const/16 v1, 0x19

    .line 1680
    const/4 v0, 0x1

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1681
    const/4 v0, 0x0

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1682
    const/4 v0, 0x2

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1683
    const/16 v0, 0x15

    const-string v1, "seperator"

    invoke-virtual {p2, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1684
    const/16 v0, 0xb6

    sget-object v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v2, "writeBefore"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeFilterable_desc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Ljava/lang/Object;C)C"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1686
    const/16 v0, 0x36

    const-string v1, "seperator"

    invoke-virtual {p2, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1687
    return-void
.end method

.method private _decimal(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 14
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v8, 0xa7

    const/16 v6, 0x19

    .line 1208
    new-instance v2, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v2}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1210
    .local v2, "end_":Lcom/alibaba/fastjson/asm/Label;
    invoke-direct {p0, p2, p3, p4, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_nameApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1211
    invoke-direct {p0, p2, p4, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 1212
    const/16 v4, 0x3a

    const-string v5, "decimal"

    invoke-virtual {p4, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p2, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1214
    invoke-direct {p0, p2, p3, p4, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_filters(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1216
    new-instance v3, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v3}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1217
    .local v3, "if_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1218
    .local v0, "else_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v1, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v1}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1220
    .local v1, "endIf_":Lcom/alibaba/fastjson/asm/Label;
    invoke-interface {p2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1223
    const-string v4, "decimal"

    invoke-virtual {p4, v4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p2, v6, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1224
    const/16 v4, 0xc7

    invoke-interface {p2, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1225
    invoke-direct {p0, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_if_write_null(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1226
    invoke-interface {p2, v8, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1228
    invoke-interface {p2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1230
    const-string v4, "out"

    invoke-virtual {p4, v4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p2, v6, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1231
    const/16 v4, 0x15

    const-string v5, "seperator"

    invoke-virtual {p4, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p2, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1232
    sget v4, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p2, v6, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1233
    const-string v4, "decimal"

    invoke-virtual {p4, v4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p2, v6, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1234
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v6, "writeFieldValue"

    const-string v7, "(CLjava/lang/String;Ljava/math/BigDecimal;)V"

    invoke-interface {p2, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1237
    invoke-direct {p0, p2, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1238
    invoke-interface {p2, v8, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1240
    invoke-interface {p2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1242
    invoke-interface {p2, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1243
    return-void
.end method

.method private _double(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 10
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v4, 0x19

    const/4 v3, 0x2

    .line 1176
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1178
    .local v0, "end_":Lcom/alibaba/fastjson/asm/Label;
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_nameApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1179
    invoke-direct {p0, p2, p4, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 1180
    const/16 v1, 0x39

    const-string v2, "double"

    invoke-virtual {p4, v2, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;I)I

    move-result v2

    invoke-interface {p2, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1182
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_filters(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1184
    const-string v1, "out"

    invoke-virtual {p4, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p2, v4, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1185
    const/16 v1, 0x15

    const-string v2, "seperator"

    invoke-virtual {p4, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p2, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1186
    sget v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p2, v4, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1187
    const/16 v1, 0x18

    const-string v2, "double"

    invoke-virtual {p4, v2, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;I)I

    move-result v2

    invoke-interface {p2, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1188
    const/16 v1, 0xb6

    sget-object v2, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v3, "writeFieldValue"

    const-string v4, "(CLjava/lang/String;D)V"

    invoke-interface {p2, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1190
    invoke-direct {p0, p2, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1192
    invoke-interface {p2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1193
    return-void
.end method

.method private _enum(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 15
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1063
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v5, 0x0

    .line 1064
    .local v5, "writeEnumUsingToString":Z
    invoke-virtual {p3}, Lcom/alibaba/fastjson/util/FieldInfo;->getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v3

    .line 1065
    .local v3, "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    if-eqz v3, :cond_19

    .line 1066
    invoke-interface {v3}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v7

    array-length v8, v7

    const/4 v6, 0x0

    :goto_d
    if-ge v6, v8, :cond_19

    aget-object v4, v7, v6

    .line 1067
    .local v4, "feature":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    sget-object v9, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteEnumUsingToString:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    if-ne v4, v9, :cond_16

    .line 1068
    const/4 v5, 0x1

    .line 1066
    :cond_16
    add-int/lit8 v6, v6, 0x1

    goto :goto_d

    .line 1073
    .end local v4    # "feature":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    :cond_19
    new-instance v2, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v2}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1074
    .local v2, "_not_null":Lcom/alibaba/fastjson/asm/Label;
    new-instance v1, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v1}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1075
    .local v1, "_end_if":Lcom/alibaba/fastjson/asm/Label;
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1077
    .local v0, "_end":Lcom/alibaba/fastjson/asm/Label;
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_nameApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1078
    invoke-direct {p0, p2, p4, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 1079
    const/16 v6, 0xc0

    const-string v7, "java/lang/Enum"

    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 1080
    const/16 v6, 0x3a

    const-string v7, "enum"

    invoke-virtual {p4, v7}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v7

    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1082
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_filters(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1084
    const/16 v6, 0x19

    const-string v7, "enum"

    invoke-virtual {p4, v7}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v7

    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1085
    const/16 v6, 0xc7

    invoke-interface {p2, v6, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1086
    invoke-direct {p0, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_if_write_null(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1087
    const/16 v6, 0xa7

    invoke-interface {p2, v6, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1089
    invoke-interface {p2, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1090
    const/16 v6, 0x19

    const-string v7, "out"

    invoke-virtual {p4, v7}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v7

    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1091
    const/16 v6, 0x15

    const-string v7, "seperator"

    invoke-virtual {p4, v7}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v7

    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1092
    const/16 v6, 0x19

    sget v7, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1093
    const/16 v6, 0x19

    const-string v7, "enum"

    invoke-virtual {p4, v7}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v7

    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1095
    if-eqz v5, :cond_a8

    .line 1096
    const/16 v6, 0xb6

    const-string v7, "java/lang/Object"

    const-string v8, "toString"

    const-string v9, "()Ljava/lang/String;"

    invoke-interface {p2, v6, v7, v8, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1097
    const/16 v6, 0xb6

    sget-object v7, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v8, "writeFieldValue"

    const-string v9, "(CLjava/lang/String;Ljava/lang/String;)V"

    invoke-interface {p2, v6, v7, v8, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1108
    :goto_9e
    invoke-direct {p0, p2, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1110
    invoke-interface {p2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1111
    invoke-interface {p2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1112
    return-void

    .line 1099
    :cond_a8
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static {p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v6

    if-eqz v6, :cond_c5

    .line 1100
    const/16 v6, 0xb6

    const-string v7, "java/lang/Enum"

    const-string v8, "name"

    const-string v9, "()Ljava/lang/String;"

    invoke-interface {p2, v6, v7, v8, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1101
    const/16 v6, 0xb6

    sget-object v7, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v8, "writeFieldValueStringWithDoubleQuote"

    const-string v9, "(CLjava/lang/String;Ljava/lang/String;)V"

    invoke-interface {p2, v6, v7, v8, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9e

    .line 1104
    :cond_c5
    const/16 v6, 0xb6

    sget-object v7, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v8, "writeFieldValue"

    const-string v9, "(CLjava/lang/String;Ljava/lang/Enum;)V"

    invoke-interface {p2, v6, v7, v8, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9e
.end method

.method private _filters(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V
    .registers 9
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p3, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .param p4, "_end"    # Lcom/alibaba/fastjson/asm/Label;

    .prologue
    .line 1510
    iget-object v0, p2, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    if-eqz v0, :cond_36

    .line 1511
    iget-object v0, p2, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isTransient(I)Z

    move-result v0

    if-eqz v0, :cond_36

    .line 1512
    const/16 v0, 0x19

    const-string v1, "out"

    invoke-virtual {p3, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1513
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->SkipTransientField:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1514
    const/16 v0, 0xb6

    sget-object v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v2, "isEnabled"

    const-string v3, "(I)Z"

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1515
    const/16 v0, 0x9a

    invoke-interface {p1, v0, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1519
    :cond_36
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_notWriteDefault(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1521
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static {p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 1531
    :goto_3f
    return-void

    .line 1525
    :cond_40
    invoke-direct {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_apply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1526
    const/16 v0, 0x99

    invoke-interface {p1, v0, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1528
    invoke-direct {p0, p1, p2, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_processKey(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1530
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_processValue(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    goto :goto_3f
.end method

.method private _float(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 10
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v3, 0x19

    .line 1156
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1158
    .local v0, "end_":Lcom/alibaba/fastjson/asm/Label;
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_nameApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1159
    invoke-direct {p0, p2, p4, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 1160
    const/16 v1, 0x38

    const-string v2, "float"

    invoke-virtual {p4, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p2, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1162
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_filters(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1164
    const-string v1, "out"

    invoke-virtual {p4, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p2, v3, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1165
    const/16 v1, 0x15

    const-string v2, "seperator"

    invoke-virtual {p4, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p2, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1166
    sget v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p2, v3, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1167
    const/16 v1, 0x17

    const-string v2, "float"

    invoke-virtual {p4, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p2, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1168
    const/16 v1, 0xb6

    sget-object v2, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v3, "writeFieldValue"

    const-string v4, "(CLjava/lang/String;F)V"

    invoke-interface {p2, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1170
    invoke-direct {p0, p2, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1172
    invoke-interface {p2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1173
    return-void
.end method

.method private _get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V
    .registers 9
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .param p3, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;

    .prologue
    const/16 v2, 0x19

    .line 1196
    iget-object v0, p3, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    .line 1197
    .local v0, "method":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_25

    .line 1198
    const-string v1, "entity"

    invoke-virtual {p2, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1199
    const/16 v1, 0xb6

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/reflect/Method;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1205
    :goto_24
    return-void

    .line 1201
    :cond_25
    const-string v1, "entity"

    invoke-virtual {p2, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1202
    const/16 v1, 0xb4

    iget-object v2, p3, Lcom/alibaba/fastjson/util/FieldInfo;->declaringClass:Ljava/lang/Class;

    invoke-static {v2}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p3, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p3, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 1203
    invoke-static {v4}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    .line 1202
    invoke-interface {p1, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_24
.end method

.method private _getFieldSer(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;)V
    .registers 13
    .param p1, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "fieldInfo"    # Lcom/alibaba/fastjson/util/FieldInfo;

    .prologue
    const/16 v8, 0xb4

    const/4 v7, 0x0

    const/16 v6, 0x19

    .line 2056
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 2057
    .local v0, "notNull_":Lcom/alibaba/fastjson/asm/Label;
    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2058
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static {p1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_asm_ser_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    invoke-interface {p2, v8, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2059
    const/16 v1, 0xc7

    invoke-interface {p2, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 2061
    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2062
    const/4 v1, 0x1

    invoke-interface {p2, v6, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2063
    iget-object v1, p3, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-static {v1}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v1

    invoke-interface {p2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 2064
    const/16 v1, 0xb6

    sget-object v2, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v3, "getObjectWriter"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(Ljava/lang/Class;)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2067
    const/16 v1, 0xb5

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static {p1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_asm_ser_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    invoke-interface {p2, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2069
    invoke-interface {p2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 2071
    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2072
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static {p1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_asm_ser_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    invoke-interface {p2, v8, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2073
    return-void
.end method

.method private _getListFieldItemSer(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Ljava/lang/Class;)V
    .registers 14
    .param p1, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "fieldInfo"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .local p4, "itemType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v8, 0xb4

    const/4 v7, 0x0

    const/16 v6, 0x19

    .line 2033
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 2034
    .local v0, "notNull_":Lcom/alibaba/fastjson/asm/Label;
    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2035
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static {p1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_asm_list_item_ser_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    invoke-interface {p2, v8, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2037
    const/16 v1, 0xc7

    invoke-interface {p2, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 2039
    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2040
    const/4 v1, 0x1

    invoke-interface {p2, v6, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2041
    invoke-static {p4}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v1

    invoke-interface {p2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 2042
    const/16 v1, 0xb6

    sget-object v2, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v3, "getObjectWriter"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(Ljava/lang/Class;)"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2045
    const/16 v1, 0xb5

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static {p1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "_asm_list_item_ser_"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    invoke-interface {p2, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2048
    invoke-interface {p2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 2050
    invoke-interface {p2, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2051
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static {p1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p3, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_asm_list_item_ser_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    invoke-interface {p2, v8, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2053
    return-void
.end method

.method private _if_write_null(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 16
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "fieldInfo"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p3, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    const/16 v11, 0xb6

    const/16 v10, 0x19

    .line 1956
    iget-object v6, p2, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 1958
    .local v6, "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v2, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v2}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1959
    .local v2, "_if":Lcom/alibaba/fastjson/asm/Label;
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1960
    .local v0, "_else":Lcom/alibaba/fastjson/asm/Label;
    new-instance v3, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v3}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1961
    .local v3, "_write_null":Lcom/alibaba/fastjson/asm/Label;
    new-instance v1, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v1}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1963
    .local v1, "_end_if":Lcom/alibaba/fastjson/asm/Label;
    invoke-interface {p1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1965
    invoke-virtual {p2}, Lcom/alibaba/fastjson/util/FieldInfo;->getAnnotation()Lcom/alibaba/fastjson/annotation/JSONField;

    move-result-object v4

    .line 1966
    .local v4, "annotation":Lcom/alibaba/fastjson/annotation/JSONField;
    const/4 v5, 0x0

    .line 1967
    .local v5, "features":I
    if-eqz v4, :cond_2c

    .line 1968
    invoke-interface {v4}, Lcom/alibaba/fastjson/annotation/JSONField;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v7

    invoke-static {v7}, Lcom/alibaba/fastjson/serializer/SerializerFeature;->of([Lcom/alibaba/fastjson/serializer/SerializerFeature;)I

    move-result v5

    .line 1972
    :cond_2c
    sget-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteMapNullValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v7, v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v7, v5

    if-nez v7, :cond_55

    .line 1973
    const-string v7, "out"

    invoke-virtual {p3, v7}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v7

    invoke-interface {p1, v10, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1974
    sget-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteMapNullValue:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v7, v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {p1, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1975
    sget-object v7, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v8, "isEnabled"

    const-string v9, "(I)Z"

    invoke-interface {p1, v11, v7, v8, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1976
    const/16 v7, 0x99

    invoke-interface {p1, v7, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1979
    :cond_55
    invoke-interface {p1, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1981
    const-string v7, "out"

    invoke-virtual {p3, v7}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v7

    invoke-interface {p1, v10, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1982
    const/16 v7, 0x15

    const-string v8, "seperator"

    invoke-virtual {p3, v8}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v8

    invoke-interface {p1, v7, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1983
    sget-object v7, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v8, "write"

    const-string v9, "(I)V"

    invoke-interface {p1, v11, v7, v8, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1985
    invoke-direct {p0, p1, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_writeFieldName(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1987
    const-string v7, "out"

    invoke-virtual {p3, v7}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v7

    invoke-interface {p1, v10, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1988
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {p1, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1991
    const-class v7, Ljava/lang/String;

    if-eq v6, v7, :cond_90

    const-class v7, Ljava/lang/Character;

    if-ne v6, v7, :cond_b3

    .line 1992
    :cond_90
    sget-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullStringAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v7, v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {p1, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 2002
    :goto_9b
    sget-object v7, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v8, "writeNull"

    const-string v9, "(II)V"

    invoke-interface {p1, v11, v7, v8, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2005
    invoke-direct {p0, p1, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 2007
    const/16 v7, 0xa7

    invoke-interface {p1, v7, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 2009
    invoke-interface {p1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 2011
    invoke-interface {p1, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 2012
    return-void

    .line 1993
    :cond_b3
    const-class v7, Ljava/lang/Number;

    invoke-virtual {v7, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_c7

    .line 1994
    sget-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullNumberAsZero:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v7, v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {p1, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    goto :goto_9b

    .line 1995
    :cond_c7
    const-class v7, Ljava/lang/Boolean;

    if-ne v6, v7, :cond_d7

    .line 1996
    sget-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullBooleanAsFalse:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v7, v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {p1, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    goto :goto_9b

    .line 1997
    :cond_d7
    const-class v7, Ljava/util/Collection;

    invoke-virtual {v7, v6}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v7

    if-nez v7, :cond_e5

    invoke-virtual {v6}, Ljava/lang/Class;->isArray()Z

    move-result v7

    if-eqz v7, :cond_f1

    .line 1998
    :cond_e5
    sget-object v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->WriteNullListAsEmpty:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v7, v7, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {p1, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    goto :goto_9b

    .line 2000
    :cond_f1
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {p1, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    goto :goto_9b
.end method

.method private _int(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;IC)V
    .registers 13
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .param p5, "var"    # I
    .param p6, "type"    # C
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            "IC)V"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v3, 0x19

    const/16 v2, 0x15

    .line 1115
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1117
    .local v0, "end_":Lcom/alibaba/fastjson/asm/Label;
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_nameApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1118
    invoke-direct {p0, p2, p4, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 1119
    const/16 v1, 0x36

    invoke-interface {p2, v1, p5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1121
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_filters(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1123
    const-string v1, "out"

    invoke-virtual {p4, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p2, v3, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1124
    const-string v1, "seperator"

    invoke-virtual {p4, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p2, v2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1125
    sget v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p2, v3, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1126
    invoke-interface {p2, v2, p5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1128
    const/16 v1, 0xb6

    sget-object v2, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v3, "writeFieldValue"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(CLjava/lang/String;"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")V"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p2, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1130
    invoke-direct {p0, p2, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1132
    invoke-interface {p2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1133
    return-void
.end method

.method private _labelApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V
    .registers 10
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p3, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .param p4, "_end"    # Lcom/alibaba/fastjson/asm/Label;

    .prologue
    const/16 v1, 0x19

    .line 1557
    const/4 v0, 0x1

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1558
    const/4 v0, 0x0

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1559
    iget-object v0, p2, Lcom/alibaba/fastjson/util/FieldInfo;->label:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1560
    const/16 v0, 0xb6

    sget-object v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v2, "applyLabel"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeFilterable_desc:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Ljava/lang/String;)Z"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1562
    const/16 v0, 0x99

    invoke-interface {p1, v0, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1563
    return-void
.end method

.method private _list(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 33
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "fieldInfo"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1290
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    move-object/from16 v0, p3

    iget-object v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    move-object/from16 v21, v0

    .line 1293
    .local v21, "propertyType":Ljava/lang/reflect/Type;
    move-object/from16 v0, v21

    instance-of v0, v0, Ljava/lang/Class;

    move/from16 v23, v0

    if-eqz v23, :cond_279

    .line 1294
    const-class v8, Ljava/lang/Object;

    .line 1299
    .end local v21    # "propertyType":Ljava/lang/reflect/Type;
    .local v8, "elementType":Ljava/lang/reflect/Type;
    :goto_10
    const/4 v7, 0x0

    .line 1300
    .local v7, "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v0, v8, Ljava/lang/Class;

    move/from16 v23, v0

    if-eqz v23, :cond_1a

    move-object v7, v8

    .line 1301
    check-cast v7, Ljava/lang/Class;

    .line 1304
    :cond_1a
    const-class v23, Ljava/lang/Object;

    move-object/from16 v0, v23

    if-eq v7, v0, :cond_26

    const-class v23, Ljava/io/Serializable;

    move-object/from16 v0, v23

    if-ne v7, v0, :cond_27

    .line 1306
    :cond_26
    const/4 v7, 0x0

    .line 1309
    :cond_27
    new-instance v11, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v11}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v11, "end_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v9, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v9}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v9, "else_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v10, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v10}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1311
    .local v10, "endIf_":Lcom/alibaba/fastjson/asm/Label;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3, v11}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_nameApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1312
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    move-object/from16 v3, p3

    invoke-direct {v0, v1, v2, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 1313
    const/16 v23, 0xc0

    const-string v24, "java/util/List"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 1314
    const/16 v23, 0x3a

    const-string v24, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1316
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3, v11}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_filters(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1318
    const/16 v23, 0x19

    const-string v24, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1319
    const/16 v23, 0xc7

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1320
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_if_write_null(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1321
    const/16 v23, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1323
    move-object/from16 v0, p2

    invoke-interface {v0, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1325
    const/16 v23, 0x19

    const-string v24, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1326
    const/16 v23, 0x15

    const-string v24, "seperator"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1327
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v25, "write"

    const-string v26, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1329
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_writeFieldName(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1332
    const/16 v23, 0x19

    const-string v24, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1333
    const/16 v23, 0xb9

    const-string v24, "java/util/List"

    const-string v25, "size"

    const-string v26, "()I"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1334
    const/16 v23, 0x36

    const-string v24, "size"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1336
    new-instance v5, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v5}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1337
    .local v5, "_else_3":Lcom/alibaba/fastjson/asm/Label;
    new-instance v6, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v6}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1339
    .local v6, "_end_if_3":Lcom/alibaba/fastjson/asm/Label;
    const/16 v23, 0x15

    const-string v24, "size"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1340
    const/16 v23, 0x3

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1341
    const/16 v23, 0xa0

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1343
    const/16 v23, 0x19

    const-string v24, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1344
    const-string v23, "[]"

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1345
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v25, "write"

    const-string v26, "(Ljava/lang/String;)V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1347
    const/16 v23, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1, v6}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1349
    move-object/from16 v0, p2

    invoke-interface {v0, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1351
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v23

    if-nez v23, :cond_1f3

    .line 1352
    const/16 v23, 0x19

    const/16 v24, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1353
    const/16 v23, 0x19

    const-string v24, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1354
    const/16 v23, 0x19

    sget v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1355
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v25, "setContext"

    const-string v26, "(Ljava/lang/Object;Ljava/lang/Object;)V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1358
    :cond_1f3
    const-class v23, Ljava/lang/String;

    move-object/from16 v0, v23

    if-ne v8, v0, :cond_285

    .line 1359
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v23

    if-eqz v23, :cond_285

    .line 1360
    const/16 v23, 0x19

    const-string v24, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1361
    const/16 v23, 0x19

    const-string v24, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1362
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v25, "write"

    const-string v26, "(Ljava/util/List;)V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1496
    .end local v8    # "elementType":Ljava/lang/reflect/Type;
    :goto_23e
    const/16 v23, 0x19

    const/16 v24, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1497
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v25, "popContext"

    const-string v26, "()V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1500
    move-object/from16 v0, p2

    invoke-interface {v0, v6}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1502
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1504
    move-object/from16 v0, p2

    invoke-interface {v0, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1506
    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1507
    return-void

    .line 1296
    .end local v5    # "_else_3":Lcom/alibaba/fastjson/asm/Label;
    .end local v6    # "_end_if_3":Lcom/alibaba/fastjson/asm/Label;
    .end local v7    # "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v9    # "else_":Lcom/alibaba/fastjson/asm/Label;
    .end local v10    # "endIf_":Lcom/alibaba/fastjson/asm/Label;
    .end local v11    # "end_":Lcom/alibaba/fastjson/asm/Label;
    .restart local v21    # "propertyType":Ljava/lang/reflect/Type;
    :cond_279
    check-cast v21, Ljava/lang/reflect/ParameterizedType;

    .end local v21    # "propertyType":Ljava/lang/reflect/Type;
    invoke-interface/range {v21 .. v21}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v23

    const/16 v24, 0x0

    aget-object v8, v23, v24

    .restart local v8    # "elementType":Ljava/lang/reflect/Type;
    goto/16 :goto_10

    .line 1364
    .restart local v5    # "_else_3":Lcom/alibaba/fastjson/asm/Label;
    .restart local v6    # "_end_if_3":Lcom/alibaba/fastjson/asm/Label;
    .restart local v7    # "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v9    # "else_":Lcom/alibaba/fastjson/asm/Label;
    .restart local v10    # "endIf_":Lcom/alibaba/fastjson/asm/Label;
    .restart local v11    # "end_":Lcom/alibaba/fastjson/asm/Label;
    :cond_285
    const/16 v23, 0x19

    const-string v24, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1365
    const/16 v23, 0x10

    const/16 v24, 0x5b

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1366
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v25, "write"

    const-string v26, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1368
    new-instance v18, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v18 .. v18}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v18, "for_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v13, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v13}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v13, "forFirst_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v12, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v12}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1370
    .local v12, "forEnd_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v23, 0x3

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1371
    const/16 v23, 0x36

    const-string v24, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1374
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1375
    const/16 v23, 0x15

    const-string v24, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1376
    const/16 v23, 0x15

    const-string v24, "size"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1377
    const/16 v23, 0xa2

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1379
    const/16 v23, 0x15

    const-string v24, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1380
    const/16 v23, 0x99

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1382
    const/16 v23, 0x19

    const-string v24, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1383
    const/16 v23, 0x10

    const/16 v24, 0x2c

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1384
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v25, "write"

    const-string v26, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1386
    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1388
    const/16 v23, 0x19

    const-string v24, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1389
    const/16 v23, 0x15

    const-string v24, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1390
    const/16 v23, 0xb9

    const-string v24, "java/util/List"

    const-string v25, "get"

    const-string v26, "(I)Ljava/lang/Object;"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1391
    const/16 v23, 0x3a

    const-string v24, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1393
    new-instance v17, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v17 .. v17}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v17, "forItemNullEnd_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v16, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v16 .. v16}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1395
    .local v16, "forItemNullElse_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v23, 0x19

    const-string v24, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1396
    const/16 v23, 0xc7

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v16

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1398
    const/16 v23, 0x19

    const-string v24, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1399
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v25, "writeNull"

    const-string v26, "()V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1400
    const/16 v23, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v17

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1402
    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1404
    new-instance v15, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v15}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v15, "forItemClassIfEnd_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v14, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v14}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1405
    .local v14, "forItemClassIfElse_":Lcom/alibaba/fastjson/asm/Label;
    if-eqz v7, :cond_64f

    invoke-virtual {v7}, Ljava/lang/Class;->getModifiers()I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v23

    if-eqz v23, :cond_64f

    .line 1406
    const/16 v23, 0x19

    const-string v24, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1407
    const/16 v23, 0xb6

    const-string v24, "java/lang/Object"

    const-string v25, "getClass"

    const-string v26, "()Ljava/lang/Class;"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1408
    invoke-static {v7}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1409
    const/16 v23, 0xa6

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1, v14}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1411
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-direct {v0, v1, v2, v3, v7}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_getListFieldItemSer(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Ljava/lang/Class;)V

    .line 1413
    const/16 v23, 0x3a

    const-string v24, "list_item_desc"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1415
    new-instance v19, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v19 .. v19}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v19, "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v20, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v20 .. v20}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1417
    .local v20, "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v23

    if-eqz v23, :cond_5ab

    .line 1418
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v23

    if-eqz v23, :cond_732

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v23

    if-eqz v23, :cond_732

    const-string v22, "writeDirectNonContext"

    .line 1421
    .local v22, "writeMethodName":Ljava/lang/String;
    :goto_4cd
    const/16 v23, 0x19

    const-string v24, "list_item_desc"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1422
    const/16 v23, 0xc1

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 1423
    const/16 v23, 0x99

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1425
    const/16 v23, 0x19

    const-string v24, "list_item_desc"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1426
    const/16 v23, 0xc0

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 1427
    const/16 v23, 0x19

    const/16 v24, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1428
    const/16 v23, 0x19

    const-string v24, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1429
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v23

    if-eqz v23, :cond_736

    .line 1430
    const/16 v23, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1435
    :goto_54d
    invoke-static {v7}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1436
    move-object/from16 v0, p3

    iget v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    move/from16 v23, v0

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1437
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "(L"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    sget-object v26, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v22

    move-object/from16 v4, v25

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1439
    const/16 v23, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1441
    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1443
    .end local v22    # "writeMethodName":Ljava/lang/String;
    :cond_5ab
    const/16 v23, 0x19

    const-string v24, "list_item_desc"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1444
    const/16 v23, 0x19

    const/16 v24, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1445
    const/16 v23, 0x19

    const-string v24, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1446
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v23

    if-eqz v23, :cond_762

    .line 1447
    const/16 v23, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1452
    :goto_5f1
    invoke-static {v7}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1453
    move-object/from16 v0, p3

    iget v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    move/from16 v23, v0

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1454
    const/16 v23, 0xb9

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer:Ljava/lang/String;

    const-string v25, "write"

    new-instance v26, Ljava/lang/StringBuilder;

    invoke-direct/range {v26 .. v26}, Ljava/lang/StringBuilder;-><init>()V

    const-string v27, "(L"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    sget-object v27, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    const-string v27, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual/range {v26 .. v27}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1457
    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1458
    const/16 v23, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1461
    .end local v19    # "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    .end local v20    # "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_64f
    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1463
    const/16 v23, 0x19

    const/16 v24, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1464
    const/16 v23, 0x19

    const-string v24, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1465
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v23

    if-eqz v23, :cond_78e

    .line 1466
    const/16 v23, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1472
    :goto_685
    if-eqz v7, :cond_7ba

    invoke-virtual {v7}, Ljava/lang/Class;->getModifiers()I

    move-result v23

    invoke-static/range {v23 .. v23}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v23

    if-eqz v23, :cond_7ba

    .line 1473
    check-cast v8, Ljava/lang/Class;

    .end local v8    # "elementType":Ljava/lang/reflect/Type;
    invoke-static {v8}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v23 .. v23}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1474
    move-object/from16 v0, p3

    iget v0, v0, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    move/from16 v23, v0

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v23

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1475
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v25, "writeWithFieldName"

    const-string v26, "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1482
    :goto_6c8
    move-object/from16 v0, p2

    invoke-interface {v0, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1483
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1485
    const-string v23, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v23

    const/16 v24, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitIincInsn(II)V

    .line 1486
    const/16 v23, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1488
    move-object/from16 v0, p2

    invoke-interface {v0, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1490
    const/16 v23, 0x19

    const-string v24, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1491
    const/16 v23, 0x10

    const/16 v24, 0x5d

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1492
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v25, "write"

    const-string v26, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_23e

    .line 1418
    .restart local v8    # "elementType":Ljava/lang/reflect/Type;
    .restart local v19    # "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    .restart local v20    # "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_732
    const-string v22, "write"

    goto/16 :goto_4cd

    .line 1432
    .restart local v22    # "writeMethodName":Ljava/lang/String;
    :cond_736
    const/16 v23, 0x15

    const-string v24, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1433
    const/16 v23, 0xb8

    const-string v24, "java/lang/Integer"

    const-string v25, "valueOf"

    const-string v26, "(I)Ljava/lang/Integer;"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_54d

    .line 1449
    .end local v22    # "writeMethodName":Ljava/lang/String;
    :cond_762
    const/16 v23, 0x15

    const-string v24, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1450
    const/16 v23, 0xb8

    const-string v24, "java/lang/Integer"

    const-string v25, "valueOf"

    const-string v26, "(I)Ljava/lang/Integer;"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_5f1

    .line 1468
    .end local v19    # "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    .end local v20    # "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_78e
    const/16 v23, 0x15

    const-string v24, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p2

    move/from16 v1, v23

    move/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1469
    const/16 v23, 0xb8

    const-string v24, "java/lang/Integer"

    const-string v25, "valueOf"

    const-string v26, "(I)Ljava/lang/Integer;"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_685

    .line 1478
    :cond_7ba
    const/16 v23, 0xb6

    sget-object v24, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v25, "writeWithFieldName"

    const-string v26, "(Ljava/lang/Object;Ljava/lang/Object;)V"

    move-object/from16 v0, p2

    move/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v25

    move-object/from16 v4, v26

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_6c8
.end method

.method private _long(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 10
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v4, 0x19

    const/4 v3, 0x2

    .line 1136
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1138
    .local v0, "end_":Lcom/alibaba/fastjson/asm/Label;
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_nameApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1139
    invoke-direct {p0, p2, p4, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 1140
    const/16 v1, 0x37

    const-string v2, "long"

    invoke-virtual {p4, v2, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;I)I

    move-result v2

    invoke-interface {p2, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1142
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_filters(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1144
    const-string v1, "out"

    invoke-virtual {p4, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p2, v4, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1145
    const/16 v1, 0x15

    const-string v2, "seperator"

    invoke-virtual {p4, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p2, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1146
    sget v1, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p2, v4, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1147
    const/16 v1, 0x16

    const-string v2, "long"

    invoke-virtual {p4, v2, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;I)I

    move-result v2

    invoke-interface {p2, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1148
    const/16 v1, 0xb6

    sget-object v2, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v3, "writeFieldValue"

    const-string v4, "(CLjava/lang/String;J)V"

    invoke-interface {p2, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1150
    invoke-direct {p0, p2, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1152
    invoke-interface {p2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1153
    return-void
.end method

.method private _nameApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V
    .registers 11
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p3, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .param p4, "_end"    # Lcom/alibaba/fastjson/asm/Label;

    .prologue
    const/16 v5, 0xb6

    const/16 v4, 0x19

    .line 1534
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static {p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v0

    if-nez v0, :cond_45

    .line 1535
    const/4 v0, 0x1

    invoke-interface {p1, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1536
    const/4 v0, 0x0

    invoke-interface {p1, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1537
    const/4 v0, 0x2

    invoke-interface {p1, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1538
    sget v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p1, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1539
    sget-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v1, "applyName"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeFilterable_desc:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "Ljava/lang/Object;Ljava/lang/String;)Z"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v5, v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1541
    const/16 v0, 0x99

    invoke-interface {p1, v0, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1543
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_labelApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1546
    :cond_45
    iget-object v0, p2, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    if-nez v0, :cond_6b

    .line 1547
    const-string v0, "out"

    invoke-virtual {p3, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1548
    sget-object v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->IgnoreNonFieldGetter:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v0, v0, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1549
    sget-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v1, "isEnabled"

    const-string v2, "(I)Z"

    invoke-interface {p1, v5, v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1552
    const/16 v0, 0x9a

    invoke-interface {p1, v0, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1554
    :cond_6b
    return-void
.end method

.method private _notWriteDefault(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V
    .registers 10
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p3, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .param p4, "_end"    # Lcom/alibaba/fastjson/asm/Label;

    .prologue
    const/16 v3, 0x15

    const/16 v4, 0x99

    .line 1700
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static {p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 1740
    :goto_a
    return-void

    .line 1704
    :cond_b
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1706
    .local v0, "elseLabel":Lcom/alibaba/fastjson/asm/Label;
    const-string v2, "notWriteDefaultValue"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1707
    invoke-interface {p1, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1709
    iget-object v1, p2, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 1710
    .local v1, "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_32

    .line 1711
    const-string v2, "boolean"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1712
    invoke-interface {p1, v4, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1739
    :cond_2e
    :goto_2e
    invoke-interface {p1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    goto :goto_a

    .line 1713
    :cond_32
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_43

    .line 1714
    const-string v2, "byte"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1715
    invoke-interface {p1, v4, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    goto :goto_2e

    .line 1716
    :cond_43
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_54

    .line 1717
    const-string v2, "short"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1718
    invoke-interface {p1, v4, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    goto :goto_2e

    .line 1719
    :cond_54
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_65

    .line 1720
    const-string v2, "int"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1721
    invoke-interface {p1, v4, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    goto :goto_2e

    .line 1722
    :cond_65
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_82

    .line 1723
    const/16 v2, 0x16

    const-string v3, "long"

    invoke-virtual {p3, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1724
    const/16 v2, 0x9

    invoke-interface {p1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1725
    const/16 v2, 0x94

    invoke-interface {p1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1726
    invoke-interface {p1, v4, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    goto :goto_2e

    .line 1727
    :cond_82
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_9f

    .line 1728
    const/16 v2, 0x17

    const-string v3, "float"

    invoke-virtual {p3, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1729
    const/16 v2, 0xb

    invoke-interface {p1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1730
    const/16 v2, 0x95

    invoke-interface {p1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1731
    invoke-interface {p1, v4, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    goto :goto_2e

    .line 1732
    :cond_9f
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_2e

    .line 1733
    const/16 v2, 0x18

    const-string v3, "double"

    invoke-virtual {p3, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1734
    const/16 v2, 0xe

    invoke-interface {p1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1735
    const/16 v2, 0x97

    invoke-interface {p1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1736
    invoke-interface {p1, v4, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    goto/16 :goto_2e
.end method

.method private _object(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 8
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 1049
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1051
    .local v0, "_end":Lcom/alibaba/fastjson/asm/Label;
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_nameApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1052
    invoke-direct {p0, p2, p4, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 1053
    const/16 v1, 0x3a

    const-string v2, "object"

    invoke-virtual {p4, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p2, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1055
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_filters(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1057
    invoke-direct {p0, p2, p3, p4, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_writeObject(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1059
    invoke-interface {p2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1060
    return-void
.end method

.method private _processKey(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 11
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p3, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    const/4 v6, 0x2

    const/16 v4, 0x15

    const/16 v5, 0xb8

    const/16 v3, 0x19

    .line 1898
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1900
    .local v0, "_else_processKey":Lcom/alibaba/fastjson/asm/Label;
    const-string v2, "hasNameFilters"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v4, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1901
    const/16 v2, 0x99

    invoke-interface {p1, v2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1903
    iget-object v1, p2, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 1905
    .local v1, "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1906
    const/4 v2, 0x0

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1907
    invoke-interface {p1, v3, v6}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1908
    sget v2, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1910
    sget-object v2, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_71

    .line 1911
    const-string v2, "byte"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v4, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1912
    const-string v2, "java/lang/Byte"

    const-string v3, "valueOf"

    const-string v4, "(B)Ljava/lang/Byte;"

    invoke-interface {p1, v5, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1946
    :goto_42
    const/16 v2, 0xb6

    sget-object v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v4, "processKey"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeFilterable_desc:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {p1, v2, v3, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1950
    const/16 v2, 0x3a

    sget v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1952
    invoke-interface {p1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1953
    return-void

    .line 1913
    :cond_71
    sget-object v2, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_88

    .line 1914
    const-string v2, "short"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v4, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1915
    const-string v2, "java/lang/Short"

    const-string v3, "valueOf"

    const-string v4, "(S)Ljava/lang/Short;"

    invoke-interface {p1, v5, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_42

    .line 1916
    :cond_88
    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_9f

    .line 1917
    const-string v2, "int"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v4, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1918
    const-string v2, "java/lang/Integer"

    const-string v3, "valueOf"

    const-string v4, "(I)Ljava/lang/Integer;"

    invoke-interface {p1, v5, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_42

    .line 1919
    :cond_9f
    sget-object v2, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_b6

    .line 1920
    const-string v2, "char"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v4, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1921
    const-string v2, "java/lang/Character"

    const-string v3, "valueOf"

    const-string v4, "(C)Ljava/lang/Character;"

    invoke-interface {p1, v5, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_42

    .line 1922
    :cond_b6
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_d0

    .line 1923
    const/16 v2, 0x16

    const-string v3, "long"

    invoke-virtual {p3, v3, v6}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;I)I

    move-result v3

    invoke-interface {p1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1924
    const-string v2, "java/lang/Long"

    const-string v3, "valueOf"

    const-string v4, "(J)Ljava/lang/Long;"

    invoke-interface {p1, v5, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_42

    .line 1925
    :cond_d0
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_ea

    .line 1926
    const/16 v2, 0x17

    const-string v3, "float"

    invoke-virtual {p3, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1927
    const-string v2, "java/lang/Float"

    const-string v3, "valueOf"

    const-string v4, "(F)Ljava/lang/Float;"

    invoke-interface {p1, v5, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_42

    .line 1928
    :cond_ea
    sget-object v2, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_104

    .line 1929
    const/16 v2, 0x18

    const-string v3, "double"

    invoke-virtual {p3, v3, v6}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;I)I

    move-result v3

    invoke-interface {p1, v2, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1930
    const-string v2, "java/lang/Double"

    const-string v3, "valueOf"

    const-string v4, "(D)Ljava/lang/Double;"

    invoke-interface {p1, v5, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_42

    .line 1931
    :cond_104
    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v1, v2, :cond_11c

    .line 1932
    const-string v2, "boolean"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v4, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1933
    const-string v2, "java/lang/Boolean"

    const-string v3, "valueOf"

    const-string v4, "(Z)Ljava/lang/Boolean;"

    invoke-interface {p1, v5, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_42

    .line 1934
    :cond_11c
    const-class v2, Ljava/math/BigDecimal;

    if-ne v1, v2, :cond_12b

    .line 1935
    const-string v2, "decimal"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_42

    .line 1936
    :cond_12b
    const-class v2, Ljava/lang/String;

    if-ne v1, v2, :cond_13a

    .line 1937
    const-string v2, "string"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_42

    .line 1938
    :cond_13a
    invoke-virtual {v1}, Ljava/lang/Class;->isEnum()Z

    move-result v2

    if-eqz v2, :cond_14b

    .line 1939
    const-string v2, "enum"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_42

    .line 1940
    :cond_14b
    const-class v2, Ljava/util/List;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_15e

    .line 1941
    const-string v2, "list"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_42

    .line 1943
    :cond_15e
    const-string v2, "object"

    invoke-virtual {p3, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v3, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_42
.end method

.method private _processValue(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V
    .registers 14
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "fieldInfo"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p3, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .param p4, "_end"    # Lcom/alibaba/fastjson/asm/Label;

    .prologue
    .line 1791
    new-instance v2, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v2}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1793
    .local v2, "processKeyElse_":Lcom/alibaba/fastjson/asm/Label;
    iget-object v1, p2, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 1795
    .local v1, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-eqz v4, :cond_41

    .line 1796
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1797
    .local v0, "checkValueEnd_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v4, 0x15

    const-string v5, "checkValue"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1798
    const/16 v4, 0x9a

    invoke-interface {p1, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1800
    const/4 v4, 0x1

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1801
    const/16 v4, 0x59

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1802
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1803
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->processValue:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1804
    const/16 v4, 0xa7

    invoke-interface {p1, v4, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1806
    invoke-interface {p1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1809
    .end local v0    # "checkValueEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_41
    const/16 v4, 0x19

    const/4 v5, 0x1

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1810
    const/16 v4, 0x19

    const/4 v5, 0x0

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1811
    const/16 v4, 0x59

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1812
    iget-object v4, p2, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {p3, v4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->getFieldOrinal(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1813
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    const-string v6, "getBeanContext"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "(I)"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-class v8, Lcom/alibaba/fastjson/serializer/BeanContext;

    invoke-static {v8}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p1, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1814
    const/16 v4, 0x19

    const/4 v5, 0x2

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1815
    const/16 v4, 0x19

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1817
    const-string v3, "Ljava/lang/Object;"

    .line 1818
    .local v3, "valueDesc":Ljava/lang/String;
    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_114

    .line 1819
    const/16 v4, 0x15

    const-string v5, "byte"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1820
    const/16 v4, 0xb8

    const-string v5, "java/lang/Byte"

    const-string v6, "valueOf"

    const-string v7, "(B)Ljava/lang/Byte;"

    invoke-interface {p1, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1821
    const/16 v4, 0x59

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1822
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1880
    :goto_b6
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v6, "processValue"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeFilterable_desc:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-class v8, Lcom/alibaba/fastjson/serializer/BeanContext;

    .line 1882
    invoke-static {v8}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "Ljava/lang/Object;Ljava/lang/String;"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")Ljava/lang/Object;"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 1880
    invoke-interface {p1, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1886
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->processValue:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1888
    const/16 v4, 0x19

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1889
    const/16 v4, 0x19

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->processValue:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1890
    const/16 v4, 0xa5

    invoke-interface {p1, v4, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1891
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_writeObject(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1892
    const/16 v4, 0xa7

    invoke-interface {p1, v4, p4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1894
    invoke-interface {p1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1895
    return-void

    .line 1823
    :cond_114
    sget-object v4, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_13c

    .line 1824
    const/16 v4, 0x15

    const-string v5, "short"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1825
    const/16 v4, 0xb8

    const-string v5, "java/lang/Short"

    const-string v6, "valueOf"

    const-string v7, "(S)Ljava/lang/Short;"

    invoke-interface {p1, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1826
    const/16 v4, 0x59

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1827
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1828
    :cond_13c
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_164

    .line 1829
    const/16 v4, 0x15

    const-string v5, "int"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1830
    const/16 v4, 0xb8

    const-string v5, "java/lang/Integer"

    const-string v6, "valueOf"

    const-string v7, "(I)Ljava/lang/Integer;"

    invoke-interface {p1, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1831
    const/16 v4, 0x59

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1832
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1833
    :cond_164
    sget-object v4, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_18c

    .line 1834
    const/16 v4, 0x15

    const-string v5, "char"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1835
    const/16 v4, 0xb8

    const-string v5, "java/lang/Character"

    const-string v6, "valueOf"

    const-string v7, "(C)Ljava/lang/Character;"

    invoke-interface {p1, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1836
    const/16 v4, 0x59

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1837
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1838
    :cond_18c
    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_1b5

    .line 1839
    const/16 v4, 0x16

    const-string v5, "long"

    const/4 v6, 0x2

    invoke-virtual {p3, v5, v6}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;I)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1840
    const/16 v4, 0xb8

    const-string v5, "java/lang/Long"

    const-string v6, "valueOf"

    const-string v7, "(J)Ljava/lang/Long;"

    invoke-interface {p1, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1841
    const/16 v4, 0x59

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1842
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1843
    :cond_1b5
    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_1dd

    .line 1844
    const/16 v4, 0x17

    const-string v5, "float"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1845
    const/16 v4, 0xb8

    const-string v5, "java/lang/Float"

    const-string v6, "valueOf"

    const-string v7, "(F)Ljava/lang/Float;"

    invoke-interface {p1, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1846
    const/16 v4, 0x59

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1847
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1848
    :cond_1dd
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_206

    .line 1849
    const/16 v4, 0x18

    const-string v5, "double"

    const/4 v6, 0x2

    invoke-virtual {p3, v5, v6}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;I)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1850
    const/16 v4, 0xb8

    const-string v5, "java/lang/Double"

    const-string v6, "valueOf"

    const-string v7, "(D)Ljava/lang/Double;"

    invoke-interface {p1, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1851
    const/16 v4, 0x59

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1852
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1853
    :cond_206
    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v1, v4, :cond_22e

    .line 1854
    const/16 v4, 0x15

    const-string v5, "boolean"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1855
    const/16 v4, 0xb8

    const-string v5, "java/lang/Boolean"

    const-string v6, "valueOf"

    const-string v7, "(Z)Ljava/lang/Boolean;"

    invoke-interface {p1, v4, v5, v6, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1856
    const/16 v4, 0x59

    invoke-interface {p1, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1857
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1858
    :cond_22e
    const-class v4, Ljava/math/BigDecimal;

    if-ne v1, v4, :cond_24d

    .line 1859
    const/16 v4, 0x19

    const-string v5, "decimal"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1860
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1861
    const/16 v4, 0x19

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1862
    :cond_24d
    const-class v4, Ljava/lang/String;

    if-ne v1, v4, :cond_26c

    .line 1863
    const/16 v4, 0x19

    const-string v5, "string"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1864
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1865
    const/16 v4, 0x19

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1866
    :cond_26c
    invoke-virtual {v1}, Ljava/lang/Class;->isEnum()Z

    move-result v4

    if-eqz v4, :cond_28d

    .line 1867
    const/16 v4, 0x19

    const-string v5, "enum"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1868
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1869
    const/16 v4, 0x19

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1870
    :cond_28d
    const-class v4, Ljava/util/List;

    invoke-virtual {v4, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_2b0

    .line 1871
    const/16 v4, 0x19

    const-string v5, "list"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1872
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1873
    const/16 v4, 0x19

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6

    .line 1875
    :cond_2b0
    const/16 v4, 0x19

    const-string v5, "object"

    invoke-virtual {p3, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1876
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1877
    const/16 v4, 0x19

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->original:I

    invoke-interface {p1, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_b6
.end method

.method private _seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 5
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    .line 2028
    const/16 v0, 0x10

    const/16 v1, 0x2c

    invoke-interface {p1, v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2029
    const/16 v0, 0x36

    const-string v1, "seperator"

    invoke-virtual {p2, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2030
    return-void
.end method

.method private _string(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 13
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p3, "property"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v7, 0xb6

    const/16 v6, 0x15

    const/16 v5, 0x19

    .line 1246
    new-instance v2, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v2}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1248
    .local v2, "end_":Lcom/alibaba/fastjson/asm/Label;
    invoke-direct {p0, p2, p3, p4, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_nameApply(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1249
    invoke-direct {p0, p2, p4, p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 1250
    const/16 v3, 0x3a

    const-string v4, "string"

    invoke-virtual {p4, v4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1252
    invoke-direct {p0, p2, p3, p4, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_filters(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V

    .line 1254
    new-instance v0, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v0}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1255
    .local v0, "else_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v1, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v1}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1258
    .local v1, "endIf_":Lcom/alibaba/fastjson/asm/Label;
    const-string v3, "string"

    invoke-virtual {p4, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p2, v5, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1259
    const/16 v3, 0xc7

    invoke-interface {p2, v3, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1261
    invoke-direct {p0, p2, p3, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_if_write_null(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1263
    const/16 v3, 0xa7

    invoke-interface {p2, v3, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1265
    invoke-interface {p2, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1267
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static {p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v3

    if-eqz v3, :cond_7b

    .line 1268
    const-string v3, "out"

    invoke-virtual {p4, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p2, v5, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1269
    const-string v3, "seperator"

    invoke-virtual {p4, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p2, v6, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1270
    sget v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p2, v5, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1271
    const-string v3, "string"

    invoke-virtual {p4, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p2, v5, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1272
    sget-object v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v4, "writeFieldValueStringWithDoubleQuoteCheck"

    const-string v5, "(CLjava/lang/String;Ljava/lang/String;)V"

    invoke-interface {p2, v7, v3, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1282
    :goto_71
    invoke-direct {p0, p2, p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1284
    invoke-interface {p2, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1286
    invoke-interface {p2, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1287
    return-void

    .line 1275
    :cond_7b
    const-string v3, "out"

    invoke-virtual {p4, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p2, v5, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1276
    const-string v3, "seperator"

    invoke-virtual {p4, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p2, v6, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1277
    sget v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p2, v5, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1278
    const-string v3, "string"

    invoke-virtual {p4, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p2, v5, v3}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1279
    sget-object v3, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v4, "writeFieldValue"

    const-string v5, "(CLjava/lang/String;Ljava/lang/String;)V"

    invoke-interface {p2, v7, v3, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_71
.end method

.method private _writeFieldName(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 7
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    .prologue
    const/16 v3, 0xb6

    const/16 v1, 0x19

    .line 2015
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static {p2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 2016
    const-string v0, "out"

    invoke-virtual {p2, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2017
    sget v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2018
    sget-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v1, "writeFieldNameDirect"

    const-string v2, "(Ljava/lang/String;)V"

    invoke-interface {p1, v3, v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2025
    :goto_21
    return-void

    .line 2020
    :cond_22
    const-string v0, "out"

    invoke-virtual {p2, v0}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2021
    sget v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    invoke-interface {p1, v1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 2022
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 2023
    sget-object v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v1, "writeFieldName"

    const-string v2, "(Ljava/lang/String;Z)V"

    invoke-interface {p1, v3, v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_21
.end method

.method private _writeObject(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/Label;)V
    .registers 22
    .param p1, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p2, "fieldInfo"    # Lcom/alibaba/fastjson/util/FieldInfo;
    .param p3, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .param p4, "_end"    # Lcom/alibaba/fastjson/asm/Label;

    .prologue
    .line 1566
    invoke-virtual/range {p2 .. p2}, Lcom/alibaba/fastjson/util/FieldInfo;->getFormat()Ljava/lang/String;

    move-result-object v7

    .line 1567
    .local v7, "format":Ljava/lang/String;
    move-object/from16 v0, p2

    iget-object v6, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 1569
    .local v6, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v10, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v10}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1572
    .local v10, "notNull_":Lcom/alibaba/fastjson/asm/Label;
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p3 .. p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v12

    if-eqz v12, :cond_29f

    .line 1573
    const/16 v12, 0x19

    const-string v13, "object"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1577
    :goto_22
    const/16 v12, 0x59

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 1578
    const/16 v12, 0x3a

    const-string v13, "object"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1579
    const/16 v12, 0xc7

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1580
    invoke-direct/range {p0 .. p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_if_write_null(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1581
    const/16 v12, 0xa7

    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-interface {v0, v12, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1583
    move-object/from16 v0, p1

    invoke-interface {v0, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1585
    const/16 v12, 0x19

    const-string v13, "out"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1586
    const/16 v12, 0x15

    const-string v13, "seperator"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1587
    const/16 v12, 0xb6

    sget-object v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v14, "write"

    const-string v15, "(I)V"

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13, v14, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1589
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_writeFieldName(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1591
    new-instance v5, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v5}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v5, "classIfEnd_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v4, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v4}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1592
    .local v4, "classIfElse_":Lcom/alibaba/fastjson/asm/Label;
    invoke-virtual {v6}, Ljava/lang/Class;->getModifiers()I

    move-result v12

    invoke-static {v12}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v12

    if-eqz v12, :cond_25a

    .line 1593
    invoke-static {v6}, Lcom/alibaba/fastjson/parser/ParserConfig;->isPrimitive(Ljava/lang/Class;)Z

    move-result v12

    if-nez v12, :cond_25a

    .line 1595
    const/16 v12, 0x19

    const-string v13, "object"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1596
    const/16 v12, 0xb6

    const-string v13, "java/lang/Object"

    const-string v14, "getClass"

    const-string v15, "()Ljava/lang/Class;"

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13, v14, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1597
    invoke-static {v6}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1598
    const/16 v12, 0xa6

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1600
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v1, v2, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_getFieldSer(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 1601
    const/16 v12, 0x3a

    const-string v13, "fied_ser"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1603
    new-instance v8, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v8}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v8, "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v9, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v9}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1604
    .local v9, "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v12, 0x19

    const-string v13, "fied_ser"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1605
    const/16 v12, 0xc1

    sget-object v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 1606
    const/16 v12, 0x99

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1608
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p3 .. p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v12

    if-eqz v12, :cond_2aa

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p3 .. p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v12

    if-eqz v12, :cond_2aa

    const-string v11, "writeDirectNonContext"

    .line 1612
    .local v11, "writeMethodName":Ljava/lang/String;
    :goto_11f
    const/16 v12, 0x19

    const-string v13, "fied_ser"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1613
    const/16 v12, 0xc0

    sget-object v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 1614
    const/16 v12, 0x19

    const/4 v13, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1615
    const/16 v12, 0x19

    const-string v13, "object"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1616
    const/16 v12, 0x19

    sget v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1617
    const/16 v12, 0x19

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1618
    const/16 v12, 0xb4

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static/range {p3 .. p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    iget-object v15, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "_asm_fieldType"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    const-string v15, "Ljava/lang/reflect/Type;"

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13, v14, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1620
    move-object/from16 v0, p2

    iget v12, v0, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1621
    const/16 v12, 0xb6

    sget-object v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "(L"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    sget-object v15, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13, v11, v14}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1623
    const/16 v12, 0xa7

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1625
    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1627
    const/16 v12, 0x19

    const-string v13, "fied_ser"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1628
    const/16 v12, 0x19

    const/4 v13, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1629
    const/16 v12, 0x19

    const-string v13, "object"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1630
    const/16 v12, 0x19

    sget v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1631
    const/16 v12, 0x19

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1632
    const/16 v12, 0xb4

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static/range {p3 .. p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    iget-object v15, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "_asm_fieldType"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    const-string v15, "Ljava/lang/reflect/Type;"

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13, v14, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1634
    move-object/from16 v0, p2

    iget v12, v0, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1635
    const/16 v12, 0xb9

    sget-object v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer:Ljava/lang/String;

    const-string v14, "write"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "(L"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget-object v16, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13, v14, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1638
    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1639
    const/16 v12, 0xa7

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1642
    .end local v8    # "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    .end local v9    # "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    .end local v11    # "writeMethodName":Ljava/lang/String;
    :cond_25a
    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1644
    const/16 v12, 0x19

    const/4 v13, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1645
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p3 .. p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v12

    if-eqz v12, :cond_2ae

    .line 1646
    const/16 v12, 0x19

    const-string v13, "object"

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1650
    :goto_27c
    if-eqz v7, :cond_2b8

    .line 1651
    move-object/from16 v0, p1

    invoke-interface {v0, v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1652
    const/16 v12, 0xb6

    sget-object v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v14, "writeWithFormat"

    const-string v15, "(Ljava/lang/Object;Ljava/lang/String;)V"

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13, v14, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1674
    :goto_290
    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1676
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_seperator(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1677
    return-void

    .line 1575
    .end local v4    # "classIfElse_":Lcom/alibaba/fastjson/asm/Label;
    .end local v5    # "classIfEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_29f
    const/16 v12, 0x19

    sget v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->processValue:I

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_22

    .line 1608
    .restart local v4    # "classIfElse_":Lcom/alibaba/fastjson/asm/Label;
    .restart local v5    # "classIfEnd_":Lcom/alibaba/fastjson/asm/Label;
    .restart local v8    # "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    .restart local v9    # "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_2aa
    const-string v11, "write"

    goto/16 :goto_11f

    .line 1648
    .end local v8    # "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    .end local v9    # "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_2ae
    const/16 v12, 0x19

    sget v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->processValue:I

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto :goto_27c

    .line 1655
    :cond_2b8
    const/16 v12, 0x19

    sget v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1656
    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    instance-of v12, v12, Ljava/lang/Class;

    if-eqz v12, :cond_2e3

    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    check-cast v12, Ljava/lang/Class;

    .line 1657
    invoke-virtual {v12}, Ljava/lang/Class;->isPrimitive()Z

    move-result v12

    if-eqz v12, :cond_2e3

    .line 1658
    const/16 v12, 0xb6

    sget-object v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v14, "writeWithFieldName"

    const-string v15, "(Ljava/lang/Object;Ljava/lang/Object;)V"

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13, v14, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_290

    .line 1661
    :cond_2e3
    move-object/from16 v0, p2

    iget-object v12, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v13, Ljava/lang/String;

    if-ne v12, v13, :cond_316

    .line 1662
    const-class v12, Ljava/lang/String;

    invoke-static {v12}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1668
    :goto_2fa
    move-object/from16 v0, p2

    iget v12, v0, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 1670
    const/16 v12, 0xb6

    sget-object v13, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v14, "writeWithFieldName"

    const-string v15, "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13, v14, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_290

    .line 1664
    :cond_316
    const/16 v12, 0x19

    const/4 v13, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1665
    const/16 v12, 0xb4

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static/range {p3 .. p3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p2

    iget-object v15, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "_asm_fieldType"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    const-string v15, "Ljava/lang/reflect/Type;"

    move-object/from16 v0, p1

    invoke-interface {v0, v12, v13, v14, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2fa
.end method

.method private generateWriteAsArray(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Ljava/util/List;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 39
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 446
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "getters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 447
    const/16 v29, 0x10

    const/16 v30, 0x5b

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 448
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v28

    .line 452
    .local v28, "size":I
    if-nez v28, :cond_75

    .line 453
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 454
    const/16 v29, 0x10

    const/16 v30, 0x5d

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 455
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 788
    :cond_74
    return-void

    .line 459
    :cond_75
    const/16 v20, 0x0

    .local v20, "i":I
    :goto_77
    move/from16 v0, v20

    move/from16 v1, v28

    if-ge v0, v1, :cond_74

    .line 460
    add-int/lit8 v29, v28, -0x1

    move/from16 v0, v20

    move/from16 v1, v29

    if-ne v0, v1, :cond_11d

    const/16 v27, 0x5d

    .line 462
    .local v27, "seperator":C
    :goto_87
    move-object/from16 v0, p3

    move/from16 v1, v20

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 463
    .local v10, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v9, v10, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 465
    .local v9, "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    move-object/from16 v29, v0

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 466
    const/16 v29, 0x3a

    sget v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 468
    sget-object v29, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    if-eq v9, v0, :cond_bd

    sget-object v29, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    if-eq v9, v0, :cond_bd

    sget-object v29, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    if-ne v9, v0, :cond_121

    .line 472
    :cond_bd
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 473
    const/16 v29, 0x59

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 474
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 475
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "writeInt"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 476
    const/16 v29, 0x10

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 477
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 459
    :goto_119
    add-int/lit8 v20, v20, 0x1

    goto/16 :goto_77

    .line 460
    .end local v9    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v10    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v27    # "seperator":C
    :cond_11d
    const/16 v27, 0x2c

    goto/16 :goto_87

    .line 478
    .restart local v9    # "fieldClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v10    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    .restart local v27    # "seperator":C
    :cond_121
    sget-object v29, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    if-ne v9, v0, :cond_184

    .line 479
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 480
    const/16 v29, 0x59

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 481
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 482
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "writeLong"

    const-string v32, "(J)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 483
    const/16 v29, 0x10

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 484
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_119

    .line 485
    :cond_184
    sget-object v29, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    if-ne v9, v0, :cond_1f1

    .line 486
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 487
    const/16 v29, 0x59

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 488
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 489
    const/16 v29, 0x4

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 490
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "writeFloat"

    const-string v32, "(FZ)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 491
    const/16 v29, 0x10

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 492
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_119

    .line 493
    :cond_1f1
    sget-object v29, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    if-ne v9, v0, :cond_25e

    .line 494
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 495
    const/16 v29, 0x59

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 496
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 497
    const/16 v29, 0x4

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 498
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "writeDouble"

    const-string v32, "(DZ)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    const/16 v29, 0x10

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 500
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_119

    .line 501
    :cond_25e
    sget-object v29, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    if-ne v9, v0, :cond_2c2

    .line 502
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 503
    const/16 v29, 0x59

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 504
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 505
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(Z)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 506
    const/16 v29, 0x10

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 507
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_119

    .line 508
    :cond_2c2
    sget-object v29, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v29

    if-ne v9, v0, :cond_31d

    .line 509
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 510
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 511
    const/16 v29, 0xb8

    const-string v30, "java/lang/Character"

    const-string v31, "toString"

    const-string v32, "(C)Ljava/lang/String;"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 512
    const/16 v29, 0x10

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 513
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "writeString"

    const-string v32, "(Ljava/lang/String;C)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_119

    .line 515
    :cond_31d
    const-class v29, Ljava/lang/String;

    move-object/from16 v0, v29

    if-ne v9, v0, :cond_363

    .line 516
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 517
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 518
    const/16 v29, 0x10

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 519
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "writeString"

    const-string v32, "(Ljava/lang/String;C)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_119

    .line 520
    :cond_363
    invoke-virtual {v9}, Ljava/lang/Class;->isEnum()Z

    move-result v29

    if-eqz v29, :cond_3c7

    .line 521
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 522
    const/16 v29, 0x59

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 523
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 524
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "writeEnum"

    const-string v32, "(Ljava/lang/Enum;)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 525
    const/16 v29, 0x10

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 526
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_119

    .line 527
    :cond_3c7
    const-class v29, Ljava/util/List;

    move-object/from16 v0, v29

    invoke-virtual {v0, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v29

    if-eqz v29, :cond_a85

    .line 528
    iget-object v11, v10, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    .line 531
    .local v11, "fieldType":Ljava/lang/reflect/Type;
    instance-of v0, v11, Ljava/lang/Class;

    move/from16 v29, v0

    if-eqz v29, :cond_499

    .line 532
    const-class v8, Ljava/lang/Object;

    .line 537
    .end local v11    # "fieldType":Ljava/lang/reflect/Type;
    .local v8, "elementType":Ljava/lang/reflect/Type;
    :goto_3db
    const/4 v7, 0x0

    .line 538
    .local v7, "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v0, v8, Ljava/lang/Class;

    move/from16 v29, v0

    if-eqz v29, :cond_3ec

    move-object v7, v8

    .line 539
    check-cast v7, Ljava/lang/Class;

    .line 541
    const-class v29, Ljava/lang/Object;

    move-object/from16 v0, v29

    if-ne v7, v0, :cond_3ec

    .line 542
    const/4 v7, 0x0

    .line 546
    :cond_3ec
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 547
    const/16 v29, 0xc0

    const-string v30, "java/util/List"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 548
    const/16 v29, 0x3a

    const-string v30, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 550
    const-class v29, Ljava/lang/String;

    move-object/from16 v0, v29

    if-ne v7, v0, :cond_4a5

    .line 551
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v29

    if-eqz v29, :cond_4a5

    .line 552
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 553
    const/16 v29, 0x19

    const-string v30, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 554
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(Ljava/util/List;)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 698
    .end local v8    # "elementType":Ljava/lang/reflect/Type;
    :goto_462
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 699
    const/16 v29, 0x10

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 700
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_119

    .line 534
    .end local v7    # "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .restart local v11    # "fieldType":Ljava/lang/reflect/Type;
    :cond_499
    check-cast v11, Ljava/lang/reflect/ParameterizedType;

    .end local v11    # "fieldType":Ljava/lang/reflect/Type;
    invoke-interface {v11}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v29

    const/16 v30, 0x0

    aget-object v8, v29, v30

    .restart local v8    # "elementType":Ljava/lang/reflect/Type;
    goto/16 :goto_3db

    .line 556
    .restart local v7    # "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_4a5
    new-instance v26, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v26 .. v26}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v26, "nullEnd_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v25, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v25 .. v25}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 558
    .local v25, "nullElse_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v29, 0x19

    const-string v30, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 559
    const/16 v29, 0xc7

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 561
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 562
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "writeNull"

    const-string v32, "()V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 563
    const/16 v29, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v26

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 565
    move-object/from16 v0, p2

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 567
    const/16 v29, 0x19

    const-string v30, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 568
    const/16 v29, 0xb9

    const-string v30, "java/util/List"

    const-string v31, "size"

    const-string v32, "()I"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 569
    const/16 v29, 0x36

    const-string v30, "size"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 571
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 572
    const/16 v29, 0x10

    const/16 v30, 0x5b

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 573
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 575
    new-instance v18, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v18 .. v18}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v18, "for_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v13, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v13}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v13, "forFirst_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v12, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v12}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 577
    .local v12, "forEnd_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v29, 0x3

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 578
    const/16 v29, 0x36

    const-string v30, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 581
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 582
    const/16 v29, 0x15

    const-string v30, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 583
    const/16 v29, 0x15

    const-string v30, "size"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 584
    const/16 v29, 0xa2

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 586
    const/16 v29, 0x15

    const-string v30, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 587
    const/16 v29, 0x99

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 589
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 590
    const/16 v29, 0x10

    const/16 v30, 0x2c

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 591
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 593
    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 595
    const/16 v29, 0x19

    const-string v30, "list"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 596
    const/16 v29, 0x15

    const-string v30, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 597
    const/16 v29, 0xb9

    const-string v30, "java/util/List"

    const-string v31, "get"

    const-string v32, "(I)Ljava/lang/Object;"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 598
    const/16 v29, 0x3a

    const-string v30, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 600
    new-instance v17, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v17 .. v17}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v17, "forItemNullEnd_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v16, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v16 .. v16}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 602
    .local v16, "forItemNullElse_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v29, 0x19

    const-string v30, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 603
    const/16 v29, 0xc7

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v16

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 605
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 606
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "writeNull"

    const-string v32, "()V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 607
    const/16 v29, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v17

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 609
    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 611
    new-instance v15, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v15}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v15, "forItemClassIfEnd_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v14, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v14}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 612
    .local v14, "forItemClassIfElse_":Lcom/alibaba/fastjson/asm/Label;
    if-eqz v7, :cond_902

    invoke-virtual {v7}, Ljava/lang/Class;->getModifiers()I

    move-result v29

    invoke-static/range {v29 .. v29}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v29

    if-eqz v29, :cond_902

    .line 613
    const/16 v29, 0x19

    const-string v30, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 614
    const/16 v29, 0xb6

    const-string v30, "java/lang/Object"

    const-string v31, "getClass"

    const-string v32, "()Ljava/lang/Class;"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 615
    invoke-static {v7}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 616
    const/16 v29, 0xa6

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1, v14}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 618
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v10, v7}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_getListFieldItemSer(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Ljava/lang/Class;)V

    .line 619
    const/16 v29, 0x3a

    const-string v30, "list_item_desc"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 621
    new-instance v21, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v21 .. v21}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v21, "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v22, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v22 .. v22}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 623
    .local v22, "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v29

    if-eqz v29, :cond_860

    .line 624
    const/16 v29, 0x19

    const-string v30, "list_item_desc"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 625
    const/16 v29, 0xc1

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 626
    const/16 v29, 0x99

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 628
    const/16 v29, 0x19

    const-string v30, "list_item_desc"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 629
    const/16 v29, 0xc0

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 630
    const/16 v29, 0x19

    const/16 v30, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 631
    const/16 v29, 0x19

    const-string v30, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 632
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v29

    if-eqz v29, :cond_9ea

    .line 633
    const/16 v29, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 639
    :goto_802
    invoke-static {v7}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 640
    iget v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    move/from16 v29, v0

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 641
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    const-string v31, "writeAsArrayNonContext"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "(L"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    sget-object v33, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 643
    const/16 v29, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 645
    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 648
    :cond_860
    const/16 v29, 0x19

    const-string v30, "list_item_desc"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 649
    const/16 v29, 0x19

    const/16 v30, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 650
    const/16 v29, 0x19

    const-string v30, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 651
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v29

    if-eqz v29, :cond_a16

    .line 652
    const/16 v29, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 657
    :goto_8a6
    invoke-static {v7}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 658
    iget v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    move/from16 v29, v0

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 659
    const/16 v29, 0xb9

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer:Ljava/lang/String;

    const-string v31, "write"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "(L"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    sget-object v33, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 661
    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 662
    const/16 v29, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 665
    .end local v21    # "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    .end local v22    # "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_902
    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 666
    const/16 v29, 0x19

    const/16 v30, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 667
    const/16 v29, 0x19

    const-string v30, "list_item"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 668
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v29

    if-eqz v29, :cond_a42

    .line 669
    const/16 v29, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 674
    :goto_938
    if-eqz v7, :cond_a6e

    invoke-virtual {v7}, Ljava/lang/Class;->getModifiers()I

    move-result v29

    invoke-static/range {v29 .. v29}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v29

    if-eqz v29, :cond_a6e

    .line 675
    check-cast v8, Ljava/lang/Class;

    .end local v8    # "elementType":Ljava/lang/reflect/Type;
    invoke-static {v8}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 676
    iget v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    move/from16 v29, v0

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 677
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v31, "writeWithFieldName"

    const-string v32, "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 683
    :goto_979
    move-object/from16 v0, p2

    invoke-interface {v0, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 684
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 686
    const-string v29, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v29

    const/16 v30, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitIincInsn(II)V

    .line 687
    const/16 v29, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v18

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 689
    move-object/from16 v0, p2

    invoke-interface {v0, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 691
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 692
    const/16 v29, 0x10

    const/16 v30, 0x5d

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 693
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 695
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    goto/16 :goto_462

    .line 635
    .restart local v8    # "elementType":Ljava/lang/reflect/Type;
    .restart local v21    # "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    .restart local v22    # "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_9ea
    const/16 v29, 0x15

    const-string v30, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 636
    const/16 v29, 0xb8

    const-string v30, "java/lang/Integer"

    const-string v31, "valueOf"

    const-string v32, "(I)Ljava/lang/Integer;"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_802

    .line 654
    :cond_a16
    const/16 v29, 0x15

    const-string v30, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 655
    const/16 v29, 0xb8

    const-string v30, "java/lang/Integer"

    const-string v31, "valueOf"

    const-string v32, "(I)Ljava/lang/Integer;"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_8a6

    .line 671
    .end local v21    # "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    .end local v22    # "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_a42
    const/16 v29, 0x15

    const-string v30, "i"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 672
    const/16 v29, 0xb8

    const-string v30, "java/lang/Integer"

    const-string v31, "valueOf"

    const-string v32, "(I)Ljava/lang/Integer;"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_938

    .line 680
    :cond_a6e
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v31, "writeWithFieldName"

    const-string v32, "(Ljava/lang/Object;Ljava/lang/Object;)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_979

    .line 702
    .end local v7    # "elementClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v8    # "elementType":Ljava/lang/reflect/Type;
    .end local v12    # "forEnd_":Lcom/alibaba/fastjson/asm/Label;
    .end local v13    # "forFirst_":Lcom/alibaba/fastjson/asm/Label;
    .end local v14    # "forItemClassIfElse_":Lcom/alibaba/fastjson/asm/Label;
    .end local v15    # "forItemClassIfEnd_":Lcom/alibaba/fastjson/asm/Label;
    .end local v16    # "forItemNullElse_":Lcom/alibaba/fastjson/asm/Label;
    .end local v17    # "forItemNullEnd_":Lcom/alibaba/fastjson/asm/Label;
    .end local v18    # "for_":Lcom/alibaba/fastjson/asm/Label;
    .end local v25    # "nullElse_":Lcom/alibaba/fastjson/asm/Label;
    .end local v26    # "nullEnd_":Lcom/alibaba/fastjson/asm/Label;
    :cond_a85
    new-instance v24, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v24 .. v24}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v24, "notNullEnd_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v23, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v23 .. v23}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 704
    .local v23, "notNullElse_":Lcom/alibaba/fastjson/asm/Label;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_get(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 705
    const/16 v29, 0x59

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 706
    const/16 v29, 0x3a

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "field_"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    iget-object v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 707
    const/16 v29, 0xc7

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v23

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 709
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 710
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "writeNull"

    const-string v32, "()V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    const/16 v29, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v24

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 713
    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 715
    new-instance v6, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v6}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .local v6, "classIfEnd_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v5, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v5}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 716
    .local v5, "classIfElse_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v29, 0x19

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "field_"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    iget-object v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 717
    const/16 v29, 0xb6

    const-string v30, "java/lang/Object"

    const-string v31, "getClass"

    const-string v32, "()Ljava/lang/Class;"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 718
    invoke-static {v9}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 719
    const/16 v29, 0xa6

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 721
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p2

    invoke-direct {v0, v1, v2, v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_getFieldSer(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;)V

    .line 722
    const/16 v29, 0x3a

    const-string v30, "fied_ser"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 724
    new-instance v21, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v21 .. v21}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .restart local v21    # "instanceOfElse_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v22, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v22 .. v22}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 725
    .restart local v22    # "instanceOfEnd_":Lcom/alibaba/fastjson/asm/Label;
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v29

    if-eqz v29, :cond_ca8

    invoke-virtual {v9}, Ljava/lang/Class;->getModifiers()I

    move-result v29

    invoke-static/range {v29 .. v29}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v29

    if-eqz v29, :cond_ca8

    .line 726
    const/16 v29, 0x19

    const-string v30, "fied_ser"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 727
    const/16 v29, 0xc1

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 728
    const/16 v29, 0x99

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 730
    const/16 v29, 0x19

    const-string v30, "fied_ser"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 731
    const/16 v29, 0xc0

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 732
    const/16 v29, 0x19

    const/16 v30, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 733
    const/16 v29, 0x19

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "field_"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    iget-object v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 734
    const/16 v29, 0x19

    sget v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 735
    invoke-static {v9}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 736
    iget v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    move/from16 v29, v0

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 737
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    const-string v31, "writeAsArrayNonContext"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "(L"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    sget-object v33, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 739
    const/16 v29, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v22

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 741
    move-object/from16 v0, p2

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 743
    :cond_ca8
    const/16 v29, 0x19

    const-string v30, "fied_ser"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 744
    const/16 v29, 0x19

    const/16 v30, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 745
    const/16 v29, 0x19

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "field_"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    iget-object v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 746
    const/16 v29, 0x19

    sget v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 747
    invoke-static {v9}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 748
    iget v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    move/from16 v29, v0

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 749
    const/16 v29, 0xb9

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer:Ljava/lang/String;

    const-string v31, "write"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "(L"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    sget-object v33, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 751
    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 752
    const/16 v29, 0xa7

    move-object/from16 v0, p2

    move/from16 v1, v29

    invoke-interface {v0, v1, v6}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 754
    move-object/from16 v0, p2

    invoke-interface {v0, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 755
    invoke-virtual {v10}, Lcom/alibaba/fastjson/util/FieldInfo;->getFormat()Ljava/lang/String;

    move-result-object v19

    .line 757
    .local v19, "format":Ljava/lang/String;
    const/16 v29, 0x19

    const/16 v30, 0x1

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 758
    const/16 v29, 0x19

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "field_"

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    iget-object v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 759
    if-eqz v19, :cond_e06

    .line 760
    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 761
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v31, "writeWithFormat"

    const-string v32, "(Ljava/lang/Object;Ljava/lang/String;)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 779
    :goto_dc3
    move-object/from16 v0, p2

    invoke-interface {v0, v6}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 780
    move-object/from16 v0, p2

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 783
    const/16 v29, 0x19

    const-string v30, "out"

    move-object/from16 v0, p4

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v30

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 784
    const/16 v29, 0x10

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v27

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 785
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v31, "write"

    const-string v32, "(I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_119

    .line 764
    :cond_e06
    const/16 v29, 0x19

    sget v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 765
    iget-object v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    move-object/from16 v29, v0

    move-object/from16 v0, v29

    instance-of v0, v0, Ljava/lang/Class;

    move/from16 v29, v0

    if-eqz v29, :cond_e41

    iget-object v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->fieldType:Ljava/lang/reflect/Type;

    move-object/from16 v29, v0

    check-cast v29, Ljava/lang/Class;

    .line 766
    invoke-virtual/range {v29 .. v29}, Ljava/lang/Class;->isPrimitive()Z

    move-result v29

    if-eqz v29, :cond_e41

    .line 767
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v31, "writeWithFieldName"

    const-string v32, "(Ljava/lang/Object;Ljava/lang/Object;)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_dc3

    .line 770
    :cond_e41
    const/16 v29, 0x19

    const/16 v30, 0x0

    move-object/from16 v0, p2

    move/from16 v1, v29

    move/from16 v2, v30

    invoke-interface {v0, v1, v2}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 771
    const/16 v29, 0xb4

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v30

    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    move-object/from16 v32, v0

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    const-string v32, "_asm_fieldType"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v31

    const-string v32, "Ljava/lang/reflect/Type;"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 773
    iget v0, v10, Lcom/alibaba/fastjson/util/FieldInfo;->serialzeFeatures:I

    move/from16 v29, v0

    invoke-static/range {v29 .. v29}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    move-object/from16 v0, p2

    move-object/from16 v1, v29

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 775
    const/16 v29, 0xb6

    sget-object v30, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v31, "writeWithFieldName"

    const-string v32, "(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    move-object/from16 v0, p2

    move/from16 v1, v29

    move-object/from16 v2, v30

    move-object/from16 v3, v31

    move-object/from16 v4, v32

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_dc3
.end method

.method private generateWriteMethod(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Ljava/util/List;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V
    .registers 33
    .param p2, "mw"    # Lcom/alibaba/fastjson/asm/MethodVisitor;
    .param p4, "context"    # Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lcom/alibaba/fastjson/asm/MethodVisitor;",
            "Ljava/util/List",
            "<",
            "Lcom/alibaba/fastjson/util/FieldInfo;",
            ">;",
            "Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 793
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "getters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    new-instance v14, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v14}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 795
    .local v14, "end":Lcom/alibaba/fastjson/asm/Label;
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v23

    .line 797
    .local v23, "size":I
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-nez v4, :cond_105

    .line 799
    new-instance v16, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v16 .. v16}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 800
    .local v16, "endSupper_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v24, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v24 .. v24}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 801
    .local v24, "supper_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v4, 0x19

    const-string v5, "out"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 802
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->PrettyFormat:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v4, v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 803
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v6, "isEnabled"

    const-string v8, "(I)Z"

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 804
    const/16 v4, 0x9a

    move-object/from16 v0, p2

    move-object/from16 v1, v24

    invoke-interface {v0, v4, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 806
    const/16 v20, 0x0

    .line 807
    .local v20, "hasMethod":Z
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_51
    :goto_51
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_66

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 808
    .local v19, "getter":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v19

    iget-object v5, v0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    if-eqz v5, :cond_51

    .line 809
    const/16 v20, 0x1

    goto :goto_51

    .line 813
    .end local v19    # "getter":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_66
    if-eqz v20, :cond_4d8

    .line 814
    const/16 v4, 0x19

    const-string v5, "out"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 815
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->IgnoreErrorGetter:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v4, v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 816
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v6, "isEnabled"

    const-string v8, "(I)Z"

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 817
    const/16 v4, 0x99

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-interface {v0, v4, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 822
    :goto_9a
    move-object/from16 v0, p2

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 823
    const/16 v4, 0x19

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 824
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 825
    const/16 v4, 0x19

    const/4 v5, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 826
    const/16 v4, 0x19

    const/4 v5, 0x3

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 827
    const/16 v4, 0x19

    const/4 v5, 0x4

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 828
    const/16 v4, 0x15

    const/4 v5, 0x5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 829
    const/16 v4, 0xb7

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    const-string v6, "write"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "(L"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 832
    const/16 v4, 0xb1

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 834
    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 837
    .end local v16    # "endSupper_":Lcom/alibaba/fastjson/asm/Label;
    .end local v20    # "hasMethod":Z
    .end local v24    # "supper_":Lcom/alibaba/fastjson/asm/Label;
    :cond_105
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-nez v4, :cond_169

    .line 838
    new-instance v15, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v15}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 841
    .local v15, "endRef_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v4, 0x19

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 842
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 843
    const/16 v4, 0x19

    const/4 v5, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 844
    const/16 v4, 0x15

    const/4 v5, 0x5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 845
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    const-string v6, "writeReference"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "(L"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ";Ljava/lang/Object;I)Z"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 848
    const/16 v4, 0x99

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 850
    const/16 v4, 0xb1

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 852
    move-object/from16 v0, p2

    invoke-interface {v0, v15}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 857
    .end local v15    # "endRef_":Lcom/alibaba/fastjson/asm/Label;
    :cond_169
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-eqz v4, :cond_4e7

    .line 858
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-eqz v4, :cond_4e3

    .line 859
    const-string v26, "writeAsArrayNonContext"

    .line 867
    .local v26, "writeAsArrayMethodName":Ljava/lang/String;
    :goto_177
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->beanFeatures:I
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$400(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)I

    move-result v4

    sget-object v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BeanToArray:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v5, v5, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    and-int/2addr v4, v5

    if-nez v4, :cond_4eb

    .line 868
    new-instance v17, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v17 .. v17}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 870
    .local v17, "endWriteAsArray_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v4, 0x19

    const-string v5, "out"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 871
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->BeanToArray:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v4, v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 872
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v6, "isEnabled"

    const-string v8, "(I)Z"

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 873
    const/16 v4, 0x99

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-interface {v0, v4, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 876
    const/16 v4, 0x19

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 877
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 878
    const/16 v4, 0x19

    const/4 v5, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 879
    const/16 v4, 0x19

    const/4 v5, 0x3

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 880
    const/16 v4, 0x19

    const/4 v5, 0x4

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 881
    const/16 v4, 0x15

    const/4 v5, 0x5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 882
    const/16 v4, 0xb6

    .line 883
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "(L"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v8, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 882
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-interface {v0, v4, v5, v1, v6}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 887
    const/16 v4, 0xb1

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 889
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 904
    .end local v17    # "endWriteAsArray_":Lcom/alibaba/fastjson/asm/Label;
    :goto_21f
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-nez v4, :cond_2b6

    .line 905
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 906
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v6, "getContext"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "()"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerialContext_desc:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 907
    const/16 v4, 0x3a

    const-string v5, "parent"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 909
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 910
    const/16 v4, 0x19

    const-string v5, "parent"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 911
    const/16 v4, 0x19

    const/4 v5, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 912
    const/16 v4, 0x19

    const/4 v5, 0x3

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 913
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->beanSerializeFeatures:I
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$500(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 914
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v6, "setContext"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerialContext_desc:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "Ljava/lang/Object;Ljava/lang/Object;I)V"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 919
    :cond_2b6
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-nez v4, :cond_54c

    .line 920
    new-instance v18, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v18 .. v18}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 921
    .local v18, "end_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v13, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v13}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 922
    .local v13, "else_":Lcom/alibaba/fastjson/asm/Label;
    new-instance v27, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v27 .. v27}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 924
    .local v27, "writeClass_":Lcom/alibaba/fastjson/asm/Label;
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 925
    const/16 v4, 0x19

    const/4 v5, 0x4

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 926
    const/16 v4, 0x19

    const/4 v5, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 927
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v6, "isWriteClassName"

    const-string v8, "(Ljava/lang/reflect/Type;Ljava/lang/Object;)Z"

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 929
    const/16 v4, 0x99

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 932
    const/16 v4, 0x19

    const/4 v5, 0x4

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 933
    const/16 v4, 0x19

    const/4 v5, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 934
    const/16 v4, 0xb6

    const-string v5, "java/lang/Object"

    const-string v6, "getClass"

    const-string v8, "()Ljava/lang/Class;"

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 935
    const/16 v4, 0xa5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 937
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 938
    const/16 v4, 0x19

    const-string v5, "out"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 940
    const/16 v25, 0x0

    .line 941
    .local v25, "typeName":Ljava/lang/String;
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$600(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Lcom/alibaba/fastjson/annotation/JSONType;

    move-result-object v4

    if-eqz v4, :cond_341

    .line 942
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->jsonType:Lcom/alibaba/fastjson/annotation/JSONType;
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$600(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Lcom/alibaba/fastjson/annotation/JSONType;

    move-result-object v4

    invoke-interface {v4}, Lcom/alibaba/fastjson/annotation/JSONType;->typeName()Ljava/lang/String;

    move-result-object v25

    .line 944
    :cond_341
    if-eqz v25, :cond_349

    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_34d

    .line 945
    :cond_349
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v25

    .line 947
    :cond_34d
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "{\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/alibaba/fastjson/JSON;->DEFAULT_TYPE_KEY:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\":\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 948
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v6, "write"

    const-string v8, "(Ljava/lang/String;)V"

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 949
    const/16 v4, 0x10

    const/16 v5, 0x2c

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 950
    const/16 v4, 0xa7

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-interface {v0, v4, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 952
    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 953
    const/16 v4, 0x10

    const/16 v5, 0x7b

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 955
    move-object/from16 v0, p2

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 960
    .end local v13    # "else_":Lcom/alibaba/fastjson/asm/Label;
    .end local v18    # "end_":Lcom/alibaba/fastjson/asm/Label;
    .end local v25    # "typeName":Ljava/lang/String;
    .end local v27    # "writeClass_":Lcom/alibaba/fastjson/asm/Label;
    :goto_3ad
    const/16 v4, 0x36

    const-string v5, "seperator"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 962
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-nez v4, :cond_3cb

    .line 963
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_before(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 966
    :cond_3cb
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-nez v4, :cond_486

    .line 967
    const/16 v4, 0x19

    const-string v5, "out"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 968
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v6, "isNotWriteDefaultValue"

    const-string v8, "()Z"

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 969
    const/16 v4, 0x36

    const-string v5, "notWriteDefaultValue"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 971
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 972
    const/16 v4, 0x19

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 973
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v6, "checkValue"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeFilterable_desc:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")Z"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 974
    const/16 v4, 0x36

    const-string v5, "checkValue"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 976
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 977
    const/16 v4, 0x19

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 978
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v6, "hasNameFilters"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeFilterable_desc:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")Z"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 979
    const/16 v4, 0x36

    const-string v5, "hasNameFilters"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 982
    :cond_486
    const/16 v21, 0x0

    .local v21, "i":I
    :goto_488
    move/from16 v0, v21

    move/from16 v1, v23

    if-ge v0, v1, :cond_627

    .line 983
    move-object/from16 v0, p3

    move/from16 v1, v21

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 984
    .local v7, "property":Lcom/alibaba/fastjson/util/FieldInfo;
    iget-object v0, v7, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    move-object/from16 v22, v0

    .line 986
    .local v22, "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    iget-object v4, v7, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 987
    const/16 v4, 0x3a

    sget v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->fieldName:I

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 989
    sget-object v4, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v22

    if-eq v0, v4, :cond_4be

    sget-object v4, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v22

    if-eq v0, v4, :cond_4be

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v22

    if-ne v0, v4, :cond_557

    .line 992
    :cond_4be
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v9

    const/16 v10, 0x49

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    invoke-direct/range {v4 .. v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_int(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;IC)V

    .line 982
    :goto_4d5
    add-int/lit8 v21, v21, 0x1

    goto :goto_488

    .line 819
    .end local v7    # "property":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v21    # "i":I
    .end local v22    # "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v26    # "writeAsArrayMethodName":Ljava/lang/String;
    .restart local v16    # "endSupper_":Lcom/alibaba/fastjson/asm/Label;
    .restart local v20    # "hasMethod":Z
    .restart local v24    # "supper_":Lcom/alibaba/fastjson/asm/Label;
    :cond_4d8
    const/16 v4, 0xa7

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-interface {v0, v4, v1}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    goto/16 :goto_9a

    .line 861
    .end local v16    # "endSupper_":Lcom/alibaba/fastjson/asm/Label;
    .end local v20    # "hasMethod":Z
    .end local v24    # "supper_":Lcom/alibaba/fastjson/asm/Label;
    :cond_4e3
    const-string v26, "writeAsArray"

    .restart local v26    # "writeAsArrayMethodName":Ljava/lang/String;
    goto/16 :goto_177

    .line 864
    .end local v26    # "writeAsArrayMethodName":Ljava/lang/String;
    :cond_4e7
    const-string v26, "writeAsArrayNormal"

    .restart local v26    # "writeAsArrayMethodName":Ljava/lang/String;
    goto/16 :goto_177

    .line 891
    :cond_4eb
    const/16 v4, 0x19

    const/4 v5, 0x0

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 892
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 893
    const/16 v4, 0x19

    const/4 v5, 0x2

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 894
    const/16 v4, 0x19

    const/4 v5, 0x3

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 895
    const/16 v4, 0x19

    const/4 v5, 0x4

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 896
    const/16 v4, 0x15

    const/4 v5, 0x5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 897
    const/16 v4, 0xb6

    .line 898
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->className:Ljava/lang/String;
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$300(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "(L"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-object v8, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 897
    move-object/from16 v0, p2

    move-object/from16 v1, v26

    invoke-interface {v0, v4, v5, v1, v6}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 901
    const/16 v4, 0xb1

    move-object/from16 v0, p2

    invoke-interface {v0, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    goto/16 :goto_21f

    .line 957
    :cond_54c
    const/16 v4, 0x10

    const/16 v5, 0x7b

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    goto/16 :goto_3ad

    .line 993
    .restart local v7    # "property":Lcom/alibaba/fastjson/util/FieldInfo;
    .restart local v21    # "i":I
    .restart local v22    # "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_557
    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v22

    if-ne v0, v4, :cond_56a

    .line 994
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v7, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_long(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    goto/16 :goto_4d5

    .line 995
    :cond_56a
    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v22

    if-ne v0, v4, :cond_57d

    .line 996
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v7, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_float(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    goto/16 :goto_4d5

    .line 997
    :cond_57d
    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v22

    if-ne v0, v4, :cond_590

    .line 998
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v7, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_double(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    goto/16 :goto_4d5

    .line 999
    :cond_590
    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v22

    if-ne v0, v4, :cond_5ad

    .line 1000
    const-string v4, "boolean"

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v9

    const/16 v10, 0x5a

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    invoke-direct/range {v4 .. v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_int(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;IC)V

    goto/16 :goto_4d5

    .line 1001
    :cond_5ad
    sget-object v4, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    move-object/from16 v0, v22

    if-ne v0, v4, :cond_5ca

    .line 1002
    const-string v4, "char"

    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v9

    const/16 v10, 0x43

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    move-object/from16 v8, p4

    invoke-direct/range {v4 .. v10}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_int(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;IC)V

    goto/16 :goto_4d5

    .line 1003
    :cond_5ca
    const-class v4, Ljava/lang/String;

    move-object/from16 v0, v22

    if-ne v0, v4, :cond_5dd

    .line 1004
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v7, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_string(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    goto/16 :goto_4d5

    .line 1005
    :cond_5dd
    const-class v4, Ljava/math/BigDecimal;

    move-object/from16 v0, v22

    if-ne v0, v4, :cond_5f0

    .line 1006
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v7, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_decimal(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    goto/16 :goto_4d5

    .line 1007
    :cond_5f0
    const-class v4, Ljava/util/List;

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_607

    .line 1008
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v7, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_list(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    goto/16 :goto_4d5

    .line 1009
    :cond_607
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Class;->isEnum()Z

    move-result v4

    if-eqz v4, :cond_61a

    .line 1010
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v7, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_enum(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    goto/16 :goto_4d5

    .line 1012
    :cond_61a
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    invoke-direct {v0, v1, v2, v7, v3}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_object(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/util/FieldInfo;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    goto/16 :goto_4d5

    .line 1016
    .end local v7    # "property":Lcom/alibaba/fastjson/util/FieldInfo;
    .end local v22    # "propertyClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_627
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-nez v4, :cond_636

    .line 1017
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-direct {v0, v1, v2}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->_after(Lcom/alibaba/fastjson/asm/MethodVisitor;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 1020
    :cond_636
    new-instance v11, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v11}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1021
    .local v11, "_else":Lcom/alibaba/fastjson/asm/Label;
    new-instance v12, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct {v12}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 1023
    .local v12, "_end_if":Lcom/alibaba/fastjson/asm/Label;
    const/16 v4, 0x15

    const-string v5, "seperator"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1024
    const/16 v4, 0x10

    const/16 v5, 0x7b

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitIntInsn(II)V

    .line 1025
    const/16 v4, 0xa0

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v11}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 1027
    const/16 v4, 0x19

    const-string v5, "out"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1028
    const/16 v4, 0x10

    const/16 v5, 0x7b

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1029
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v6, "write"

    const-string v8, "(I)V"

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1031
    move-object/from16 v0, p2

    invoke-interface {v0, v11}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1033
    const/16 v4, 0x19

    const-string v5, "out"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1034
    const/16 v4, 0x10

    const/16 v5, 0x7d

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1035
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v6, "write"

    const-string v8, "(I)V"

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1037
    move-object/from16 v0, p2

    invoke-interface {v0, v12}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1038
    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 1040
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->nonContext:Z
    invoke-static/range {p4 .. p4}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$200(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-nez v4, :cond_6fb

    .line 1041
    const/16 v4, 0x19

    const/4 v5, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1042
    const/16 v4, 0x19

    const-string v5, "parent"

    move-object/from16 v0, p4

    invoke-virtual {v0, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 1043
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v6, "setContext"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerialContext_desc:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ")V"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-interface {v0, v4, v5, v6, v8}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1046
    :cond_6fb
    return-void
.end method


# virtual methods
.method public createJavaBeanSerializer(Ljava/lang/Class;Ljava/util/Map;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;
    .registers 55
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/alibaba/fastjson/serializer/ObjectSerializer;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 123
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "aliasMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-eqz v4, :cond_23

    .line 124
    new-instance v4, Lcom/alibaba/fastjson/JSONException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "unsupportd class "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 127
    :cond_23
    const-class v4, Lcom/alibaba/fastjson/annotation/JSONType;

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v46

    check-cast v46, Lcom/alibaba/fastjson/annotation/JSONType;

    .line 129
    .local v46, "jsonType":Lcom/alibaba/fastjson/annotation/JSONType;
    const/4 v4, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v46

    move-object/from16 v2, p2

    invoke-static {v0, v1, v2, v4}, Lcom/alibaba/fastjson/util/TypeUtils;->computeGetters(Ljava/lang/Class;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/Map;Z)Ljava/util/List;

    move-result-object v51

    .line 131
    .local v51, "unsortedGetters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    invoke-interface/range {v51 .. v51}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 132
    .local v41, "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v41

    iget-object v5, v0, Lcom/alibaba/fastjson/util/FieldInfo;->field:Ljava/lang/reflect/Field;

    if-nez v5, :cond_3c

    move-object/from16 v0, v41

    iget-object v5, v0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    if-eqz v5, :cond_3c

    move-object/from16 v0, v41

    iget-object v5, v0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    .line 134
    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->isInterface()Z

    move-result v5

    if-eqz v5, :cond_3c

    .line 135
    new-instance v45, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;

    move-object/from16 v0, v45

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lcom/alibaba/fastjson/serializer/JavaBeanSerializer;-><init>(Ljava/lang/Class;)V

    .line 440
    .end local v41    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :goto_6b
    return-object v45

    .line 139
    :cond_6c
    const/16 v48, 0x0

    .line 141
    .local v48, "orders":[Ljava/lang/String;
    if-eqz v46, :cond_74

    .line 142
    invoke-interface/range {v46 .. v46}, Lcom/alibaba/fastjson/annotation/JSONType;->orders()[Ljava/lang/String;

    move-result-object v48

    .line 146
    :cond_74
    if-eqz v48, :cond_b5

    move-object/from16 v0, v48

    array-length v4, v0

    if-eqz v4, :cond_b5

    .line 147
    const/4 v4, 0x1

    move-object/from16 v0, p1

    move-object/from16 v1, v46

    move-object/from16 v2, p2

    invoke-static {v0, v1, v2, v4}, Lcom/alibaba/fastjson/util/TypeUtils;->computeGetters(Ljava/lang/Class;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/util/Map;Z)Ljava/util/List;

    move-result-object v43

    .line 153
    .local v43, "getters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    :goto_86
    const/16 v47, 0x1

    .line 154
    .local v47, "nativeSorted":Z
    const/16 v44, 0x0

    .local v44, "i":I
    invoke-interface/range {v51 .. v51}, Ljava/util/List;->size()I

    move-result v50

    .local v50, "size":I
    :goto_8e
    move/from16 v0, v44

    move/from16 v1, v50

    if-ge v0, v1, :cond_aa

    .line 155
    move-object/from16 v0, v51

    move/from16 v1, v44

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/alibaba/fastjson/util/FieldInfo;

    invoke-interface/range {v43 .. v44}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_c2

    .line 156
    const/16 v47, 0x0

    .line 161
    :cond_aa
    invoke-interface/range {v43 .. v43}, Ljava/util/List;->size()I

    move-result v4

    const/16 v5, 0x100

    if-le v4, v5, :cond_c5

    .line 162
    const/16 v45, 0x0

    goto :goto_6b

    .line 149
    .end local v43    # "getters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    .end local v44    # "i":I
    .end local v47    # "nativeSorted":Z
    .end local v50    # "size":I
    :cond_b5
    new-instance v43, Ljava/util/ArrayList;

    move-object/from16 v0, v43

    move-object/from16 v1, v51

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 150
    .restart local v43    # "getters":Ljava/util/List;, "Ljava/util/List<Lcom/alibaba/fastjson/util/FieldInfo;>;"
    invoke-static/range {v43 .. v43}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    goto :goto_86

    .line 154
    .restart local v44    # "i":I
    .restart local v47    # "nativeSorted":Z
    .restart local v50    # "size":I
    :cond_c2
    add-int/lit8 v44, v44, 0x1

    goto :goto_8e

    .line 165
    :cond_c5
    invoke-interface/range {v43 .. v43}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_c9
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_e6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v42

    check-cast v42, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 166
    .local v42, "getter":Lcom/alibaba/fastjson/util/FieldInfo;
    invoke-virtual/range {v42 .. v42}, Lcom/alibaba/fastjson/util/FieldInfo;->getMember()Ljava/lang/reflect/Member;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/alibaba/fastjson/util/ASMUtils;->checkName(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_c9

    .line 167
    const/16 v45, 0x0

    goto :goto_6b

    .line 171
    .end local v42    # "getter":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_e6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ASMSerializer_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->seed:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v9

    invoke-virtual {v4, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "_"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    .line 172
    .local v36, "className":Ljava/lang/String;
    const-class v4, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;

    invoke-virtual {v4}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v49

    .line 173
    .local v49, "packageName":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v5, 0x2e

    const/16 v9, 0x2f

    move-object/from16 v0, v49

    invoke-virtual {v0, v5, v9}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v36

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 174
    .local v6, "classNameType":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v49

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v36

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v37

    .line 175
    .local v37, "classNameFull":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/alibaba/fastjson/util/TypeUtils;->getSerializeFeatures(Ljava/lang/Class;)I

    move-result v23

    .line 177
    .local v23, "beanSerializeFeatures":I
    new-instance v3, Lcom/alibaba/fastjson/asm/ClassWriter;

    invoke-direct {v3}, Lcom/alibaba/fastjson/asm/ClassWriter;-><init>()V

    .line 178
    .local v3, "cw":Lcom/alibaba/fastjson/asm/ClassWriter;
    const/16 v4, 0x31

    const/16 v5, 0x21

    sget-object v7, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    const/4 v9, 0x1

    new-array v8, v9, [Ljava/lang/String;

    const/4 v9, 0x0

    sget-object v10, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer:Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-virtual/range {v3 .. v8}, Lcom/alibaba/fastjson/asm/ClassWriter;->visit(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 185
    invoke-interface/range {v43 .. v43}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_175
    :goto_175
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_211

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 186
    .restart local v41    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v41

    iget-object v5, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v5}, Ljava/lang/Class;->isPrimitive()Z

    move-result v5

    if-nez v5, :cond_175

    move-object/from16 v0, v41

    iget-object v5, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 187
    invoke-virtual {v5}, Ljava/lang/Class;->isEnum()Z

    move-result v5

    if-nez v5, :cond_175

    move-object/from16 v0, v41

    iget-object v5, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v9, Ljava/lang/String;

    if-eq v5, v9, :cond_175

    .line 192
    new-instance v5, Lcom/alibaba/fastjson/asm/FieldWriter;

    const/4 v9, 0x1

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v41

    iget-object v11, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "_asm_fieldType"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "Ljava/lang/reflect/Type;"

    invoke-direct {v5, v3, v9, v10, v11}, Lcom/alibaba/fastjson/asm/FieldWriter;-><init>(Lcom/alibaba/fastjson/asm/ClassWriter;ILjava/lang/String;Ljava/lang/String;)V

    .line 193
    invoke-virtual {v5}, Lcom/alibaba/fastjson/asm/FieldWriter;->visitEnd()V

    .line 195
    const-class v5, Ljava/util/List;

    move-object/from16 v0, v41

    iget-object v9, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v5, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_1ed

    .line 196
    new-instance v5, Lcom/alibaba/fastjson/asm/FieldWriter;

    const/4 v9, 0x1

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v41

    iget-object v11, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "_asm_list_item_ser_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    sget-object v11, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    invoke-direct {v5, v3, v9, v10, v11}, Lcom/alibaba/fastjson/asm/FieldWriter;-><init>(Lcom/alibaba/fastjson/asm/ClassWriter;ILjava/lang/String;Ljava/lang/String;)V

    .line 198
    invoke-virtual {v5}, Lcom/alibaba/fastjson/asm/FieldWriter;->visitEnd()V

    .line 201
    :cond_1ed
    new-instance v5, Lcom/alibaba/fastjson/asm/FieldWriter;

    const/4 v9, 0x1

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v41

    iget-object v11, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "_asm_ser_"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    sget-object v11, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->ObjectSerializer_desc:Ljava/lang/String;

    invoke-direct {v5, v3, v9, v10, v11}, Lcom/alibaba/fastjson/asm/FieldWriter;-><init>(Lcom/alibaba/fastjson/asm/ClassWriter;ILjava/lang/String;Ljava/lang/String;)V

    .line 202
    invoke-virtual {v5}, Lcom/alibaba/fastjson/asm/FieldWriter;->visitEnd()V

    goto/16 :goto_175

    .line 205
    .end local v41    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_211
    new-instance v7, Lcom/alibaba/fastjson/asm/MethodWriter;

    const/4 v9, 0x1

    const-string v10, "<init>"

    const-string v11, "()V"

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v8, v3

    invoke-direct/range {v7 .. v13}, Lcom/alibaba/fastjson/asm/MethodWriter;-><init>(Lcom/alibaba/fastjson/asm/ClassWriter;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 206
    .local v7, "mw":Lcom/alibaba/fastjson/asm/MethodVisitor;
    const/16 v4, 0x19

    const/4 v5, 0x0

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 207
    invoke-static/range {p1 .. p1}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v4

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 208
    const/16 v4, 0xb7

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    const-string v9, "<init>"

    const-string v10, "(Ljava/lang/Class;)V"

    invoke-interface {v7, v4, v5, v9, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    const/16 v44, 0x0

    :goto_23c
    invoke-interface/range {v43 .. v43}, Ljava/util/List;->size()I

    move-result v4

    move/from16 v0, v44

    if-ge v0, v4, :cond_2d6

    .line 212
    invoke-interface/range {v43 .. v44}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v41

    check-cast v41, Lcom/alibaba/fastjson/util/FieldInfo;

    .line 213
    .restart local v41    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    move-object/from16 v0, v41

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    invoke-virtual {v4}, Ljava/lang/Class;->isPrimitive()Z

    move-result v4

    if-nez v4, :cond_266

    move-object/from16 v0, v41

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    .line 214
    invoke-virtual {v4}, Ljava/lang/Class;->isEnum()Z

    move-result v4

    if-nez v4, :cond_266

    move-object/from16 v0, v41

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->fieldClass:Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    if-ne v4, v5, :cond_269

    .line 211
    :cond_266
    :goto_266
    add-int/lit8 v44, v44, 0x1

    goto :goto_23c

    .line 219
    :cond_269
    const/16 v4, 0x19

    const/4 v5, 0x0

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 221
    move-object/from16 v0, v41

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    if-eqz v4, :cond_2bd

    .line 222
    move-object/from16 v0, v41

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->declaringClass:Ljava/lang/Class;

    invoke-static {v4}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/alibaba/fastjson/asm/Type;->getType(Ljava/lang/String;)Lcom/alibaba/fastjson/asm/Type;

    move-result-object v4

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 223
    move-object/from16 v0, v41

    iget-object v4, v0, Lcom/alibaba/fastjson/util/FieldInfo;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 224
    const/16 v4, 0xb8

    const-class v5, Lcom/alibaba/fastjson/util/ASMUtils;

    invoke-static {v5}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    const-string v9, "getMethodType"

    const-string v10, "(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Type;"

    invoke-interface {v7, v4, v5, v9, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    :goto_29e
    const/16 v4, 0xb5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v41

    iget-object v9, v0, Lcom/alibaba/fastjson/util/FieldInfo;->name:Ljava/lang/String;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v9, "_asm_fieldType"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v9, "Ljava/lang/reflect/Type;"

    invoke-interface {v7, v4, v6, v5, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_266

    .line 228
    :cond_2bd
    const/16 v4, 0x19

    const/4 v5, 0x0

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 229
    invoke-static/range {v44 .. v44}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 230
    const/16 v4, 0xb7

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer:Ljava/lang/String;

    const-string v9, "getFieldType"

    const-string v10, "(I)Ljava/lang/reflect/Type;"

    invoke-interface {v7, v4, v5, v9, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_29e

    .line 236
    .end local v41    # "fieldInfo":Lcom/alibaba/fastjson/util/FieldInfo;
    :cond_2d6
    const/16 v4, 0xb1

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 237
    const/4 v4, 0x4

    const/4 v5, 0x4

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMaxs(II)V

    .line 238
    invoke-interface {v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitEnd()V

    .line 240
    const/16 v25, 0x0

    .line 241
    .local v25, "DisableCircularReferenceDetect":Z
    if-eqz v46, :cond_2f9

    .line 242
    invoke-interface/range {v46 .. v46}, Lcom/alibaba/fastjson/annotation/JSONType;->serialzeFeatures()[Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-result-object v5

    array-length v9, v5

    const/4 v4, 0x0

    :goto_2ed
    if-ge v4, v9, :cond_2f9

    aget-object v40, v5, v4

    .line 243
    .local v40, "featrues":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    sget-object v10, Lcom/alibaba/fastjson/serializer/SerializerFeature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    move-object/from16 v0, v40

    if-ne v0, v10, :cond_52d

    .line 244
    const/16 v25, 0x1

    .line 253
    .end local v40    # "featrues":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    :cond_2f9
    const/16 v44, 0x0

    :goto_2fb
    const/4 v4, 0x3

    move/from16 v0, v44

    if-ge v0, v4, :cond_540

    .line 255
    move/from16 v14, v25

    .line 256
    .local v14, "nonContext":Z
    const/4 v13, 0x0

    .line 257
    .local v13, "writeDirect":Z
    if-nez v44, :cond_531

    .line 258
    const-string v18, "write"

    .line 259
    .local v18, "methodName":Ljava/lang/String;
    const/4 v13, 0x1

    .line 268
    :goto_308
    new-instance v8, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    move-object/from16 v9, v43

    move-object/from16 v10, v46

    move-object v11, v6

    move/from16 v12, v23

    invoke-direct/range {v8 .. v14}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;-><init>(Ljava/util/List;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/lang/String;IZZ)V

    .line 271
    .local v8, "context":Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    new-instance v7, Lcom/alibaba/fastjson/asm/MethodWriter;

    .end local v7    # "mw":Lcom/alibaba/fastjson/asm/MethodVisitor;
    const/16 v17, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(L"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    const/4 v4, 0x1

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v21, v0

    const/4 v4, 0x0

    const-string v5, "java/io/IOException"

    aput-object v5, v21, v4

    move-object v15, v7

    move-object/from16 v16, v3

    invoke-direct/range {v15 .. v21}, Lcom/alibaba/fastjson/asm/MethodWriter;-><init>(Lcom/alibaba/fastjson/asm/ClassWriter;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 280
    .restart local v7    # "mw":Lcom/alibaba/fastjson/asm/MethodVisitor;
    const/16 v4, 0x19

    const/4 v5, 0x1

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 281
    const/16 v4, 0xb4

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v9, "out"

    sget-object v10, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter_desc:Ljava/lang/String;

    invoke-interface {v7, v4, v5, v9, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 282
    const/16 v4, 0x3a

    const-string v5, "out"

    invoke-virtual {v8, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 284
    if-nez v47, :cond_3e3

    .line 285
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static {v8}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-nez v4, :cond_3e3

    .line 287
    if-eqz v46, :cond_371

    invoke-interface/range {v46 .. v46}, Lcom/alibaba/fastjson/annotation/JSONType;->alphabetic()Z

    move-result v4

    if-eqz v4, :cond_3e3

    .line 288
    :cond_371
    new-instance v35, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v35 .. v35}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 290
    .local v35, "_else":Lcom/alibaba/fastjson/asm/Label;
    const/16 v4, 0x19

    const-string v5, "out"

    invoke-virtual {v8, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 291
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v9, "isSortField"

    const-string v10, "()Z"

    invoke-interface {v7, v4, v5, v9, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    const/16 v4, 0x9a

    move-object/from16 v0, v35

    invoke-interface {v7, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 294
    const/16 v4, 0x19

    const/4 v5, 0x0

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 295
    const/16 v4, 0x19

    const/4 v5, 0x1

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 296
    const/16 v4, 0x19

    const/4 v5, 0x2

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 297
    const/16 v4, 0x19

    const/4 v5, 0x3

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 298
    const/16 v4, 0x19

    const/4 v5, 0x4

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 299
    const/16 v4, 0x15

    const/4 v5, 0x5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 300
    const/16 v4, 0xb6

    const-string v5, "writeUnsorted"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "(L"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v4, v6, v5, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    const/16 v4, 0xb1

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 305
    move-object/from16 v0, v35

    invoke-interface {v7, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 310
    .end local v35    # "_else":Lcom/alibaba/fastjson/asm/Label;
    :cond_3e3
    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->writeDirect:Z
    invoke-static {v8}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$000(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)Z

    move-result v4

    if-eqz v4, :cond_4f4

    if-nez v14, :cond_4f4

    .line 311
    new-instance v33, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v33 .. v33}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 312
    .local v33, "_direct":Lcom/alibaba/fastjson/asm/Label;
    new-instance v34, Lcom/alibaba/fastjson/asm/Label;

    invoke-direct/range {v34 .. v34}, Lcom/alibaba/fastjson/asm/Label;-><init>()V

    .line 314
    .local v34, "_directElse":Lcom/alibaba/fastjson/asm/Label;
    const/16 v4, 0x19

    const/4 v5, 0x1

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 315
    const/16 v4, 0x19

    const/4 v5, 0x0

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 316
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v9, "writeDirect"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "("

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JavaBeanSerializer_desc:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")Z"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v7, v4, v5, v9, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    const/16 v4, 0x9a

    move-object/from16 v0, v34

    invoke-interface {v7, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 319
    const/16 v4, 0x19

    const/4 v5, 0x0

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 320
    const/16 v4, 0x19

    const/4 v5, 0x1

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 321
    const/16 v4, 0x19

    const/4 v5, 0x2

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 322
    const/16 v4, 0x19

    const/4 v5, 0x3

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 323
    const/16 v4, 0x19

    const/4 v5, 0x4

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 324
    const/16 v4, 0x15

    const/4 v5, 0x5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 325
    const/16 v4, 0xb6

    const-string v5, "writeNormal"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "(L"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v4, v6, v5, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    const/16 v4, 0xb1

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 330
    move-object/from16 v0, v34

    invoke-interface {v7, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 331
    const/16 v4, 0x19

    const-string v5, "out"

    invoke-virtual {v8, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 332
    sget-object v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->DisableCircularReferenceDetect:Lcom/alibaba/fastjson/serializer/SerializerFeature;

    iget v4, v4, Lcom/alibaba/fastjson/serializer/SerializerFeature;->mask:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLdcInsn(Ljava/lang/Object;)V

    .line 333
    const/16 v4, 0xb6

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter:Ljava/lang/String;

    const-string v9, "isEnabled"

    const-string v10, "(I)Z"

    invoke-interface {v7, v4, v5, v9, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 334
    const/16 v4, 0x99

    move-object/from16 v0, v33

    invoke-interface {v7, v4, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitJumpInsn(ILcom/alibaba/fastjson/asm/Label;)V

    .line 336
    const/16 v4, 0x19

    const/4 v5, 0x0

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 337
    const/16 v4, 0x19

    const/4 v5, 0x1

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 338
    const/16 v4, 0x19

    const/4 v5, 0x2

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 339
    const/16 v4, 0x19

    const/4 v5, 0x3

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 340
    const/16 v4, 0x19

    const/4 v5, 0x4

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 341
    const/16 v4, 0x15

    const/4 v5, 0x5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 342
    const/16 v4, 0xb6

    const-string v5, "writeDirectNonContext"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "(L"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-object v10, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v4, v6, v5, v9}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMethodInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 344
    const/16 v4, 0xb1

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 346
    move-object/from16 v0, v33

    invoke-interface {v7, v0}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitLabel(Lcom/alibaba/fastjson/asm/Label;)V

    .line 349
    .end local v33    # "_direct":Lcom/alibaba/fastjson/asm/Label;
    .end local v34    # "_directElse":Lcom/alibaba/fastjson/asm/Label;
    :cond_4f4
    const/16 v4, 0x19

    const/4 v5, 0x2

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 350
    const/16 v4, 0xc0

    invoke-static/range {p1 .. p1}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 351
    const/16 v4, 0x3a

    const-string v5, "entity"

    invoke-virtual {v8, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 352
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v7, v2, v8}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->generateWriteMethod(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Ljava/util/List;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 353
    const/16 v4, 0xb1

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 354
    const/4 v4, 0x7

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variantIndex:I
    invoke-static {v8}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$100(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)I

    move-result v5

    add-int/lit8 v5, v5, 0x2

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMaxs(II)V

    .line 355
    invoke-interface {v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitEnd()V

    .line 253
    add-int/lit8 v44, v44, 0x1

    goto/16 :goto_2fb

    .line 242
    .end local v8    # "context":Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .end local v13    # "writeDirect":Z
    .end local v14    # "nonContext":Z
    .end local v18    # "methodName":Ljava/lang/String;
    .restart local v40    # "featrues":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    :cond_52d
    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_2ed

    .line 260
    .end local v40    # "featrues":Lcom/alibaba/fastjson/serializer/SerializerFeature;
    .restart local v13    # "writeDirect":Z
    .restart local v14    # "nonContext":Z
    :cond_531
    const/4 v4, 0x1

    move/from16 v0, v44

    if-ne v0, v4, :cond_53a

    .line 261
    const-string v18, "writeNormal"

    .restart local v18    # "methodName":Ljava/lang/String;
    goto/16 :goto_308

    .line 263
    .end local v18    # "methodName":Ljava/lang/String;
    :cond_53a
    const/4 v13, 0x1

    .line 264
    const/4 v14, 0x1

    .line 265
    const-string v18, "writeDirectNonContext"

    .restart local v18    # "methodName":Ljava/lang/String;
    goto/16 :goto_308

    .line 358
    .end local v13    # "writeDirect":Z
    .end local v14    # "nonContext":Z
    .end local v18    # "methodName":Ljava/lang/String;
    :cond_540
    if-nez v47, :cond_5d6

    .line 360
    new-instance v8, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    const/16 v24, 0x0

    move-object/from16 v19, v8

    move-object/from16 v20, v43

    move-object/from16 v21, v46

    move-object/from16 v22, v6

    invoke-direct/range {v19 .. v25}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;-><init>(Ljava/util/List;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/lang/String;IZZ)V

    .line 363
    .restart local v8    # "context":Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    new-instance v7, Lcom/alibaba/fastjson/asm/MethodWriter;

    .end local v7    # "mw":Lcom/alibaba/fastjson/asm/MethodVisitor;
    const/16 v28, 0x1

    const-string v29, "writeUnsorted"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(L"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    const/16 v31, 0x0

    const/4 v4, 0x1

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v32, v0

    const/4 v4, 0x0

    const-string v5, "java/io/IOException"

    aput-object v5, v32, v4

    move-object/from16 v26, v7

    move-object/from16 v27, v3

    invoke-direct/range {v26 .. v32}, Lcom/alibaba/fastjson/asm/MethodWriter;-><init>(Lcom/alibaba/fastjson/asm/ClassWriter;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 367
    .restart local v7    # "mw":Lcom/alibaba/fastjson/asm/MethodVisitor;
    const/16 v4, 0x19

    const/4 v5, 0x1

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 368
    const/16 v4, 0xb4

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v9, "out"

    sget-object v10, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter_desc:Ljava/lang/String;

    invoke-interface {v7, v4, v5, v9, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    const/16 v4, 0x3a

    const-string v5, "out"

    invoke-virtual {v8, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 371
    const/16 v4, 0x19

    const/4 v5, 0x2

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 372
    const/16 v4, 0xc0

    invoke-static/range {p1 .. p1}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 373
    const/16 v4, 0x3a

    const-string v5, "entity"

    invoke-virtual {v8, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 375
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v51

    invoke-direct {v0, v1, v7, v2, v8}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->generateWriteMethod(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Ljava/util/List;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 377
    const/16 v4, 0xb1

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 378
    const/4 v4, 0x7

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variantIndex:I
    invoke-static {v8}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$100(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)I

    move-result v5

    add-int/lit8 v5, v5, 0x2

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMaxs(II)V

    .line 379
    invoke-interface {v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitEnd()V

    .line 385
    .end local v8    # "context":Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    :cond_5d6
    const/16 v44, 0x0

    :goto_5d8
    const/4 v4, 0x3

    move/from16 v0, v44

    if-ge v0, v4, :cond_686

    .line 387
    move/from16 v14, v25

    .line 388
    .restart local v14    # "nonContext":Z
    const/4 v13, 0x0

    .line 389
    .restart local v13    # "writeDirect":Z
    if-nez v44, :cond_677

    .line 390
    const-string v18, "writeAsArray"

    .line 391
    .restart local v18    # "methodName":Ljava/lang/String;
    const/4 v13, 0x1

    .line 400
    :goto_5e5
    new-instance v8, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;

    move-object/from16 v9, v43

    move-object/from16 v10, v46

    move-object v11, v6

    move/from16 v12, v23

    invoke-direct/range {v8 .. v14}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;-><init>(Ljava/util/List;Lcom/alibaba/fastjson/annotation/JSONType;Ljava/lang/String;IZZ)V

    .line 403
    .restart local v8    # "context":Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    new-instance v7, Lcom/alibaba/fastjson/asm/MethodWriter;

    .end local v7    # "mw":Lcom/alibaba/fastjson/asm/MethodVisitor;
    const/16 v17, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "(L"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ";Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Type;I)V"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    const/16 v20, 0x0

    const/4 v4, 0x1

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v21, v0

    const/4 v4, 0x0

    const-string v5, "java/io/IOException"

    aput-object v5, v21, v4

    move-object v15, v7

    move-object/from16 v16, v3

    invoke-direct/range {v15 .. v21}, Lcom/alibaba/fastjson/asm/MethodWriter;-><init>(Lcom/alibaba/fastjson/asm/ClassWriter;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    .line 407
    .restart local v7    # "mw":Lcom/alibaba/fastjson/asm/MethodVisitor;
    const/16 v4, 0x19

    const/4 v5, 0x1

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 408
    const/16 v4, 0xb4

    sget-object v5, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->JSONSerializer:Ljava/lang/String;

    const-string v9, "out"

    sget-object v10, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->SerializeWriter_desc:Ljava/lang/String;

    invoke-interface {v7, v4, v5, v9, v10}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitFieldInsn(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    const/16 v4, 0x3a

    const-string v5, "out"

    invoke-virtual {v8, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 411
    const/16 v4, 0x19

    const/4 v5, 0x2

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 412
    const/16 v4, 0xc0

    invoke-static/range {p1 .. p1}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitTypeInsn(ILjava/lang/String;)V

    .line 413
    const/16 v4, 0x3a

    const-string v5, "entity"

    invoke-virtual {v8, v5}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->var(Ljava/lang/String;)I

    move-result v5

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitVarInsn(II)V

    .line 414
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, v43

    invoke-direct {v0, v1, v7, v2, v8}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->generateWriteAsArray(Ljava/lang/Class;Lcom/alibaba/fastjson/asm/MethodVisitor;Ljava/util/List;Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)V

    .line 415
    const/16 v4, 0xb1

    invoke-interface {v7, v4}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitInsn(I)V

    .line 416
    const/4 v4, 0x7

    # getter for: Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->variantIndex:I
    invoke-static {v8}, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;->access$100(Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;)I

    move-result v5

    add-int/lit8 v5, v5, 0x2

    invoke-interface {v7, v4, v5}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitMaxs(II)V

    .line 417
    invoke-interface {v7}, Lcom/alibaba/fastjson/asm/MethodVisitor;->visitEnd()V

    .line 385
    add-int/lit8 v44, v44, 0x1

    goto/16 :goto_5d8

    .line 392
    .end local v8    # "context":Lcom/alibaba/fastjson/serializer/ASMSerializerFactory$Context;
    .end local v18    # "methodName":Ljava/lang/String;
    :cond_677
    const/4 v4, 0x1

    move/from16 v0, v44

    if-ne v0, v4, :cond_680

    .line 393
    const-string v18, "writeAsArrayNormal"

    .restart local v18    # "methodName":Ljava/lang/String;
    goto/16 :goto_5e5

    .line 395
    .end local v18    # "methodName":Ljava/lang/String;
    :cond_680
    const/4 v13, 0x1

    .line 396
    const/4 v14, 0x1

    .line 397
    const-string v18, "writeAsArrayNonContext"

    .restart local v18    # "methodName":Ljava/lang/String;
    goto/16 :goto_5e5

    .line 420
    .end local v13    # "writeDirect":Z
    .end local v14    # "nonContext":Z
    .end local v18    # "methodName":Ljava/lang/String;
    :cond_686
    invoke-virtual {v3}, Lcom/alibaba/fastjson/asm/ClassWriter;->toByteArray()[B

    move-result-object v38

    .line 437
    .local v38, "code":[B
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/alibaba/fastjson/serializer/ASMSerializerFactory;->classLoader:Lcom/alibaba/fastjson/util/ASMClassLoader;

    const/4 v5, 0x0

    move-object/from16 v0, v38

    array-length v9, v0

    move-object/from16 v0, v37

    move-object/from16 v1, v38

    invoke-virtual {v4, v0, v1, v5, v9}, Lcom/alibaba/fastjson/util/ASMClassLoader;->defineClassPublic(Ljava/lang/String;[BII)Ljava/lang/Class;

    move-result-object v39

    .line 438
    .local v39, "exampleClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual/range {v39 .. v39}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v45

    .line 440
    .local v45, "instance":Ljava/lang/Object;
    check-cast v45, Lcom/alibaba/fastjson/serializer/ObjectSerializer;

    goto/16 :goto_6b
.end method
