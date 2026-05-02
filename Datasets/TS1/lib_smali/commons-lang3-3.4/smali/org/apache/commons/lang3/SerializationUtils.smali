.class public Lorg/apache/commons/lang3/SerializationUtils;
.super Ljava/lang/Object;
.source "SerializationUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    return-void
.end method

.method public static clone(Ljava/io/Serializable;)Ljava/io/Serializable;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Serializable;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 79
    .local p0, "object":Ljava/io/Serializable;, "TT;"
    if-nez p0, :cond_4

    .line 80
    const/4 v5, 0x0

    .line 108
    :cond_3
    :goto_3
    return-object v5

    .line 82
    :cond_4
    invoke-static {p0}, Lorg/apache/commons/lang3/SerializationUtils;->serialize(Ljava/io/Serializable;)[B

    move-result-object v4

    .line 83
    .local v4, "objectData":[B
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 85
    .local v0, "bais":Ljava/io/ByteArrayInputStream;
    const/4 v2, 0x0

    .line 88
    .local v2, "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    :try_start_e
    new-instance v3, Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-direct {v3, v0, v6}, Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/ClassLoader;)V
    :try_end_1b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_e .. :try_end_1b} :catch_30
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_1b} :catch_40
    .catchall {:try_start_e .. :try_end_1b} :catchall_39

    .line 95
    .end local v2    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    .local v3, "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    :try_start_1b
    invoke-virtual {v3}, Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/io/Serializable;
    :try_end_21
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1b .. :try_end_21} :catch_58
    .catch Ljava/io/IOException; {:try_start_1b .. :try_end_21} :catch_55
    .catchall {:try_start_1b .. :try_end_21} :catchall_52

    .line 104
    .local v5, "readObject":Ljava/io/Serializable;, "TT;"
    if-eqz v3, :cond_3

    .line 105
    :try_start_23
    invoke-virtual {v3}, Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;->close()V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_26} :catch_27

    goto :goto_3

    .line 107
    :catch_27
    move-exception v1

    .line 108
    .local v1, "ex":Ljava/io/IOException;
    new-instance v6, Lorg/apache/commons/lang3/SerializationException;

    const-string v7, "IOException on closing cloned object data InputStream."

    invoke-direct {v6, v7, v1}, Lorg/apache/commons/lang3/SerializationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 98
    .end local v1    # "ex":Ljava/io/IOException;
    .end local v3    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    .end local v5    # "readObject":Ljava/io/Serializable;, "TT;"
    .restart local v2    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    :catch_30
    move-exception v1

    .line 99
    .local v1, "ex":Ljava/lang/ClassNotFoundException;
    :goto_31
    :try_start_31
    new-instance v6, Lorg/apache/commons/lang3/SerializationException;

    const-string v7, "ClassNotFoundException while reading cloned object data"

    invoke-direct {v6, v7, v1}, Lorg/apache/commons/lang3/SerializationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_39
    .catchall {:try_start_31 .. :try_end_39} :catchall_39

    .line 103
    .end local v1    # "ex":Ljava/lang/ClassNotFoundException;
    :catchall_39
    move-exception v6

    .line 104
    :goto_3a
    if-eqz v2, :cond_3f

    .line 105
    :try_start_3c
    invoke-virtual {v2}, Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;->close()V
    :try_end_3f
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_3f} :catch_49

    .line 108
    :cond_3f
    throw v6

    .line 100
    :catch_40
    move-exception v1

    .line 101
    .local v1, "ex":Ljava/io/IOException;
    :goto_41
    :try_start_41
    new-instance v6, Lorg/apache/commons/lang3/SerializationException;

    const-string v7, "IOException while reading cloned object data"

    invoke-direct {v6, v7, v1}, Lorg/apache/commons/lang3/SerializationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_49
    .catchall {:try_start_41 .. :try_end_49} :catchall_39

    .line 107
    .end local v1    # "ex":Ljava/io/IOException;
    :catch_49
    move-exception v1

    .line 108
    .restart local v1    # "ex":Ljava/io/IOException;
    new-instance v6, Lorg/apache/commons/lang3/SerializationException;

    const-string v7, "IOException on closing cloned object data InputStream."

    invoke-direct {v6, v7, v1}, Lorg/apache/commons/lang3/SerializationException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6

    .line 103
    .end local v1    # "ex":Ljava/io/IOException;
    .end local v2    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    .restart local v3    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    :catchall_52
    move-exception v6

    move-object v2, v3

    .end local v3    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    .restart local v2    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    goto :goto_3a

    .line 100
    .end local v2    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    .restart local v3    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    :catch_55
    move-exception v1

    move-object v2, v3

    .end local v3    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    .restart local v2    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    goto :goto_41

    .line 98
    .end local v2    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    .restart local v3    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    :catch_58
    move-exception v1

    move-object v2, v3

    .end local v3    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    .restart local v2    # "in":Lorg/apache/commons/lang3/SerializationUtils$ClassLoaderAwareObjectInputStream;
    goto :goto_31
.end method

