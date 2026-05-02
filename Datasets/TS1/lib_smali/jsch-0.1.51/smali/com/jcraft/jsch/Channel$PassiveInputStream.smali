.class Lcom/jcraft/jsch/Channel$PassiveInputStream;
.super Lcom/jcraft/jsch/Channel$MyPipedInputStream;
.source "Channel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jcraft/jsch/Channel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PassiveInputStream"
.end annotation


# instance fields
.field out:Ljava/io/PipedOutputStream;

.field final synthetic this$0:Lcom/jcraft/jsch/Channel;


# direct methods
.method constructor <init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedOutputStream;)V
    .registers 3
    .param p2, "out"    # Ljava/io/PipedOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 630
    iput-object p1, p0, Lcom/jcraft/jsch/Channel$PassiveInputStream;->this$0:Lcom/jcraft/jsch/Channel;

    .line 631
    invoke-direct {p0, p1, p2}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;-><init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedOutputStream;)V

    .line 632
    iput-object p2, p0, Lcom/jcraft/jsch/Channel$PassiveInputStream;->out:Ljava/io/PipedOutputStream;

    .line 633
    return-void
.end method

.method constructor <init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedOutputStream;I)V
    .registers 4
    .param p2, "out"    # Ljava/io/PipedOutputStream;
    .param p3, "size"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 626
    iput-object p1, p0, Lcom/jcraft/jsch/Channel$PassiveInputStream;->this$0:Lcom/jcraft/jsch/Channel;

    .line 627
    invoke-direct {p0, p1, p2, p3}, Lcom/jcraft/jsch/Channel$MyPipedInputStream;-><init>(Lcom/jcraft/jsch/Channel;Ljava/io/PipedOutputStream;I)V

    .line 628
    iput-object p2, p0, Lcom/jcraft/jsch/Channel$PassiveInputStream;->out:Ljava/io/PipedOutputStream;

    .line 629
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 635
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$PassiveInputStream;->out:Ljava/io/PipedOutputStream;

    if-eqz v0, :cond_9

    .line 636
    iget-object v0, p0, Lcom/jcraft/jsch/Channel$PassiveInputStream;->out:Ljava/io/PipedOutputStream;

    invoke-virtual {v0}, Ljava/io/PipedOutputStream;->close()V

    .line 638
    :cond_9
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/Channel$PassiveInputStream;->out:Ljava/io/PipedOutputStream;

    .line 639
    return-void
.end method
