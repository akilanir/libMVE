.class public Lorg/apache/http/util/VersionInfo;
.super Ljava/lang/Object;
.source "VersionInfo.java"


# static fields
.field public static final PROPERTY_MODULE:Ljava/lang/String; = "info.module"

.field public static final PROPERTY_RELEASE:Ljava/lang/String; = "info.release"

.field public static final PROPERTY_TIMESTAMP:Ljava/lang/String; = "info.timestamp"

.field public static final UNAVAILABLE:Ljava/lang/String; = "UNAVAILABLE"

.field public static final VERSION_PROPERTY_FILE:Ljava/lang/String; = "version.properties"


# instance fields
.field private final infoClassloader:Ljava/lang/String;

.field private final infoModule:Ljava/lang/String;

.field private final infoPackage:Ljava/lang/String;

.field private final infoRelease:Ljava/lang/String;

.field private final infoTimestamp:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8
    .param p1, "pckg"    # Ljava/lang/String;
    .param p2, "module"    # Ljava/lang/String;
    .param p3, "release"    # Ljava/lang/String;
    .param p4, "time"    # Ljava/lang/String;
    .param p5, "clsldr"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    if-nez p1, :cond_d

    .line 92
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Package identifier must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_d
    iput-object p1, p0, Lorg/apache/http/util/VersionInfo;->infoPackage:Ljava/lang/String;

    .line 97
    if-eqz p2, :cond_20

    .end local p2    # "module":Ljava/lang/String;
    :goto_11
    iput-object p2, p0, Lorg/apache/http/util/VersionInfo;->infoModule:Ljava/lang/String;

    .line 98
    if-eqz p3, :cond_23

    .end local p3    # "release":Ljava/lang/String;
    :goto_15
    iput-object p3, p0, Lorg/apache/http/util/VersionInfo;->infoRelease:Ljava/lang/String;

    .line 99
    if-eqz p4, :cond_26

    .end local p4    # "time":Ljava/lang/String;
    :goto_19
    iput-object p4, p0, Lorg/apache/http/util/VersionInfo;->infoTimestamp:Ljava/lang/String;

    .line 100
    if-eqz p5, :cond_29

    .end local p5    # "clsldr":Ljava/lang/String;
    :goto_1d
    iput-object p5, p0, Lorg/apache/http/util/VersionInfo;->infoClassloader:Ljava/lang/String;

    .line 101
    return-void

    .line 97
    .restart local p2    # "module":Ljava/lang/String;
    .restart local p3    # "release":Ljava/lang/String;
    .restart local p4    # "time":Ljava/lang/String;
    .restart local p5    # "clsldr":Ljava/lang/String;
    :cond_20
    const-string p2, "UNAVAILABLE"

    goto :goto_11

    .line 98
    .end local p2    # "module":Ljava/lang/String;
    :cond_23
    const-string p3, "UNAVAILABLE"

    goto :goto_15

    .line 99
    .end local p3    # "release":Ljava/lang/String;
    :cond_26
    const-string p4, "UNAVAILABLE"

    goto :goto_19

    .line 100
    .end local p4    # "time":Ljava/lang/String;
    :cond_29
    const-string p5, "UNAVAILABLE"

    goto :goto_1d
.end method

