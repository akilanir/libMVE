.class public Ljavassist/CtField;
.super Ljavassist/CtMember;
.source "CtField.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/CtField$MultiArrayInitializer;,
        Ljavassist/CtField$ArrayInitializer;,
        Ljavassist/CtField$StringInitializer;,
        Ljavassist/CtField$DoubleInitializer;,
        Ljavassist/CtField$FloatInitializer;,
        Ljavassist/CtField$LongInitializer;,
        Ljavassist/CtField$IntInitializer;,
        Ljavassist/CtField$MethodInitializer;,
        Ljavassist/CtField$NewInitializer;,
        Ljavassist/CtField$ParamInitializer;,
        Ljavassist/CtField$PtreeInitializer;,
        Ljavassist/CtField$CodeInitializer;,
        Ljavassist/CtField$CodeInitializer0;,
        Ljavassist/CtField$Initializer;
    }
.end annotation


# static fields
.field static final javaLangString:Ljava/lang/String; = "java.lang.String"


# instance fields
.field protected fieldInfo:Ljavassist/bytecode/FieldInfo;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljavassist/CtClass;)V
    .registers 8
    .param p1, "typeDesc"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "clazz"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 100
    invoke-direct {p0, p3}, Ljavassist/CtMember;-><init>(Ljavassist/CtClass;)V

    .line 101
    invoke-virtual {p3}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v0

    .line 102
    .local v0, "cf":Ljavassist/bytecode/ClassFile;
    if-nez v0, :cond_26

    .line 103
    new-instance v1, Ljavassist/CannotCompileException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bad declaring class: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p3}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 106
    :cond_26
    new-instance v1, Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/ClassFile;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    invoke-direct {v1, v2, p2, p1}, Ljavassist/bytecode/FieldInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v1, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    .line 107
    return-void
.end method

.method public constructor <init>(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)V
    .registers 5
    .param p1, "type"    # Ljavassist/CtClass;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 61
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Ljavassist/CtField;-><init>(Ljava/lang/String;Ljava/lang/String;Ljavassist/CtClass;)V

    .line 62
    return-void
.end method

.method public constructor <init>(Ljavassist/CtField;Ljavassist/CtClass;)V
    .registers 9
    .param p1, "src"    # Ljavassist/CtField;
    .param p2, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v4, p1, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v4}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p1, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v5}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v4, v5, p2}, Ljavassist/CtField;-><init>(Ljava/lang/String;Ljava/lang/String;Ljavassist/CtClass;)V

    .line 86
    iget-object v4, p1, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v4}, Ljavassist/bytecode/FieldInfo;->getAttributes()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v3

    .line 88
    .local v3, "iterator":Ljava/util/ListIterator;
    iget-object v2, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    .line 89
    .local v2, "fi":Ljavassist/bytecode/FieldInfo;
    iget-object v4, p1, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v4}, Ljavassist/bytecode/FieldInfo;->getAccessFlags()I

    move-result v4

    invoke-virtual {v2, v4}, Ljavassist/bytecode/FieldInfo;->setAccessFlags(I)V

    .line 90
    invoke-virtual {v2}, Ljavassist/bytecode/FieldInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v1

    .line 91
    .local v1, "cp":Ljavassist/bytecode/ConstPool;
    :goto_28
    invoke-interface {v3}, Ljava/util/ListIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3d

    .line 92
    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AttributeInfo;

    .line 93
    .local v0, "ainfo":Ljavassist/bytecode/AttributeInfo;
    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4}, Ljavassist/bytecode/AttributeInfo;->copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljavassist/bytecode/FieldInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    goto :goto_28

    .line 95
    .end local v0    # "ainfo":Ljavassist/bytecode/AttributeInfo;
    :cond_3d
    return-void
.end method

.method constructor <init>(Ljavassist/bytecode/FieldInfo;Ljavassist/CtClass;)V
    .registers 3
    .param p1, "fi"    # Ljavassist/bytecode/FieldInfo;
    .param p2, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 110
    invoke-direct {p0, p2}, Ljavassist/CtMember;-><init>(Ljavassist/CtClass;)V

    .line 111
    iput-object p1, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    .line 112
    return-void
.end method

