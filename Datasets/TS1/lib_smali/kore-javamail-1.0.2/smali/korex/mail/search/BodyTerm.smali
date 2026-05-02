.class public final Lkorex/mail/search/BodyTerm;
.super Lkorex/mail/search/StringTerm;
.source "BodyTerm.java"


# static fields
.field private static final serialVersionUID:J = -0x43d8ba911c34ab19L


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0, p1}, Lkorex/mail/search/StringTerm;-><init>(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method private matchPart(Lkorex/mail/Part;)Z
    .registers 8
    .param p1, "p"    # Lkorex/mail/Part;

    .prologue
    const/4 v5, 0x0

    .line 89
    :try_start_1
    const-string v4, "text/*"

    invoke-interface {p1, v4}, Lkorex/mail/Part;->isMimeType(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_18

    .line 90
    invoke-interface {p1}, Lkorex/mail/Part;->getContent()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 91
    .local v3, "s":Ljava/lang/String;
    if-nez v3, :cond_13

    move v4, v5

    .line 115
    .end local v3    # "s":Ljava/lang/String;
    :goto_12
    return v4

    .line 101
    .restart local v3    # "s":Ljava/lang/String;
    :cond_13
    invoke-super {p0, v3}, Lkorex/mail/search/StringTerm;->match(Ljava/lang/String;)Z

    move-result v4

    goto :goto_12

    .line 102
    .end local v3    # "s":Ljava/lang/String;
    :cond_18
    const-string v4, "multipart/*"

    invoke-interface {p1, v4}, Lkorex/mail/Part;->isMimeType(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3c

    .line 103
    invoke-interface {p1}, Lkorex/mail/Part;->getContent()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkorex/mail/Multipart;

    .line 104
    .local v2, "mp":Lkorex/mail/Multipart;
    invoke-virtual {v2}, Lkorex/mail/Multipart;->getCount()I

    move-result v0

    .line 105
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_2b
    if-ge v1, v0, :cond_50

    .line 106
    invoke-virtual {v2, v1}, Lkorex/mail/Multipart;->getBodyPart(I)Lkorex/mail/BodyPart;

    move-result-object v4

    invoke-direct {p0, v4}, Lkorex/mail/search/BodyTerm;->matchPart(Lkorex/mail/Part;)Z

    move-result v4

    if-eqz v4, :cond_39

    .line 107
    const/4 v4, 0x1

    goto :goto_12

    .line 105
    :cond_39
    add-int/lit8 v1, v1, 0x1

    goto :goto_2b

    .line 108
    .end local v0    # "count":I
    .end local v1    # "i":I
    .end local v2    # "mp":Lkorex/mail/Multipart;
    :cond_3c
    const-string v4, "message/rfc822"

    invoke-interface {p1, v4}, Lkorex/mail/Part;->isMimeType(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_50

    .line 109
    invoke-interface {p1}, Lkorex/mail/Part;->getContent()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkorex/mail/Part;

    invoke-direct {p0, v4}, Lkorex/mail/search/BodyTerm;->matchPart(Lkorex/mail/Part;)Z
    :try_end_4d
    .catch Lkorex/mail/MessagingException; {:try_start_1 .. :try_end_4d} :catch_54
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_4d} :catch_52
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_4d} :catch_4f

    move-result v4

    goto :goto_12

    .line 113
    :catch_4f
    move-exception v4

    :cond_50
    :goto_50
    move v4, v5

    .line 115
    goto :goto_12

    .line 112
    :catch_52
    move-exception v4

    goto :goto_50

    .line 111
    :catch_54
    move-exception v4

    goto :goto_50
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 122
    instance-of v0, p1, Lkorex/mail/search/BodyTerm;

    if-nez v0, :cond_6

    .line 123
    const/4 v0, 0x0

    .line 124
    :goto_5
    return v0

    :cond_6
    invoke-super {p0, p1}, Lkorex/mail/search/StringTerm;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 3
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    .line 76
    invoke-direct {p0, p1}, Lkorex/mail/search/BodyTerm;->matchPart(Lkorex/mail/Part;)Z

    move-result v0

    return v0
.end method
