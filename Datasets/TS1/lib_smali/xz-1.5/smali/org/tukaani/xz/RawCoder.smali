.class Lorg/tukaani/xz/RawCoder;
.super Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static validate([Lorg/tukaani/xz/FilterCoder;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    const/4 v1, 0x0

    move v0, v1

    :goto_2
    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_1a

    aget-object v2, p0, v0

    invoke-interface {v2}, Lorg/tukaani/xz/FilterCoder;->nonLastOK()Z

    move-result v2

    if-nez v2, :cond_17

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Unsupported XZ filter chain"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_17
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_1a
    array-length v0, p0

    add-int/lit8 v0, v0, -0x1

    aget-object v0, p0, v0

    invoke-interface {v0}, Lorg/tukaani/xz/FilterCoder;->lastOK()Z

    move-result v0

    if-nez v0, :cond_2d

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Unsupported XZ filter chain"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2d
    move v0, v1

    :goto_2e
    array-length v2, p0

    if-ge v1, v2, :cond_3e

    aget-object v2, p0, v1

    invoke-interface {v2}, Lorg/tukaani/xz/FilterCoder;->changesSize()Z

    move-result v2

    if-eqz v2, :cond_3b

    add-int/lit8 v0, v0, 0x1

    :cond_3b
    add-int/lit8 v1, v1, 0x1

    goto :goto_2e

    :cond_3e
    const/4 v1, 0x3

    if-le v0, v1, :cond_49

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    const-string v1, "Unsupported XZ filter chain"

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_49
    return-void
.end method
