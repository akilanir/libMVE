.class public abstract Lch/qos/logback/core/LayoutBase;
.super Lch/qos/logback/core/spi/ContextAwareBase;

# interfaces
.implements Lch/qos/logback/core/Layout;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/spi/ContextAwareBase;",
        "Lch/qos/logback/core/Layout",
        "<TE;>;"
    }
.end annotation


# instance fields
.field fileFooter:Ljava/lang/String;

.field fileHeader:Ljava/lang/String;

.field presentationFooter:Ljava/lang/String;

.field presentationHeader:Ljava/lang/String;

.field protected started:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lch/qos/logback/core/spi/ContextAwareBase;-><init>()V

    return-void
.end method


# virtual methods
.method public getContentType()Ljava/lang/String;
    .registers 2

    const-string v0, "text/plain"

    return-object v0
.end method

.method public getContext()Lch/qos/logback/core/Context;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/LayoutBase;->context:Lch/qos/logback/core/Context;

    return-object v0
.end method

.method public getFileFooter()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/LayoutBase;->fileFooter:Ljava/lang/String;

    return-object v0
.end method

.method public getFileHeader()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/LayoutBase;->fileHeader:Ljava/lang/String;

    return-object v0
.end method

.method public getPresentationFooter()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/LayoutBase;->presentationFooter:Ljava/lang/String;

    return-object v0
.end method

.method public getPresentationHeader()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/LayoutBase;->presentationHeader:Ljava/lang/String;

    return-object v0
.end method

.method public isStarted()Z
    .registers 2

    iget-boolean v0, p0, Lch/qos/logback/core/LayoutBase;->started:Z

    return v0
.end method

.method public setContext(Lch/qos/logback/core/Context;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/LayoutBase;->context:Lch/qos/logback/core/Context;

    return-void
.end method

.method public setFileFooter(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/LayoutBase;->fileFooter:Ljava/lang/String;

    return-void
.end method

.method public setFileHeader(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/LayoutBase;->fileHeader:Ljava/lang/String;

    return-void
.end method

.method public setPresentationFooter(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/LayoutBase;->presentationFooter:Ljava/lang/String;

    return-void
.end method

.method public setPresentationHeader(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lch/qos/logback/core/LayoutBase;->presentationHeader:Ljava/lang/String;

    return-void
.end method

.method public start()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lch/qos/logback/core/LayoutBase;->started:Z

    return-void
.end method

.method public stop()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lch/qos/logback/core/LayoutBase;->started:Z

    return-void
.end method
