.class public final Lkorex/mail/search/ReceivedDateTerm;
.super Lkorex/mail/search/DateTerm;
.source "ReceivedDateTerm.java"


# static fields
.field private static final serialVersionUID:J = -0x2641bfb8877db042L


# direct methods
.method public constructor <init>(ILjava/util/Date;)V
    .registers 3
    .param p1, "comparison"    # I
    .param p2, "date"    # Ljava/util/Date;

    .prologue
    .line 64
    invoke-direct {p0, p1, p2}, Lkorex/mail/search/DateTerm;-><init>(ILjava/util/Date;)V

    .line 65
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 93
    instance-of v0, p1, Lkorex/mail/search/ReceivedDateTerm;

    if-nez v0, :cond_6

    .line 94
    const/4 v0, 0x0

    .line 95
    :goto_5
    return v0

    :cond_6
    invoke-super {p0, p1}, Lkorex/mail/search/DateTerm;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_5
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 5
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v2, 0x0

    .line 78
    :try_start_1
    invoke-virtual {p1}, Lkorex/mail/Message;->getReceivedDate()Ljava/util/Date;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_8

    move-result-object v0

    .line 83
    .local v0, "d":Ljava/util/Date;
    if-nez v0, :cond_a

    .line 86
    .end local v0    # "d":Ljava/util/Date;
    :goto_7
    return v2

    .line 79
    :catch_8
    move-exception v1

    .line 80
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_7

    .line 86
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "d":Ljava/util/Date;
    :cond_a
    invoke-super {p0, v0}, Lkorex/mail/search/DateTerm;->match(Ljava/util/Date;)Z

    move-result v2

    goto :goto_7
.end method
