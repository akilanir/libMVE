.class public Lcom/sun/mail/imap/protocol/Namespaces;
.super Ljava/lang/Object;
.source "Namespaces.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sun/mail/imap/protocol/Namespaces$Namespace;
    }
.end annotation


# instance fields
.field public otherUsers:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

.field public personal:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

.field public shared:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;


# direct methods
.method public constructor <init>(Lcom/sun/mail/iap/Response;)V
    .registers 3
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 143
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/Namespaces;->getNamespaces(Lcom/sun/mail/iap/Response;)[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/Namespaces;->personal:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    .line 144
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/Namespaces;->getNamespaces(Lcom/sun/mail/iap/Response;)[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/Namespaces;->otherUsers:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    .line 145
    invoke-direct {p0, p1}, Lcom/sun/mail/imap/protocol/Namespaces;->getNamespaces(Lcom/sun/mail/iap/Response;)[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    move-result-object v0

    iput-object v0, p0, Lcom/sun/mail/imap/protocol/Namespaces;->shared:[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    .line 146
    return-void
.end method

.method private getNamespaces(Lcom/sun/mail/iap/Response;)[Lcom/sun/mail/imap/protocol/Namespaces$Namespace;
    .registers 8
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ProtocolException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 154
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->peekByte()B

    move-result v3

    const/16 v4, 0x28

    if-ne v3, v4, :cond_33

    .line 155
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v2, "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/Namespaces$Namespace;>;"
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    .line 158
    :cond_13
    new-instance v0, Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    invoke-direct {v0, p1}, Lcom/sun/mail/imap/protocol/Namespaces$Namespace;-><init>(Lcom/sun/mail/iap/Response;)V

    .line 159
    .local v0, "ns":Lcom/sun/mail/imap/protocol/Namespaces$Namespace;
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 160
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->peekByte()B

    move-result v3

    const/16 v4, 0x29

    if-ne v3, v4, :cond_13

    .line 161
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    .line 162
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/sun/mail/imap/protocol/Namespaces$Namespace;

    .line 169
    .end local v0    # "ns":Lcom/sun/mail/imap/protocol/Namespaces$Namespace;
    .end local v2    # "v":Ljava/util/List;, "Ljava/util/List<Lcom/sun/mail/imap/protocol/Namespaces$Namespace;>;"
    :goto_32
    return-object v3

    .line 164
    :cond_33
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readAtom()Ljava/lang/String;

    move-result-object v1

    .line 165
    .local v1, "s":Ljava/lang/String;
    if-nez v1, :cond_41

    .line 166
    new-instance v3, Lcom/sun/mail/iap/ProtocolException;

    const-string v4, "Expected NIL, got null"

    invoke-direct {v3, v4}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 167
    :cond_41
    const-string v3, "NIL"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_62

    .line 168
    new-instance v3, Lcom/sun/mail/iap/ProtocolException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected NIL, got "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/sun/mail/iap/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 169
    :cond_62
    const/4 v3, 0x0

    goto :goto_32
.end method
