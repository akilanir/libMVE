.class public final Lcom/google/android/exoplayer/extractor/mp4/PsshAtomUtil;
.super Ljava/lang/Object;
.source "PsshAtomUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "PsshAtomUtil"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildPsshAtom(Ljava/util/UUID;[B)[B
    .registers 6
    .param p0, "uuid"    # Ljava/util/UUID;
    .param p1, "data"    # [B

    .prologue
    .line 43
    array-length v2, p1

    add-int/lit8 v1, v2, 0x20

    .line 44
    .local v1, "psshBoxLength":I
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 45
    .local v0, "psshBox":Ljava/nio/ByteBuffer;
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 46
    sget v2, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_pssh:I

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 47
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 48
    invoke-virtual {p0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 49
    invoke-virtual {p0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 50
    array-length v2, p1

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 51
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 52
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v2

    return-object v2
.end method

.method private static parsePsshAtom([B)Landroid/util/Pair;
    .registers 16
    .param p0, "atom"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)",
            "Landroid/util/Pair",
            "<",
            "Ljava/util/UUID;",
            "[B>;"
        }
    .end annotation

    .prologue
    const/4 v14, 0x1

    const/4 v13, 0x0

    const/4 v8, 0x0

    .line 104
    new-instance v0, Lcom/google/android/exoplayer/util/ParsableByteArray;

    invoke-direct {v0, p0}, Lcom/google/android/exoplayer/util/ParsableByteArray;-><init>([B)V

    .line 105
    .local v0, "atomData":Lcom/google/android/exoplayer/util/ParsableByteArray;
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->limit()I

    move-result v9

    const/16 v10, 0x20

    if-ge v9, v10, :cond_11

    .line 137
    :cond_10
    :goto_10
    return-object v8

    .line 109
    :cond_11
    invoke-virtual {v0, v13}, Lcom/google/android/exoplayer/util/ParsableByteArray;->setPosition(I)V

    .line 110
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v1

    .line 111
    .local v1, "atomSize":I
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v9

    add-int/lit8 v9, v9, 0x4

    if-ne v1, v9, :cond_10

    .line 115
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v2

    .line 116
    .local v2, "atomType":I
    sget v9, Lcom/google/android/exoplayer/extractor/mp4/Atom;->TYPE_pssh:I

    if-ne v2, v9, :cond_10

    .line 120
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readInt()I

    move-result v9

    invoke-static {v9}, Lcom/google/android/exoplayer/extractor/mp4/Atom;->parseFullAtomVersion(I)I

    move-result v3

    .line 121
    .local v3, "atomVersion":I
    if-le v3, v14, :cond_4b

    .line 122
    const-string v9, "PsshAtomUtil"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unsupported pssh version: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_10

    .line 125
    :cond_4b
    new-instance v7, Ljava/util/UUID;

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLong()J

    move-result-wide v9

    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readLong()J

    move-result-wide v11

    invoke-direct {v7, v9, v10, v11, v12}, Ljava/util/UUID;-><init>(JJ)V

    .line 126
    .local v7, "uuid":Ljava/util/UUID;
    if-ne v3, v14, :cond_63

    .line 127
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v6

    .line 128
    .local v6, "keyIdCount":I
    mul-int/lit8 v9, v6, 0x10

    invoke-virtual {v0, v9}, Lcom/google/android/exoplayer/util/ParsableByteArray;->skipBytes(I)V

    .line 130
    .end local v6    # "keyIdCount":I
    :cond_63
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readUnsignedIntToInt()I

    move-result v5

    .line 131
    .local v5, "dataSize":I
    invoke-virtual {v0}, Lcom/google/android/exoplayer/util/ParsableByteArray;->bytesLeft()I

    move-result v9

    if-ne v5, v9, :cond_10

    .line 135
    new-array v4, v5, [B

    .line 136
    .local v4, "data":[B
    invoke-virtual {v0, v4, v13, v5}, Lcom/google/android/exoplayer/util/ParsableByteArray;->readBytes([BII)V

    .line 137
    invoke-static {v7, v4}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v8

    goto :goto_10
.end method

.method public static parseSchemeSpecificData([BLjava/util/UUID;)[B
    .registers 7
    .param p0, "atom"    # [B
    .param p1, "uuid"    # Ljava/util/UUID;

    .prologue
    const/4 v1, 0x0

    .line 84
    invoke-static {p0}, Lcom/google/android/exoplayer/extractor/mp4/PsshAtomUtil;->parsePsshAtom([B)Landroid/util/Pair;

    move-result-object v0

    .line 85
    .local v0, "parsedAtom":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/UUID;[B>;"
    if-nez v0, :cond_8

    .line 92
    :goto_7
    return-object v1

    .line 88
    :cond_8
    if-eqz p1, :cond_3d

    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3d

    .line 89
    const-string v2, "PsshAtomUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UUID mismatch. Expected: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", got: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    .line 92
    :cond_3d
    iget-object v1, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, [B

    goto :goto_7
.end method

.method public static parseUuid([B)Ljava/util/UUID;
    .registers 3
    .param p0, "atom"    # [B

    .prologue
    .line 65
    invoke-static {p0}, Lcom/google/android/exoplayer/extractor/mp4/PsshAtomUtil;->parsePsshAtom([B)Landroid/util/Pair;

    move-result-object v0

    .line 66
    .local v0, "parsedAtom":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/util/UUID;[B>;"
    if-nez v0, :cond_8

    .line 67
    const/4 v1, 0x0

    .line 69
    :goto_7
    return-object v1

    :cond_8
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Ljava/util/UUID;

    goto :goto_7
.end method
