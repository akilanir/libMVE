.class Lcom/jcraft/jsch/Channel$PassiveOutputStream;
.super Ljava/io/PipedOutputStream;
.source "Channel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/Channel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PassiveOutputStream"
.end annotation


# instance fields
.field private _sink:Lcom/jcraft/jsch/Channel$MyPipedInputStream;

.field final synthetic this$0:Lcom/jcraft/jsch/Channel;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedInputStream;Z)V
    .registers 5
    .param p2, "in"    # Ljava/io/PipedInputStream;
    .param p3, "resizable_buffer"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 644
    iput-object p1, p0, Lcom/jcraft/jsch/Channel$PassiveOutputStream;->this$0:Lcom/jcraft/jsch/Channel;

    .line 645
    invoke-direct {p0, p2}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    .line 642
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/Channel$PassiveOutputStream;->_sink:Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    .line 646
    if-eqz p3, :cond_12

    instance-of v0, p2, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    if-eqz v0, :cond_12

    .line 647
    check-cast p2, Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    .end local p2    # "in":Ljava/io/PipedInputStream;
    iput-object p2, p0, Lcom/jcraft/jsch/Channel$PassiveOutputStream;->_sink:Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    .line 649
    :cond_12
    return-void
.end method


# virtual methods
.method public write(I)V
    .registers 4
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 651
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$PassiveOutputStream;->_sink:Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    if-eqz v0, :cond_a

    .line 652
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$PassiveOutputStream;->_sink:Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->checkSpace(I)V

    .line 654
    :cond_a
    invoke-super {p0, p1}, Ljava/io/PipedOutputStream;->write(I)V

    .line 655
    return-void
.end method

.method public write([BII)V
    .registers 5
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 657
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$PassiveOutputStream;->_sink:Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    if-eqz v0, :cond_9

    .line 658
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$PassiveOutputStream;->_sink:Lcom/jcraft/jsch/Channel$MyPipedInputStream;

    invoke-virtual {v0, p3}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;->checkSpace(I)V

    .line 660
    :cond_9
    invoke-super {p0, p1, p2, p3}, Ljava/io/PipedOutputStream;->write([BII)V

    .line 661
    return-void
.end method
