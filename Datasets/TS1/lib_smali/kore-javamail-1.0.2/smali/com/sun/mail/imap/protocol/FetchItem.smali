.class public abstract Lcom/sun/mail/imap/protocol/FetchItem;
.super Ljava/lang/Object;
.source "FetchItem.java"


# instance fields
.field private fetchProfileItem:Lkorex/mail/FetchProfile$Item;

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lkorex/mail/FetchProfile$Item;)V
    .registers 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "fetchProfileItem"    # Lkorex/mail/FetchProfile$Item;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/sun/mail/imap/protocol/FetchItem;->name:Ljava/lang/String;

    .line 63
    iput-object p2, p0, Lcom/sun/mail/imap/protocol/FetchItem;->fetchProfileItem:Lkorex/mail/FetchProfile$Item;

    .line 64
    return-void
.end method


# virtual methods
.method public getFetchProfileItem()Lkorex/mail/FetchProfile$Item;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/FetchItem;->fetchProfileItem:Lkorex/mail/FetchProfile$Item;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/FetchItem;->name:Ljava/lang/String;

    return-object v0
.end method

.method public abstract parseItem(Lcom/sun/mail/imap/protocol/FetchResponse;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation
.end method
