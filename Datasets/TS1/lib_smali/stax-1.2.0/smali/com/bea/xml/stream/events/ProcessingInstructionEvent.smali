.class public Lcom/bea/xml/stream/events/ProcessingInstructionEvent;
.super Lcom/bea/xml/stream/events/BaseEvent;
.source "ProcessingInstructionEvent.java"

# interfaces
.implements Ljavax/xml/stream/events/ProcessingInstruction;


# instance fields
.field content:Ljava/lang/String;

.field name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    invoke-virtual {p0}, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->init()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/bea/xml/stream/events/BaseEvent;-><init>()V

    invoke-virtual {p0}, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->init()V

    .line 29
    iput-object p1, p0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->name:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->content:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method protected doWriteAsEncodedUnicode(Ljava/io/Writer;)V
    .registers 3
    .param p1, "writer"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 49
    const-string v0, "<?"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 50
    iget-object v0, p0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->name:Ljava/lang/String;

    if-eqz v0, :cond_e

    .line 51
    iget-object v0, p0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 53
    :cond_e
    iget-object v0, p0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->content:Ljava/lang/String;

    if-eqz v0, :cond_1c

    .line 54
    const/16 v0, 0x20

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(I)V

    .line 55
    iget-object v0, p0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->content:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 57
    :cond_1c
    const-string v0, "?>"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 58
    return-void
.end method

.method public getData()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    iget-object v0, p0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getTarget()Ljava/lang/String;
    .registers 2

    .prologue
    .line 34
    iget-object v0, p0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->name:Ljava/lang/String;

    return-object v0
.end method

.method protected init()V
    .registers 2

    .prologue
    .line 32
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->setEventType(I)V

    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .registers 2
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->content:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setTarget(Ljava/lang/String;)V
    .registers 2
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/bea/xml/stream/events/ProcessingInstructionEvent;->name:Ljava/lang/String;

    .line 38
    return-void
.end method
