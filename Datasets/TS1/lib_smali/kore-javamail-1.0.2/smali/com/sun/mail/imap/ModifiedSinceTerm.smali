.class public final Lcom/sun/mail/imap/ModifiedSinceTerm;
.super Lkorex/mail/search/SearchTerm;
.source "ModifiedSinceTerm.java"


# static fields
.field private static final serialVersionUID:J = 0x477da746691c5038L


# instance fields
.field private modseq:J


# direct methods
.method public constructor <init>(J)V
    .registers 3
    .param p1, "modseq"    # J

    .prologue
    .line 66
    invoke-direct {p0}, Lkorex/mail/search/SearchTerm;-><init>()V

    .line 67
    iput-wide p1, p0, Lcom/sun/mail/imap/ModifiedSinceTerm;->modseq:J

    .line 68
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v0, 0x0

    .line 105
    instance-of v1, p1, Lcom/sun/mail/imap/ModifiedSinceTerm;

    if-nez v1, :cond_6

    .line 107
    .end local p1    # "obj":Ljava/lang/Object;
    :cond_5
    :goto_5
    return v0

    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_6
    iget-wide v1, p0, Lcom/sun/mail/imap/ModifiedSinceTerm;->modseq:J

    check-cast p1, Lcom/sun/mail/imap/ModifiedSinceTerm;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-wide v3, p1, Lcom/sun/mail/imap/ModifiedSinceTerm;->modseq:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_5

    const/4 v0, 0x1

    goto :goto_5
.end method

.method public getModSeq()J
    .registers 3

    .prologue
    .line 76
    iget-wide v0, p0, Lcom/sun/mail/imap/ModifiedSinceTerm;->modseq:J

    return-wide v0
.end method

.method public hashCode()I
    .registers 3

    .prologue
    .line 114
    iget-wide v0, p0, Lcom/sun/mail/imap/ModifiedSinceTerm;->modseq:J

    long-to-int v0, v0

    return v0
.end method

.method public match(Lkorex/mail/Message;)Z
    .registers 8
    .param p1, "msg"    # Lkorex/mail/Message;

    .prologue
    const/4 v3, 0x0

    .line 90
    :try_start_1
    instance-of v4, p1, Lcom/sun/mail/imap/IMAPMessage;

    if-eqz v4, :cond_12

    .line 91
    check-cast p1, Lcom/sun/mail/imap/IMAPMessage;

    .end local p1    # "msg":Lkorex/mail/Message;
    invoke-virtual {p1}, Lcom/sun/mail/imap/IMAPMessage;->getModSeq()J
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a} :catch_13

    move-result-wide v1

    .line 98
    .local v1, "m":J
    iget-wide v4, p0, Lcom/sun/mail/imap/ModifiedSinceTerm;->modseq:J

    cmp-long v4, v1, v4

    if-ltz v4, :cond_12

    const/4 v3, 0x1

    .end local v1    # "m":J
    :cond_12
    :goto_12
    return v3

    .line 94
    :catch_13
    move-exception v0

    .line 95
    .local v0, "e":Ljava/lang/Exception;
    goto :goto_12
.end method