.method protected static final fromMap(Ljava/lang/String;Ljava/util/Map;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;
    .registers 9
    .param p0, "pckg"    # Ljava/lang/String;
    .param p2, "clsldr"    # Ljava/lang/ClassLoader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<**>;",
            "Ljava/lang/ClassLoader;",
            ")",
            "Lorg/apache/http/util/VersionInfo;"
        }
    .end annotation

    .prologue
    .local p1, "info":Ljava/util/Map;, "Ljava/util/Map<**>;"
    const/4 v1, 0x1

    .line 277
    if-nez p0, :cond_b

    .line 278
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Package identifier must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 282
    :cond_b
    const/4 v2, 0x0

    .line 283
    .local v2, "module":Ljava/lang/String;
    const/4 v3, 0x0

    .line 284
    .local v3, "release":Ljava/lang/String;
    const/4 v4, 0x0

    .line 286
    .local v4, "timestamp":Ljava/lang/String;
    if-eqz p1, :cond_53

    .line 287
    const-string v0, "info.module"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "module":Ljava/lang/String;
    check-cast v2, Ljava/lang/String;

    .line 288
    .restart local v2    # "module":Ljava/lang/String;
    if-eqz v2, :cond_21

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, v1, :cond_21

    .line 289
    const/4 v2, 0x0

    .line 291
    :cond_21
    const-string v0, "info.release"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "release":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 292
    .restart local v3    # "release":Ljava/lang/String;
    if-eqz v3, :cond_3a

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v1, :cond_39

    const-string v0, "${pom.version}"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a

    .line 294
    :cond_39
    const/4 v3, 0x0

    .line 296
    :cond_3a
    const-string v0, "info.timestamp"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4    # "timestamp":Ljava/lang/String;
    check-cast v4, Ljava/lang/String;

    .line 297
    .restart local v4    # "timestamp":Ljava/lang/String;
    if-eqz v4, :cond_53

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v0, v1, :cond_52

    const-string v0, "${mvn.timestamp}"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_53

    .line 301
    :cond_52
    const/4 v4, 0x0

    .line 304
    :cond_53
    const/4 v5, 0x0

    .line 305
    .local v5, "clsldrstr":Ljava/lang/String;
    if-eqz p2, :cond_5a

    .line 306
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 308
    :cond_5a
    new-instance v0, Lorg/apache/http/util/VersionInfo;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/http/util/VersionInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static final loadVersionInfo(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;
    .registers 9
    .param p0, "pckg"    # Ljava/lang/String;
    .param p1, "clsldr"    # Ljava/lang/ClassLoader;

    .prologue
    .line 230
    if-nez p0, :cond_a

    .line 231
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Package identifier must not be null."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 235
    :cond_a
    if-nez p1, :cond_14

    .line 236
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object p1

    .line 238
    :cond_14
    const/4 v3, 0x0

    .line 242
    .local v3, "vip":Ljava/util/Properties;
    :try_start_15
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v5, 0x2e

    const/16 v6, 0x2f

    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "version.properties"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/ClassLoader;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_39} :catch_55

    move-result-object v0

    .line 244
    .local v0, "is":Ljava/io/InputStream;
    if-eqz v0, :cond_48

    .line 246
    :try_start_3c
    new-instance v1, Ljava/util/Properties;

    invoke-direct {v1}, Ljava/util/Properties;-><init>()V

    .line 247
    .local v1, "props":Ljava/util/Properties;
    invoke-virtual {v1, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_44
    .catchall {:try_start_3c .. :try_end_44} :catchall_50

    .line 248
    move-object v3, v1

    .line 250
    :try_start_45
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_48
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_48} :catch_55

    .line 257
    .end local v0    # "is":Ljava/io/InputStream;
    .end local v1    # "props":Ljava/util/Properties;
    :cond_48
    :goto_48
    const/4 v2, 0x0

    .line 258
    .local v2, "result":Lorg/apache/http/util/VersionInfo;
    if-eqz v3, :cond_4f

    .line 259
    invoke-static {p0, v3, p1}, Lorg/apache/http/util/VersionInfo;->fromMap(Ljava/lang/String;Ljava/util/Map;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;

    move-result-object v2

    .line 261
    :cond_4f
    return-object v2

    .line 250
    .end local v2    # "result":Lorg/apache/http/util/VersionInfo;
    .restart local v0    # "is":Ljava/io/InputStream;
    :catchall_50
    move-exception v4

    :try_start_51
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v4
    :try_end_55
    .catch Ljava/io/IOException; {:try_start_51 .. :try_end_55} :catch_55

    .line 253
    .end local v0    # "is":Ljava/io/InputStream;
    :catch_55
    move-exception v4

    goto :goto_48
.end method

.method public static final loadVersionInfo([Ljava/lang/String;Ljava/lang/ClassLoader;)[Lorg/apache/http/util/VersionInfo;
    .registers 7
    .param p0, "pckgs"    # [Ljava/lang/String;
    .param p1, "clsldr"    # Ljava/lang/ClassLoader;

    .prologue
    .line 200
    if-nez p0, :cond_a

    .line 201
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Package identifier list must not be null."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 205
    :cond_a
    new-instance v2, Ljava/util/ArrayList;

    array-length v3, p0

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 206
    .local v2, "vil":Ljava/util/List;, "Ljava/util/List<Lorg/apache/http/util/VersionInfo;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_11
    array-length v3, p0

    if-ge v0, v3, :cond_22

    .line 207
    aget-object v3, p0, v0

    invoke-static {v3, p1}, Lorg/apache/http/util/VersionInfo;->loadVersionInfo(Ljava/lang/String;Ljava/lang/ClassLoader;)Lorg/apache/http/util/VersionInfo;

    move-result-object v1

    .line 208
    .local v1, "vi":Lorg/apache/http/util/VersionInfo;
    if-eqz v1, :cond_1f

    .line 209
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 206
    :cond_1f
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 212
    .end local v1    # "vi":Lorg/apache/http/util/VersionInfo;
    :cond_22
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lorg/apache/http/util/VersionInfo;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/apache/http/util/VersionInfo;

    return-object v3
.end method


# virtual methods
.method public final getClassloader()Ljava/lang/String;
    .registers 2

    .prologue
    .line 153
    iget-object v0, p0, Lorg/apache/http/util/VersionInfo;->infoClassloader:Ljava/lang/String;

    return-object v0
.end method

.method public final getModule()Ljava/lang/String;
    .registers 2

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/http/util/VersionInfo;->infoModule:Ljava/lang/String;

    return-object v0
.end method

.method public final getPackage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 111
    iget-object v0, p0, Lorg/apache/http/util/VersionInfo;->infoPackage:Ljava/lang/String;

    return-object v0
.end method

.method public final getRelease()Ljava/lang/String;
    .registers 2

    .prologue
    .line 131
    iget-object v0, p0, Lorg/apache/http/util/VersionInfo;->infoRelease:Ljava/lang/String;

    return-object v0
.end method

.method public final getTimestamp()Ljava/lang/String;
    .registers 2

    .prologue
    .line 141
    iget-object v0, p0, Lorg/apache/http/util/VersionInfo;->infoTimestamp:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    const/16 v3, 0x3a

    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/util/VersionInfo;->infoPackage:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x14

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoModule:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoRelease:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoTimestamp:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoClassloader:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 169
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "VersionInfo("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoPackage:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoModule:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    const-string v1, "UNAVAILABLE"

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoRelease:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_53

    .line 175
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoRelease:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    :cond_53
    const-string v1, "UNAVAILABLE"

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoTimestamp:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_66

    .line 177
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoTimestamp:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    :cond_66
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 181
    const-string v1, "UNAVAILABLE"

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoClassloader:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_80

    .line 182
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/http/util/VersionInfo;->infoClassloader:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    :cond_80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