.method public static deserialize(Ljava/io/InputStream;)Ljava/lang/Object;
    .registers 7
    .param p0, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/io/InputStream;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 215
    if-nez p0, :cond_a

    .line 216
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "The InputStream must not be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 218
    :cond_a
    const/4 v1, 0x0

    .line 221
    .local v1, "in":Ljava/io/ObjectInputStream;
    :try_start_b
    new-instance v2, Ljava/io/ObjectInputStream;

    invoke-direct {v2, p0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_10
    .catch Ljava/lang/ClassCastException; {:try_start_b .. :try_end_10} :catch_1a
    .catch Ljava/lang/ClassNotFoundException; {:try_start_b .. :try_end_10} :catch_28
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_2f
    .catchall {:try_start_b .. :try_end_10} :catchall_21

    .line 223
    .end local v1    # "in":Ljava/io/ObjectInputStream;
    .local v2, "in":Ljava/io/ObjectInputStream;
    :try_start_10
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_13
    .catch Ljava/lang/ClassCastException; {:try_start_10 .. :try_end_13} :catch_43
    .catch Ljava/lang/ClassNotFoundException; {:try_start_10 .. :try_end_13} :catch_40
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_13} :catch_3d
    .catchall {:try_start_10 .. :try_end_13} :catchall_3a

    move-result-object v3

    .line 234
    .local v3, "obj":Ljava/lang/Object;, "TT;"
    if-eqz v2, :cond_19

    .line 235
    :try_start_16
    invoke-virtual {v2}, Ljava/io/ObjectInputStream;->close()V
    :try_end_19
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_19} :catch_36

    .line 239
    :cond_19
    :goto_19
    return-object v3

    .line 226
    .end local v2    # "in":Ljava/io/ObjectInputStream;
    .end local v3    # "obj":Ljava/lang/Object;, "TT;"
    .restart local v1    # "in":Ljava/io/ObjectInputStream;
    :catch_1a
    move-exception v0

    .line 227
    .local v0, "ex":Ljava/lang/ClassCastException;
    :goto_1b
    :try_start_1b
    new-instance v4, Lorg/apache/commons/lang3/SerializationException;

    invoke-direct {v4, v0}, Lorg/apache/commons/lang3/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_21
    .catchall {:try_start_1b .. :try_end_21} :catchall_21

    .line 233
    .end local v0    # "ex":Ljava/lang/ClassCastException;
    :catchall_21
    move-exception v4

    .line 234
    :goto_22
    if-eqz v1, :cond_27

    .line 235
    :try_start_24
    invoke-virtual {v1}, Ljava/io/ObjectInputStream;->close()V
    :try_end_27
    .catch Ljava/io/IOException; {:try_start_24 .. :try_end_27} :catch_38

    .line 239
    :cond_27
    :goto_27
    throw v4

    .line 228
    :catch_28
    move-exception v0

    .line 229
    .local v0, "ex":Ljava/lang/ClassNotFoundException;
    :goto_29
    :try_start_29
    new-instance v4, Lorg/apache/commons/lang3/SerializationException;

    invoke-direct {v4, v0}, Lorg/apache/commons/lang3/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 230
    .end local v0    # "ex":Ljava/lang/ClassNotFoundException;
    :catch_2f
    move-exception v0

    .line 231
    .local v0, "ex":Ljava/io/IOException;
    :goto_30
    new-instance v4, Lorg/apache/commons/lang3/SerializationException;

    invoke-direct {v4, v0}, Lorg/apache/commons/lang3/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_36
    .catchall {:try_start_29 .. :try_end_36} :catchall_21

    .line 237
    .end local v0    # "ex":Ljava/io/IOException;
    .end local v1    # "in":Ljava/io/ObjectInputStream;
    .restart local v2    # "in":Ljava/io/ObjectInputStream;
    .restart local v3    # "obj":Ljava/lang/Object;, "TT;"
    :catch_36
    move-exception v4

    goto :goto_19

    .end local v2    # "in":Ljava/io/ObjectInputStream;
    .end local v3    # "obj":Ljava/lang/Object;, "TT;"
    .restart local v1    # "in":Ljava/io/ObjectInputStream;
    :catch_38
    move-exception v5

    goto :goto_27

    .line 233
    .end local v1    # "in":Ljava/io/ObjectInputStream;
    .restart local v2    # "in":Ljava/io/ObjectInputStream;
    :catchall_3a
    move-exception v4

    move-object v1, v2

    .end local v2    # "in":Ljava/io/ObjectInputStream;
    .restart local v1    # "in":Ljava/io/ObjectInputStream;
    goto :goto_22

    .line 230
    .end local v1    # "in":Ljava/io/ObjectInputStream;
    .restart local v2    # "in":Ljava/io/ObjectInputStream;
    :catch_3d
    move-exception v0

    move-object v1, v2

    .end local v2    # "in":Ljava/io/ObjectInputStream;
    .restart local v1    # "in":Ljava/io/ObjectInputStream;
    goto :goto_30

    .line 228
    .end local v1    # "in":Ljava/io/ObjectInputStream;
    .restart local v2    # "in":Ljava/io/ObjectInputStream;
    :catch_40
    move-exception v0

    move-object v1, v2

    .end local v2    # "in":Ljava/io/ObjectInputStream;
    .restart local v1    # "in":Ljava/io/ObjectInputStream;
    goto :goto_29

    .line 226
    .end local v1    # "in":Ljava/io/ObjectInputStream;
    .restart local v2    # "in":Ljava/io/ObjectInputStream;
    :catch_43
    move-exception v0

    move-object v1, v2

    .end local v2    # "in":Ljava/io/ObjectInputStream;
    .restart local v1    # "in":Ljava/io/ObjectInputStream;
    goto :goto_1b
