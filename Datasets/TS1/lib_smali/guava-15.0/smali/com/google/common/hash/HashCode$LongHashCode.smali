.class final Lcom/google/common/hash/HashCode$LongHashCode;
.super Lcom/google/common/hash/HashCode;
.source "HashCode.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/hash/HashCode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LongHashCode"
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field final hash:J


# direct methods
.method constructor <init>(J)V
    .registers 3
    .param p1, "hash"    # J

    .prologue
    .line 137
    invoke-direct {p0}, Lcom/google/common/hash/HashCode;-><init>()V

    .line 138
    iput-wide p1, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    .line 139
    return-void
.end method


# virtual methods
.method public asBytes()[B
    .registers 6

    .prologue
    const/16 v4, 0x8

    .line 148
    new-array v0, v4, [B

    const/4 v1, 0x0

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x1

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x2

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x10

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x3

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x18

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x4

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x20

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x5

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x28

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x6

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x30

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    const/4 v1, 0x7

    iget-wide v2, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    const/16 v4, 0x38

    shr-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    return-object v0
.end method

.method public asInt()I
    .registers 3

    .prologue
    .line 161
    iget-wide v0, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    long-to-int v0, v0

    return v0
.end method

.method public asLong()J
    .registers 3

    .prologue
    .line 166
    iget-wide v0, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    return-wide v0
.end method

.method public bits()I
    .registers 2

    .prologue
    .line 143
    const/16 v0, 0x40

    return v0
.end method

.method public padToLong()J
    .registers 3

    .prologue
    .line 171
    iget-wide v0, p0, Lcom/google/common/hash/HashCode$LongHashCode;->hash:J

    return-wide v0
.end method
