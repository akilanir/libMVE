.class public Ljavassist/SerialVersionUID;
.super Ljava/lang/Object;
.source "SerialVersionUID.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static calculateDefault(Ljavassist/CtClass;)J
    .registers 26
    .param p0, "clazz"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;
        }
    .end annotation

    .prologue
    .line 78
    :try_start_0
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 79
    .local v2, "bout":Ljava/io/ByteArrayOutputStream;
    new-instance v20, Ljava/io/DataOutputStream;

    move-object/from16 v0, v20

    invoke-direct {v0, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 80
    .local v20, "out":Ljava/io/DataOutputStream;
    invoke-virtual/range {p0 .. p0}, Ljavassist/CtClass;->getClassFile()Ljavassist/bytecode/ClassFile;

    move-result-object v3

    .line 83
    .local v3, "classFile":Ljavassist/bytecode/ClassFile;
    invoke-static/range {p0 .. p0}, Ljavassist/SerialVersionUID;->javaName(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v16

    .line 84
    .local v16, "javaName":Ljava/lang/String;
    move-object/from16 v0, v20

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 86
    invoke-virtual/range {p0 .. p0}, Ljavassist/CtClass;->getDeclaredMethods()[Ljavassist/CtMethod;

    move-result-object v18

    .line 89
    .local v18, "methods":[Ljavassist/CtMethod;
    invoke-virtual/range {p0 .. p0}, Ljavassist/CtClass;->getModifiers()I

    move-result v4

    .line 90
    .local v4, "classMods":I
    and-int/lit16 v0, v4, 0x200

    move/from16 v21, v0

    if-eqz v21, :cond_32

    .line 91
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v21, v0

    if-lez v21, :cond_4e

    .line 92
    or-int/lit16 v4, v4, 0x400

    .line 96
    :cond_32
    :goto_32
    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 99
    invoke-virtual {v3}, Ljavassist/bytecode/ClassFile;->getInterfaces()[Ljava/lang/String;

    move-result-object v15

    .line 100
    .local v15, "interfaces":[Ljava/lang/String;
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_3c
    array-length v0, v15

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v14, v0, :cond_51

    .line 101
    aget-object v21, v15, v14

    invoke-static/range {v21 .. v21}, Ljavassist/SerialVersionUID;->javaName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    aput-object v21, v15, v14

    .line 100
    add-int/lit8 v14, v14, 0x1

    goto :goto_3c

    .line 94
    .end local v14    # "i":I
    .end local v15    # "interfaces":[Ljava/lang/String;
    :cond_4e
    and-int/lit16 v4, v4, -0x401

    goto :goto_32

    .line 103
    .restart local v14    # "i":I
    .restart local v15    # "interfaces":[Ljava/lang/String;
    :cond_51
    invoke-static {v15}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    .line 104
    const/4 v14, 0x0

    :goto_55
    array-length v0, v15

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v14, v0, :cond_64

    .line 105
    aget-object v21, v15, v14

    invoke-virtual/range {v20 .. v21}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 104
    add-int/lit8 v14, v14, 0x1

    goto :goto_55

    .line 108
    :cond_64
    invoke-virtual/range {p0 .. p0}, Ljavassist/CtClass;->getDeclaredFields()[Ljavassist/CtField;

    move-result-object v11

    .line 109
    .local v11, "fields":[Ljavassist/CtField;
    new-instance v21, Ljavassist/SerialVersionUID$1;

    invoke-direct/range {v21 .. v21}, Ljavassist/SerialVersionUID$1;-><init>()V

    move-object/from16 v0, v21

    invoke-static {v11, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 117
    const/4 v14, 0x0

    :goto_73
    array-length v0, v11

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v14, v0, :cond_a8

    .line 118
    aget-object v10, v11, v14

    .line 119
    .local v10, "field":Ljavassist/CtField;
    invoke-virtual {v10}, Ljavassist/CtField;->getModifiers()I

    move-result v19

    .line 120
    .local v19, "mods":I
    and-int/lit8 v21, v19, 0x2

    if-eqz v21, :cond_8c

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0x88

    move/from16 v21, v0

    if-nez v21, :cond_a5

    .line 122
    :cond_8c
    invoke-virtual {v10}, Ljavassist/CtField;->getName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 123
    move-object/from16 v0, v20

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 124
    invoke-virtual {v10}, Ljavassist/CtField;->getFieldInfo2()Ljavassist/bytecode/FieldInfo;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljavassist/bytecode/FieldInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 117
    :cond_a5
    add-int/lit8 v14, v14, 0x1

    goto :goto_73

    .line 129
    .end local v10    # "field":Ljavassist/CtField;
    .end local v19    # "mods":I
    :cond_a8
    invoke-virtual {v3}, Ljavassist/bytecode/ClassFile;->getStaticInitializer()Ljavassist/bytecode/MethodInfo;

    move-result-object v21

    if-eqz v21, :cond_bd

    .line 130
    const-string v21, "<clinit>"

    invoke-virtual/range {v20 .. v21}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 131
    const/16 v21, 0x8

    invoke-virtual/range {v20 .. v21}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 132
    const-string v21, "()V"

    invoke-virtual/range {v20 .. v21}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 136
    :cond_bd
    invoke-virtual/range {p0 .. p0}, Ljavassist/CtClass;->getDeclaredConstructors()[Ljavassist/CtConstructor;

    move-result-object v6

    .line 137
    .local v6, "constructors":[Ljavassist/CtConstructor;
    new-instance v21, Ljavassist/SerialVersionUID$2;

    invoke-direct/range {v21 .. v21}, Ljavassist/SerialVersionUID$2;-><init>()V

    move-object/from16 v0, v21

    invoke-static {v6, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 146
    const/4 v14, 0x0

    :goto_cc
    array-length v0, v6

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v14, v0, :cond_ff

    .line 147
    aget-object v5, v6, v14

    .line 148
    .local v5, "constructor":Ljavassist/CtConstructor;
    invoke-virtual {v5}, Ljavassist/CtConstructor;->getModifiers()I

    move-result v19

    .line 149
    .restart local v19    # "mods":I
    and-int/lit8 v21, v19, 0x2

    if-nez v21, :cond_fc

    .line 150
    const-string v21, "<init>"

    invoke-virtual/range {v20 .. v21}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 151
    move-object/from16 v0, v20

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 152
    invoke-virtual {v5}, Ljavassist/CtConstructor;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x2f

    const/16 v23, 0x2e

    invoke-virtual/range {v21 .. v23}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 146
    :cond_fc
    add-int/lit8 v14, v14, 0x1

    goto :goto_cc

    .line 158
    .end local v5    # "constructor":Ljavassist/CtConstructor;
    .end local v19    # "mods":I
    :cond_ff
    new-instance v21, Ljavassist/SerialVersionUID$3;

    invoke-direct/range {v21 .. v21}, Ljavassist/SerialVersionUID$3;-><init>()V

    move-object/from16 v0, v18

    move-object/from16 v1, v21

    invoke-static {v0, v1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 171
    const/4 v14, 0x0

    :goto_10c
    move-object/from16 v0, v18

    array-length v0, v0

    move/from16 v21, v0

    move/from16 v0, v21

    if-ge v14, v0, :cond_149

    .line 172
    aget-object v17, v18, v14

    .line 173
    .local v17, "method":Ljavassist/CtMethod;
    invoke-virtual/range {v17 .. v17}, Ljavassist/CtMethod;->getModifiers()I

    move-result v21

    move/from16 v0, v21

    and-int/lit16 v0, v0, 0xd3f

    move/from16 v19, v0

    .line 178
    .restart local v19    # "mods":I
    and-int/lit8 v21, v19, 0x2

    if-nez v21, :cond_146

    .line 179
    invoke-virtual/range {v17 .. v17}, Ljavassist/CtMethod;->getName()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 180
    move-object/from16 v0, v20

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 181
    invoke-virtual/range {v17 .. v17}, Ljavassist/CtMethod;->getMethodInfo2()Ljavassist/bytecode/MethodInfo;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljavassist/bytecode/MethodInfo;->getDescriptor()Ljava/lang/String;

    move-result-object v21

    const/16 v22, 0x2f

    const/16 v23, 0x2e

    invoke-virtual/range {v21 .. v23}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 171
    :cond_146
    add-int/lit8 v14, v14, 0x1

    goto :goto_10c

    .line 187
    .end local v17    # "method":Ljavassist/CtMethod;
    .end local v19    # "mods":I
    :cond_149
    invoke-virtual/range {v20 .. v20}, Ljava/io/DataOutputStream;->flush()V

    .line 188
    const-string v21, "SHA"

    invoke-static/range {v21 .. v21}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v7

    .line 189
    .local v7, "digest":Ljava/security/MessageDigest;
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v7, v0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v8

    .line 190
    .local v8, "digested":[B
    const-wide/16 v12, 0x0

    .line 191
    .local v12, "hash":J
    array-length v0, v8

    move/from16 v21, v0

    const/16 v22, 0x8

    invoke-static/range {v21 .. v22}, Ljava/lang/Math;->min(II)I

    move-result v21

    add-int/lit8 v14, v21, -0x1

    :goto_169
    if-ltz v14, :cond_193

    .line 192
    const/16 v21, 0x8

    shl-long v21, v12, v21

    aget-byte v23, v8, v14
    :try_end_171
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_171} :catch_181
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_171} :catch_18a

    move/from16 v0, v23

    and-int/lit16 v0, v0, 0xff

    move/from16 v23, v0

    move/from16 v0, v23

    int-to-long v0, v0

    move-wide/from16 v23, v0

    or-long v12, v21, v23

    .line 191
    add-int/lit8 v14, v14, -0x1

    goto :goto_169

    .line 196
    .end local v2    # "bout":Ljava/io/ByteArrayOutputStream;
    .end local v3    # "classFile":Ljavassist/bytecode/ClassFile;
    .end local v4    # "classMods":I
    .end local v6    # "constructors":[Ljavassist/CtConstructor;
    .end local v7    # "digest":Ljava/security/MessageDigest;
    .end local v8    # "digested":[B
    .end local v11    # "fields":[Ljavassist/CtField;
    .end local v12    # "hash":J
    .end local v14    # "i":I
    .end local v15    # "interfaces":[Ljava/lang/String;
    .end local v16    # "javaName":Ljava/lang/String;
    .end local v18    # "methods":[Ljavassist/CtMethod;
    .end local v20    # "out":Ljava/io/DataOutputStream;
    :catch_181
    move-exception v9

    .line 197
    .local v9, "e":Ljava/io/IOException;
    new-instance v21, Ljavassist/CannotCompileException;

    move-object/from16 v0, v21

    invoke-direct {v0, v9}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v21

    .line 199
    .end local v9    # "e":Ljava/io/IOException;
    :catch_18a
    move-exception v9

    .line 200
    .local v9, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v21, Ljavassist/CannotCompileException;

    move-object/from16 v0, v21

    invoke-direct {v0, v9}, Ljavassist/CannotCompileException;-><init>(Ljava/lang/Throwable;)V

    throw v21

    .line 194
    .end local v9    # "e":Ljava/security/NoSuchAlgorithmException;
    .restart local v2    # "bout":Ljava/io/ByteArrayOutputStream;
    .restart local v3    # "classFile":Ljavassist/bytecode/ClassFile;
    .restart local v4    # "classMods":I
    .restart local v6    # "constructors":[Ljavassist/CtConstructor;
    .restart local v7    # "digest":Ljava/security/MessageDigest;
    .restart local v8    # "digested":[B
    .restart local v11    # "fields":[Ljavassist/CtField;
    .restart local v12    # "hash":J
    .restart local v14    # "i":I
    .restart local v15    # "interfaces":[Ljava/lang/String;
    .restart local v16    # "javaName":Ljava/lang/String;
    .restart local v18    # "methods":[Ljavassist/CtMethod;
    .restart local v20    # "out":Ljava/io/DataOutputStream;
    :cond_193
    return-wide v12
.end method

.method private static isSerializable(Ljavassist/CtClass;)Z
    .registers 3
    .param p0, "clazz"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 66
    invoke-virtual {p0}, Ljavassist/CtClass;->getClassPool()Ljavassist/ClassPool;

    move-result-object v0

    .line 67
    .local v0, "pool":Ljavassist/ClassPool;
    const-string v1, "java.io.Serializable"

    invoke-virtual {v0, v1}, Ljavassist/ClassPool;->get(Ljava/lang/String;)Ljavassist/CtClass;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljavassist/CtClass;->subtypeOf(Ljavassist/CtClass;)Z

    move-result v1

    return v1
.end method

.method private static javaName(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 209
    invoke-static {p0}, Ljavassist/bytecode/Descriptor;->toJvmName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->toJavaName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static javaName(Ljavassist/CtClass;)Ljava/lang/String;
    .registers 2
    .param p0, "clazz"    # Ljavassist/CtClass;

    .prologue
    .line 205
    invoke-static {p0}, Ljavassist/bytecode/Descriptor;->toJvmName(Ljavassist/CtClass;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljavassist/bytecode/Descriptor;->toJavaName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static setSerialVersionUID(Ljavassist/CtClass;)V
    .registers 5
    .param p0, "clazz"    # Ljavassist/CtClass;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavassist/CannotCompileException;,
            Ljavassist/NotFoundException;
        }
    .end annotation

    .prologue
    .line 43
    :try_start_0
    const-string v1, "serialVersionUID"

    invoke-virtual {p0, v1}, Ljavassist/CtClass;->getDeclaredField(Ljava/lang/String;)Ljavassist/CtField;
    :try_end_5
    .catch Ljavassist/NotFoundException; {:try_start_0 .. :try_end_5} :catch_6

    .line 58
    :cond_5
    :goto_5
    return-void

    .line 46
    :catch_6
    move-exception v1

    .line 49
    invoke-static {p0}, Ljavassist/SerialVersionUID;->isSerializable(Ljavassist/CtClass;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 53
    new-instance v0, Ljavassist/CtField;

    sget-object v1, Ljavassist/CtClass;->longType:Ljavassist/CtClass;

    const-string v2, "serialVersionUID"

    invoke-direct {v0, v1, v2, p0}, Ljavassist/CtField;-><init>(Ljavassist/CtClass;Ljava/lang/String;Ljavassist/CtClass;)V

    .line 55
    .local v0, "field":Ljavassist/CtField;
    const/16 v1, 0x1a

    invoke-virtual {v0, v1}, Ljavassist/CtField;->setModifiers(I)V

    .line 57
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Ljavassist/SerialVersionUID;->calculateDefault(Ljavassist/CtClass;)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "L"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ljavassist/CtClass;->addField(Ljavassist/CtField;Ljava/lang/String;)V

    goto :goto_5
.end method
