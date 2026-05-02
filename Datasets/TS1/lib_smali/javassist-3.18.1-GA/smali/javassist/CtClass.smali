.class public abstract Ljavassist/CtClass;
.super Ljava/lang/Object;
.source "CtClass.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/CtClass$DelayedFileOutputStream;
    }
.end annotation


# static fields
.field public static booleanType:Ljavassist/CtClass; = null

.field public static byteType:Ljavassist/CtClass; = null

.field public static charType:Ljavassist/CtClass; = null

.field public static debugDump:Ljava/lang/String; = null

.field public static doubleType:Ljavassist/CtClass; = null

.field public static floatType:Ljavassist/CtClass; = null

.field public static intType:Ljavassist/CtClass; = null

.field static final javaLangObject:Ljava/lang/String; = "java.lang.Object"

.field public static longType:Ljavassist/CtClass; = null

.field static primitiveTypes:[Ljavassist/CtClass; = null

.field public static shortType:Ljavassist/CtClass; = null

.field public static final version:Ljava/lang/String; = "3.18.0-GA"

.field public static voidType:Ljavassist/CtClass;


# instance fields
.field protected qualifiedName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .prologue
    .line 67
    const/4 v0, 0x0

    sput-object v0, Ljavassist/CtClass;->debugDump:Ljava/lang/String;

    .line 146
    const/16 v0, 0x9

    new-array v0, v0, [Ljavassist/CtClass;

    sput-object v0, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    .line 148
    new-instance v0, Ljavassist/CtPrimitiveType;

    const-string v1, "boolean"

    const/16 v2, 0x5a

    const-string v3, "java.lang.Boolean"

    const-string v4, "booleanValue"

    const-string v5, "()Z"

    const/16 v6, 0xac

    const/4 v7, 0x4

    const/4 v8, 0x1

    invoke-direct/range {v0 .. v8}, Ljavassist/CtPrimitiveType;-><init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V

    sput-object v0, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    .line 152
    sget-object v0, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    const/4 v1, 0x0

    sget-object v2, Ljavassist/CtClass;->booleanType:Ljavassist/CtClass;

    aput-object v2, v0, v1

    .line 154
    new-instance v0, Ljavassist/CtPrimitiveType;

    const-string v1, "char"

    const/16 v2, 0x43

    const-string v3, "java.lang.Character"

    const-string v4, "charValue"

    const-string v5, "()C"

    const/16 v6, 0xac

    const/4 v7, 0x5

    const/4 v8, 0x1

    invoke-direct/range {v0 .. v8}, Ljavassist/CtPrimitiveType;-><init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V

    sput-object v0, Ljavassist/CtClass;->charType:Ljavassist/CtClass;

    .line 157
    sget-object v0, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    const/4 v1, 0x1

    sget-object v2, Ljavassist/CtClass;->charType:Ljavassist/CtClass;

    aput-object v2, v0, v1

    .line 159
    new-instance v0, Ljavassist/CtPrimitiveType;

    const-string v1, "byte"

    const/16 v2, 0x42

    const-string v3, "java.lang.Byte"

    const-string v4, "byteValue"

    const-string v5, "()B"

    const/16 v6, 0xac

    const/16 v7, 0x8

    const/4 v8, 0x1

    invoke-direct/range {v0 .. v8}, Ljavassist/CtPrimitiveType;-><init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V

    sput-object v0, Ljavassist/CtClass;->byteType:Ljavassist/CtClass;

    .line 162
    sget-object v0, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    const/4 v1, 0x2

    sget-object v2, Ljavassist/CtClass;->byteType:Ljavassist/CtClass;

    aput-object v2, v0, v1

    .line 164
    new-instance v0, Ljavassist/CtPrimitiveType;

    const-string v1, "short"

    const/16 v2, 0x53

    const-string v3, "java.lang.Short"

    const-string v4, "shortValue"

    const-string v5, "()S"

    const/16 v6, 0xac

    const/16 v7, 0x9

    const/4 v8, 0x1

    invoke-direct/range {v0 .. v8}, Ljavassist/CtPrimitiveType;-><init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V

    sput-object v0, Ljavassist/CtClass;->shortType:Ljavassist/CtClass;

    .line 167
    sget-object v0, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    const/4 v1, 0x3

    sget-object v2, Ljavassist/CtClass;->shortType:Ljavassist/CtClass;

    aput-object v2, v0, v1

    .line 169
    new-instance v0, Ljavassist/CtPrimitiveType;

    const-string v1, "int"

    const/16 v2, 0x49

    const-string v3, "java.lang.Integer"

    const-string v4, "intValue"

    const-string v5, "()I"

    const/16 v6, 0xac

    const/16 v7, 0xa

    const/4 v8, 0x1

    invoke-direct/range {v0 .. v8}, Ljavassist/CtPrimitiveType;-><init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V

    sput-object v0, Ljavassist/CtClass;->intType:Ljavassist/CtClass;

    .line 172
    sget-object v0, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    const/4 v1, 0x4

    sget-object v2, Ljavassist/CtClass;->intType:Ljavassist/CtClass;

    aput-object v2, v0, v1

    .line 174
    new-instance v0, Ljavassist/CtPrimitiveType;

    const-string v1, "long"

    const/16 v2, 0x4a

    const-string v3, "java.lang.Long"

    const-string v4, "longValue"

    const-string v5, "()J"

    const/16 v6, 0xad

    const/16 v7, 0xb

    const/4 v8, 0x2

    invoke-direct/range {v0 .. v8}, Ljavassist/CtPrimitiveType;-><init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V

    sput-object v0, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    .line 177
    sget-object v0, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    const/4 v1, 0x5

    sget-object v2, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    aput-object v2, v0, v1

    .line 179
    new-instance v0, Ljavassist/CtPrimitiveType;

    const-string v1, "float"

    const/16 v2, 0x46

    const-string v3, "java.lang.Float"

    const-string v4, "floatValue"

    const-string v5, "()F"

    const/16 v6, 0xae

    const/4 v7, 0x6

    const/4 v8, 0x1

    invoke-direct/range {v0 .. v8}, Ljavassist/CtPrimitiveType;-><init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V

    sput-object v0, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    .line 182
    sget-object v0, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    const/4 v1, 0x6

    sget-object v2, Ljavassist/CtClass;->floatType:Ljavassist/CtClass;

    aput-object v2, v0, v1

    .line 184
    new-instance v0, Ljavassist/CtPrimitiveType;

    const-string v1, "double"

    const/16 v2, 0x44

    const-string v3, "java.lang.Double"

    const-string v4, "doubleValue"

    const-string v5, "()D"

    const/16 v6, 0xaf

    const/4 v7, 0x7

    const/4 v8, 0x2

    invoke-direct/range {v0 .. v8}, Ljavassist/CtPrimitiveType;-><init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V

    sput-object v0, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    .line 187
    sget-object v0, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    const/4 v1, 0x7

    sget-object v2, Ljavassist/CtClass;->doubleType:Ljavassist/CtClass;

    aput-object v2, v0, v1

    .line 189
    new-instance v0, Ljavassist/CtPrimitiveType;

    const-string v1, "void"

    const/16 v2, 0x56

    const-string v3, "java.lang.Void"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v6, 0xb1

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Ljavassist/CtPrimitiveType;-><init>(Ljava/lang/String;CLjava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V

    sput-object v0, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    .line 191
    sget-object v0, Ljavassist/CtClass;->primitiveTypes:[Ljavassist/CtClass;

    const/16 v1, 0x8

    sget-object v2, Ljavassist/CtClass;->voidType:Ljavassist/CtClass;

    aput-object v2, v0, v1

    .line 192
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 195
    iput-object p1, p0, Ljavassist/CtClass;->qualifiedName:Ljava/lang/String;

    .line 196
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 82
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Javassist version 3.18.0-GA"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 83
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Copyright (C) 1999-2013 Shigeru Chiba. All Rights Reserved."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 85
    return-void
.end method


# virtual methods
.method public addConstructor(Ljavassist/CtConstructor;)V
    .registers 2
    .param p1, "c"    # Ljavassist/CtConstructor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1009
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 1010
    return-void
.end method

.method public addField(Ljavassist/CtField;)V
    .registers 3
    .param p1, "f"    # Ljavassist/CtField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1049
    const/4 v0, 0x0

    check-cast v0, Ljavassist/CtField$Initializer;

    invoke-virtual {p0, p1, v0}, Ljavassist/CtClass;->addField(Ljavassist/CtField;Ljavassist/CtField$Initializer;)V

    .line 1050
    return-void
.end method

.method public addField(Ljavassist/CtField;Ljava/lang/String;)V
    .registers 3
    .param p1, "f"    # Ljavassist/CtField;
    .param p2, "init"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1085
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 1086
    return-void
.end method

.method public addField(Ljavassist/CtField;Ljavassist/CtField$Initializer;)V
    .registers 3
    .param p1, "f"    # Ljavassist/CtField;
    .param p2, "init"    # Ljavassist/CtField$Initializer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1113
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 1114
    return-void
.end method

.method public addInterface(Ljavassist/CtClass;)V
    .registers 2
    .param p1, "anInterface"    # Ljavassist/CtClass;

    .prologue
    .line 746
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 747
    return-void
.end method

.method public addMethod(Ljavassist/CtMethod;)V
    .registers 2
    .param p1, "m"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1026
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 1027
    return-void
.end method

.method checkModify()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .prologue
    .line 295
    invoke-virtual {p0}, Ljavassist/CtClass;->isFrozen()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 296
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " class is frozen"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 299
    :cond_23
    return-void
.end method

.method compress()V
    .registers 1

    .prologue
    .line 1554
    return-void
.end method

.method public debugWriteFile()V
    .registers 2

    .prologue
    .line 1458
    const-string v0, "."

    invoke-virtual {p0, v0}, Ljavassist/CtClass;->debugWriteFile(Ljava/lang/String;)V

    .line 1459
    return-void
.end method

.method public debugWriteFile(Ljava/lang/String;)V
    .registers 5
    .param p1, "directoryName"    # Ljava/lang/String;

    .prologue
    .line 1472
    const/4 v2, 0x1

    :try_start_1
    invoke-virtual {p0, v2}, Ljavassist/CtClass;->stopPruning(Z)Z

    move-result v1

    .line 1473
    .local v1, "p":Z
    invoke-virtual {p0, p1}, Ljavassist/CtClass;->writeFile(Ljava/lang/String;)V

    .line 1474
    invoke-virtual {p0}, Ljavassist/CtClass;->defrost()V

    .line 1475
    invoke-virtual {p0, v1}, Ljavassist/CtClass;->stopPruning(Z)Z
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_e} :catch_f

    .line 1480
    return-void

    .line 1477
    .end local v1    # "p":Z
    :catch_f
    move-exception v0

    .line 1478
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public defrost()V
    .registers 4

    .prologue
    .line 317
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot defrost "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public detach()V
    .registers 5

    .prologue
    .line 1296
    invoke-virtual {p0}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v0

    .line 1297
    .local v0, "cp":Ljavassist/ClassPool;
    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljavassist/ClassPool;->removeCached(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    .line 1298
    .local v1, "obj":Ljavassist/CtClass;
    if-eq v1, p0, :cond_16

    .line 1299
    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Ljavassist/ClassPool;->cacheCtClass(Ljava/lang/String;Ljavassist/CtClass;Z)V

    .line 1300
    :cond_16
    return-void
.end method

.method protected extendToString(Ljava/lang/StringBuffer;)V
    .registers 3
    .param p1, "buffer"    # Ljava/lang/StringBuffer;

    .prologue
    .line 216
    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 217
    return-void
.end method

.method public freeze()V
    .registers 1

    .prologue
    .line 290
    return-void
.end method

.method public getAccessorMaker()Ljavassist/compiler/AccessorMaker;
    .registers 2

    .prologue
    .line 259
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAnnotation(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 3
    .param p1, "clz"    # Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 602
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAnnotations()[Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 617
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    return-object v0
.end method

.method public getAttribute(Ljava/lang/String;)[B
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1144
    const/4 v0, 0x0

    return-object v0
.end method

.method public getAvailableAnnotations()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 632
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    return-object v0
.end method

.method public getClassFile()Ljavassist/bytecode/ClassFile;
    .registers 2

    .prologue
    .line 231
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 232
    invoke-virtual {p0}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v0

    return-object v0
.end method

.method public getClassFile2()Ljavassist/bytecode/ClassFile;
    .registers 2

    .prologue
    .line 253
    const/4 v0, 0x0

    return-object v0
.end method

.method public getClassInitializer()Ljavassist/CtConstructor;
    .registers 2

    .prologue
    .line 917
    const/4 v0, 0x0

    return-object v0
.end method

.method public getClassPool()Ljavassist/ClassPool;
    .registers 2

    .prologue
    .line 222
    const/4 v0, 0x0

    return-object v0
.end method

.method public getComponentType()Ljavassist/CtClass;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 339
    const/4 v0, 0x0

    return-object v0
.end method

.method public getConstructor(Ljava/lang/String;)Ljavassist/CtConstructor;
    .registers 4
    .param p1, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 883
    new-instance v0, Ljavassist/NotFoundException;

    const-string v1, "no such constructor"

    invoke-direct {v0, v1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getConstructors()[Ljavassist/CtConstructor;
    .registers 2

    .prologue
    .line 867
    const/4 v0, 0x0

    new-array v0, v0, [Ljavassist/CtConstructor;

    return-object v0
.end method

.method public getDeclaredBehaviors()[Ljavassist/CtBehavior;
    .registers 2

    .prologue
    .line 859
    const/4 v0, 0x0

    new-array v0, v0, [Ljavassist/CtBehavior;

    return-object v0
.end method

.method public getDeclaredClasses()[Ljavassist/CtClass;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 644
    invoke-virtual {p0}, Ljavassist/CtClass;->getNestedClasses()[Ljavassist/CtClass;

    move-result-object v0

    return-object v0
.end method

.method public getDeclaredConstructor([Ljavassist/CtClass;)Ljavassist/CtConstructor;
    .registers 4
    .param p1, "params"    # [Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 903
    invoke-static {p1}, Ljavassist/bytecode/Descriptor;->ofConstructor([Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v0

    .line 904
    .local v0, "desc":Ljava/lang/String;
    invoke-virtual {p0, v0}, Ljavassist/CtClass;->getConstructor(Ljava/lang/String;)Ljavassist/CtConstructor;

    move-result-object v1

    return-object v1
.end method

.method public getDeclaredConstructors()[Ljavassist/CtConstructor;
    .registers 2

    .prologue
    .line 892
    const/4 v0, 0x0

    new-array v0, v0, [Ljavassist/CtConstructor;

    return-object v0
.end method

.method public getDeclaredField(Ljava/lang/String;)Ljavassist/CtField;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 836
    new-instance v0, Ljavassist/NotFoundException;

    invoke-direct {v0, p1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDeclaredField(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtField;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 852
    new-instance v0, Ljavassist/NotFoundException;

    invoke-direct {v0, p1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDeclaredFields()[Ljavassist/CtField;
    .registers 2

    .prologue
    .line 827
    const/4 v0, 0x0

    new-array v0, v0, [Ljavassist/CtField;

    return-object v0
.end method

.method public getDeclaredMethod(Ljava/lang/String;)Ljavassist/CtMethod;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 984
    new-instance v0, Ljavassist/NotFoundException;

    invoke-direct {v0, p1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDeclaredMethod(Ljava/lang/String;[Ljavassist/CtClass;)Ljavassist/CtMethod;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "params"    # [Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 971
    new-instance v0, Ljavassist/NotFoundException;

    invoke-direct {v0, p1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDeclaredMethods()[Ljavassist/CtMethod;
    .registers 2

    .prologue
    .line 955
    const/4 v0, 0x0

    new-array v0, v0, [Ljavassist/CtMethod;

    return-object v0
.end method

.method public getDeclaringClass()Ljavassist/CtClass;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 756
    const/4 v0, 0x0

    return-object v0
.end method

.method public getEnclosingMethod()Ljavassist/CtMethod;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 767
    const/4 v0, 0x0

    return-object v0
.end method

.method public getField(Ljava/lang/String;)Ljavassist/CtField;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 798
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ljavassist/CtClass;->getField(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtField;

    move-result-object v0

    return-object v0
.end method

.method public getField(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtField;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 813
    new-instance v0, Ljavassist/NotFoundException;

    invoke-direct {v0, p1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getField2(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtField;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/String;

    .prologue
    .line 819
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFields()[Ljavassist/CtField;
    .registers 2

    .prologue
    .line 791
    const/4 v0, 0x0

    new-array v0, v0, [Ljavassist/CtField;

    return-object v0
.end method

.method public getGenericSignature()Ljava/lang/String;
    .registers 2

    .prologue
    .line 405
    const/4 v0, 0x0

    return-object v0
.end method

.method public getInterfaces()[Ljavassist/CtClass;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 724
    const/4 v0, 0x0

    new-array v0, v0, [Ljavassist/CtClass;

    return-object v0
.end method

.method public getMethod(Ljava/lang/String;Ljava/lang/String;)Ljavassist/CtMethod;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "desc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 945
    new-instance v0, Ljavassist/NotFoundException;

    invoke-direct {v0, p1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMethods()[Ljavassist/CtMethod;
    .registers 2

    .prologue
    .line 927
    const/4 v0, 0x0

    new-array v0, v0, [Ljavassist/CtMethod;

    return-object v0
.end method

.method public getModifiers()I
    .registers 2

    .prologue
    .line 576
    const/4 v0, 0x0

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 354
    iget-object v0, p0, Ljavassist/CtClass;->qualifiedName:Ljava/lang/String;

    return-object v0
.end method

.method public getNestedClasses()[Ljavassist/CtClass;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 655
    const/4 v0, 0x0

    new-array v0, v0, [Ljavassist/CtClass;

    return-object v0
.end method

.method public final getPackageName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 372
    iget-object v1, p0, Ljavassist/CtClass;->qualifiedName:Ljava/lang/String;

    .line 373
    .local v1, "qname":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 374
    .local v0, "index":I
    if-gez v0, :cond_c

    .line 375
    const/4 v2, 0x0

    .line 377
    :goto_b
    return-object v2

    :cond_c
    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_b
.end method

.method public declared-synchronized getRefClasses()Ljava/util/Collection;
    .registers 4

    .prologue
    .line 516
    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Ljavassist/CtClass;->getClassFile2()Ljavassist/bytecode/ClassFile;

    move-result-object v0

    .line 517
    .local v0, "cf":Ljavassist/bytecode/ClassFile;
    if-eqz v0, :cond_15

    .line 518
    new-instance v1, Ljavassist/CtClass$1;

    invoke-direct {v1, p0}, Ljavassist/CtClass$1;-><init>(Ljavassist/CtClass;)V

    .line 531
    .local v1, "cm":Ljavassist/ClassMap;
    invoke-virtual {v0, v1}, Ljavassist/bytecode/ClassFile;->getRefClasses(Ljava/util/Map;)V

    .line 532
    invoke-virtual {v1}, Ljavassist/ClassMap;->values()Ljava/util/Collection;
    :try_end_12
    .catchall {:try_start_1 .. :try_end_12} :catchall_17

    move-result-object v2

    .line 535
    .end local v1    # "cm":Ljavassist/ClassMap;
    :goto_13
    monitor-exit p0

    return-object v2

    :cond_15
    const/4 v2, 0x0

    goto :goto_13

    .line 516
    .end local v0    # "cf":Ljavassist/bytecode/ClassFile;
    :catchall_17
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public final getSimpleName()Ljava/lang/String;
    .registers 4

    .prologue
    .line 360
    iget-object v1, p0, Ljavassist/CtClass;->qualifiedName:Ljava/lang/String;

    .line 361
    .local v1, "qname":Ljava/lang/String;
    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 362
    .local v0, "index":I
    if-gez v0, :cond_b

    .line 365
    .end local v1    # "qname":Ljava/lang/String;
    :goto_a
    return-object v1

    .restart local v1    # "qname":Ljava/lang/String;
    :cond_b
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_a
.end method

.method public getSuperclass()Ljavassist/CtClass;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 698
    const/4 v0, 0x0

    return-object v0
.end method

.method public getURL()Ljava/net/URL;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 266
    new-instance v0, Ljavassist/NotFoundException;

    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljavassist/NotFoundException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hasAnnotation(Ljava/lang/Class;)Z
    .registers 3
    .param p1, "clz"    # Ljava/lang/Class;

    .prologue
    .line 587
    const/4 v0, 0x0

    return v0
.end method

.method incGetCounter()V
    .registers 1

    .prologue
    .line 1363
    return-void
.end method

.method public instrument(Ljavassist/CodeConverter;)V
    .registers 2
    .param p1, "converter"    # Ljavassist/CodeConverter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1184
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 1185
    return-void
.end method

.method public instrument(Ljavassist/expr/ExprEditor;)V
    .registers 2
    .param p1, "editor"    # Ljavassist/expr/ExprEditor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1198
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 1199
    return-void
.end method

.method public isAnnotation()Z
    .registers 2

    .prologue
    .line 553
    const/4 v0, 0x0

    return v0
.end method

.method public isArray()Z
    .registers 2

    .prologue
    .line 331
    const/4 v0, 0x0

    return v0
.end method

.method public isEnum()Z
    .registers 2

    .prologue
    .line 563
    const/4 v0, 0x0

    return v0
.end method

.method public isFrozen()Z
    .registers 2

    .prologue
    .line 281
    const/4 v0, 0x1

    return v0
.end method

.method public isInterface()Z
    .registers 2

    .prologue
    .line 543
    const/4 v0, 0x0

    return v0
.end method

.method public isModified()Z
    .registers 2

    .prologue
    .line 272
    const/4 v0, 0x0

    return v0
.end method

.method public isPrimitive()Z
    .registers 2

    .prologue
    .line 325
    const/4 v0, 0x0

    return v0
.end method

.method public makeClassInitializer()Ljavassist/CtConstructor;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 997
    new-instance v0, Ljavassist/CannotCompileException;

    const-string v1, "not a class"

    invoke-direct {v0, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected makeFileOutput(Ljava/lang/String;)Ljava/io/DataOutputStream;
    .registers 9
    .param p1, "directoryName"    # Ljava/lang/String;

    .prologue
    .line 1436
    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    .line 1437
    .local v0, "classname":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-char v5, Ljava/io/File;->separatorChar:C

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x2e

    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".class"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1439
    .local v2, "filename":Ljava/lang/String;
    sget-char v4, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v3

    .line 1440
    .local v3, "pos":I
    if-lez v3, :cond_46

    .line 1441
    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1442
    .local v1, "dir":Ljava/lang/String;
    const-string v4, "."

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_46

    .line 1443
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 1446
    .end local v1    # "dir":Ljava/lang/String;
    :cond_46
    new-instance v4, Ljava/io/DataOutputStream;

    new-instance v5, Ljava/io/BufferedOutputStream;

    new-instance v6, Ljavassist/CtClass$DelayedFileOutputStream;

    invoke-direct {v6, v2}, Ljavassist/CtClass$DelayedFileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v4, v5}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-object v4
.end method

.method public makeNestedClass(Ljava/lang/String;Z)Ljavassist/CtClass;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "isStatic"    # Z

    .prologue
    .line 782
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not a class"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public makeUniqueName(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 1548
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "not available in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public prune()V
    .registers 1

    .prologue
    .line 1358
    return-void
.end method

.method public rebuildClassFile()V
    .registers 1

    .prologue
    .line 1378
    return-void
.end method

.method public removeConstructor(Ljavassist/CtConstructor;)V
    .registers 2
    .param p1, "c"    # Ljavassist/CtConstructor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 1019
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 1020
    return-void
.end method

.method public removeField(Ljavassist/CtField;)V
    .registers 2
    .param p1, "f"    # Ljavassist/CtField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 1123
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 1124
    return-void
.end method

.method public removeMethod(Ljavassist/CtMethod;)V
    .registers 2
    .param p1, "m"    # Ljavassist/CtMethod;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 1036
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 1037
    return-void
.end method

.method public replaceClassName(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "oldName"    # Ljava/lang/String;
    .param p2, "newName"    # Ljava/lang/String;

    .prologue
    .line 482
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 483
    return-void
.end method

.method public replaceClassName(Ljavassist/ClassMap;)V
    .registers 2
    .param p1, "map"    # Ljavassist/ClassMap;

    .prologue
    .line 503
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 504
    return-void
.end method

.method public setAttribute(Ljava/lang/String;[B)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .prologue
    .line 1170
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 1171
    return-void
.end method

.method public setGenericSignature(Ljava/lang/String;)V
    .registers 2
    .param p1, "sig"    # Ljava/lang/String;

    .prologue
    .line 472
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    return-void
.end method

.method public setInterfaces([Ljavassist/CtClass;)V
    .registers 2
    .param p1, "list"    # [Ljavassist/CtClass;

    .prologue
    .line 737
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 738
    return-void
.end method

.method public setModifiers(I)V
    .registers 2
    .param p1, "mod"    # I

    .prologue
    .line 670
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 671
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 386
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 387
    if-eqz p1, :cond_7

    .line 388
    iput-object p1, p0, Ljavassist/CtClass;->qualifiedName:Ljava/lang/String;

    .line 389
    :cond_7
    return-void
.end method

.method public setSuperclass(Ljavassist/CtClass;)V
    .registers 2
    .param p1, "clazz"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 715
    invoke-virtual {p0}, Ljavassist/CtClass;->checkModify()V

    .line 716
    return-void
.end method

.method public stopPruning(Z)Z
    .registers 3
    .param p1, "stop"    # Z

    .prologue
    .line 1326
    const/4 v0, 0x1

    return v0
.end method

.method public subclassOf(Ljavassist/CtClass;)Z
    .registers 3
    .param p1, "superclass"    # Ljavassist/CtClass;

    .prologue
    .line 682
    const/4 v0, 0x0

    return v0
.end method

.method public subtypeOf(Ljavassist/CtClass;)Z
    .registers 4
    .param p1, "clazz"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 348
    if-eq p0, p1, :cond_10

    invoke-virtual {p0}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljavassist/CtClass;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    :cond_10
    const/4 v0, 0x1

    :goto_11
    return v0

    :cond_12
    const/4 v0, 0x0

    goto :goto_11
.end method

.method public toBytecode(Ljava/io/DataOutputStream;)V
    .registers 4
    .param p1, "out"    # Ljava/io/DataOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1535
    new-instance v0, Ljavassist/CannotCompileException;

    const-string v1, "not a class"

    invoke-direct {v0, v1}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toBytecode()[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1388
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1389
    .local v0, "barray":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 1391
    .local v1, "out":Ljava/io/DataOutputStream;
    :try_start_a
    invoke-virtual {p0, v1}, Ljavassist/CtClass;->toBytecode(Ljava/io/DataOutputStream;)V
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_15

    .line 1394
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    .line 1397
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 1394
    :catchall_15
    move-exception v2

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    throw v2
.end method

.method public toClass()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1224
    invoke-virtual {p0}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljavassist/ClassPool;->toClass(Ljavassist/CtClass;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public final toClass(Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1280
    invoke-virtual {p0}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljavassist/ClassPool;->toClass(Ljavassist/CtClass;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public toClass(Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)Ljava/lang/Class;
    .registers 5
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .param p2, "domain"    # Ljava/security/ProtectionDomain;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1261
    invoke-virtual {p0}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v0

    .line 1262
    .local v0, "cp":Ljavassist/ClassPool;
    if-nez p1, :cond_a

    .line 1263
    invoke-virtual {v0}, Ljavassist/ClassPool;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    .line 1265
    :cond_a
    invoke-virtual {v0, p0, p1, p2}, Ljavassist/ClassPool;->toClass(Ljavassist/CtClass;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v1

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 202
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 203
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 204
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 205
    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 206
    invoke-virtual {p0, v0}, Ljavassist/CtClass;->extendToString(Ljava/lang/StringBuffer;)V

    .line 207
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 208
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public writeFile()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;,
            Ljava/io/IOException;,
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 1411
    const-string v0, "."

    invoke-virtual {p0, v0}, Ljavassist/CtClass;->writeFile(Ljava/lang/String;)V

    .line 1412
    return-void
.end method

.method public writeFile(Ljava/lang/String;)V
    .registers 4
    .param p1, "directoryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1426
    invoke-virtual {p0, p1}, Ljavassist/CtClass;->makeFileOutput(Ljava/lang/String;)Ljava/io/DataOutputStream;

    move-result-object v0

    .line 1428
    .local v0, "out":Ljava/io/DataOutputStream;
    :try_start_4
    invoke-virtual {p0, v0}, Ljavassist/CtClass;->toBytecode(Ljava/io/DataOutputStream;)V
    :try_end_7
    .catchall {:try_start_4 .. :try_end_7} :catchall_b

    .line 1431
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    .line 1433
    return-void

    .line 1431
    :catchall_b
    move-exception v1

    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    throw v1
.end method
