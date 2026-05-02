.class public Ljavassist/bytecode/AnnotationsAttribute;
.super Ljavassist/bytecode/AttributeInfo;
.source "AnnotationsAttribute.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ljavassist/bytecode/AnnotationsAttribute$Parser;,
        Ljavassist/bytecode/AnnotationsAttribute$Copier;,
        Ljavassist/bytecode/AnnotationsAttribute$Renamer;,
        Ljavassist/bytecode/AnnotationsAttribute$Walker;
    }
.end annotation


# static fields
.field public static final invisibleTag:Ljava/lang/String; = "RuntimeInvisibleAnnotations"

.field public static final visibleTag:Ljava/lang/String; = "RuntimeVisibleAnnotations"


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
    .line 150
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;ILjava/io/DataInputStream;)V

    .line 151
    return-void
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "attrname"    # Ljava/lang/String;

    .prologue
    .line 141
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    invoke-direct {p0, p1, p2, v0}, Ljavassist/bytecode/AnnotationsAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 142
    return-void

    .line 141
    :array_a
    .array-data 1
        0x0t
        0x0t
    .end array-data
.end method

.method public constructor <init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V
    .registers 4
    .param p1, "cp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "attrname"    # Ljava/lang/String;
    .param p3, "info"    # [B

    .prologue
    .line 126
    invoke-direct {p0, p1, p2, p3}, Ljavassist/bytecode/AttributeInfo;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V

    .line 127
    return-void
.end method


