.class public Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;
.super Lorg/apache/commons/compress/archivers/ArchiveOutputStream;
.source "ArArchiveOutputStream.java"


# static fields
.field public static final LONGFILE_BSD:I = 0x1

.field public static final LONGFILE_ERROR:I


# instance fields
.field private entryOffset:J

.field private finished:Z

.field private haveUnclosedEntry:Z

.field private longFileMode:I

.field private final out:Ljava/io/OutputStream;

.field private prevEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .registers 5
    .param p1, "pOut"    # Ljava/io/OutputStream;

    .prologue
    const/4 v2, 0x0

    .line 50
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ArchiveOutputStream;-><init>()V

    .line 42
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->entryOffset:J

    .line 44
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->haveUnclosedEntry:Z

    .line 45
    iput v2, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->longFileMode:I

    .line 48
    iput-boolean v2, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->finished:Z

    .line 51
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->out:Ljava/io/OutputStream;

    .line 52
    return-void
.end method

.method private fill(JJC)J
    .registers 11
    .param p1, "pOffset"    # J
    .param p3, "pNewOffset"    # J
    .param p5, "pFill"    # C
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    sub-long v0, p3, p1

    .line 116
    .local v0, "diff":J
    const-wide/16 v3, 0x0

    cmp-long v3, v0, v3

    if-lez v3, :cond_14

    .line 117
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_9
    int-to-long v3, v2

    cmp-long v3, v3, v0

    if-gez v3, :cond_14

    .line 118
    invoke-virtual {p0, p5}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write(I)V

    .line 117
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 122
    .end local v2    # "i":I
    :cond_14
    return-wide p3
.end method

