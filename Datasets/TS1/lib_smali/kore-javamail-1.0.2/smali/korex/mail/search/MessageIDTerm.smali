.class public final Lkorex/mail/search/MessageIDTerm;
.super Lkorex/mail/search/StringTerm;
.source "MessageIDTerm.java"


# static fields
.field private static final serialVersionUID:J = -0x1d6fa5d7f4941c7bL


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "msgid"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-direct {p0, p1}, Lkorex/mail/search/StringTerm;-><init>(Ljava/lang/String;)V

    .line 68
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 99
    instance-of v0, p1, Lkorex/mail/search/MessageIDTerm;

    if-nez v0, :cond_6

    .line 100
    const/4 v0, 0x0

    .line 101
    :goto_5
    return v0

    :cond_6
    invoke-super {p0, p1}, Lkorex/mail/search/StringTerm;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 7
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v3, 0x0

    .line 81
    :try_start_1
    const-string v4, "Message-ID"

    invoke-virtual {p1, v4}, Lkorex/mail/Message;->getHeader(Ljava/lang/String;)[Ljava/lang/String;
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_6} :catch_a

    move-result-object v2

    .line 86
    .local v2, "s":[Ljava/lang/String;
    if-nez v2, :cond_c

    .line 92
    .end local v2    # "s":[Ljava/lang/String;
    :cond_9
    :goto_9
    return v3

    .line 82
    :catch_a
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_9

    .line 89
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "s":[Ljava/lang/String;
    :cond_c
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_d
    array-length v4, v2

    if-ge v1, v4, :cond_9

    .line 90
    aget-object v4, v2, v1

    invoke-super {p0, v4}, Lkorex/mail/search/StringTerm;->match(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 91
    const/4 v3, 0x1

    goto :goto_9

    .line 89
    :cond_1a
    add-int/lit8 v1, v1, 0x1

    goto :goto_d
.end method
