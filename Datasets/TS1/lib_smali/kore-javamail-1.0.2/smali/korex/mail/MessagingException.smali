.class public Lkorex/mail/MessagingException;
.super Ljava/lang/Exception;
.source "MessagingException.java"


# static fields
.field private static final serialVersionUID:J = -0x690b2c48c7581fd5L


# instance fields
.field private next:Ljava/lang/Exception;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 68
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkorex/mail/MessagingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 77
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 78
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkorex/mail/MessagingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "e"    # Ljava/lang/Exception;

    .prologue
    .line 93
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 94
    iput-object p2, p0, Lkorex/mail/MessagingException;->next:Ljava/lang/Exception;

    .line 95
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lkorex/mail/MessagingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 96
    return-void
.end method

.method private final superToString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 172
    invoke-super {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public declared-synchronized getCause()Ljava/lang/Throwable;
    .registers 2

    .prologue
    .line 116
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/MessagingException;->next:Ljava/lang/Exception;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getNextException()Ljava/lang/Exception;
    .registers 2

    .prologue
    .line 106
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/MessagingException;->next:Ljava/lang/Exception;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setNextException(Ljava/lang/Exception;)Z
    .registers 5
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 129
    monitor-enter p0

    move-object v1, p0

    .line 130
    .local v1, "theEnd":Ljava/lang/Exception;
    :goto_2
    :try_start_2
    instance-of v2, v1, Lkorex/mail/MessagingException;

    if-eqz v2, :cond_13

    move-object v0, v1

    check-cast v0, Lkorex/mail/MessagingException;

    move-object v2, v0

    iget-object v2, v2, Lkorex/mail/MessagingException;->next:Ljava/lang/Exception;

    if-eqz v2, :cond_13

    .line 132
    check-cast v1, Lkorex/mail/MessagingException;

    .end local v1    # "theEnd":Ljava/lang/Exception;
    iget-object v1, v1, Lkorex/mail/MessagingException;->next:Ljava/lang/Exception;

    .restart local v1    # "theEnd":Ljava/lang/Exception;
    goto :goto_2

    .line 136
    :cond_13
    instance-of v2, v1, Lkorex/mail/MessagingException;

    if-eqz v2, :cond_1e

    .line 137
    check-cast v1, Lkorex/mail/MessagingException;

    .end local v1    # "theEnd":Ljava/lang/Exception;
    iput-object p1, v1, Lkorex/mail/MessagingException;->next:Ljava/lang/Exception;
    :try_end_1b
    .catchall {:try_start_2 .. :try_end_1b} :catchall_20

    .line 138
    const/4 v2, 0x1

    .line 140
    :goto_1c
    monitor-exit p0

    return v2

    .restart local v1    # "theEnd":Ljava/lang/Exception;
    :cond_1e
    const/4 v2, 0x0

    goto :goto_1c

    .line 129
    .end local v1    # "theEnd":Ljava/lang/Exception;
    :catchall_20
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized toString()Ljava/lang/String;
    .registers 7

    .prologue
    .line 148
    monitor-enter p0

    :try_start_1
    invoke-super {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    .line 149
    .local v3, "s":Ljava/lang/String;
    iget-object v2, p0, Lkorex/mail/MessagingException;->next:Ljava/lang/Exception;
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_3b

    .line 150
    .local v2, "n":Ljava/lang/Exception;
    if-nez v2, :cond_b

    .line 164
    .end local v3    # "s":Ljava/lang/String;
    :goto_9
    monitor-exit p0

    return-object v3

    .line 152
    .restart local v3    # "s":Ljava/lang/String;
    :cond_b
    :try_start_b
    new-instance v4, Ljava/lang/StringBuffer;

    if-nez v3, :cond_11

    const-string v3, ""

    .end local v3    # "s":Ljava/lang/String;
    :cond_11
    invoke-direct {v4, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 153
    .local v4, "sb":Ljava/lang/StringBuffer;
    :goto_14
    if-eqz v2, :cond_36

    .line 154
    const-string v5, ";\n  nested exception is:\n\t"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 155
    instance-of v5, v2, Lkorex/mail/MessagingException;

    if-eqz v5, :cond_2d

    .line 156
    move-object v0, v2

    check-cast v0, Lkorex/mail/MessagingException;

    move-object v1, v0

    .line 157
    .local v1, "mex":Lkorex/mail/MessagingException;
    invoke-direct {v1}, Lkorex/mail/MessagingException;->superToString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 158
    iget-object v2, v1, Lkorex/mail/MessagingException;->next:Ljava/lang/Exception;

    .line 159
    goto :goto_14

    .line 160
    .end local v1    # "mex":Lkorex/mail/MessagingException;
    :cond_2d
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 161
    const/4 v2, 0x0

    goto :goto_14

    .line 164
    :cond_36
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_39
    .catchall {:try_start_b .. :try_end_39} :catchall_3b

    move-result-object v3

    goto :goto_9

    .line 148
    .end local v2    # "n":Ljava/lang/Exception;
    .end local v4    # "sb":Ljava/lang/StringBuffer;
    :catchall_3b
    move-exception v5

    monitor-exit p0

    throw v5
.end method
