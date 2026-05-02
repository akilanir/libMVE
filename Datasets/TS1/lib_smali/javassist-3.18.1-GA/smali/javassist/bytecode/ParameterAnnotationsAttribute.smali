.class public Ljavassist/bytecode/ParameterAnnotationsAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "ParameterAnnotationsAttribute.java"


# static fields
.field public static final invisibleTag:Ljava/lang/String; = "RuntimeInvisibleParameterAnnotations"

.field public static final visibleTag:Ljava/lang/String; = "RuntimeVisibleParameterAnnotations"


# direct methods
.method constructor <init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "n"    # I
    .param p3, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 95
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V
    .registers 5
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "attrname"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 85
    const/4 v0, 0x1

    new-array v0, v0, [B

    aput-byte v1, v0, v1

    invoke-direct {p0, p1, p2, v0}, Ljavassist/bytecode/ParameterAnnotationsAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 86
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "attrname"    # Ljava/lang/String;
    .param p3, "info"    # [B

    .prologue
    .line 70
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 71
    return-void
.end method


# virtual methods
.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 8
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 108
    new-instance v0, Ljavassist/bytecode/AnnotationsAttribute$Copier;

    iget-object v2, p0, Ljavassist/bytecode/ParameterAnnotationsAttribute;->info:[B

    iget-object v3, p0, Ljavassist/bytecode/ParameterAnnotationsAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v0, v2, v3, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Copier;-><init>([BLjavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)V

    .line 110
    .local v0, "copier":Ljavassist/bytecode/AnnotationsAttribute$Copier;
    :try_start_9
    invoke-virtual {v0}, Ljavassist/bytecode/AnnotationsAttribute$Copier;->parameters()V

    .line 111
    new-instance v2, Ljavassist/bytecode/ParameterAnnotationsAttribute;

    invoke-virtual {p0}, Ljavassist/bytecode/ParameterAnnotationsAttribute;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljavassist/bytecode/AnnotationsAttribute$Copier;->close()[B

    move-result-object v4

    invoke-direct {v2, p1, v3, v4}, Ljavassist/bytecode/ParameterAnnotationsAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_19} :catch_1a

    return-object v2

    .line 114
    :catch_1a
    move-exception v1

    .line 115
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public getAnnotations()[[Ljavassist/bytecode/annotation/Annotation;
    .registers 5

    .prologue
    .line 133
    :try_start_0
    new-instance v1, Ljavassist/bytecode/AnnotationsAttribute$Parser;

    iget-object v2, p0, Ljavassist/bytecode/ParameterAnnotationsAttribute;->info:[B

    iget-object v3, p0, Ljavassist/bytecode/ParameterAnnotationsAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v1, v2, v3}, Ljavassist/bytecode/AnnotationsAttribute$Parser;-><init>([BLjavassist/bytecode/ConstPool;)V

    invoke-virtual {v1}, Ljavassist/bytecode/AnnotationsAttribute$Parser;->parseParameters()[[Ljavassist/bytecode/annotation/Annotation;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_e

    move-result-object v1

    return-object v1

    .line 135
    :catch_e
    move-exception v0

    .line 136
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getRefClasses(Ljava/util/Map;)V
    .registers 2
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 190
    invoke-virtual {p0, p1}, Ljavassist/bytecode/ParameterAnnotationsAttribute;->renameClass(Ljava/util/Map;)V

    return-void
.end method

.method public numParameters()I
    .registers 3

    .prologue
    .line 101
    iget-object v0, p0, Ljavassist/bytecode/ParameterAnnotationsAttribute;->info:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method renameClass(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "newname"    # Ljava/lang/String;

    .prologue
    .line 176
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 177
    .local v0, "map":Ljava/util/HashMap;
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    invoke-virtual {p0, v0}, Ljavassist/bytecode/ParameterAnnotationsAttribute;->renameClass(Ljava/util/Map;)V

    .line 179
    return-void
.end method

.method renameClass(Ljava/util/Map;)V
    .registers 6
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 182
    new-instance v1, Ljavassist/bytecode/AnnotationsAttribute$Renamer;

    iget-object v2, p0, Ljavassist/bytecode/ParameterAnnotationsAttribute;->info:[B

    invoke-virtual {p0}, Ljavassist/bytecode/ParameterAnnotationsAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v3

    invoke-direct {v1, v2, v3, p1}, Ljavassist/bytecode/AnnotationsAttribute$Renamer;-><init>([BLjavassist/bytecode/ConstPool;Ljava/util/Map;)V

    .line 184
    .local v1, "renamer":Ljavassist/bytecode/AnnotationsAttribute$Renamer;
    :try_start_b
    invoke-virtual {v1}, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->parameters()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_e} :catch_f

    .line 188
    return-void

    .line 185
    :catch_f
    move-exception v0

    .line 186
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setAnnotations([[Ljavassist/bytecode/annotation/Annotation;)V
    .registers 10
    .param p1, "params"    # [[Ljavassist/bytecode/annotation/Annotation;

    .prologue
    .line 150
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 151
    .local v5, "output":Ljava/io/ByteArrayOutputStream;
    new-instance v6, Ljavassist/bytecode/annotation/AnnotationsWriter;

    iget-object v7, p0, Ljavassist/bytecode/ParameterAnnotationsAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v6, v5, v7}, Ljavassist/bytecode/annotation/AnnotationsWriter;-><init>(Ljava/io/OutputStream;Ljavassist/bytecode/ConstPool;)V

    .line 153
    .local v6, "writer":Ljavassist/bytecode/annotation/AnnotationsWriter;
    :try_start_c
    array-length v4, p1

    .line 154
    .local v4, "n":I
    invoke-virtual {v6, v4}, Ljavassist/bytecode/annotation/AnnotationsWriter;->numParameters(I)V

    .line 155
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_11
    if-ge v2, v4, :cond_28

    .line 156
    aget-object v0, p1, v2

    .line 157
    .local v0, "anno":[Ljavassist/bytecode/annotation/Annotation;
    array-length v7, v0

    invoke-virtual {v6, v7}, Ljavassist/bytecode/annotation/AnnotationsWriter;->numAnnotations(I)V

    .line 158
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1a
    array-length v7, v0

    if-ge v3, v7, :cond_25

    .line 159
    aget-object v7, v0, v3

    invoke-virtual {v7, v6}, Ljavassist/bytecode/annotation/Annotation;->write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V

    .line 158
    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    .line 155
    :cond_25
    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    .line 162
    .end local v0    # "anno":[Ljavassist/bytecode/annotation/Annotation;
    .end local v3    # "j":I
    :cond_28
    invoke-virtual {v6}, Ljavassist/bytecode/annotation/AnnotationsWriter;->close()V
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_2b} :catch_33

    .line 168
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    invoke-virtual {p0, v7}, Ljavassist/bytecode/ParameterAnnotationsAttribute;->set([B)V

    .line 169
    return-void

    .line 164
    .end local v2    # "i":I
    .end local v4    # "n":I
    :catch_33
    move-exception v1

    .line 165
    .local v1, "e":Ljava/io/IOException;
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7
.end method

.method public toString()Ljava/lang/String;
    .registers 9

    .prologue
    .line 196
    invoke-virtual {p0}, Ljavassist/bytecode/ParameterAnnotationsAttribute;->getAnnotations()[[Ljavassist/bytecode/annotation/Annotation;

    move-result-object v1

    .line 197
    .local v1, "aa":[[Ljavassist/bytecode/annotation/Annotation;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .local v6, "sbuf":Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .line 199
    .local v4, "k":I
    :goto_a
    array-length v7, v1

    if-ge v4, v7, :cond_34

    .line 200
    add-int/lit8 v5, v4, 0x1

    .end local v4    # "k":I
    .local v5, "k":I
    aget-object v0, v1, v4

    .line 201
    .local v0, "a":[Ljavassist/bytecode/annotation/Annotation;
    const/4 v2, 0x0

    .line 202
    .local v2, "i":I
    :goto_12
    array-length v7, v0

    if-ge v2, v7, :cond_2a

    .line 203
    add-int/lit8 v3, v2, 0x1

    .end local v2    # "i":I
    .local v3, "i":I
    aget-object v7, v0, v2

    invoke-virtual {v7}, Ljavassist/bytecode/annotation/Annotation;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    array-length v7, v0

    if-eq v3, v7, :cond_39

    .line 205
    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_12

    .line 208
    :cond_2a
    array-length v7, v1

    if-eq v5, v7, :cond_32

    .line 209
    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_32
    move v4, v5

    .line 210
    .end local v5    # "k":I
    .restart local v4    # "k":I
    goto :goto_a

    .line 212
    .end local v0    # "a":[Ljavassist/bytecode/annotation/Annotation;
    .end local v2    # "i":I
    :cond_34
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .end local v4    # "k":I
    .restart local v0    # "a":[Ljavassist/bytecode/annotation/Annotation;
    .restart local v3    # "i":I
    .restart local v5    # "k":I
    :cond_39
    move v2, v3

    .end local v3    # "i":I
    .restart local v2    # "i":I
    goto :goto_12
.end method