.method private getAnnotations(Z)[Ljava/lang/Object;
    .registers 6
    .param p1, "ignoreNotFound"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 312
    invoke-virtual {p0}, Ljavassist/CtField;->getFieldInfo2()Ljavassist/bytecode/FieldInfo;

    move-result-object v2

    .line 313
    .local v2, "fi":Ljavassist/bytecode/FieldInfo;
    const-string v3, "RuntimeInvisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AnnotationsAttribute;

    .line 315
    .local v0, "ainfo":Ljavassist/bytecode/AnnotationsAttribute;
    const-string v3, "RuntimeVisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/AnnotationsAttribute;

    .line 317
    .local v1, "ainfo2":Ljavassist/bytecode/AnnotationsAttribute;
    invoke-virtual {p0}, Ljavassist/CtField;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    invoke-static {p1, v3, v0, v1}, Ljavassist/CtClassType;->toAnnotationType(ZLjavassist/ClassPool;Ljavassist/bytecode/AnnotationsAttribute;Ljavassist/bytecode/AnnotationsAttribute;)[Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public static make(Ljava/lang/String;Ljavassist/CtClass;)Ljavassist/CtField;
    .registers 7
    .param p0, "src"    # Ljava/lang/String;
    .param p1, "declaring"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 160
    new-instance v0, Ljavassist/compiler/Javac;

    invoke-direct {v0, p1}, Ljavassist/compiler/Javac;-><init>(Ljavassist/CtClass;)V

    .line 162
    .local v0, "compiler":Ljavassist/compiler/Javac;
    :try_start_5
    invoke-virtual {v0, p0}, Ljavassist/compiler/Javac;->compile(Ljava/lang/String;)Ljavassist/CtMember;

    move-result-object v2

    .line 163
    .local v2, "obj":Ljavassist/CtMember;
    instance-of v3, v2, Ljavassist/CtField;

    if-eqz v3, :cond_17

    .line 164
    check-cast v2, Ljavassist/CtField;
    :try_end_f
    .catch Ljavassist/compiler/CompileError; {:try_start_5 .. :try_end_f} :catch_10

    .end local v2    # "obj":Ljavassist/CtMember;
    return-object v2

    .line 166
    :catch_10
    move-exception v1

    .line 167
    .local v1, "e":Ljavassist/compiler/CompileError;
    new-instance v3, Ljavassist/CannotCompileException;

    invoke-direct {v3, v1}, Ljavassist/CannotCompileException;-><init>(Ljavassist/compiler/CompileError;)V

    throw v3

    .line 170
    .end local v1    # "e":Ljavassist/compiler/CompileError;
    .restart local v2    # "obj":Ljavassist/CtMember;
    :cond_17
    new-instance v3, Ljavassist/CannotCompileException;

    const-string v4, "not a field"

    invoke-direct {v3, v4}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method protected extendToString(Ljava/lang/StringBuffer;)V
    .registers 4
    .param p1, "buffer"    # Ljava/lang/StringBuffer;

    .prologue
    const/16 v1, 0x20

    .line 123
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 124
    invoke-virtual {p0}, Ljavassist/CtField;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    invoke-virtual {p1, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 126
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 127
    return-void
.end method

.method public getAnnotation(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 6
    .param p1, "clz"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 273
    invoke-virtual {p0}, Ljavassist/CtField;->getFieldInfo2()Ljavassist/bytecode/FieldInfo;

    move-result-object v2

    .line 274
    .local v2, "fi":Ljavassist/bytecode/FieldInfo;
    const-string v3, "RuntimeInvisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AnnotationsAttribute;

    .line 276
    .local v0, "ainfo":Ljavassist/bytecode/AnnotationsAttribute;
    const-string v3, "RuntimeVisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/AnnotationsAttribute;

    .line 278
    .local v1, "ainfo2":Ljavassist/bytecode/AnnotationsAttribute;
    invoke-virtual {p0}, Ljavassist/CtField;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    invoke-static {p1, v3, v0, v1}, Ljavassist/CtClassType;->getAnnotationType(Ljava/lang/Class;Ljavassist/ClassPool;Ljavassist/bytecode/AnnotationsAttribute;Ljavassist/bytecode/AnnotationsAttribute;)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method public getAnnotations()[Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 290
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Ljavassist/CtField;->getAnnotations(Z)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;)[B
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 440
    iget-object v1, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v1, p1}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    .line 441
    .local v0, "ai":Ljavassist/bytecode/AttributeInfo;
    if-nez v0, :cond_a

    .line 442
    const/4 v1, 0x0

    .line 444
    :goto_9
    return-object v1

    :cond_a
    invoke-virtual {v0}, Ljavassist/bytecode/AttributeInfo;->get()[B

    move-result-object v1

    goto :goto_9
.end method

.method public getAvailableAnnotations()[Ljava/lang/Object;
    .registers 4

    .prologue
    .line 304
    const/4 v1, 0x1

    :try_start_1
    invoke-direct {p0, v1}, Ljavassist/CtField;->getAnnotations(Z)[Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_4} :catch_6

    move-result-object v1

    return-object v1

    .line 306
    :catch_6
    move-exception v0

    .line 307
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Unexpected exception"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getConstantValue()Ljava/lang/Object;
    .registers 7

    .prologue
    .line 401
    iget-object v3, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v3}, Ljavassist/bytecode/FieldInfo;->getConstantValue()I

    move-result v1

    .line 402
    .local v1, "index":I
    if-nez v1, :cond_a

    .line 403
    const/4 v3, 0x0

    .line 421
    :goto_9
    return-object v3

    .line 405
    :cond_a
    iget-object v3, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v3}, Ljavassist/bytecode/FieldInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v0

    .line 406
    .local v0, "cp":Ljavassist/bytecode/ConstPool;
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getTag(I)I

    move-result v3

    packed-switch v3, :pswitch_data_86

    .line 423
    :pswitch_17
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "bad tag: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getTag(I)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " at "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 408
    :pswitch_3e
    new-instance v3, Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getLongInfo(I)J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/lang/Long;-><init>(J)V

    goto :goto_9

    .line 410
    :pswitch_48
    new-instance v3, Ljava/lang/Float;

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getFloatInfo(I)F

    move-result v4

    invoke-direct {v3, v4}, Ljava/lang/Float;-><init>(F)V

    goto :goto_9

    .line 412
    :pswitch_52
    new-instance v3, Ljava/lang/Double;

    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getDoubleInfo(I)D

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/lang/Double;-><init>(D)V

    goto :goto_9

    .line 414
    :pswitch_5c
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getIntegerInfo(I)I

    move-result v2

    .line 416
    .local v2, "value":I
    const-string v3, "Z"

    iget-object v4, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v4}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7a

    .line 417
    new-instance v4, Ljava/lang/Boolean;

    if-eqz v2, :cond_78

    const/4 v3, 0x1

    :goto_73
    invoke-direct {v4, v3}, Ljava/lang/Boolean;-><init>(Z)V

    move-object v3, v4

    goto :goto_9

    :cond_78
    const/4 v3, 0x0

    goto :goto_73

    .line 419
    :cond_7a
    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, v2}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_9

    .line 421
    .end local v2    # "value":I
    :pswitch_80
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ConstPool;->getStringInfo(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_9

    .line 406
    nop

    :pswitch_data_86
    .packed-switch 0x3
        :pswitch_5c
        :pswitch_48
        :pswitch_3e
        :pswitch_52
        :pswitch_17
        :pswitch_80
    .end packed-switch
.end method

.method public getDeclaringClass()Ljavassist/CtClass;
    .registers 2

    .prologue
    .line 207
    invoke-super {p0}, Ljavassist/CtMember;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public getFieldInfo()Ljavassist/bytecode/FieldInfo;
    .registers 2

    .prologue
    .line 177
    iget-object v0, p0, Ljavassist/CtField;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 178
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    return-object v0
.end method

.method public getFieldInfo2()Ljavassist/bytecode/FieldInfo;
    .registers 2

    .prologue
    .line 200
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    return-object v0
.end method

.method public getGenericSignature()Ljava/lang/String;
    .registers 4

    .prologue
    .line 347
    iget-object v1, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    const-string v2, "Signature"

    invoke-virtual {v1, v2}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/SignatureAttribute;

    .line 349
    .local v0, "sa":Ljavassist/bytecode/SignatureAttribute;
    if-nez v0, :cond_e

    const/4 v1, 0x0

    :goto_d
    return-object v1

    :cond_e
    invoke-virtual {v0}, Ljavassist/bytecode/SignatureAttribute;->getSignature()Ljava/lang/String;

    move-result-object v1

    goto :goto_d
.end method

.method getInit()Ljavassist/CtField$Initializer;
    .registers 3

    .prologue
    .line 136
    invoke-virtual {p0}, Ljavassist/CtField;->getInitAST()Ljavassist/compiler/ast/ASTree;

    move-result-object v0

    .line 137
    .local v0, "tree":Ljavassist/compiler/ast/ASTree;
    if-nez v0, :cond_8

    .line 138
    const/4 v1, 0x0

    .line 140
    :goto_7
    return-object v1

    :cond_8
    invoke-static {v0}, Ljavassist/CtField$Initializer;->byExpr(Ljavassist/compiler/ast/ASTree;)Ljavassist/CtField$Initializer;

    move-result-object v1

    goto :goto_7
.end method

.method protected getInitAST()Ljavassist/compiler/ast/ASTree;
    .registers 2

    .prologue
    .line 131
    const/4 v0, 0x0

    return-object v0
.end method

.method public getModifiers()I
    .registers 2

    .prologue
    .line 231
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/FieldInfo;->getAccessFlags()I

    move-result v0

    invoke-static {v0}, Ljavassist/bytecode/AccessFlag;->toModifier(I)I

    move-result v0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 214
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/FieldInfo;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSignature()Ljava/lang/String;
    .registers 2

    .prologue
    .line 336
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljavassist/CtClass;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 371
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v0}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Ljavassist/CtField;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v1}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v1

    invoke-static {v0, v1}, Ljavassist/bytecode/Descriptor;->toCtClass(Ljava/lang/String;Ljavassist/ClassPool;)Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public hasAnnotation(Ljava/lang/Class;)Z
    .registers 6
    .param p1, "clz"    # Ljava/lang/Class;

    .prologue
    .line 252
    invoke-virtual {p0}, Ljavassist/CtField;->getFieldInfo2()Ljavassist/bytecode/FieldInfo;

    move-result-object v2

    .line 253
    .local v2, "fi":Ljavassist/bytecode/FieldInfo;
    const-string v3, "RuntimeInvisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v0

    check-cast v0, Ljavassist/bytecode/AnnotationsAttribute;

    .line 255
    .local v0, "ainfo":Ljavassist/bytecode/AnnotationsAttribute;
    const-string v3, "RuntimeVisibleAnnotations"

    invoke-virtual {v2, v3}, Ljavassist/bytecode/FieldInfo;->getAttribute(Ljava/lang/String;)Ljavassist/bytecode/AttributeInfo;

    move-result-object v1

    check-cast v1, Ljavassist/bytecode/AnnotationsAttribute;

    .line 257
    .local v1, "ainfo2":Ljavassist/bytecode/AnnotationsAttribute;
    invoke-virtual {p0}, Ljavassist/CtField;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v3

    invoke-virtual {v3}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v3

    invoke-static {p1, v3, v0, v1}, Ljavassist/CtClassType;->hasAnnotationType(Ljava/lang/Class;Ljavassist/ClassPool;Ljavassist/bytecode/AnnotationsAttribute;Ljavassist/bytecode/AnnotationsAttribute;)Z

    move-result v3

    return v3
.end method

.method public setAttribute(Ljava/lang/String;[B)V
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .prologue
    .line 458
    iget-object v0, p0, Ljavassist/CtField;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 459
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    new-instance v1, Ljavassist/bytecode/AttributeInfo;

    iget-object v2, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v2}, Ljavassist/bytecode/FieldInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    invoke-direct {v1, v2, p1, p2}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    invoke-virtual {v0, v1}, Ljavassist/bytecode/FieldInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 461
    return-void
.end method

.method public setGenericSignature(Ljava/lang/String;)V
    .registers 5
    .param p1, "sig"    # Ljava/lang/String;

    .prologue
    .line 363
    iget-object v0, p0, Ljavassist/CtField;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 364
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    new-instance v1, Ljavassist/bytecode/SignatureAttribute;

    iget-object v2, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v2}, Ljavassist/bytecode/FieldInfo;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljavassist/bytecode/SignatureAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljavassist/bytecode/FieldInfo;->addAttribute(Ljavassist/bytecode/AttributeInfo;)V

    .line 365
    return-void
