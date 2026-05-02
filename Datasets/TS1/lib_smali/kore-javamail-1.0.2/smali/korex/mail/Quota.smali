.class public Lkorex/mail/Quota;
.super Ljava/lang/Object;
.source "Quota.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lkorex/mail/Quota$Resource;
    }
.end annotation


# instance fields
.field public quotaRoot:Ljava/lang/String;

.field public resources:[Lkorex/mail/Quota$Resource;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "quotaRoot"    # Ljava/lang/String;

    .prologue
    .line 102
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 103
    iput-object p1, p0, Lkorex/mail/Quota;->quotaRoot:Ljava/lang/String;

    .line 104
    return-void
.end method


# virtual methods
.method public setResourceLimit(Ljava/lang/String;J)V
    .registers 14
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "limit"    # J

    .prologue
    const-wide/16 v2, 0x0

    const/4 v9, 0x0

    .line 113
    iget-object v0, p0, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    if-nez v0, :cond_18

    .line 114
    const/4 v0, 0x1

    new-array v0, v0, [Lkorex/mail/Quota$Resource;

    iput-object v0, p0, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    .line 115
    iget-object v8, p0, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    new-instance v0, Lkorex/mail/Quota$Resource;

    move-object v1, p1

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Lkorex/mail/Quota$Resource;-><init>(Ljava/lang/String;JJ)V

    aput-object v0, v8, v9

    .line 128
    :goto_17
    return-void

    .line 118
    :cond_18
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_19
    iget-object v0, p0, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    array-length v0, v0

    if-ge v6, v0, :cond_34

    .line 119
    iget-object v0, p0, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    aget-object v0, v0, v6

    iget-object v0, v0, Lkorex/mail/Quota$Resource;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 120
    iget-object v0, p0, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    aget-object v0, v0, v6

    iput-wide p2, v0, Lkorex/mail/Quota$Resource;->limit:J

    goto :goto_17

    .line 118
    :cond_31
    add-int/lit8 v6, v6, 0x1

    goto :goto_19

    .line 124
    :cond_34
    iget-object v0, p0, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    array-length v0, v0

    add-int/lit8 v0, v0, 0x1

    new-array v7, v0, [Lkorex/mail/Quota$Resource;

    .line 125
    .local v7, "ra":[Lkorex/mail/Quota$Resource;
    iget-object v0, p0, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    iget-object v1, p0, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    array-length v1, v1

    invoke-static {v0, v9, v7, v9, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 126
    array-length v0, v7

    add-int/lit8 v8, v0, -0x1

    new-instance v0, Lkorex/mail/Quota$Resource;

    move-object v1, p1

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Lkorex/mail/Quota$Resource;-><init>(Ljava/lang/String;JJ)V

    aput-object v0, v7, v8

    .line 127
    iput-object v7, p0, Lkorex/mail/Quota;->resources:[Lkorex/mail/Quota$Resource;

    goto :goto_17
.end method