# virtual methods
.method public addAnnotation(Ljavassist/bytecode/annotation/Annotation;)V
    .registers 8
    .param p1, "annotation"    # Ljavassist/bytecode/annotation/Annotation;

    .prologue
    const/4 v5, 0x0

    .line 200
    invoke-virtual {p1}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v3

    .line 201
    .local v3, "type":Ljava/lang/String;
    invoke-virtual {p0}, Ljavassist/bytecode/AnnotationsAttribute;->getAnnotations()[Ljavassist/bytecode/annotation/Annotation;

    move-result-object v0

    .line 202
    .local v0, "annotations":[Ljavassist/bytecode/annotation/Annotation;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_a
    array-length v4, v0

    if-ge v1, v4, :cond_22

    .line 203
    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1f

    .line 204
    aput-object p1, v0, v1

    .line 205
    invoke-virtual {p0, v0}, Ljavassist/bytecode/AnnotationsAttribute;->setAnnotations([Ljavassist/bytecode/annotation/Annotation;)V

    .line 214
    :goto_1e
    return-void

    .line 202
    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    .line 210
    :cond_22
    array-length v4, v0

    add-int/lit8 v4, v4, 0x1

    new-array v2, v4, [Ljavassist/bytecode/annotation/Annotation;

    .line 211
    .local v2, "newlist":[Ljavassist/bytecode/annotation/Annotation;
    array-length v4, v0

    invoke-static {v0, v5, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 212
    array-length v4, v0

    aput-object p1, v2, v4

    .line 213
    invoke-virtual {p0, v2}, Ljavassist/bytecode/AnnotationsAttribute;->setAnnotations([Ljavassist/bytecode/annotation/Annotation;)V

    goto :goto_1e
.end method

.method public copy(Ljavassist/bytecode/ConstPool;Ljava/util/Map;)Ljavassist/bytecode/AttributeInfo;
    .registers 8
    .param p1, "newCp"    # Ljavassist/bytecode/ConstPool;
    .param p2, "classnames"    # Ljava/util/Map;

    .prologue
    .line 164
    new-instance v0, Ljavassist/bytecode/AnnotationsAttribute$Copier;

    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute;->info:[B

    iget-object v3, p0, Ljavassist/bytecode/AnnotationsAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v0, v2, v3, p1, p2}, Ljavassist/bytecode/AnnotationsAttribute$Copier;-><init>([BLjavassist/bytecode/ConstPool;Ljavassist/bytecode/ConstPool;Ljava/util/Map;)V

    .line 166
    .local v0, "copier":Ljavassist/bytecode/AnnotationsAttribute$Copier;
    :try_start_9
    invoke-virtual {v0}, Ljavassist/bytecode/AnnotationsAttribute$Copier;->annotationArray()V

    .line 167
    new-instance v2, Ljavassist/bytecode/AnnotationsAttribute;

    invoke-virtual {p0}, Ljavassist/bytecode/AnnotationsAttribute;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljavassist/bytecode/AnnotationsAttribute$Copier;->close()[B

    move-result-object v4

    invoke-direct {v2, p1, v3, v4}, Ljavassist/bytecode/AnnotationsAttribute;-><init>(Ljavassist/bytecode/ConstPool;Ljava/lang/String;[B)V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_19} :catch_1a

    return-object v2

    .line 169
    :catch_1a
    move-exception v1

    .line 170
    .local v1, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public getAnnotation(Ljava/lang/String;)Ljavassist/bytecode/annotation/Annotation;
    .registers 5
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 184
    invoke-virtual {p0}, Ljavassist/bytecode/AnnotationsAttribute;->getAnnotations()[Ljavassist/bytecode/annotation/Annotation;

    move-result-object v0

    .line 185
    .local v0, "annotations":[Ljavassist/bytecode/annotation/Annotation;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_5
    array-length v2, v0

    if-ge v1, v2, :cond_1a

    .line 186
    aget-object v2, v0, v1

    invoke-virtual {v2}, Ljavassist/bytecode/annotation/Annotation;->getTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_17

    .line 187
    aget-object v2, v0, v1

    .line 190
    :goto_16
    return-object v2

    .line 185
    :cond_17
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 190
    :cond_1a
    const/4 v2, 0x0

    goto :goto_16
.end method

.method public getAnnotations()[Ljavassist/bytecode/annotation/Annotation;
    .registers 5

    .prologue
    .line 227
    :try_start_0
    new-instance v1, Ljavassist/bytecode/AnnotationsAttribute$Parser;

    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute;->info:[B

    iget-object v3, p0, Ljavassist/bytecode/AnnotationsAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v1, v2, v3}, Ljavassist/bytecode/AnnotationsAttribute$Parser;-><init>([BLjavassist/bytecode/ConstPool;)V

    invoke-virtual {v1}, Ljavassist/bytecode/AnnotationsAttribute$Parser;->parseAnnotations()[Ljavassist/bytecode/annotation/Annotation;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_c} :catch_e

    move-result-object v1

    return-object v1

    .line 229
    :catch_e
    move-exception v0

    .line 230
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method getRefClasses(Ljava/util/Map;)V
    .registers 2
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 289
    invoke-virtual {p0, p1}, Ljavassist/bytecode/AnnotationsAttribute;->renameClass(Ljava/util/Map;)V

    return-void
.end method

.method public numAnnotations()I
    .registers 3

    .prologue
    .line 157
    iget-object v0, p0, Ljavassist/bytecode/AnnotationsAttribute;->info:[B

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljavassist/bytecode/ByteArray;->readU16bit([BI)I

    move-result v0

    return v0
.end method

.method renameClass(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "oldname"    # Ljava/lang/String;
    .param p2, "newname"    # Ljava/lang/String;

    .prologue
    .line 275
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 276
    .local v0, "map":Ljava/util/HashMap;
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    invoke-virtual {p0, v0}, Ljavassist/bytecode/AnnotationsAttribute;->renameClass(Ljava/util/Map;)V

    .line 278
    return-void
.end method

.method renameClass(Ljava/util/Map;)V
    .registers 6
    .param p1, "classnames"    # Ljava/util/Map;

    .prologue
    .line 281
    new-instance v1, Ljavassist/bytecode/AnnotationsAttribute$Renamer;

    iget-object v2, p0, Ljavassist/bytecode/AnnotationsAttribute;->info:[B

    invoke-virtual {p0}, Ljavassist/bytecode/AnnotationsAttribute;->getConstPool()Ljavassist/bytecode/ConstPool;

    move-result-object v3

    invoke-direct {v1, v2, v3, p1}, Ljavassist/bytecode/AnnotationsAttribute$Renamer;-><init>([BLjavassist/bytecode/ConstPool;Ljava/util/Map;)V

    .line 283
    .local v1, "renamer":Ljavassist/bytecode/AnnotationsAttribute$Renamer;
    :try_start_b
    invoke-virtual {v1}, Ljavassist/bytecode/AnnotationsAttribute$Renamer;->annotationArray()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_e} :catch_f

    .line 287
    return-void

    .line 284
    :catch_f
    move-exception v0

    .line 285
    .local v0, "e":Ljava/lang/Exception;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method public setAnnotation(Ljavassist/bytecode/annotation/Annotation;)V
    .registers 4
    .param p1, "annotation"    # Ljavassist/bytecode/annotation/Annotation;

    .prologue
    .line 267
    const/4 v0, 0x1

    new-array v0, v0, [Ljavassist/bytecode/annotation/Annotation;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Ljavassist/bytecode/AnnotationsAttribute;->setAnnotations([Ljavassist/bytecode/annotation/Annotation;)V

    .line 268
    return-void
.end method

.method public setAnnotations([Ljavassist/bytecode/annotation/Annotation;)V
    .registers 8
    .param p1, "annotations"    # [Ljavassist/bytecode/annotation/Annotation;

    .prologue
    .line 242
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 243
    .local v3, "output":Ljava/io/ByteArrayOutputStream;
    new-instance v4, Ljavassist/bytecode/annotation/AnnotationsWriter;

    iget-object v5, p0, Ljavassist/bytecode/AnnotationsAttribute;->constPool:Ljavassist/bytecode/ConstPool;

    invoke-direct {v4, v3, v5}, Ljavassist/bytecode/annotation/AnnotationsWriter;-><init>(Ljava/io/OutputStream;Ljavassist/bytecode/ConstPool;)V

    .line 245
    .local v4, "writer":Ljavassist/bytecode/annotation/AnnotationsWriter;
    :try_start_c
    array-length v2, p1

    .line 246
    .local v2, "n":I
    invoke-virtual {v4, v2}, Ljavassist/bytecode/annotation/AnnotationsWriter;->numAnnotations(I)V

    .line 247
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_11
    if-ge v1, v2, :cond_1b

    .line 248
    aget-object v5, p1, v1

    invoke-virtual {v5, v4}, Ljavassist/bytecode/annotation/Annotation;->write(Ljavassist/bytecode/annotation/AnnotationsWriter;)V

    .line 247
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 250
    :cond_1b
    invoke-virtual {v4}, Ljavassist/bytecode/annotation/AnnotationsWriter;->close()V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_1e} :catch_26

    .line 256
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    invoke-virtual {p0, v5}, Ljavassist/bytecode/AnnotationsAttribute;->set([B)V

    .line 257
    return-void

    .line 252
    .end local v1    # "i":I
    .end local v2    # "n":I
    :catch_26
    move-exception v0

    .line 253
    .local v0, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    .prologue
    .line 295
    invoke-virtual {p0}, Ljavassist/bytecode/AnnotationsAttribute;->getAnnotations()[Ljavassist/bytecode/annotation/Annotation;

    move-result-object v0

    .line 296
    .local v0, "a":[Ljavassist/bytecode/annotation/Annotation;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 297
    .local v3, "sbuf":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .line 298
    .local v1, "i":I
    :goto_a
    array-length v4, v0

    if-ge v1, v4, :cond_22

    .line 299
    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    aget-object v4, v0, v1

    invoke-virtual {v4}, Ljavassist/bytecode/annotation/Annotation;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    array-length v4, v0

    if-eq v2, v4, :cond_27

    .line 301
    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_a

    .line 304
    :cond_22
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .end local v1    # "i":I
    .restart local v2    # "i":I
    :cond_27
    move v1, v2

    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_a
.end method
