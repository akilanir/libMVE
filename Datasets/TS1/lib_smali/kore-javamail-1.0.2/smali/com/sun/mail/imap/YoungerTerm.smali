.class public final Lcom/sun/mail/imap/YoungerTerm;
.super Lkorex/mail/search/SearchTerm;
.source "YoungerTerm.java"


# static fields
.field private static final serialVersionUID:J = 0x161a7522d4c8dea8L


# instance fields
.field private interval:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .param p1, "interval"    # I

    .prologue
    .line 67
    invoke-direct {p0}, Lkorex/mail/search/SearchTerm;-><init>()V

    .line 68
    iput p1, p0, Lcom/sun/mail/imap/YoungerTerm;->interval:I

    .line 69
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 107
    instance-of v1, p1, Lcom/sun/mail/imap/YoungerTerm;

    if-nez v1, :cond_6

    .line 109
    .end local p1    # "obj":Ljava/lang/Object;
    :cond_5
    :goto_5
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_6
    iget v1, p0, Lcom/sun/mail/imap/YoungerTerm;->interval:I

    check-cast p1, Lcom/sun/mail/imap/YoungerTerm;

    .end local p1    # "obj":Ljava/lang/Object;
    iget v2, p1, Lcom/sun/mail/imap/YoungerTerm;->interval:I

    if-ne v1, v2, :cond_5

    const/4 v0, 0x1

    goto :goto_5
.end method

.method public getInterval()I
    .registers 2

    .prologue
    .line 77
    iget v0, p0, Lcom/sun/mail/imap/YoungerTerm;->interval:I

    return v0
.end method

.method public hashCode()I
    .registers 2

    .prologue
    .line 116
    iget v0, p0, Lcom/sun/mail/imap/YoungerTerm;->interval:I

    return v0
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 13
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v2, 0x0

    .line 91
    :try_start_1
    invoke-virtual {p1}, Lkorex/mail/Message;->getReceivedDate()Ljava/util/Date;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_4} :catch_8

    move-result-object v0

    .line 96
    .local v0, "d":Ljava/util/Date;
    if-nez v0, :cond_a

    .line 100
    .end local v0    # "d":Ljava/util/Date;
    :cond_7
    :goto_7
    return v2

    .line 92
    :catch_8
    move-exception v1

    .line 93
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_7

    .line 99
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "d":Ljava/util/Date;
    :cond_a
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    .line 100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget v7, p0, Lcom/sun/mail/imap/YoungerTerm;->interval:I

    int-to-long v7, v7

    const-wide/16 v9, 0x3e8

    mul-long/2addr v7, v9

    sub-long/2addr v5, v7

    cmp-long v3, v3, v5

    if-ltz v3, :cond_7

    const/4 v2, 0x1

    goto :goto_7
.end method