.method private write(Ljava/lang/String;)J
    .registers 5
    .param p1, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 126
    const-string v1, "ascii"

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 127
    .local v0, "bytes":[B
    invoke-virtual {p0, v0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write([B)V

    .line 128
    array-length v1, v0

    int-to-long v1, v1

    return-wide v1
.end method

.method private writeArchiveHeader()J
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 67
    const-string v1, "!<arch>\n"

    invoke-static {v1}, Lorg/apache/commons/compress/utils/ArchiveUtils;->toAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 68
    .local v0, "header":[B
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 69
    array-length v1, v0

    int-to-long v1, v1

    return-wide v1
.end method

.method private writeEntryHeader(Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;)J
    .registers 17
    .param p1, "pEntry"    # Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 133
    const-wide/16 v1, 0x0

    .line 134
    .local v1, "offset":J
    const/4 v9, 0x0

    .line 136
    .local v9, "mustAppendName":Z
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getName()Ljava/lang/String;

    move-result-object v10

    .line 137
    .local v10, "n":Ljava/lang/String;
    iget v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->longFileMode:I

    if-nez v0, :cond_2c

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0x10

    if-le v0, v3, :cond_2c

    .line 138
    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "filename too long, > 16 chars: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 140
    :cond_2c
    const/4 v0, 0x1

    iget v3, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->longFileMode:I

    if-ne v0, v3, :cond_92

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0x10

    if-gt v0, v3, :cond_41

    const-string v0, " "

    invoke-virtual {v10, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_92

    .line 142
    :cond_41
    const/4 v9, 0x1

    .line 143
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "#1/"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 149
    :goto_62
    const-wide/16 v3, 0x10

    const/16 v5, 0x20

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->fill(JJC)J

    move-result-wide v1

    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getLastModified()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 151
    .local v8, "m":Ljava/lang/String;
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0xc

    if-le v0, v3, :cond_98

    .line 152
    new-instance v0, Ljava/io/IOException;

    const-string v3, "modified too long"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 146
    .end local v8    # "m":Ljava/lang/String;
    :cond_92
    invoke-direct {p0, v10}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v1, v3

    goto :goto_62

    .line 154
    .restart local v8    # "m":Ljava/lang/String;
    :cond_98
    invoke-direct {p0, v8}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 156
    const-wide/16 v3, 0x1c

    const/16 v5, 0x20

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->fill(JJC)J

    move-result-wide v1

    .line 157
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getUserId()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 158
    .local v12, "u":Ljava/lang/String;
    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v3, 0x6

    if-le v0, v3, :cond_cc

    .line 159
    new-instance v0, Ljava/io/IOException;

    const-string v3, "userid too long"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 161
    :cond_cc
    invoke-direct {p0, v12}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 163
    const-wide/16 v3, 0x22

    const/16 v5, 0x20

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->fill(JJC)J

    move-result-wide v1

    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getGroupId()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 165
    .local v7, "g":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v3, 0x6

    if-le v0, v3, :cond_100

    .line 166
    new-instance v0, Ljava/io/IOException;

    const-string v3, "groupid too long"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :cond_100
    invoke-direct {p0, v7}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 170
    const-wide/16 v3, 0x28

    const/16 v5, 0x20

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->fill(JJC)J

    move-result-wide v1

    .line 171
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getMode()I

    move-result v3

    const/16 v4, 0x8

    invoke-static {v3, v4}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 172
    .local v6, "fm":Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0x8

    if-le v0, v3, :cond_13b

    .line 173
    new-instance v0, Ljava/io/IOException;

    const-string v3, "filemode too long"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 175
    :cond_13b
    invoke-direct {p0, v6}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 177
    const-wide/16 v3, 0x30

    const/16 v5, 0x20

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->fill(JJC)J

    move-result-wide v1

    .line 178
    invoke-virtual/range {p1 .. p1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getLength()J

    move-result-wide v3

    if-eqz v9, :cond_169

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v0

    :goto_153
    int-to-long v13, v0

    add-long/2addr v3, v13

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    .line 181
    .local v11, "s":Ljava/lang/String;
    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v3, 0xa

    if-le v0, v3, :cond_16b

    .line 182
    new-instance v0, Ljava/io/IOException;

    const-string v3, "size too long"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 178
    .end local v11    # "s":Ljava/lang/String;
    :cond_169
    const/4 v0, 0x0

    goto :goto_153

    .line 184
    .restart local v11    # "s":Ljava/lang/String;
    :cond_16b
    invoke-direct {p0, v11}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 186
    const-wide/16 v3, 0x3a

    const/16 v5, 0x20

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->fill(JJC)J

    move-result-wide v1

    .line 188
    const-string v0, "`\n"

    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 190
    if-eqz v9, :cond_187

    .line 191
    invoke-direct {p0, v10}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->write(Ljava/lang/String;)J

    move-result-wide v3

    add-long/2addr v1, v3

    .line 194
    :cond_187
    return-wide v1
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 209
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->finished:Z

    if-nez v0, :cond_7

    .line 210
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->finish()V

    .line 212
    :cond_7
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 213
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->prevEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    .line 214
    return-void
.end method

.method public closeArchiveEntry()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 74
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->finished:Z

    if-eqz v0, :cond_c

    .line 75
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream has already been finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_c
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->prevEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    if-eqz v0, :cond_14

    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->haveUnclosedEntry:Z

    if-nez v0, :cond_1c

    .line 78
    :cond_14
    new-instance v0, Ljava/io/IOException;

    const-string v1, "No current entry to close"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_1c
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->entryOffset:J

    const-wide/16 v2, 0x2

    rem-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2e

    .line 81
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->out:Ljava/io/OutputStream;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write(I)V

    .line 83
    :cond_2e
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->haveUnclosedEntry:Z

    .line 84
    return-void
.end method

.method public createArchiveEntry(Ljava/io/File;Ljava/lang/String;)Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .registers 5
    .param p1, "inputFile"    # Ljava/io/File;
    .param p2, "entryName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 219
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->finished:Z

    if-eqz v0, :cond_c

    .line 220
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Stream has already been finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 222
    :cond_c
    new-instance v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    invoke-direct {v0, p1, p2}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public finish()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 227
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->haveUnclosedEntry:Z

    if-eqz v0, :cond_c

    .line 228
    new-instance v0, Ljava/io/IOException;

    const-string v1, "This archive contains unclosed entries."

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 229
    :cond_c
    iget-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->finished:Z

    if-eqz v0, :cond_18

    .line 230
    new-instance v0, Ljava/io/IOException;

    const-string v1, "This archive has already been finished"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 232
    :cond_18
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->finished:Z

    .line 233
    return-void
.end method

.method public putArchiveEntry(Lorg/apache/commons/compress/archivers/ArchiveEntry;)V
    .registers 7
    .param p1, "pEntry"    # Lorg/apache/commons/compress/archivers/ArchiveEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 88
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->finished:Z

    if-eqz v1, :cond_c

    .line 89
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream has already been finished"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_c
    move-object v0, p1

    .line 92
    check-cast v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    .line 93
    .local v0, "pArEntry":Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->prevEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    if-nez v1, :cond_23

    .line 94
    invoke-direct {p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->writeArchiveHeader()J

    .line 105
    :cond_16
    :goto_16
    iput-object v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->prevEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    .line 107
    invoke-direct {p0, v0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->writeEntryHeader(Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;)J

    .line 109
    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->entryOffset:J

    .line 110
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->haveUnclosedEntry:Z

    .line 111
    return-void

    .line 96
    :cond_23
    iget-object v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->prevEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    invoke-virtual {v1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getLength()J

    move-result-wide v1

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->entryOffset:J

    cmp-long v1, v1, v3

    if-eqz v1, :cond_5a

    .line 97
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "length does not match entry ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->prevEntry:Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;

    invoke-virtual {v3}, Lorg/apache/commons/compress/archivers/ar/ArArchiveEntry;->getLength()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " != "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v3, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->entryOffset:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 100
    :cond_5a
    iget-boolean v1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->haveUnclosedEntry:Z

    if-eqz v1, :cond_16

    .line 101
    invoke-virtual {p0}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->closeArchiveEntry()V

    goto :goto_16
.end method

.method public setLongFileMode(I)V
    .registers 2
    .param p1, "longFileMode"    # I

    .prologue
    .line 63
    iput p1, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->longFileMode:I

    .line 64
    return-void
.end method

.method public write([BII)V
    .registers 8
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 199
    iget-object v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 200
    invoke-virtual {p0, p3}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->count(I)V

    .line 201
    iget-wide v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->entryOffset:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;->entryOffset:J

    .line 202
    return-void
.end method
