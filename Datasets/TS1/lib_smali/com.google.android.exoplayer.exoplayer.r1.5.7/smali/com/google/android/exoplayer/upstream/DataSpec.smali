.class public final Lcom/google/android/exoplayer/upstream/DataSpec;
.super Ljava/lang/Object;
.source "DataSpec.java"


# static fields
.field public static final FLAG_ALLOW_GZIP:I = 0x1


# instance fields
.field public final absoluteStreamPosition:J

.field public final flags:I

.field public final key:Ljava/lang/String;

.field public final length:J

.field public final position:J

.field public final postBody:[B

.field public final uri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .registers 3
    .param p1, "uri"    # Landroid/net/Uri;

    .prologue
    .line 82
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;I)V

    .line 83
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;I)V
    .registers 11
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "flags"    # I

    .prologue
    .line 92
    const-wide/16 v2, 0x0

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJLjava/lang/String;I)V

    .line 93
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;JJJLjava/lang/String;I)V
    .registers 21
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "absoluteStreamPosition"    # J
    .param p4, "position"    # J
    .param p6, "length"    # J
    .param p8, "key"    # Ljava/lang/String;
    .param p9, "flags"    # I

    .prologue
    .line 133
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v3, p2

    move-wide v5, p4

    move-wide/from16 v7, p6

    move-object/from16 v9, p8

    move/from16 v10, p9

    invoke-direct/range {v0 .. v10}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;[BJJJLjava/lang/String;I)V

    .line 134
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;JJLjava/lang/String;)V
    .registers 17
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "absoluteStreamPosition"    # J
    .param p4, "length"    # J
    .param p6, "key"    # Ljava/lang/String;

    .prologue
    .line 104
    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p2

    move-wide v6, p4

    move-object/from16 v8, p6

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJJLjava/lang/String;I)V

    .line 105
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;JJLjava/lang/String;I)V
    .registers 18
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "absoluteStreamPosition"    # J
    .param p4, "length"    # J
    .param p6, "key"    # Ljava/lang/String;
    .param p7, "flags"    # I

    .prologue
    .line 117
    move-object v0, p0

    move-object v1, p1

    move-wide v2, p2

    move-wide v4, p2

    move-wide v6, p4

    move-object/from16 v8, p6

    move/from16 v9, p7

    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer/upstream/DataSpec;-><init>(Landroid/net/Uri;JJJLjava/lang/String;I)V

    .line 118
    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;[BJJJLjava/lang/String;I)V
    .registers 16
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "postBody"    # [B
    .param p3, "absoluteStreamPosition"    # J
    .param p5, "position"    # J
    .param p7, "length"    # J
    .param p9, "key"    # Ljava/lang/String;
    .param p10, "flags"    # I

    .prologue
    const-wide/16 v3, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    cmp-long v0, p3, v3

    if-ltz v0, :cond_34

    move v0, v1

    :goto_c
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 151
    cmp-long v0, p5, v3

    if-ltz v0, :cond_36

    move v0, v1

    :goto_14
    invoke-static {v0}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 152
    cmp-long v0, p7, v3

    if-gtz v0, :cond_21

    const-wide/16 v3, -0x1

    cmp-long v0, p7, v3

    if-nez v0, :cond_22

    :cond_21
    move v2, v1

    :cond_22
    invoke-static {v2}, Lcom/google/android/exoplayer/util/Assertions;->checkArgument(Z)V

    .line 153
    iput-object p1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    .line 154
    iput-object p2, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->postBody:[B

    .line 155
    iput-wide p3, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    .line 156
    iput-wide p5, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    .line 157
    iput-wide p7, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    .line 158
    iput-object p9, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->key:Ljava/lang/String;

    .line 159
    iput p10, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->flags:I

    .line 160
    return-void

    :cond_34
    move v0, v2

    .line 150
    goto :goto_c

    :cond_36
    move v0, v2

    .line 151
    goto :goto_14
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 164
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DataSpec["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->postBody:[B

    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->absoluteStreamPosition:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->position:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->length:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/google/android/exoplayer/upstream/DataSpec;->flags:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
