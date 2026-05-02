.class public Lcom/koushikdutta/async/util/FileCache;
.super Ljava/lang/Object;
.source "FileCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/koushikdutta/async/util/FileCache$InternalCache;,
        Lcom/koushikdutta/async/util/FileCache$Snapshot;,
        Lcom/koushikdutta/async/util/FileCache$CacheEntry;
    }
.end annotation


# static fields
.field private static hashAlgorithm:Ljava/lang/String;

.field static messageDigest:Ljava/security/MessageDigest;


# instance fields
.field blockSize:J

.field cache:Lcom/koushikdutta/async/util/FileCache$InternalCache;

.field dateCompare:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field directory:Ljava/io/File;

.field loadAsync:Z

.field loading:Z

.field random:Ljava/util/Random;

.field size:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 46
    const-string v1, "MD5"

    sput-object v1, Lcom/koushikdutta/async/util/FileCache;->hashAlgorithm:Ljava/lang/String;

    .line 68
    :try_start_4
    sget-object v1, Lcom/koushikdutta/async/util/FileCache;->hashAlgorithm:Ljava/lang/String;

    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    sput-object v1, Lcom/koushikdutta/async/util/FileCache;->messageDigest:Ljava/security/MessageDigest;
    :try_end_c
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_c} :catch_17

    .line 75
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    :cond_c
    :try_start_c
    sget-object v1, Lcom/koushikdutta/async/util/FileCache;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v1}, Ljava/security/MessageDigest;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/security/MessageDigest;

    sput-object v1, Lcom/koushikdutta/async/util/FileCache;->messageDigest:Ljava/security/MessageDigest;
    :try_end_16
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_c .. :try_end_16} :catch_28

    .line 79
    :goto_16
    return-void

    .line 69
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_17
    move-exception v0

    .line 70
    .restart local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    invoke-static {}, Lcom/koushikdutta/async/util/FileCache;->findAlternativeMessageDigest()Ljava/security/MessageDigest;

    move-result-object v1

    sput-object v1, Lcom/koushikdutta/async/util/FileCache;->messageDigest:Ljava/security/MessageDigest;

    .line 71
    sget-object v1, Lcom/koushikdutta/async/util/FileCache;->messageDigest:Ljava/security/MessageDigest;

    if-nez v1, :cond_c

    .line 72
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 77
    :catch_28
    move-exception v1

    goto :goto_16
.end method

.method public constructor <init>(Ljava/io/File;JZ)V
    .registers 7
    .param p1, "directory"    # Ljava/io/File;
    .param p2, "size"    # J
    .param p4, "loadAsync"    # Z

    .prologue
    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/koushikdutta/async/util/FileCache;->random:Ljava/util/Random;

    .line 198
    const-wide/16 v0, 0x1000

    iput-wide v0, p0, Lcom/koushikdutta/async/util/FileCache;->blockSize:J

    .line 228
    new-instance v0, Lcom/koushikdutta/async/util/FileCache$1;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/util/FileCache$1;-><init>(Lcom/koushikdutta/async/util/FileCache;)V

    iput-object v0, p0, Lcom/koushikdutta/async/util/FileCache;->dateCompare:Ljava/util/Comparator;

    .line 279
    iput-object p1, p0, Lcom/koushikdutta/async/util/FileCache;->directory:Ljava/io/File;

    .line 280
    iput-wide p2, p0, Lcom/koushikdutta/async/util/FileCache;->size:J

    .line 281
    iput-boolean p4, p0, Lcom/koushikdutta/async/util/FileCache;->loadAsync:Z

    .line 282
    new-instance v0, Lcom/koushikdutta/async/util/FileCache$InternalCache;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/util/FileCache$InternalCache;-><init>(Lcom/koushikdutta/async/util/FileCache;)V

    iput-object v0, p0, Lcom/koushikdutta/async/util/FileCache;->cache:Lcom/koushikdutta/async/util/FileCache$InternalCache;

    .line 284
    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    .line 285
    invoke-direct {p0}, Lcom/koushikdutta/async/util/FileCache;->doLoad()V

    .line 286
    return-void
.end method

.method private doLoad()V
    .registers 2

    .prologue
    .line 265
    iget-boolean v0, p0, Lcom/koushikdutta/async/util/FileCache;->loadAsync:Z

    if-eqz v0, :cond_d

    .line 266
    new-instance v0, Lcom/koushikdutta/async/util/FileCache$2;

    invoke-direct {v0, p0}, Lcom/koushikdutta/async/util/FileCache$2;-><init>(Lcom/koushikdutta/async/util/FileCache;)V

    invoke-virtual {v0}, Lcom/koushikdutta/async/util/FileCache$2;->start()V

    .line 276
    :goto_c
    return-void

    .line 274
    :cond_d
    invoke-virtual {p0}, Lcom/koushikdutta/async/util/FileCache;->load()V

    goto :goto_c
