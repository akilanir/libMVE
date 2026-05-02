.class Lorg/jivesoftware/smack/ReconnectionManager$2;
.super Ljava/lang/Thread;
.source "ReconnectionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/ReconnectionManager;->reconnect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private attempts:I

.field final synthetic this$0:Lorg/jivesoftware/smack/ReconnectionManager;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/ReconnectionManager;)V
    .registers 3

    .prologue
    .line 73
    iput-object p1, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 78
    const/4 v0, 0x0

    iput v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->attempts:I

    return-void
.end method

.method private timeDelay()I
    .registers 3

    .prologue
    .line 86
    iget v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->attempts:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->attempts:I

    .line 87
    iget v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->attempts:I

    const/16 v1, 0xd

    if-le v0, v1, :cond_17

    .line 88
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    # getter for: Lorg/jivesoftware/smack/ReconnectionManager;->randomBase:I
    invoke-static {v0}, Lorg/jivesoftware/smack/ReconnectionManager;->access$100(Lorg/jivesoftware/smack/ReconnectionManager;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x6

    mul-int/lit8 v0, v0, 0x5

    .line 93
    :goto_16
    return v0

    .line 90
    :cond_17
    iget v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->attempts:I

    const/4 v1, 0x7

    if-le v0, v1, :cond_25

    .line 91
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    # getter for: Lorg/jivesoftware/smack/ReconnectionManager;->randomBase:I
    invoke-static {v0}, Lorg/jivesoftware/smack/ReconnectionManager;->access$100(Lorg/jivesoftware/smack/ReconnectionManager;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x6

    goto :goto_16

    .line 93
    :cond_25
    iget-object v0, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    # getter for: Lorg/jivesoftware/smack/ReconnectionManager;->randomBase:I
    invoke-static {v0}, Lorg/jivesoftware/smack/ReconnectionManager;->access$100(Lorg/jivesoftware/smack/ReconnectionManager;)I

    move-result v0

    goto :goto_16
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 103
    :cond_0
    :goto_0
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    # invokes: Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z
    invoke-static {v3}, Lorg/jivesoftware/smack/ReconnectionManager;->access$200(Lorg/jivesoftware/smack/ReconnectionManager;)Z

    move-result v3

    if-eqz v3, :cond_46

    .line 105
    invoke-direct {p0}, Lorg/jivesoftware/smack/ReconnectionManager$2;->timeDelay()I

    move-result v2

    .line 110
    .local v2, "remainingSeconds":I
    :goto_c
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    # invokes: Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z
    invoke-static {v3}, Lorg/jivesoftware/smack/ReconnectionManager;->access$200(Lorg/jivesoftware/smack/ReconnectionManager;)Z

    move-result v3

    if-eqz v3, :cond_2d

    if-lez v2, :cond_2d

    .line 113
    const-wide/16 v3, 0x3e8

    :try_start_18
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V

    .line 114
    add-int/lit8 v2, v2, -0x1

    .line 115
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smack/ReconnectionManager;->notifyAttemptToReconnectIn(I)V
    :try_end_22
    .catch Ljava/lang/InterruptedException; {:try_start_18 .. :try_end_22} :catch_23

    goto :goto_c

    .line 118
    :catch_23
    move-exception v1

    .line 119
    .local v1, "e1":Ljava/lang/InterruptedException;
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 121
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-virtual {v3, v1}, Lorg/jivesoftware/smack/ReconnectionManager;->notifyReconnectionFailed(Ljava/lang/Exception;)V

    goto :goto_c

    .line 127
    .end local v1    # "e1":Ljava/lang/InterruptedException;
    :cond_2d
    :try_start_2d
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    # invokes: Lorg/jivesoftware/smack/ReconnectionManager;->isReconnectionAllowed()Z
    invoke-static {v3}, Lorg/jivesoftware/smack/ReconnectionManager;->access$200(Lorg/jivesoftware/smack/ReconnectionManager;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 128
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    # getter for: Lorg/jivesoftware/smack/ReconnectionManager;->connection:Lorg/jivesoftware/smack/Connection;
    invoke-static {v3}, Lorg/jivesoftware/smack/ReconnectionManager;->access$300(Lorg/jivesoftware/smack/ReconnectionManager;)Lorg/jivesoftware/smack/Connection;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jivesoftware/smack/Connection;->connect()V
    :try_end_3e
    .catch Lorg/jivesoftware/smack/XMPPException; {:try_start_2d .. :try_end_3e} :catch_3f

    goto :goto_0

    .line 131
    :catch_3f
    move-exception v0

    .line 133
    .local v0, "e":Lorg/jivesoftware/smack/XMPPException;
    iget-object v3, p0, Lorg/jivesoftware/smack/ReconnectionManager$2;->this$0:Lorg/jivesoftware/smack/ReconnectionManager;

    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/ReconnectionManager;->notifyReconnectionFailed(Ljava/lang/Exception;)V

    goto :goto_0

    .line 136
    .end local v0    # "e":Lorg/jivesoftware/smack/XMPPException;
    .end local v2    # "remainingSeconds":I
    :cond_46
    return-void
.end method
