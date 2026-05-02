.class public Ljavassist/util/proxy/FactoryHelper;
.super Ljava/lang/Object;
.source "FactoryHelper.java"


# static fields
.field public static final dataSize:[I

.field private static defineClass1:Ljava/lang/reflect/Method;

.field private static defineClass2:Ljava/lang/reflect/Method;

.field public static final primitiveTypes:[Ljava/lang/Class;

.field public static final unwarpMethods:[Ljava/lang/String;

.field public static final unwrapDesc:[Ljava/lang/String;

.field public static final wrapperDesc:[Ljava/lang/String;

.field public static final wrapperTypes:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 11

    .prologue
    const/4 v10, 0x4

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 42
    :try_start_5
    const-string v2, "java.lang.ClassLoader"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 43
    .local v0, "cl":Ljava/lang/Class;
    const-string v2, "defineClass"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, [B

    aput-object v5, v3, v4

    const/4 v4, 0x2

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x3

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    invoke-static {v0, v2, v3}, Ljavassist/util/proxy/SecurityActions;->getDeclaredMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Ljavassist/util/proxy/FactoryHelper;->defineClass1:Ljava/lang/reflect/Method;

    .line 49
    const-string v2, "defineClass"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, [B

    aput-object v5, v3, v4

    const/4 v4, 0x2

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x3

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v3, v4

    const/4 v4, 0x4

    const-class v5, Ljava/security/ProtectionDomain;

    aput-object v5, v3, v4

    invoke-static {v0, v2, v3}, Ljavassist/util/proxy/SecurityActions;->getDeclaredMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Ljavassist/util/proxy/FactoryHelper;->defineClass2:Ljava/lang/reflect/Method;
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_4e} :catch_131

    .line 78
    const/16 v2, 0x9

    new-array v2, v2, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v6

    sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v7

    sget-object v3, Ljava/lang/Character;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v8

    sget-object v3, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v9

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v10

    const/4 v3, 0x5

    sget-object v4, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/4 v3, 0x6

    sget-object v4, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/4 v3, 0x7

    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    const/16 v3, 0x8

    sget-object v4, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    sput-object v2, Ljavassist/util/proxy/FactoryHelper;->primitiveTypes:[Ljava/lang/Class;

    .line 86
    const/16 v2, 0x9

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "java.lang.Boolean"

    aput-object v3, v2, v6

    const-string v3, "java.lang.Byte"

    aput-object v3, v2, v7

    const-string v3, "java.lang.Character"

    aput-object v3, v2, v8

    const-string v3, "java.lang.Short"

    aput-object v3, v2, v9

    const-string v3, "java.lang.Integer"

    aput-object v3, v2, v10

    const/4 v3, 0x5

    const-string v4, "java.lang.Long"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "java.lang.Float"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "java.lang.Double"

    aput-object v4, v2, v3

    const/16 v3, 0x8

    const-string v4, "java.lang.Void"

    aput-object v4, v2, v3

    sput-object v2, Ljavassist/util/proxy/FactoryHelper;->wrapperTypes:[Ljava/lang/String;

    .line 95
    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "(Z)V"

    aput-object v3, v2, v6

    const-string v3, "(B)V"

    aput-object v3, v2, v7

    const-string v3, "(C)V"

    aput-object v3, v2, v8

    const-string v3, "(S)V"

    aput-object v3, v2, v9

    const-string v3, "(I)V"

    aput-object v3, v2, v10

    const/4 v3, 0x5

    const-string v4, "(J)V"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "(F)V"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "(D)V"

    aput-object v4, v2, v3

    sput-object v2, Ljavassist/util/proxy/FactoryHelper;->wrapperDesc:[Ljava/lang/String;

    .line 106
    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "booleanValue"

    aput-object v3, v2, v6

    const-string v3, "byteValue"

    aput-object v3, v2, v7

    const-string v3, "charValue"

    aput-object v3, v2, v8

    const-string v3, "shortValue"

    aput-object v3, v2, v9

    const-string v3, "intValue"

    aput-object v3, v2, v10

    const/4 v3, 0x5

    const-string v4, "longValue"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "floatValue"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "doubleValue"

    aput-object v4, v2, v3

    sput-object v2, Ljavassist/util/proxy/FactoryHelper;->unwarpMethods:[Ljava/lang/String;

    .line 115
    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "()Z"

    aput-object v3, v2, v6

    const-string v3, "()B"

    aput-object v3, v2, v7

    const-string v3, "()C"

    aput-object v3, v2, v8

    const-string v3, "()S"

    aput-object v3, v2, v9

    const-string v3, "()I"

    aput-object v3, v2, v10

    const/4 v3, 0x5

    const-string v4, "()J"

    aput-object v4, v2, v3

    const/4 v3, 0x6

    const-string v4, "()F"

    aput-object v4, v2, v3

    const/4 v3, 0x7

    const-string v4, "()D"

    aput-object v4, v2, v3

    sput-object v2, Ljavassist/util/proxy/FactoryHelper;->unwrapDesc:[Ljava/lang/String;

    .line 123
    const/16 v2, 0x8

    new-array v2, v2, [I

    fill-array-data v2, :array_13a

    sput-object v2, Ljavassist/util/proxy/FactoryHelper;->dataSize:[I

    return-void

    .line 55
    :catch_131
    move-exception v1

    .line 56
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "cannot initialize"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 123
    :array_13a
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
        0x2
        0x1
        0x2
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static toBytecode(Ljavassist/bytecode/ClassFile;)[B
    .registers 4
    .param p0, "cf"    # Ljavassist/bytecode/ClassFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 189
    .local v0, "barray":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-direct {v1, v0}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 191
    .local v1, "out":Ljava/io/DataOutputStream;
    :try_start_a
    invoke-virtual {p0, v1}, Ljavassist/bytecode/ClassFile;->write(Ljava/io/DataOutputStream;)V
    :try_end_d
    .catchall {:try_start_a .. :try_end_d} :catchall_15

    .line 194
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    .line 197
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2

    .line 194
    :catchall_15
    move-exception v2

    invoke-virtual {v1}, Ljava/io/DataOutputStream;->close()V

    throw v2
.end method

.method public static toClass(Ljavassist/bytecode/ClassFile;Ljava/lang/ClassLoader;)Ljava/lang/Class;
    .registers 3
    .param p0, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 137
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Ljavassist/util/proxy/FactoryHelper;->toClass(Ljavassist/bytecode/ClassFile;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public static toClass(Ljavassist/bytecode/ClassFile;Ljava/lang/ClassLoader;Ljava/security/ProtectionDomain;)Ljava/lang/Class;
    .registers 10
    .param p0, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .param p2, "domain"    # Ljava/security/ProtectionDomain;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 150
    :try_start_0
    invoke-static {p0}, Ljavassist/util/proxy/FactoryHelper;->toBytecode(Ljavassist/bytecode/ClassFile;)[B

    move-result-object v1

    .line 153
    .local v1, "b":[B
    if-nez p2, :cond_2c

    .line 154
    sget-object v3, Ljavassist/util/proxy/FactoryHelper;->defineClass1:Ljava/lang/reflect/Method;

    .line 155
    .local v3, "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x4

    new-array v0, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    const/4 v4, 0x1

    aput-object v1, v0, v4

    const/4 v4, 0x2

    new-instance v5, Ljava/lang/Integer;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    aput-object v5, v0, v4

    const/4 v4, 0x3

    new-instance v5, Ljava/lang/Integer;

    array-length v6, v1

    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    aput-object v5, v0, v4

    .line 164
    .local v0, "args":[Ljava/lang/Object;
    :goto_27
    invoke-static {v3, p1, v0}, Ljavassist/util/proxy/FactoryHelper;->toClass2(Ljava/lang/reflect/Method;Ljava/lang/ClassLoader;[Ljava/lang/Object;)Ljava/lang/Class;

    move-result-object v4

    return-object v4

    .line 159
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_2c
    sget-object v3, Ljavassist/util/proxy/FactoryHelper;->defineClass2:Ljava/lang/reflect/Method;

    .line 160
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    const/4 v4, 0x5

    new-array v0, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    const/4 v4, 0x1

    aput-object v1, v0, v4

    const/4 v4, 0x2

    new-instance v5, Ljava/lang/Integer;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    aput-object v5, v0, v4

    const/4 v4, 0x3

    new-instance v5, Ljava/lang/Integer;

    array-length v6, v1

    invoke-direct {v5, v6}, Ljava/lang/Integer;-><init>(I)V

    aput-object v5, v0, v4

    const/4 v4, 0x4

    aput-object p2, v0, v4
    :try_end_50
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_50} :catch_51
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_50} :catch_53
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_50} :catch_5e

    .restart local v0    # "args":[Ljava/lang/Object;
    goto :goto_27

    .line 166
    .end local v0    # "args":[Ljava/lang/Object;
    .end local v1    # "b":[B
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :catch_51
    move-exception v2

    .line 167
    .local v2, "e":Ljava/lang/RuntimeException;
    throw v2

    .line 169
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :catch_53
    move-exception v2

    .line 170
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getTargetException()Ljava/lang/Throwable;

    move-result-object v5

    invoke-direct {v4, v5}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 172
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_5e
    move-exception v2

    .line 173
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Ljavassist/CannotCompileException;

    invoke-direct {v4, v2}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method private static declared-synchronized toClass2(Ljava/lang/reflect/Method;Ljava/lang/ClassLoader;[Ljava/lang/Object;)Ljava/lang/Class;
    .registers 6
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .param p1, "loader"    # Ljava/lang/ClassLoader;
    .param p2, "args"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 181
    const-class v2, Ljavassist/util/proxy/FactoryHelper;

    monitor-enter v2

    const/4 v1, 0x1

    :try_start_4
    invoke-static {p0, v1}, Ljavassist/util/proxy/SecurityActions;->setAccessible(Ljava/lang/reflect/AccessibleObject;Z)V

    .line 182
    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 183
    .local v0, "clazz":Ljava/lang/Class;
    const/4 v1, 0x0

    invoke-static {p0, v1}, Ljavassist/util/proxy/SecurityActions;->setAccessible(Ljava/lang/reflect/AccessibleObject;Z)V
    :try_end_11
    .catchall {:try_start_4 .. :try_end_11} :catchall_13

    .line 184
    monitor-exit v2

    return-object v0

    .line 181
    .end local v0    # "clazz":Ljava/lang/Class;
    :catchall_13
    move-exception v1

    monitor-exit v2

    throw v1
.end method

.method public static final typeIndex(Ljava/lang/Class;)I
    .registers 7
    .param p0, "type"    # Ljava/lang/Class;

    .prologue
    .line 66
    sget-object v1, Ljavassist/util/proxy/FactoryHelper;->primitiveTypes:[Ljava/lang/Class;

    .line 67
    .local v1, "list":[Ljava/lang/Class;
    array-length v2, v1

    .line 68
    .local v2, "n":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    if-ge v0, v2, :cond_e

    .line 69
    aget-object v3, v1, v0

    if-ne v3, p0, :cond_b

    .line 70
    return v0

    .line 68
    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 72
    :cond_e
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "bad type:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static writeFile(Ljavassist/bytecode/ClassFile;Ljava/lang/String;)V
    .registers 4
    .param p0, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p1, "directoryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 206
    :try_start_0
    invoke-static {p0, p1}, Ljavassist/util/proxy/FactoryHelper;->writeFile0(Ljavassist/bytecode/ClassFile;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_3} :catch_4

    .line 211
    return-void

    .line 208
    :catch_4
    move-exception v0

    .line 209
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljavassist/CannotCompileException;

    invoke-direct {v1, v0}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method private static writeFile0(Ljavassist/bytecode/ClassFile;Ljava/lang/String;)V
    .registers 11
    .param p0, "cf"    # Ljavassist/bytecode/ClassFile;
    .param p1, "directoryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    invoke-virtual {p0}, Ljavassist/bytecode/ClassFile;->getName()Ljava/lang/String;

    move-result-object v0

    .line 216
    .local v0, "classname":Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x2e

    sget-char v8, Ljava/io/File;->separatorChar:C

    invoke-virtual {v0, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".class"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 218
    .local v3, "filename":Ljava/lang/String;
    sget-char v6, Ljava/io/File;->separatorChar:C

    invoke-virtual {v3, v6}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v5

    .line 219
    .local v5, "pos":I
    if-lez v5, :cond_46

    .line 220
    const/4 v6, 0x0

    invoke-virtual {v3, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 221
    .local v1, "dir":Ljava/lang/String;
    const-string v6, "."

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_46

    .line 222
    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 225
    .end local v1    # "dir":Ljava/lang/String;
    :cond_46
    new-instance v4, Ljava/io/DataOutputStream;

    new-instance v6, Ljava/io/BufferedOutputStream;

    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    invoke-direct {v6, v7}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v4, v6}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 228
    .local v4, "out":Ljava/io/DataOutputStream;
    :try_start_55
    invoke-virtual {p0, v4}, Ljavassist/bytecode/ClassFile;->write(Ljava/io/DataOutputStream;)V
    :try_end_58
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_58} :catch_5c
    .catchall {:try_start_55 .. :try_end_58} :catchall_5e

    .line 234
    invoke-virtual {v4}, Ljava/io/DataOutputStream;->close()V

    .line 236
    return-void

    .line 230
    :catch_5c
    move-exception v2

    .line 231
    .local v2, "e":Ljava/io/IOException;
    :try_start_5d
    throw v2
    :try_end_5e
    .catchall {:try_start_5d .. :try_end_5e} :catchall_5e

    .line 234
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_5e
    move-exception v6

    invoke-virtual {v4}, Ljava/io/DataOutputStream;->close()V

    throw v6
.end method
