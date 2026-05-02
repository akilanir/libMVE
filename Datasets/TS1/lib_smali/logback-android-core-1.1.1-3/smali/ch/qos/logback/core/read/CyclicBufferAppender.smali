.class public Lch/qos/logback/core/read/CyclicBufferAppender;
.super Lch/qos/logback/core/AppenderBase;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lch/qos/logback/core/AppenderBase",
        "<TE;>;"
    }
.end annotation


# instance fields
.field cb:Lch/qos/logback/core/helpers/CyclicBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lch/qos/logback/core/helpers/CyclicBuffer",
            "<TE;>;"
        }
    .end annotation
.end field

.field maxSize:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lch/qos/logback/core/AppenderBase;-><init>()V

    const/16 v0, 0x200

    iput v0, p0, Lch/qos/logback/core/read/CyclicBufferAppender;->maxSize:I

    return-void
.end method


# virtual methods
.method protected append(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/read/CyclicBufferAppender;->isStarted()Z

    move-result v0

    if-nez v0, :cond_7

    :goto_6
    return-void

    :cond_7
    iget-object v0, p0, Lch/qos/logback/core/read/CyclicBufferAppender;->cb:Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/helpers/CyclicBuffer;->add(Ljava/lang/Object;)V

    goto :goto_6
.end method

.method public get(I)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    invoke-virtual {p0}, Lch/qos/logback/core/read/CyclicBufferAppender;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lch/qos/logback/core/read/CyclicBufferAppender;->cb:Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-virtual {v0, p1}, Lch/qos/logback/core/helpers/CyclicBuffer;->get(I)Ljava/lang/Object;

    move-result-object v0

    :goto_c
    return-object v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getLength()I
    .registers 2

    invoke-virtual {p0}, Lch/qos/logback/core/read/CyclicBufferAppender;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-object v0, p0, Lch/qos/logback/core/read/CyclicBufferAppender;->cb:Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-virtual {v0}, Lch/qos/logback/core/helpers/CyclicBuffer;->length()I

    move-result v0

    :goto_c
    return v0

    :cond_d
    const/4 v0, 0x0

    goto :goto_c
.end method

.method public getMaxSize()I
    .registers 2

    iget v0, p0, Lch/qos/logback/core/read/CyclicBufferAppender;->maxSize:I

    return v0
.end method

.method public reset()V
    .registers 2

    iget-object v0, p0, Lch/qos/logback/core/read/CyclicBufferAppender;->cb:Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-virtual {v0}, Lch/qos/logback/core/helpers/CyclicBuffer;->clear()V

    return-void
.end method

.method public setMaxSize(I)V
    .registers 2

    iput p1, p0, Lch/qos/logback/core/read/CyclicBufferAppender;->maxSize:I

    return-void
.end method

.method public start()V
    .registers 3

    new-instance v0, Lch/qos/logback/core/helpers/CyclicBuffer;

    iget v1, p0, Lch/qos/logback/core/read/CyclicBufferAppender;->maxSize:I

    invoke-direct {v0, v1}, Lch/qos/logback/core/helpers/CyclicBuffer;-><init>(I)V

    iput-object v0, p0, Lch/qos/logback/core/read/CyclicBufferAppender;->cb:Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-super {p0}, Lch/qos/logback/core/AppenderBase;->start()V

    return-void
.end method

.method public stop()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lch/qos/logback/core/read/CyclicBufferAppender;->cb:Lch/qos/logback/core/helpers/CyclicBuffer;

    invoke-super {p0}, Lch/qos/logback/core/AppenderBase;->stop()V

    return-void
.end method