.end method

.method public static deserialize([B)Ljava/lang/Object;
    .registers 3
    .param p0, "objectData"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([B)TT;"
        }
    .end annotation

    .prologue
    .line 264
    if-nez p0, :cond_a

    .line 265
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The byte[] must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 267
    :cond_a
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-static {v0}, Lorg/apache/commons/lang3/SerializationUtils;->deserialize(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static roundtrip(Ljava/io/Serializable;)Ljava/io/Serializable;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Ljava/io/Serializable;",
            ">(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 125
    .local p0, "msg":Ljava/io/Serializable;, "TT;"
    invoke-static {p0}, Lorg/apache/commons/lang3/SerializationUtils;->serialize(Ljava/io/Serializable;)[B

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/lang3/SerializationUtils;->deserialize([B)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/Serializable;

    return-object v0
.end method

.method public static serialize(Ljava/io/Serializable;Ljava/io/OutputStream;)V
    .registers 7
    .param p0, "obj"    # Ljava/io/Serializable;
    .param p1, "outputStream"    # Ljava/io/OutputStream;

    .prologue
    .line 146
    if-nez p1, :cond_a

    .line 147
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "The OutputStream must not be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 149
    :cond_a
    const/4 v1, 0x0

    .line 152
    .local v1, "out":Ljava/io/ObjectOutputStream;
    :try_start_b
    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-direct {v2, p1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_10} :catch_19
    .catchall {:try_start_b .. :try_end_10} :catchall_20

    .line 153
    .end local v1    # "out":Ljava/io/ObjectOutputStream;
    .local v2, "out":Ljava/io/ObjectOutputStream;
    :try_start_10
    invoke-virtual {v2, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_13} :catch_2e
    .catchall {:try_start_10 .. :try_end_13} :catchall_2b

    .line 159
    if-eqz v2, :cond_18

    .line 160
    :try_start_15
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_18} :catch_27

    .line 166
    :cond_18
    :goto_18
    return-void

    .line 155
    .end local v2    # "out":Ljava/io/ObjectOutputStream;
    .restart local v1    # "out":Ljava/io/ObjectOutputStream;
    :catch_19
    move-exception v0

    .line 156
    .local v0, "ex":Ljava/io/IOException;
    :goto_1a
    :try_start_1a
    new-instance v3, Lorg/apache/commons/lang3/SerializationException;

    invoke-direct {v3, v0}, Lorg/apache/commons/lang3/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_20
    .catchall {:try_start_1a .. :try_end_20} :catchall_20

    .line 158
    .end local v0    # "ex":Ljava/io/IOException;
    :catchall_20
    move-exception v3

    .line 159
    :goto_21
    if-eqz v1, :cond_26

    .line 160
    :try_start_23
    invoke-virtual {v1}, Ljava/io/ObjectOutputStream;->close()V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_23 .. :try_end_26} :catch_29

    .line 164
    :cond_26
    :goto_26
    throw v3

    .line 162
    .end local v1    # "out":Ljava/io/ObjectOutputStream;
    .restart local v2    # "out":Ljava/io/ObjectOutputStream;
    :catch_27
    move-exception v3

    goto :goto_18

    .end local v2    # "out":Ljava/io/ObjectOutputStream;
    .restart local v1    # "out":Ljava/io/ObjectOutputStream;
    :catch_29
    move-exception v4

    goto :goto_26

    .line 158
    .end local v1    # "out":Ljava/io/ObjectOutputStream;
    .restart local v2    # "out":Ljava/io/ObjectOutputStream;
    :catchall_2b
    move-exception v3

    move-object v1, v2

    .end local v2    # "out":Ljava/io/ObjectOutputStream;
    .restart local v1    # "out":Ljava/io/ObjectOutputStream;
    goto :goto_21

    .line 155
    .end local v1    # "out":Ljava/io/ObjectOutputStream;
    .restart local v2    # "out":Ljava/io/ObjectOutputStream;
    :catch_2e
    move-exception v0

    move-object v1, v2

    .end local v2    # "out":Ljava/io/ObjectOutputStream;
    .restart local v1    # "out":Ljava/io/ObjectOutputStream;
    goto :goto_1a
.end method

.method public static serialize(Ljava/io/Serializable;)[B
    .registers 3
    .param p0, "obj"    # Ljava/io/Serializable;

    .prologue
    .line 177
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v1, 0x200

    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 178
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    invoke-static {p0, v0}, Lorg/apache/commons/lang3/SerializationUtils;->serialize(Ljava/io/Serializable;Ljava/io/OutputStream;)V

    .line 179
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method
