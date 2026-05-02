.class public final Lkorex/mail/search/FromTerm;
.super Lkorex/mail/search/AddressTerm;
.source "FromTerm.java"


# static fields
.field private static final serialVersionUID:J = 0x485e7192407c3469L


# direct methods
.method public constructor <init>(Lkorex/mail/Address;)V
    .registers 2
    .param p1, "address"    # Lkorex/mail/Address;

    .prologue
    .line 61
    invoke-direct {p0, p1}, Lkorex/mail/search/AddressTerm;-><init>(Lkorex/mail/Address;)V

    .line 62
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 92
    instance-of v0, p1, Lkorex/mail/search/FromTerm;

    if-nez v0, :cond_6

    .line 93
    const/4 v0, 0x0

    .line 94
    :goto_5
    return v0

    :cond_6
    invoke-super {p0, p1}, Lkorex/mail/search/AddressTerm;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 7
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v3, 0x0

    .line 74
    :try_start_1
    invoke-virtual {p1}, Lkorex/mail/Message;->getFrom()[Lkorex/mail/Address;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_8

    move-result-object v1

    .line 79
    .local v1, "from":[Lkorex/mail/Address;
    if-nez v1, :cond_a

    .line 85
    .end local v1    # "from":[Lkorex/mail/Address;
    :cond_7
    :goto_7
    return v3

    .line 75
    :catch_8
    move-exception v0

    .line 76
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_7

    .line 82
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "from":[Lkorex/mail/Address;
    :cond_a
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    array-length v4, v1

    if-ge v2, v4, :cond_7

    .line 83
    aget-object v4, v1, v2

    invoke-super {p0, v4}, Lkorex/mail/search/AddressTerm;->match(Lkorex/mail/Address;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 84
    const/4 v3, 0x1

    goto :goto_7

    .line 82
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_b
.end method
