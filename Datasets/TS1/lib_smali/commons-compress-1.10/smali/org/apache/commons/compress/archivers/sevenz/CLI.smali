.class public Lorg/apache/commons/compress/archivers/sevenz/CLI;
.super Ljava/lang/Object;
.source "CLI.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/compress/archivers/sevenz/CLI$1;,
        Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;
    }
.end annotation


# static fields
.field private static final BUF:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 26
    const/16 v0, 0x2000

    new-array v0, v0, [B

    sput-object v0, Lorg/apache/commons/compress/archivers/sevenz/CLI;->BUF:[B

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method static synthetic access$100()[B
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lorg/apache/commons/compress/archivers/sevenz/CLI;->BUF:[B

    return-object v0
.end method

.method private static grabMode([Ljava/lang/String;)Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;
    .registers 3
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 146
    array-length v0, p0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_7

    .line 147
    sget-object v0, Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;->LIST:Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;

    .line 149
    :goto_6
    return-object v0

    :cond_7
    const-class v0, Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;

    const/4 v1, 0x1

    aget-object v1, p0, v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;

    goto :goto_6
.end method

.method public static main([Ljava/lang/String;)V
    .registers 9
    .param p0, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 120
    array-length v4, p0

    if-nez v4, :cond_8

    .line 121
    invoke-static {}, Lorg/apache/commons/compress/archivers/sevenz/CLI;->usage()V

    .line 139
    :goto_7
    return-void

    .line 124
    :cond_8
    invoke-static {p0}, Lorg/apache/commons/compress/archivers/sevenz/CLI;->grabMode([Ljava/lang/String;)Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;

    move-result-object v3

    .line 125
    .local v3, "mode":Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, p0, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 126
    new-instance v2, Ljava/io/File;

    aget-object v4, p0, v7

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 127
    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v4

    if-nez v4, :cond_53

    .line 128
    sget-object v4, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " doesn\'t exist or is a directory"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 130
    :cond_53
    new-instance v1, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;

    invoke-direct {v1, v2}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;-><init>(Ljava/io/File;)V

    .line 133
    .local v1, "archive":Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;
    :goto_58
    :try_start_58
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->getNextEntry()Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;

    move-result-object v0

    .local v0, "ae":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    if-eqz v0, :cond_67

    .line 134
    invoke-virtual {v3, v1, v0}, Lorg/apache/commons/compress/archivers/sevenz/CLI$Mode;->takeAction(Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;)V
    :try_end_61
    .catchall {:try_start_58 .. :try_end_61} :catchall_62

    goto :goto_58

    .line 137
    .end local v0    # "ae":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :catchall_62
    move-exception v4

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->close()V

    throw v4

    .restart local v0    # "ae":Lorg/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry;
    :cond_67
    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/sevenz/SevenZFile;->close()V

    goto :goto_7
.end method

.method private static usage()V
    .registers 2

    .prologue
    .line 142
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Parameters: archive-name [list|extract]"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 143
    return-void
.end method
