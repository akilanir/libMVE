.class public abstract Lorg/tukaani/xz/FilterOptions;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Cloneable;


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDecoderMemoryUsage([Lorg/tukaani/xz/FilterOptions;)I
    .registers 4

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    array-length v2, p0

    if-ge v0, v2, :cond_f

    aget-object v2, p0, v0

    invoke-virtual {v2}, Lorg/tukaani/xz/FilterOptions;->getDecoderMemoryUsage()I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_f
    return v1
.end method

.method public static getEncoderMemoryUsage([Lorg/tukaani/xz/FilterOptions;)I
    .registers 4

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    array-length v2, p0

    if-ge v0, v2, :cond_f

    aget-object v2, p0, v0

    invoke-virtual {v2}, Lorg/tukaani/xz/FilterOptions;->getEncoderMemoryUsage()I

    move-result v2

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_f
    return v1
.end method


# virtual methods
.method public abstract getDecoderMemoryUsage()I
.end method

.method public abstract getEncoderMemoryUsage()I
.end method

.method abstract getFilterEncoder()Lorg/tukaani/xz/FilterEncoder;
.end method

.method public abstract getInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getOutputStream(Lorg/tukaani/xz/FinishableOutputStream;)Lorg/tukaani/xz/FinishableOutputStream;
.end method
