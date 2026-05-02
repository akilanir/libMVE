.class public Lcom/alibaba/fastjson/util/ASMUtils;
.super Ljava/lang/Object;
.source "ASMUtils.java"


# static fields
.field public static final IS_ANDROID:Z

.field public static final JAVA_VM_NAME:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 8
    const-string v0, "java.vm.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/alibaba/fastjson/util/ASMUtils;->JAVA_VM_NAME:Ljava/lang/String;

    .line 10
    sget-object v0, Lcom/alibaba/fastjson/util/ASMUtils;->JAVA_VM_NAME:Ljava/lang/String;

    invoke-static {v0}, Lcom/alibaba/fastjson/util/ASMUtils;->isAndroid(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lcom/alibaba/fastjson/util/ASMUtils;->IS_ANDROID:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkName(Ljava/lang/String;)Z
    .registers 5
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 95
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_13

    .line 96
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 97
    .local v0, "c":C
    if-lt v0, v2, :cond_12

    const/16 v3, 0x7f

    if-le v0, v3, :cond_14

    .line 98
    :cond_12
    const/4 v2, 0x0

    .line 102
    .end local v0    # "c":C
    :cond_13
    return v2

    .line 95
    .restart local v0    # "c":C
    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method public static desc(Ljava/lang/Class;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 37
    .local p0, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 38
    invoke-static {p0}, Lcom/alibaba/fastjson/util/ASMUtils;->getPrimitiveLetter(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 42
    :goto_a
    return-object v0

    .line 39
    :cond_b
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_2d

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    invoke-static {v1}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    .line 42
    :cond_2d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "L"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Lcom/alibaba/fastjson/util/ASMUtils;->type(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_a
.end method

.method public static desc(Ljava/lang/reflect/Method;)Ljava/lang/String;
    .registers 5
    .param p0, "method"    # Ljava/lang/reflect/Method;

    .prologue
    .line 25
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    .line 26
    .local v2, "types":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v0, Ljava/lang/StringBuilder;

    array-length v3, v2

    add-int/lit8 v3, v3, 0x1

    shl-int/lit8 v3, v3, 0x4

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 27
    .local v0, "buf":Ljava/lang/StringBuilder;
    const/16 v3, 0x28

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 28
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_14
    array-length v3, v2

    if-ge v1, v3, :cond_23

    .line 29
    aget-object v3, v2, v1

    invoke-static {v3}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 31
    :cond_23
    const/16 v3, 0x29

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 32
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static getMethodType(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Type;
    .registers 5
    .param p1, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .prologue
    .line 86
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x0

    :try_start_1
    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {p0, p1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 88
    .local v1, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v1}, Ljava/lang/reflect/Method;->getGenericReturnType()Ljava/lang/reflect/Type;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a} :catch_c

    move-result-object v2

    .line 90
    .end local v1    # "method":Ljava/lang/reflect/Method;
    :goto_b
    return-object v2

    .line 89
    :catch_c
    move-exception v0

    .line 90
    .local v0, "ex":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_b
.end method

.method public static getPrimitiveLetter(Ljava/lang/Class;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 61
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne v0, p0, :cond_7

    .line 62
    const-string v0, "I"

    .line 78
    :goto_6
    return-object v0

    .line 63
    :cond_7
    sget-object v0, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v0, p0, :cond_e

    .line 64
    const-string v0, "V"

    goto :goto_6

    .line 65
    :cond_e
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-ne v0, p0, :cond_15

    .line 66
    const-string v0, "Z"

    goto :goto_6

    .line 67
    :cond_15
    sget-object v0, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    if-ne v0, p0, :cond_1c

    .line 68
    const-string v0, "C"

    goto :goto_6

    .line 69
    :cond_1c
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-ne v0, p0, :cond_23

    .line 70
    const-string v0, "B"

    goto :goto_6

    .line 71
    :cond_23
    sget-object v0, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    if-ne v0, p0, :cond_2a

    .line 72
    const-string v0, "S"

    goto :goto_6

    .line 73
    :cond_2a
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v0, p0, :cond_31

    .line 74
    const-string v0, "F"

    goto :goto_6

    .line 75
    :cond_31
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-ne v0, p0, :cond_38

    .line 76
    const-string v0, "J"

    goto :goto_6

    .line 77
    :cond_38
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-ne v0, p0, :cond_3f

    .line 78
    const-string v0, "D"

    goto :goto_6

    .line 81
    :cond_3f
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a primitive type"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isAndroid(Ljava/lang/String;)Z
    .registers 4
    .param p0, "vmName"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 13
    if-nez p0, :cond_4

    .line 20
    :cond_3
    :goto_3
    return v1

    .line 17
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 19
    .local v0, "lowerVMName":Ljava/lang/String;
    const-string v2, "dalvik"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_18

    const-string v2, "lemur"

    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_18
    const/4 v1, 0x1

    goto :goto_3
.end method

.method public static type(Ljava/lang/Class;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "parameterType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_22

    .line 48
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lcom/alibaba/fastjson/util/ASMUtils;->desc(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 54
    :goto_21
    return-object v1

    .line 50
    :cond_22
    invoke-virtual {p0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v1

    if-nez v1, :cond_35

    .line 51
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 52
    .local v0, "clsName":Ljava/lang/String;
    const/16 v1, 0x2e

    const/16 v2, 0x2f

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    goto :goto_21

    .line 54
    .end local v0    # "clsName":Ljava/lang/String;
    :cond_35
    invoke-static {p0}, Lcom/alibaba/fastjson/util/ASMUtils;->getPrimitiveLetter(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    goto :goto_21
.end method
