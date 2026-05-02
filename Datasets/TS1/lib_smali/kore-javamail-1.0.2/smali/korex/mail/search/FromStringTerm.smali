.class public final Lkorex/mail/search/FromStringTerm;
.super Lkorex/mail/search/AddressStringTerm;
.source "FromStringTerm.java"


# static fields
.field private static final serialVersionUID:J = 0x5081bebf4a6fab34L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lkorex/mail/search/AddressStringTerm;-><init>(Ljava/lang/String;)V

    .line 68
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 100
    instance-of v0, p1, Lkorex/mail/search/FromStringTerm;

    if-nez v0, :cond_6

    .line 101
    const/4 v0, 0x0

    .line 102
    :goto_5
    return v0

    :cond_6
    invoke-super {p0, p1}, Lkorex/mail/search/AddressStringTerm;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 7
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v3, 0x0

    .line 82
    :try_start_1
    invoke-virtual {p1}, Lkorex/mail/Message;->getFrom()[Lkorex/mail/Address;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_8

    move-result-object v1

    .line 87
    .local v1, "from":[Lkorex/mail/Address;
    if-nez v1, :cond_a

    .line 93
    .end local v1    # "from":[Lkorex/mail/Address;
    :cond_7
    :goto_7
    return v3

    .line 83
    :catch_8
    move-exception v0

    .line 84
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_7

    .line 90
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "from":[Lkorex/mail/Address;
    :cond_a
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    array-length v4, v1

    if-ge v2, v4, :cond_7

    .line 91
    aget-object v4, v1, v2

    invoke-super {p0, v4}, Lkorex/mail/search/AddressStringTerm;->match(Lkorex/mail/Address;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 92
    const/4 v3, 0x1

    goto :goto_7

    .line 90
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_b
.end method
