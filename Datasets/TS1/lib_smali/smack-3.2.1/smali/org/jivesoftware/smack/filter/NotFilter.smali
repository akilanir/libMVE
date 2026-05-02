.class public Lorg/jivesoftware/smack/filter/NotFilter;
.super Ljava/lang/Object;
.source "NotFilter.java"

# interfaces
.implements Lorg/jivesoftware/smack/filter/PacketFilter;


# instance fields
.field private filter:Lorg/jivesoftware/smack/filter/PacketFilter;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .registers 4
    .param p1, "filter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    if-nez p1, :cond_d

    .line 42
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parameter cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_d
    iput-object p1, p0, Lorg/jivesoftware/smack/filter/NotFilter;->filter:Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 45
    return-void
.end method


# virtual methods
.method public accept(Lorg/jivesoftware/smack/packet/Packet;)Z
    .registers 3
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 48
    iget-object v0, p0, Lorg/jivesoftware/smack/filter/NotFilter;->filter:Lorg/jivesoftware/smack/filter/PacketFilter;

    invoke-interface {v0, p1}, Lorg/jivesoftware/smack/filter/PacketFilter;->accept(Lorg/jivesoftware/smack/packet/Packet;)Z

    move-result v0

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method
