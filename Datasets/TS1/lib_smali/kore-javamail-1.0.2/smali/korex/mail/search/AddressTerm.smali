.class public abstract Lkorex/mail/search/AddressTerm;
.super Lkorex/mail/search/SearchTerm;
.source "AddressTerm.java"


# static fields
.field private static final serialVersionUID:J = 0x1bd4a1b9715ebffcL


# instance fields
.field protected address:Lkorex/mail/Address;


# direct methods
.method protected constructor <init>(Lkorex/mail/Address;)V
    .registers 2
    .param p1, "address"    # Lkorex/mail/Address;

    .prologue
    .line 62
    invoke-direct {p0}, Lkorex/mail/search/SearchTerm;-><init>()V

    .line 63
    iput-object p1, p0, Lkorex/mail/search/AddressTerm;->address:Lkorex/mail/Address;

    .line 64
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 89
    instance-of v1, p1, Lkorex/mail/search/AddressTerm;

    if-nez v1, :cond_6

    .line 90
    const/4 v1, 0x0

    .line 92
    :goto_5
    return v1

    :cond_6
    move-object v0, p1

    .line 91
    check-cast v0, Lkorex/mail/search/AddressTerm;

    .line 92
    .local v0, "at":Lkorex/mail/search/AddressTerm;
    iget-object v1, v0, Lkorex/mail/search/AddressTerm;->address:Lkorex/mail/Address;

    iget-object v2, p0, Lkorex/mail/search/AddressTerm;->address:Lkorex/mail/Address;

    invoke-virtual {v1, v2}, Lkorex/mail/Address;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_5
.end method

.method public getAddress()Lkorex/mail/Address;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lkorex/mail/search/AddressTerm;->address:Lkorex/mail/Address;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 99
    iget-object v0, p0, Lkorex/mail/search/AddressTerm;->address:Lkorex/mail/Address;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method protected match(Lkorex/mail/Address;)Z
    .registers 3
    .param p1, "a"    # Lkorex/mail/Address;

    .prologue
    .line 82
    iget-object v0, p0, Lkorex/mail/search/AddressTerm;->address:Lkorex/mail/Address;

    invoke-virtual {p1, v0}, Lkorex/mail/Address;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
