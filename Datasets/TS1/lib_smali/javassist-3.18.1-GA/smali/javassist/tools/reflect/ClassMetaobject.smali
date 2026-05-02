.class public Ljavassist/tools/reflect/ClassMetaobject;
.super Ljava/lang/Object;
.source "ClassMetaobject.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field static final methodPrefix:Ljava/lang/String; = "_m_"

.field static final methodPrefixLen:I = 0x3

.field public static useContextClassLoader:Z


# instance fields
.field private constructors:[Ljava/lang/reflect/Constructor;

.field private javaClass:Ljava/lang/Class;

.field private methods:[Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 63
    const/4 v0, 0x0

    sput-boolean v0, Ljavassist/tools/reflect/ClassMetaobject;->useContextClassLoader:Z

    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .registers 7
    .param p1, "params"    # [Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    const/4 v1, 0x0

    :try_start_5
    aget-object v1, p1, v1

    invoke-direct {p0, v1}, Ljavassist/tools/reflect/ClassMetaobject;->getClassObject(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    iput-object v1, p0, Ljavassist/tools/reflect/ClassMetaobject;->javaClass:Ljava/lang/Class;
    :try_end_d
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_d} :catch_19

    .line 82
    iget-object v1, p0, Ljavassist/tools/reflect/ClassMetaobject;->javaClass:Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v1

    iput-object v1, p0, Ljavassist/tools/reflect/ClassMetaobject;->constructors:[Ljava/lang/reflect/Constructor;

    .line 83
    const/4 v1, 0x0

    iput-object v1, p0, Ljavassist/tools/reflect/ClassMetaobject;->methods:[Ljava/lang/reflect/Method;

    .line 84
    return-void

    .line 76
    :catch_19
    move-exception v0

    .line 77
    .local v0, "e":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "not found: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p1, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", useContextClassLoader: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-boolean v3, Ljavassist/tools/reflect/ClassMetaobject;->useContextClassLoader:Z

    invoke-static {v3}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private getClassObject(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 99
    sget-boolean v0, Ljavassist/tools/reflect/ClassMetaobject;->useContextClassLoader:Z

    if-eqz v0, :cond_11

    .line 100
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 103
    :goto_10
    return-object v0

    :cond_11
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_10
.end method

.method public static invoke(Ljava/lang/Object;I[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "identifier"    # I
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 206
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 207
    .local v0, "allmethods":[Ljava/lang/reflect/Method;
    array-length v4, v0

    .line 208
    .local v4, "n":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_m_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 209
    .local v2, "head":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1d
    if-ge v3, v4, :cond_42

    .line 210
    aget-object v5, v0, v3

    invoke-virtual {v5}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3f

    .line 212
    :try_start_2b
    aget-object v5, v0, v3

    invoke-virtual {v5, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_30
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2b .. :try_end_30} :catch_32
    .catch Ljava/lang/IllegalAccessException; {:try_start_2b .. :try_end_30} :catch_38

    move-result-object v5

    return-object v5

    .line 213
    :catch_32
    move-exception v1

    .line 214
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v5

    throw v5

    .line 215
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_38
    move-exception v1

    .line 216
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v5, Ljavassist/tools/reflect/CannotInvokeException;

    invoke-direct {v5, v1}, Ljavassist/tools/reflect/CannotInvokeException;-><init>(Ljava/lang/IllegalAccessException;)V

    throw v5

    .line 209
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :cond_3f
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    .line 220
    :cond_42
    new-instance v5, Ljavassist/tools/reflect/CannotInvokeException;

    const-string v6, "cannot find a method"

    invoke-direct {v5, v6}, Ljavassist/tools/reflect/CannotInvokeException;-><init>(Ljava/lang/String;)V

    throw v5
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 3
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 93
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljavassist/tools/reflect/ClassMetaobject;->getClassObject(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Ljavassist/tools/reflect/ClassMetaobject;->javaClass:Ljava/lang/Class;

    .line 94
    iget-object v0, p0, Ljavassist/tools/reflect/ClassMetaobject;->javaClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v0

    iput-object v0, p0, Ljavassist/tools/reflect/ClassMetaobject;->constructors:[Ljava/lang/reflect/Constructor;

    .line 95
    const/4 v0, 0x0

    iput-object v0, p0, Ljavassist/tools/reflect/ClassMetaobject;->methods:[Ljava/lang/reflect/Method;

    .line 96
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Ljavassist/tools/reflect/ClassMetaobject;->javaClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 88
    return-void
.end method


# virtual methods
.method public final getJavaClass()Ljava/lang/Class;
    .registers 2

    .prologue
    .line 110
    iget-object v0, p0, Ljavassist/tools/reflect/ClassMetaobject;->javaClass:Ljava/lang/Class;

    return-object v0
.end method

.method public final getMethod(I)Ljava/lang/reflect/Method;
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 299
    invoke-virtual {p0}, Ljavassist/tools/reflect/ClassMetaobject;->getReflectiveMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    aget-object v0, v0, p1

    return-object v0
.end method

.method public final getMethodIndex(Ljava/lang/String;[Ljava/lang/Class;)I
    .registers 8
    .param p1, "originalName"    # Ljava/lang/String;
    .param p2, "argTypes"    # [Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 356
    invoke-virtual {p0}, Ljavassist/tools/reflect/ClassMetaobject;->getReflectiveMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    .line 357
    .local v1, "mthds":[Ljava/lang/reflect/Method;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_5
    array-length v2, v1

    if-ge v0, v2, :cond_26

    .line 358
    aget-object v2, v1, v0

    if-nez v2, :cond_f

    .line 357
    :cond_c
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 362
    :cond_f
    invoke-virtual {p0, v0}, Ljavassist/tools/reflect/ClassMetaobject;->getMethodName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    aget-object v2, v1, v0

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v2

    invoke-static {p2, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 364
    return v0

    .line 367
    :cond_26
    new-instance v2, Ljava/lang/NoSuchMethodException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Method "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not found"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NoSuchMethodException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public final getMethodName(I)Ljava/lang/String;
    .registers 7
    .param p1, "identifier"    # I

    .prologue
    .line 307
    invoke-virtual {p0}, Ljavassist/tools/reflect/ClassMetaobject;->getReflectiveMethods()[Ljava/lang/reflect/Method;

    move-result-object v4

    aget-object v4, v4, p1

    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    .line 308
    .local v3, "mname":Ljava/lang/String;
    const/4 v1, 0x3

    .line 310
    .local v1, "j":I
    :goto_b
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "j":I
    .local v2, "j":I
    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 311
    .local v0, "c":C
    const/16 v4, 0x30

    if-lt v0, v4, :cond_19

    const/16 v4, 0x39

    if-ge v4, v0, :cond_1e

    .line 315
    :cond_19
    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    return-object v4

    :cond_1e
    move v1, v2

    .line 313
    .end local v2    # "j":I
    .restart local v1    # "j":I
    goto :goto_b
.end method

.method public final getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 117
    iget-object v0, p0, Ljavassist/tools/reflect/ClassMetaobject;->javaClass:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getParameterTypes(I)[Ljava/lang/Class;
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 324
    invoke-virtual {p0}, Ljavassist/tools/reflect/ClassMetaobject;->getReflectiveMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    aget-object v0, v0, p1

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public final getReflectiveMethods()[Ljava/lang/reflect/Method;
    .registers 15

    .prologue
    .line 251
    iget-object v11, p0, Ljavassist/tools/reflect/ClassMetaobject;->methods:[Ljava/lang/reflect/Method;

    if-eqz v11, :cond_7

    .line 252
    iget-object v11, p0, Ljavassist/tools/reflect/ClassMetaobject;->methods:[Ljava/lang/reflect/Method;

    .line 283
    :goto_6
    return-object v11

    .line 254
    :cond_7
    invoke-virtual {p0}, Ljavassist/tools/reflect/ClassMetaobject;->getJavaClass()Ljava/lang/Class;

    move-result-object v1

    .line 255
    .local v1, "baseclass":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .line 256
    .local v0, "allmethods":[Ljava/lang/reflect/Method;
    array-length v10, v0

    .line 257
    .local v10, "n":I
    new-array v4, v10, [I

    .line 258
    .local v4, "index":[I
    const/4 v8, 0x0

    .line 259
    .local v8, "max":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_14
    if-ge v3, v10, :cond_44

    .line 260
    aget-object v7, v0, v3

    .line 261
    .local v7, "m":Ljava/lang/reflect/Method;
    invoke-virtual {v7}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v9

    .line 262
    .local v9, "mname":Ljava/lang/String;
    const-string v11, "_m_"

    invoke-virtual {v9, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_41

    .line 263
    const/4 v6, 0x0

    .line 264
    .local v6, "k":I
    const/4 v5, 0x3

    .line 265
    .local v5, "j":I
    :goto_26
    invoke-virtual {v9, v5}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 266
    .local v2, "c":C
    const/16 v11, 0x30

    if-gt v11, v2, :cond_3a

    const/16 v11, 0x39

    if-gt v2, v11, :cond_3a

    .line 267
    mul-int/lit8 v11, v6, 0xa

    add-int/2addr v11, v2

    add-int/lit8 v6, v11, -0x30

    .line 264
    add-int/lit8 v5, v5, 0x1

    goto :goto_26

    .line 272
    :cond_3a
    add-int/lit8 v6, v6, 0x1

    aput v6, v4, v3

    .line 273
    if-le v6, v8, :cond_41

    .line 274
    move v8, v6

    .line 259
    .end local v2    # "c":C
    .end local v5    # "j":I
    .end local v6    # "k":I
    :cond_41
    add-int/lit8 v3, v3, 0x1

    goto :goto_14

    .line 278
    .end local v7    # "m":Ljava/lang/reflect/Method;
    .end local v9    # "mname":Ljava/lang/String;
    :cond_44
    new-array v11, v8, [Ljava/lang/reflect/Method;

    iput-object v11, p0, Ljavassist/tools/reflect/ClassMetaobject;->methods:[Ljava/lang/reflect/Method;

    .line 279
    const/4 v3, 0x0

    :goto_49
    if-ge v3, v10, :cond_5c

    .line 280
    aget v11, v4, v3

    if-lez v11, :cond_59

    .line 281
    iget-object v11, p0, Ljavassist/tools/reflect/ClassMetaobject;->methods:[Ljava/lang/reflect/Method;

    aget v12, v4, v3

    add-int/lit8 v12, v12, -0x1

    aget-object v13, v0, v3

    aput-object v13, v11, v12

    .line 279
    :cond_59
    add-int/lit8 v3, v3, 0x1

    goto :goto_49

    .line 283
    :cond_5c
    iget-object v11, p0, Ljavassist/tools/reflect/ClassMetaobject;->methods:[Ljava/lang/reflect/Method;

    goto :goto_6
.end method

.method public final getReturnType(I)Ljava/lang/Class;
    .registers 3
    .param p1, "identifier"    # I

    .prologue
    .line 332
    invoke-virtual {p0}, Ljavassist/tools/reflect/ClassMetaobject;->getReflectiveMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    aget-object v0, v0, p1

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public final isInstance(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 124
    iget-object v0, p0, Ljavassist/tools/reflect/ClassMetaobject;->javaClass:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public final newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/tools/reflect/CannotCreateException;
        }
    .end annotation

    .prologue
    .line 135
    iget-object v3, p0, Ljavassist/tools/reflect/ClassMetaobject;->constructors:[Ljava/lang/reflect/Constructor;

    array-length v2, v3

    .line 136
    .local v2, "n":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    if-ge v1, v2, :cond_28

    .line 138
    :try_start_6
    iget-object v3, p0, Ljavassist/tools/reflect/ClassMetaobject;->constructors:[Ljava/lang/reflect/Constructor;

    aget-object v3, v3, v1

    invoke-virtual {v3, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_d} :catch_24
    .catch Ljava/lang/InstantiationException; {:try_start_6 .. :try_end_d} :catch_f
    .catch Ljava/lang/IllegalAccessException; {:try_start_6 .. :try_end_d} :catch_16
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_6 .. :try_end_d} :catch_1d

    move-result-object v3

    return-object v3

    .line 143
    :catch_f
    move-exception v0

    .line 144
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v3, Ljavassist/tools/reflect/CannotCreateException;

    invoke-direct {v3, v0}, Ljavassist/tools/reflect/CannotCreateException;-><init>(Ljava/lang/Exception;)V

    throw v3

    .line 146
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_16
    move-exception v0

    .line 147
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v3, Ljavassist/tools/reflect/CannotCreateException;

    invoke-direct {v3, v0}, Ljavassist/tools/reflect/CannotCreateException;-><init>(Ljava/lang/Exception;)V

    throw v3

    .line 149
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1d
    move-exception v0

    .line 150
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v3, Ljavassist/tools/reflect/CannotCreateException;

    invoke-direct {v3, v0}, Ljavassist/tools/reflect/CannotCreateException;-><init>(Ljava/lang/Exception;)V

    throw v3

    .line 140
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_24
    move-exception v3

    .line 136
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 154
    :cond_28
    new-instance v3, Ljavassist/tools/reflect/CannotCreateException;

    const-string v4, "no constructor matches"

    invoke-direct {v3, v4}, Ljavassist/tools/reflect/CannotCreateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public trapFieldRead(Ljava/lang/String;)Ljava/lang/Object;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 165
    invoke-virtual {p0}, Ljavassist/tools/reflect/ClassMetaobject;->getJavaClass()Ljava/lang/Class;

    move-result-object v1

    .line 167
    .local v1, "jc":Ljava/lang/Class;
    :try_start_4
    invoke-virtual {v1, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4 .. :try_end_c} :catch_e
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_c} :catch_19

    move-result-object v2

    return-object v2

    .line 169
    :catch_e
    move-exception v0

    .line 170
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/NoSuchFieldException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 172
    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    :catch_19
    move-exception v0

    .line 173
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public trapFieldWrite(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 185
    invoke-virtual {p0}, Ljavassist/tools/reflect/ClassMetaobject;->getJavaClass()Ljava/lang/Class;

    move-result-object v1

    .line 187
    .local v1, "jc":Ljava/lang/Class;
    :try_start_4
    invoke-virtual {v1, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3, p2}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_c
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4 .. :try_end_c} :catch_d
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_c} :catch_18

    .line 195
    return-void

    .line 189
    :catch_d
    move-exception v0

    .line 190
    .local v0, "e":Ljava/lang/NoSuchFieldException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/NoSuchFieldException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 192
    .end local v0    # "e":Ljava/lang/NoSuchFieldException;
    :catch_18
    move-exception v0

    .line 193
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public trapMethodcall(I[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .param p1, "identifier"    # I
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 235
    :try_start_0
    invoke-virtual {p0}, Ljavassist/tools/reflect/ClassMetaobject;->getReflectiveMethods()[Ljava/lang/reflect/Method;

    move-result-object v1

    .line 236
    .local v1, "m":[Ljava/lang/reflect/Method;
    aget-object v2, v1, p1

    const/4 v3, 0x0

    invoke-virtual {v2, v3, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_a} :catch_c
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_a} :catch_12

    move-result-object v2

    return-object v2

    .line 238
    .end local v1    # "m":[Ljava/lang/reflect/Method;
    :catch_c
    move-exception v0

    .line 239
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v2

    throw v2

    .line 241
    .end local v0    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_12
    move-exception v0

    .line 242
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljavassist/tools/reflect/CannotInvokeException;

    invoke-direct {v2, v0}, Ljavassist/tools/reflect/CannotInvokeException;-><init>(Ljava/lang/IllegalAccessException;)V

    throw v2
.end method
