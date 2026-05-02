.class public Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;
.super Ljava/lang/Object;
.source "ArArchiveEntry.java"

# interfaces
.implements Lorg/apache/commons/compress/archivers/ArchiveEntry;


# static fields
.field private static final DEFAULT_MODE:I = 0x81a4

.field public static final HEADER:Ljava/lang/String; = "!<arch>\n"

.field public static final TRAILER:Ljava/lang/String; = "`\n"


# instance fields
.field private final groupId:I

.field private final lastModified:J

.field private final length:J

.field private final mode:I

.field private final name:Ljava/lang/String;

.field private final userId:I


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 12
    .param p1, "inputFile"    # Ljava/io/File;
    .param p2, "entryName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 116
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_1d

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v2

    :goto_b
    const v6, 0x81a4

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    const-wide/16 v7, 0x3e8

    div-long v7, v0, v7

    move-object v0, p0

    move-object v1, p2

    move v5, v4

    invoke-direct/range {v0 .. v8}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;-><init>(Ljava/lang/String;JIIIJ)V

    .line 118
    return-void

    .line 116
    :cond_1d
    const-wide/16 v2, 0x0

    goto :goto_b
.end method

.method public constructor <init>(Ljava/lang/String;J)V
    .registers 13
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "length"    # J

    .prologue
    const/4 v4, 0x0

    .line 85
    const v6, 0x81a4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long v7, v0, v2

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move v5, v4

    invoke-direct/range {v0 .. v8}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;-><init>(Ljava/lang/String;JIIIJ)V

    .line 87
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JIIIJ)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "length"    # J
    .param p4, "userId"    # I
    .param p5, "groupId"    # I
    .param p6, "mode"    # I
    .param p7, "lastModified"    # J

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 101
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->name:Ljava/lang/String;

    .line 102
    iput-wide p2, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->length:J

    .line 103
    iput p4, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->userId:I

    .line 104
    iput p5, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->groupId:I

    .line 105
    iput p6, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->mode:I

    .line 106
    iput-wide p7, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->lastModified:J

    .line 107
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 170
    if-ne p0, p1, :cond_5

    .line 184
    :cond_4
    :goto_4
    return v1

    .line 173
    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_13

    :cond_11
    move v1, v2

    .line 174
    goto :goto_4

    :cond_13
    move-object v0, p1

    .line 176
    check-cast v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    .line 177
    .local v0, "other":Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->name:Ljava/lang/String;

    if-nez v3, :cond_20

    .line 178
    iget-object v3, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->name:Ljava/lang/String;

    if-eqz v3, :cond_4

    move v1, v2

    .line 179
    goto :goto_4

    .line 181
    :cond_20
    iget-object v3, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->name:Ljava/lang/String;

    iget-object v4, v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 182
    goto :goto_4
.end method

.method public getGroupId()I
    .registers 2

    .prologue
    .line 133
    iget v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->groupId:I

    return v0
.end method

.method public getLastModified()J
    .registers 3

    .prologue
    .line 145
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->lastModified:J

    return-wide v0
.end method

.method public getLastModifiedDate()Ljava/util/Date;
    .registers 6

    .prologue
    .line 149
    new-instance v0, Ljava/util/Date;

    const-wide/16 v1, 0x3e8

    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getLastModified()J

    move-result-wide v3

    mul-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0
.end method

.method public getLength()J
    .registers 3

    .prologue
    .line 153
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->length:J

    return-wide v0
.end method

.method public getMode()I
    .registers 2

    .prologue
    .line 137
    iget v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->mode:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .registers 3

    .prologue
    .line 121
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public getUserId()I
    .registers 2

    .prologue
    .line 129
    iget v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->userId:I

    return v0
.end method

.method public hashCode()I
    .registers 4

    .prologue
    .line 162
    const/16 v0, 0x1f

    .line 163
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 164
    .local v1, "result":I
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->name:Ljava/lang/String;

    if-nez v2, :cond_b

    const/4 v2, 0x0

    :goto_8
    add-int/lit8 v1, v2, 0x1f

    .line 165
    return v1

    .line 164
    :cond_b
    iget-object v2, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_8
.end method

.method public isDirectory()Z
    .registers 2

    .prologue
    .line 157
    const/4 v0, 0x0

    return v0
.end method
