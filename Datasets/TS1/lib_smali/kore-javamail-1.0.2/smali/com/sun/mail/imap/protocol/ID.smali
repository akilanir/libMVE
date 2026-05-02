.class public Lcom/sun/mail/imap/protocol/ID;
.super Ljava/lang/Object;
.source "ID.java"


# instance fields
.field private serverParams:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/sun/mail/iap/Response;)V
    .registers 10
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const/4 v5, 0x0

    iput-object v5, p0, Lcom/sun/mail/imap/protocol/ID;->serverParams:Ljava/util/Map;

    .line 67
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 68
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->peekByte()B

    move-result v0

    .line 69
    .local v0, "c":I
    const/16 v5, 0x4e

    if-eq v0, v5, :cond_15

    const/16 v5, 0x6e

    if-ne v0, v5, :cond_16

    .line 91
    :cond_15
    :goto_15
    return-void

    .line 72
    :cond_16
    const/16 v5, 0x28

    if-eq v0, v5, :cond_22

    .line 73
    new-instance v5, Lcom/sun/mail/iap/ProtocolException;

    const-string v6, "Missing \'(\' at start of ID"

    invoke-direct {v5, v6}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 75
    :cond_22
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lcom/sun/mail/imap/protocol/ID;->serverParams:Ljava/util/Map;

    .line 77
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readStringList()[Ljava/lang/String;

    move-result-object v3

    .line 78
    .local v3, "v":[Ljava/lang/String;
    if-eqz v3, :cond_69

    .line 79
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_30
    array-length v5, v3

    if-ge v1, v5, :cond_69

    .line 80
    aget-object v2, v3, v1

    .line 81
    .local v2, "name":Ljava/lang/String;
    if-nez v2, :cond_3f

    .line 82
    new-instance v5, Lcom/sun/mail/iap/ProtocolException;

    const-string v6, "ID field name null"

    invoke-direct {v5, v6}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 83
    :cond_3f
    add-int/lit8 v5, v1, 0x1

    array-length v6, v3

    if-lt v5, v6, :cond_5d

    .line 84
    new-instance v5, Lcom/sun/mail/iap/ProtocolException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "ID field without value: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 86
    :cond_5d
    add-int/lit8 v5, v1, 0x1

    aget-object v4, v3, v5

    .line 87
    .local v4, "value":Ljava/lang/String;
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/ID;->serverParams:Ljava/util/Map;

    invoke-interface {v5, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    add-int/lit8 v1, v1, 0x2

    goto :goto_30

    .line 90
    .end local v1    # "i":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_69
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/ID;->serverParams:Ljava/util/Map;

    invoke-static {v5}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v5

    iput-object v5, p0, Lcom/sun/mail/imap/protocol/ID;->serverParams:Ljava/util/Map;

    goto :goto_15
.end method

.method static getArgumentList(Ljava/util/Map;)Lcom/sun/mail/iap/Argument;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/sun/mail/iap/Argument;"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "clientParams":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/sun/mail/iap/Argument;

    invoke-direct {v0}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 105
    .local v0, "arg":Lcom/sun/mail/iap/Argument;
    if-nez p0, :cond_d

    .line 106
    const-string v3, "NIL"

    invoke-virtual {v0, v3}, Lcom/sun/mail/iap/Argument;->writeString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 116
    :goto_c
    return-object v0

    .line 109
    :cond_d
    new-instance v2, Lcom/sun/mail/iap/Argument;

    invoke-direct {v2}, Lcom/sun/mail/iap/Argument;-><init>()V

    .line 111
    .local v2, "list":Lcom/sun/mail/iap/Argument;
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_39

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 112
    .local v1, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/sun/mail/iap/Argument;->writeNString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    .line 113
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/sun/mail/iap/Argument;->writeNString(Ljava/lang/String;)Lcom/sun/mail/iap/Argument;

    goto :goto_1a

    .line 115
    .end local v1    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_39
    invoke-virtual {v0, v2}, Lcom/sun/mail/iap/Argument;->writeArgument(Lcom/sun/mail/iap/Argument;)Lcom/sun/mail/iap/Argument;

    goto :goto_c
.end method


# virtual methods
.method getServerParams()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/ID;->serverParams:Ljava/util/Map;

    return-object v0
.end method
