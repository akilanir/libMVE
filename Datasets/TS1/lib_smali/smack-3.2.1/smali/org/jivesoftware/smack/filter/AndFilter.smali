.class public Lorg/jivesoftware/smack/filter/AndFilter;
.super Ljava/lang/Object;
.source "AndFilter.java"

# interfaces
.implements Lorg/jivesoftware/smack/filter/PacketFilter;


# instance fields
.field private filters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/filter/PacketFilter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/filter/AndFilter;->filters:Ljava/util/List;

    .line 47
    return-void
.end method

.method public varargs constructor <init>([Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .registers 8
    .param p1, "filters"    # [Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lorg/jivesoftware/smack/filter/AndFilter;->filters:Ljava/util/List;

    .line 55
    if-nez p1, :cond_14

    .line 56
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Parameter cannot be null."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 58
    :cond_14
    move-object v0, p1

    .local v0, "arr$":[Lorg/jivesoftware/smack/filter/PacketFilter;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_17
    if-ge v2, v3, :cond_2d

    aget-object v1, v0, v2

    .line 59
    .local v1, "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    if-nez v1, :cond_25

    .line 60
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "Parameter cannot be null."

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 62
    :cond_25
    iget-object v4, p0, Lorg/jivesoftware/smack/filter/AndFilter;->filters:Ljava/util/List;

    invoke-interface {v4, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .line 64
    .end local v1    # "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    :cond_2d
    return-void
.end method


# virtual methods
.method public accept(Lorg/jivesoftware/smack/packet/Packet;)Z
    .registers 5
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 80
    iget-object v2, p0, Lorg/jivesoftware/smack/filter/AndFilter;->filters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_6
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/filter/PacketFilter;

    .line 81
    .local v0, "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    invoke-interface {v0, p1}, Lorg/jivesoftware/smack/filter/PacketFilter;->accept(Lorg/jivesoftware/smack/packet/Packet;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 82
    const/4 v2, 0x0

    .line 85
    .end local v0    # "filter":Lorg/jivesoftware/smack/filter/PacketFilter;
    :goto_19
    return v2

    :cond_1a
    const/4 v2, 0x1

    goto :goto_19
.end method

.method public addFilter(Lorg/jivesoftware/smack/filter/PacketFilter;)V
    .registers 4
    .param p1, "filter"    # Lorg/jivesoftware/smack/filter/PacketFilter;

    .prologue
    .line 73
    if-nez p1, :cond_a

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parameter cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_a
    iget-object v0, p0, Lorg/jivesoftware/smack/filter/AndFilter;->filters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 89
    iget-object v0, p0, Lorg/jivesoftware/smack/filter/AndFilter;->filters:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