.end method

.method private static findAlternativeMessageDigest()Ljava/security/MessageDigest;
    .registers 9

    .prologue
    .line 49
    const-string v7, "MD5"

    sget-object v8, Lcom/koushikdutta/async/util/FileCache;->hashAlgorithm:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3c

    .line 50
    invoke-static {}, Ljava/security/Security;->getProviders()[Ljava/security/Provider;

    move-result-object v0

    .local v0, "arr$":[Ljava/security/Provider;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    move v2, v1

    .end local v1    # "i$":I
    .local v2, "i$":I
    :goto_11
    if-ge v2, v3, :cond_3c

    aget-object v5, v0, v2

    .line 51
    .local v5, "provider":Ljava/security/Provider;
    invoke-virtual {v5}, Ljava/security/Provider;->getServices()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .end local v2    # "i$":I
    .local v1, "i$":Ljava/util/Iterator;
    :cond_1d
    :goto_1d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_38

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/security/Provider$Service;

    .line 52
    .local v6, "service":Ljava/security/Provider$Service;
    invoke-virtual {v6}, Ljava/security/Provider$Service;->getAlgorithm()Ljava/lang/String;

    move-result-object v7

    sput-object v7, Lcom/koushikdutta/async/util/FileCache;->hashAlgorithm:Ljava/lang/String;

    .line 54
    :try_start_2f
    sget-object v7, Lcom/koushikdutta/async/util/FileCache;->hashAlgorithm:Ljava/lang/String;

    invoke-static {v7}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;
    :try_end_34
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2f .. :try_end_34} :catch_3e

    move-result-object v4

    .line 55
    .local v4, "messageDigest":Ljava/security/MessageDigest;
    if-eqz v4, :cond_1d

    .line 62
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v4    # "messageDigest":Ljava/security/MessageDigest;
    .end local v5    # "provider":Ljava/security/Provider;
    .end local v6    # "service":Ljava/security/Provider$Service;
    :goto_37
    return-object v4

    .line 50
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v5    # "provider":Ljava/security/Provider;
    :cond_38
    add-int/lit8 v1, v2, 0x1

    .local v1, "i$":I
    move v2, v1

    .end local v1    # "i$":I
    .restart local v2    # "i$":I
    goto :goto_11

    .line 62
    .end local v5    # "provider":Ljava/security/Provider;
    :cond_3c
    const/4 v4, 0x0

    goto :goto_37

    .line 57
    .end local v2    # "i$":I
    .local v1, "i$":Ljava/util/Iterator;
    .restart local v5    # "provider":Ljava/security/Provider;
    .restart local v6    # "service":Ljava/security/Provider$Service;
    :catch_3e
    move-exception v7

    goto :goto_1d
.end method

.method public static varargs removeFiles([Ljava/io/File;)V
    .registers 5
    .param p0, "files"    # [Ljava/io/File;

    .prologue
    .line 107
    if-nez p0, :cond_3

    .line 112
    :cond_2
    return-void

    .line 109
    :cond_3
    move-object v0, p0

    .local v0, "arr$":[Ljava/io/File;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_6
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .line 110
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 109
    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method public static varargs declared-synchronized toKeyString([Ljava/lang/Object;)Ljava/lang/String;
    .registers 9
    .param p0, "parts"    # [Ljava/lang/Object;

    .prologue
    .line 82
    const-class v6, Lcom/koushikdutta/async/util/FileCache;

    monitor-enter v6

    :try_start_3
    sget-object v5, Lcom/koushikdutta/async/util/FileCache;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v5}, Ljava/security/MessageDigest;->reset()V

    .line 83
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_b
    if-ge v1, v2, :cond_1f

    aget-object v4, v0, v1

    .line 84
    .local v4, "part":Ljava/lang/Object;
    sget-object v5, Lcom/koushikdutta/async/util/FileCache;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/security/MessageDigest;->update([B)V

    .line 83
    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    .line 86
    .end local v4    # "part":Ljava/lang/Object;
    :cond_1f
    sget-object v5, Lcom/koushikdutta/async/util/FileCache;->messageDigest:Ljava/security/MessageDigest;

    invoke-virtual {v5}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    .line 87
    .local v3, "md5bytes":[B
    new-instance v5, Ljava/math/BigInteger;

    const/4 v7, 0x1

    invoke-direct {v5, v7, v3}, Ljava/math/BigInteger;-><init>(I[B)V

    const/16 v7, 0x10

    invoke-virtual {v5, v7}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;
    :try_end_30
    .catchall {:try_start_3 .. :try_end_30} :catchall_33

    move-result-object v5

    monitor-exit v6

    return-object v5

    .line 82
    .end local v0    # "arr$":[Ljava/lang/Object;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "md5bytes":[B
    :catchall_33
    move-exception v5

    monitor-exit v6

    throw v5
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 293
    iget-object v0, p0, Lcom/koushikdutta/async/util/FileCache;->directory:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/koushikdutta/async/util/FileCache;->removeFiles([Ljava/io/File;)V

    .line 294
    iget-object v0, p0, Lcom/koushikdutta/async/util/FileCache;->cache:Lcom/koushikdutta/async/util/FileCache$InternalCache;

    invoke-virtual {v0}, Lcom/koushikdutta/async/util/FileCache$InternalCache;->evictAll()V

    .line 295
    return-void
.end method

.method public varargs commitTempFiles(Ljava/lang/String;[Ljava/io/File;)V
    .registers 9
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "tempFiles"    # [Ljava/io/File;

    .prologue
    .line 168
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/util/FileCache;->removePartFiles(Ljava/lang/String;)V

    .line 171
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    array-length v3, p2

    if-ge v0, v3, :cond_19

    .line 172
    aget-object v2, p2, v0

    .line 173
    .local v2, "tmp":Ljava/io/File;
    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/util/FileCache;->getPartFile(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v1

    .line 174
    .local v1, "partFile":Ljava/io/File;
    invoke-virtual {v2, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-nez v3, :cond_1a

    .line 176
    invoke-static {p2}, Lcom/koushikdutta/async/util/FileCache;->removeFiles([Ljava/io/File;)V

    .line 177
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/util/FileCache;->remove(Ljava/lang/String;)V

    .line 183
    .end local v1    # "partFile":Ljava/io/File;
    .end local v2    # "tmp":Ljava/io/File;
    :cond_19
    return-void

    .line 180
    .restart local v1    # "partFile":Ljava/io/File;
    .restart local v2    # "tmp":Ljava/io/File;
    :cond_1a
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/koushikdutta/async/util/FileCache;->remove(Ljava/lang/String;)V

    .line 181
    iget-object v3, p0, Lcom/koushikdutta/async/util/FileCache;->cache:Lcom/koushikdutta/async/util/FileCache$InternalCache;

    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/util/FileCache;->getPartName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/koushikdutta/async/util/FileCache$CacheEntry;

    invoke-direct {v5, p0, v1}, Lcom/koushikdutta/async/util/FileCache$CacheEntry;-><init>(Lcom/koushikdutta/async/util/FileCache;Ljava/io/File;)V

    invoke-virtual {v3, v4, v5}, Lcom/koushikdutta/async/util/FileCache$InternalCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    add-int/lit8 v0, v0, 0x1

    goto :goto_4
.end method

.method public exists(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 127
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/util/FileCache;->getPartFile(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public exists(Ljava/lang/String;I)Z
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "part"    # I

    .prologue
    .line 123
    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/async/util/FileCache;->getPartFile(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/String;)Ljava/io/FileInputStream;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    new-instance v0, Ljava/io/FileInputStream;

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1}, Lcom/koushikdutta/async/util/FileCache;->getPartFile(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/koushikdutta/async/util/FileCache;->touch(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0
.end method

.method public get(Ljava/lang/String;I)[Ljava/io/FileInputStream;
    .registers 12
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "count"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 145
    new-array v6, p2, [Ljava/io/FileInputStream;

    .line 147
    .local v6, "ret":[Ljava/io/FileInputStream;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_3
    if-ge v3, p2, :cond_2f

    .line 148
    :try_start_5
    new-instance v7, Ljava/io/FileInputStream;

    invoke-virtual {p0, p1, v3}, Lcom/koushikdutta/async/util/FileCache;->getPartFile(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/koushikdutta/async/util/FileCache;->touch(Ljava/io/File;)Ljava/io/File;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    aput-object v7, v6, v3
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_14} :catch_17

    .line 147
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 151
    :catch_17
    move-exception v1

    .line 153
    .local v1, "e":Ljava/io/IOException;
    move-object v0, v6

    .local v0, "arr$":[Ljava/io/FileInputStream;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1b
    if-ge v4, v5, :cond_2b

    aget-object v2, v0, v4

    .line 154
    .local v2, "fin":Ljava/io/FileInputStream;
    const/4 v7, 0x1

    new-array v7, v7, [Ljava/io/Closeable;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    invoke-static {v7}, Lcom/koushikdutta/async/util/StreamUtility;->closeQuietly([Ljava/io/Closeable;)V

    .line 153
    add-int/lit8 v4, v4, 0x1

    goto :goto_1b

    .line 156
    .end local v2    # "fin":Ljava/io/FileInputStream;
    :cond_2b
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/util/FileCache;->remove(Ljava/lang/String;)V

    .line 157
    throw v1

    .line 160
    .end local v0    # "arr$":[Ljava/io/FileInputStream;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :cond_2f
    return-object v6
.end method

.method public getFile(Ljava/lang/String;)Ljava/io/File;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 141
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/util/FileCache;->getPartFile(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/koushikdutta/async/util/FileCache;->touch(Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method getPartFile(Ljava/lang/String;I)Ljava/io/File;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "part"    # I

    .prologue
    .line 195
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/koushikdutta/async/util/FileCache;->directory:Ljava/io/File;

    invoke-virtual {p0, p1, p2}, Lcom/koushikdutta/async/util/FileCache;->getPartName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method getPartName(Ljava/lang/String;I)Ljava/lang/String;
    .registers 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "part"    # I

    .prologue
    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTempFile()Ljava/io/File;
    .registers 6

    .prologue
    .line 94
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/koushikdutta/async/util/FileCache;->directory:Ljava/io/File;

    new-instance v2, Ljava/math/BigInteger;

    const/16 v3, 0x80

    iget-object v4, p0, Lcom/koushikdutta/async/util/FileCache;->random:Ljava/util/Random;

    invoke-direct {v2, v3, v4}, Ljava/math/BigInteger;-><init>(ILjava/util/Random;)V

    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 95
    return-object v0
.end method

.method public getTempFiles(I)[Ljava/io/File;
    .registers 5
    .param p1, "count"    # I

    .prologue
    .line 99
    new-array v1, p1, [Ljava/io/File;

    .line 100
    .local v1, "ret":[Ljava/io/File;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    if-ge v0, p1, :cond_e

    .line 101
    invoke-virtual {p0}, Lcom/koushikdutta/async/util/FileCache;->getTempFile()Ljava/io/File;

    move-result-object v2

    aput-object v2, v1, v0

    .line 100
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 103
    :cond_e
    return-object v1
.end method

.method public keySet()Ljava/util/Set;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 298
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 299
    .local v7, "ret":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    iget-object v8, p0, Lcom/koushikdutta/async/util/FileCache;->directory:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 300
    .local v2, "files":[Ljava/io/File;
    if-nez v2, :cond_e

    .line 308
    :cond_d
    return-object v7

    .line 302
    :cond_e
    move-object v0, v2

    .local v0, "arr$":[Ljava/io/File;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_11
    if-ge v3, v5, :cond_d

    aget-object v1, v0, v3

    .line 303
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    .line 304
    .local v6, "name":Ljava/lang/String;
    const/16 v8, 0x2e

    invoke-virtual {v6, v8}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v4

    .line 305
    .local v4, "last":I
    const/4 v8, -0x1

    if-eq v4, v8, :cond_2a

    .line 306
    const/4 v8, 0x0

    invoke-virtual {v6, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 302
    :cond_2a
    add-int/lit8 v3, v3, 0x1

    goto :goto_11
.end method

.method load()V
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 243
    const/4 v6, 0x1

    iput-boolean v6, p0, Lcom/koushikdutta/async/util/FileCache;->loading:Z

    .line 245
    :try_start_4
    iget-object v6, p0, Lcom/koushikdutta/async/util/FileCache;->directory:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->listFiles()[Ljava/io/File;
    :try_end_9
    .catchall {:try_start_4 .. :try_end_9} :catchall_40

    move-result-object v2

    .line 246
    .local v2, "files":[Ljava/io/File;
    if-nez v2, :cond_f

    .line 260
    iput-boolean v7, p0, Lcom/koushikdutta/async/util/FileCache;->loading:Z

    .line 262
    :goto_e
    return-void

    .line 248
    :cond_f
    :try_start_f
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 249
    .local v4, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    invoke-static {v4, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 250
    iget-object v6, p0, Lcom/koushikdutta/async/util/FileCache;->dateCompare:Ljava/util/Comparator;

    invoke-static {v4, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 252
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_20
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_44

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/io/File;

    .line 253
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    .line 254
    .local v5, "name":Ljava/lang/String;
    new-instance v0, Lcom/koushikdutta/async/util/FileCache$CacheEntry;

    invoke-direct {v0, p0, v1}, Lcom/koushikdutta/async/util/FileCache$CacheEntry;-><init>(Lcom/koushikdutta/async/util/FileCache;Ljava/io/File;)V

    .line 255
    .local v0, "entry":Lcom/koushikdutta/async/util/FileCache$CacheEntry;
    iget-object v6, p0, Lcom/koushikdutta/async/util/FileCache;->cache:Lcom/koushikdutta/async/util/FileCache$InternalCache;

    invoke-virtual {v6, v5, v0}, Lcom/koushikdutta/async/util/FileCache$InternalCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    iget-object v6, p0, Lcom/koushikdutta/async/util/FileCache;->cache:Lcom/koushikdutta/async/util/FileCache$InternalCache;

    invoke-virtual {v6, v5}, Lcom/koushikdutta/async/util/FileCache$InternalCache;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3f
    .catchall {:try_start_f .. :try_end_3f} :catchall_40

    goto :goto_20

    .line 260
    .end local v0    # "entry":Lcom/koushikdutta/async/util/FileCache$CacheEntry;
    .end local v1    # "file":Ljava/io/File;
    .end local v2    # "files":[Ljava/io/File;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .end local v5    # "name":Ljava/lang/String;
    :catchall_40
    move-exception v6

    iput-boolean v7, p0, Lcom/koushikdutta/async/util/FileCache;->loading:Z

    throw v6

    .restart local v2    # "files":[Ljava/io/File;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    :cond_44
    iput-boolean v7, p0, Lcom/koushikdutta/async/util/FileCache;->loading:Z

    goto :goto_e
.end method

.method public remove(Ljava/lang/String;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 115
    const/4 v0, 0x0

    .line 116
    .local v0, "i":I
    :goto_1
    iget-object v1, p0, Lcom/koushikdutta/async/util/FileCache;->cache:Lcom/koushikdutta/async/util/FileCache$InternalCache;

    invoke-virtual {p0, p1, v0}, Lcom/koushikdutta/async/util/FileCache;->getPartName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/koushikdutta/async/util/FileCache$InternalCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_10

    .line 117
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 119
    :cond_10
    invoke-virtual {p0, p1}, Lcom/koushikdutta/async/util/FileCache;->removePartFiles(Ljava/lang/String;)V

    .line 120
    return-void
.end method

.method removePartFiles(Ljava/lang/String;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 186
    const/4 v1, 0x0

    .line 188
    .local v1, "i":I
    :goto_1
    invoke-virtual {p0, p1, v1}, Lcom/koushikdutta/async/util/FileCache;->getPartFile(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 189
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 190
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 192
    :cond_11
    return-void
.end method

.method public setBlockSize(J)V
    .registers 3
    .param p1, "blockSize"    # J

    .prologue
    .line 200
    iput-wide p1, p0, Lcom/koushikdutta/async/util/FileCache;->blockSize:J

    .line 201
    return-void
.end method

.method public setMaxSize(J)V
    .registers 4
    .param p1, "maxSize"    # J

    .prologue
    .line 312
    iget-object v0, p0, Lcom/koushikdutta/async/util/FileCache;->cache:Lcom/koushikdutta/async/util/FileCache$InternalCache;

    invoke-virtual {v0, p1, p2}, Lcom/koushikdutta/async/util/FileCache$InternalCache;->setMaxSize(J)V

    .line 313
    invoke-direct {p0}, Lcom/koushikdutta/async/util/FileCache;->doLoad()V

    .line 314
    return-void
.end method

.method public size()J
    .registers 3

    .prologue
    .line 289
    iget-object v0, p0, Lcom/koushikdutta/async/util/FileCache;->cache:Lcom/koushikdutta/async/util/FileCache$InternalCache;

    invoke-virtual {v0}, Lcom/koushikdutta/async/util/FileCache$InternalCache;->size()J

    move-result-wide v0

    return-wide v0
.end method

.method public touch(Ljava/io/File;)Ljava/io/File;
    .registers 4
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 131
    iget-object v0, p0, Lcom/koushikdutta/async/util/FileCache;->cache:Lcom/koushikdutta/async/util/FileCache$InternalCache;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/koushikdutta/async/util/FileCache$InternalCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/File;->setLastModified(J)Z

    .line 133
    return-object p1
.end method
