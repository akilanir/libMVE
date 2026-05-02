.class abstract Lorg/tukaani/xz/BCJOptions;
.super Lorg/tukaani/xz/FilterOptions;


# static fields
.field static final $assertionsDisabled:Z

.field static class$org$tukaani$xz$BCJOptions:Ljava/lang/Class;


# instance fields
.field private final alignment:I

.field startOffset:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lorg/tukaani/xz/BCJOptions;->class$org$tukaani$xz$BCJOptions:Ljava/lang/Class;

    if-nez v0, :cond_16

    const-string v0, "org.tukaani.xz.BCJOptions"

    invoke-static {v0}, Lorg/tukaani/xz/BCJOptions;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/tukaani/xz/BCJOptions;->class$org$tukaani$xz$BCJOptions:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_19

    const/4 v0, 0x1

    :goto_13
    sput-boolean v0, Lorg/tukaani/xz/BCJOptions;->$assertionsDisabled:Z

    return-void

    :cond_16
    sget-object v0, Lorg/tukaani/xz/BCJOptions;->class$org$tukaani$xz$BCJOptions:Ljava/lang/Class;

    goto :goto_c

    :cond_19
    const/4 v0, 0x0

    goto :goto_13
.end method

.method constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Lorg/tukaani/xz/FilterOptions;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lorg/tukaani/xz/BCJOptions;->startOffset:I

    iput p1, p0, Lorg/tukaani/xz/BCJOptions;->alignment:I

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3

    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    :catch_5
    move-exception v0

    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .registers 2

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v0

    return-object v0

    :catch_5
    move-exception v0

    sget-boolean v0, Lorg/tukaani/xz/BCJOptions;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_10
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0
.end method

.method public getDecoderMemoryUsage()I
    .registers 2

    invoke-static {}, Lorg/tukaani/xz/SimpleInputStream;->getMemoryUsage()I

    move-result v0

    return v0
.end method

.method public getEncoderMemoryUsage()I
    .registers 2

    invoke-static {}, Lorg/tukaani/xz/SimpleOutputStream;->getMemoryUsage()I

    move-result v0

    return v0
.end method

.method public getStartOffset()I
    .registers 2

    iget v0, p0, Lorg/tukaani/xz/BCJOptions;->startOffset:I

    return v0
.end method

.method public setStartOffset(I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/tukaani/xz/UnsupportedOptionsException;
        }
    .end annotation

    iget v0, p0, Lorg/tukaani/xz/BCJOptions;->alignment:I

    add-int/lit8 v0, v0, -0x1

    and-int/2addr v0, p1

    if-eqz v0, :cond_22

    new-instance v0, Lorg/tukaani/xz/UnsupportedOptionsException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Start offset must be a multiple of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget v2, p0, Lorg/tukaani/xz/BCJOptions;->alignment:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/tukaani/xz/UnsupportedOptionsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_22
    iput p1, p0, Lorg/tukaani/xz/BCJOptions;->startOffset:I

    return-void
.end method
