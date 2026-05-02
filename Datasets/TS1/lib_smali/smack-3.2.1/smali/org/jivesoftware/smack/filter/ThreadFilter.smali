.class public Lorg/jivesoftware/smack/filter/ThreadFilter;
.super Ljava/lang/Object;
.source "ThreadFilter.java"

# interfaces
.implements Lorg/jivesoftware/smack/filter/PacketFilter;


# instance fields
.field private thread:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "thread"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    if-nez p1, :cond_d

    .line 42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Thread cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_d
    iput-object p1, p0, Lorg/jivesoftware/smack/filter/ThreadFilter;->thread:Ljava/lang/String;

    .line 45
    return-void
.end method


# virtual methods
.method public accept(Lorg/jivesoftware/smack/packet/Packet;)Z
    .registers 4
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 48
    instance-of v0, p1, Lorg/jivesoftware/smack/packet/Message;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lorg/jivesoftware/smack/filter/ThreadFilter;->thread:Ljava/lang/String;

    check-cast p1, Lorg/jivesoftware/smack/packet/Message;

    .end local p1    # "packet":Lorg/jivesoftware/smack/packet/Packet;
    invoke-virtual {p1}, Lorg/jivesoftware/smack/packet/Message;->getThread()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method
