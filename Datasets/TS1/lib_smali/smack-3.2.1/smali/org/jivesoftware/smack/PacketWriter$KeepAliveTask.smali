.class Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;
.super Ljava/lang/Object;
.source "PacketWriter.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/PacketWriter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "KeepAliveTask"
.end annotation


# instance fields
.field private delay:I

.field final synthetic this$0:Lorg/jivesoftware/smack/PacketWriter;

.field private thread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/PacketWriter;I)V
    .registers 3
    .param p2, "delay"    # I

    .prologue
    .line 270
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 271
    iput p2, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->delay:I

    .line 272
    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    .line 282
    const-wide/16 v0, 0x3a98

    :try_start_2
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_5} :catch_51

    .line 287
    :goto_5
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    # getter for: Lorg/jivesoftware/smack/PacketWriter;->done:Z
    invoke-static {v0}, Lorg/jivesoftware/smack/PacketWriter;->access$100(Lorg/jivesoftware/smack/PacketWriter;)Z

    move-result v0

    if-nez v0, :cond_53

    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    # getter for: Lorg/jivesoftware/smack/PacketWriter;->keepAliveThread:Ljava/lang/Thread;
    invoke-static {v0}, Lorg/jivesoftware/smack/PacketWriter;->access$200(Lorg/jivesoftware/smack/PacketWriter;)Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->thread:Ljava/lang/Thread;

    if-ne v0, v1, :cond_53

    .line 288
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    # getter for: Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;
    invoke-static {v0}, Lorg/jivesoftware/smack/PacketWriter;->access$300(Lorg/jivesoftware/smack/PacketWriter;)Ljava/io/Writer;

    move-result-object v1

    monitor-enter v1

    .line 290
    :try_start_1e
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    # getter for: Lorg/jivesoftware/smack/PacketWriter;->lastActive:J
    invoke-static {v0}, Lorg/jivesoftware/smack/PacketWriter;->access$400(Lorg/jivesoftware/smack/PacketWriter;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    iget v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->delay:I
    :try_end_2b
    .catchall {:try_start_1e .. :try_end_2b} :catchall_4e

    int-to-long v4, v0

    cmp-long v0, v2, v4

    if-ltz v0, :cond_44

    .line 292
    :try_start_30
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    # getter for: Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;
    invoke-static {v0}, Lorg/jivesoftware/smack/PacketWriter;->access$300(Lorg/jivesoftware/smack/PacketWriter;)Ljava/io/Writer;

    move-result-object v0

    const-string v2, " "

    invoke-virtual {v0, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 293
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    # getter for: Lorg/jivesoftware/smack/PacketWriter;->writer:Ljava/io/Writer;
    invoke-static {v0}, Lorg/jivesoftware/smack/PacketWriter;->access$300(Lorg/jivesoftware/smack/PacketWriter;)Ljava/io/Writer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/Writer;->flush()V
    :try_end_44
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_44} :catch_54
    .catchall {:try_start_30 .. :try_end_44} :catchall_4e

    .line 299
    :cond_44
    :goto_44
    :try_start_44
    monitor-exit v1
    :try_end_45
    .catchall {:try_start_44 .. :try_end_45} :catchall_4e

    .line 302
    :try_start_45
    iget v0, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->delay:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4b
    .catch Ljava/lang/InterruptedException; {:try_start_45 .. :try_end_4b} :catch_4c

    goto :goto_5

    .line 304
    :catch_4c
    move-exception v0

    goto :goto_5

    .line 299
    :catchall_4e
    move-exception v0

    :try_start_4f
    monitor-exit v1
    :try_end_50
    .catchall {:try_start_4f .. :try_end_50} :catchall_4e

    throw v0

    .line 284
    :catch_51
    move-exception v0

    goto :goto_5

    .line 308
    :cond_53
    return-void

    .line 295
    :catch_54
    move-exception v0

    goto :goto_44
.end method

.method protected setThread(Ljava/lang/Thread;)V
    .registers 2
    .param p1, "thread"    # Ljava/lang/Thread;

    .prologue
    .line 275
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketWriter$KeepAliveTask;->thread:Ljava/lang/Thread;

    .line 276
    return-void
.end method
