.class public final Lcom/drew/lang/BufferBoundsException;
.super Ljava/io/IOException;
.source "BufferBoundsException.java"


# static fields
.field private static final serialVersionUID:J = 0x2866509b783bdcdcL


# direct methods
.method public constructor <init>(IIJ)V
    .registers 6
    .param p1, "index"    # I
    .param p2, "bytesRequested"    # I
    .param p3, "bufferLength"    # J

    .prologue
    .line 37
    invoke-static {p1, p2, p3, p4}, Lcom/drew/lang/BufferBoundsException;->getMessage(IIJ)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 43
    return-void
.end method

.method private static getMessage(IIJ)Ljava/lang/String;
    .registers 13
    .param p0, "index"    # I
    .param p1, "bytesRequested"    # I
    .param p2, "bufferLength"    # J

    .prologue
    const-wide/16 v7, 0x1

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 47
    if-gez p0, :cond_16

    .line 48
    const-string v0, "Attempt to read from buffer using a negative index (%d)"

    new-array v1, v5, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 56
    :goto_15
    return-object v0

    .line 50
    :cond_16
    if-gez p1, :cond_27

    .line 51
    const-string v0, "Number of requested bytes cannot be negative (%d)"

    new-array v1, v5, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_15

    .line 53
    :cond_27
    int-to-long v0, p0

    int-to-long v2, p1

    add-long/2addr v0, v2

    sub-long/2addr v0, v7

    const-wide/32 v2, 0x7fffffff

    cmp-long v0, v0, v2

    if-lez v0, :cond_47

    .line 54
    const-string v0, "Number of requested bytes summed with starting index exceed maximum range of signed 32 bit integers (requested index: %d, requested count: %d)"

    new-array v1, v6, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_15

    .line 56
    :cond_47
    const-string v0, "Attempt to read from beyond end of underlying data source (requested index: %d, requested count: %d, max index: %d)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v5

    sub-long v2, p2, v7

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v6

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_15
.end method