.end method

.method public setModifiers(I)V
    .registers 4
    .param p1, "mod"    # I

    .prologue
    .line 240
    iget-object v0, p0, Ljavassist/CtField;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 241
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-static {p1}, Ljavassist/bytecode/AccessFlag;->of(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/FieldInfo;->setAccessFlags(I)V

    .line 242
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 3
    .param p1, "newName"    # Ljava/lang/String;

    .prologue
    .line 221
    iget-object v0, p0, Ljavassist/CtField;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 222
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v0, p1}, Ljavassist/bytecode/FieldInfo;->setName(Ljava/lang/String;)V

    .line 223
    return-void
.end method

.method public setType(Ljavassist/CtClass;)V
    .registers 4
    .param p1, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 379
    iget-object v0, p0, Ljavassist/CtField;->declaringClass:Ljavassist/CtClass;

    invoke-virtual {v0}, Ljavassist/CtClass;->checkModify()V

    .line 380
    iget-object v0, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->of(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljavassist/bytecode/FieldInfo;->setDescriptor(Ljava/lang/String;)V

    .line 381
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/CtField;->getDeclaringClass()Ljavassist/CtClass;

    move-result-object v1

    invoke-virtual {v1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljavassist/CtField;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ljavassist/CtField;->fieldInfo:Ljavassist/bytecode/FieldInfo;

    invoke-virtual {v1}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
