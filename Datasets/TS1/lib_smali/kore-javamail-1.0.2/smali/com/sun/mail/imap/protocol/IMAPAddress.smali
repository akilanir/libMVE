.class Lcom/sun/mail/imap/protocol/IMAPAddress;
.super Lkorex/mail/internet/InternetAddress;
.source "ENVELOPE.java"


# static fields
.field private static final serialVersionUID:J = -0x353b93d010f59e38L


# instance fields
.field private group:Z

.field private grouplist:[Lkorex/mail/internet/InternetAddress;

.field private groupname:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/sun/mail/iap/Response;)V
    .registers 10
    .param p1, "r"    # Lcom/sun/mail/iap/Response;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sun/mail/iap/ParsingException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x29

    .line 162
    invoke-direct {p0}, Lkorex/mail/internet/InternetAddress;-><init>()V

    .line 156
    const/4 v5, 0x0

    iput-boolean v5, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->group:Z

    .line 163
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 165
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v5

    const/16 v6, 0x28

    if-eq v5, v6, :cond_1b

    .line 166
    new-instance v5, Lcom/sun/mail/iap/ParsingException;

    const-string v6, "ADDRESS parse error"

    invoke-direct {v5, v6}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 168
    :cond_1b
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->encodedPersonal:Ljava/lang/String;

    .line 170
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readString()Ljava/lang/String;

    .line 171
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readString()Ljava/lang/String;

    move-result-object v2

    .line 172
    .local v2, "mb":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readString()Ljava/lang/String;

    move-result-object v1

    .line 175
    .local v1, "host":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->skipSpaces()V

    .line 176
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->readByte()B

    move-result v5

    if-eq v5, v7, :cond_3d

    .line 177
    new-instance v5, Lcom/sun/mail/iap/ParsingException;

    const-string v6, "ADDRESS parse error"

    invoke-direct {v5, v6}, Lcom/sun/mail/iap/ParsingException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 179
    :cond_3d
    if-nez v1, :cond_9f

    .line 181
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->group:Z

    .line 182
    iput-object v2, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->groupname:Ljava/lang/String;

    .line 183
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->groupname:Ljava/lang/String;

    if-nez v5, :cond_49

    .line 212
    :goto_48
    return-void

    .line 188
    :cond_49
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 189
    .local v3, "sb":Ljava/lang/StringBuffer;
    iget-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->groupname:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const/16 v6, 0x3a

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 190
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 191
    .local v4, "v":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/internet/InternetAddress;>;"
    :goto_5e
    invoke-virtual {p1}, Lcom/sun/mail/iap/Response;->peekByte()B

    move-result v5

    if-eq v5, v7, :cond_6f

    .line 192
    new-instance v0, Lcom/sun/mail/imap/protocol/IMAPAddress;

    invoke-direct {v0, p1}, Lcom/sun/mail/imap/protocol/IMAPAddress;-><init>(Lcom/sun/mail/iap/Response;)V

    .line 193
    .local v0, "a":Lcom/sun/mail/imap/protocol/IMAPAddress;
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPAddress;->isEndOfGroup()Z

    move-result v5

    if-eqz v5, :cond_89

    .line 200
    .end local v0    # "a":Lcom/sun/mail/imap/protocol/IMAPAddress;
    :cond_6f
    const/16 v5, 0x3b

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 201
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->address:Ljava/lang/String;

    .line 202
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Lcom/sun/mail/imap/protocol/IMAPAddress;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Lkorex/mail/internet/InternetAddress;

    iput-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->grouplist:[Lkorex/mail/internet/InternetAddress;

    goto :goto_48

    .line 195
    .restart local v0    # "a":Lcom/sun/mail/imap/protocol/IMAPAddress;
    :cond_89
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    if-eqz v5, :cond_94

    .line 196
    const/16 v5, 0x2c

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 197
    :cond_94
    invoke-virtual {v0}, Lcom/sun/mail/imap/protocol/IMAPAddress;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 198
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_5e

    .line 204
    .end local v0    # "a":Lcom/sun/mail/imap/protocol/IMAPAddress;
    .end local v3    # "sb":Ljava/lang/StringBuffer;
    .end local v4    # "v":Ljava/util/List;, "Ljava/util/List<Lkorex/mail/internet/InternetAddress;>;"
    :cond_9f
    if-eqz v2, :cond_a7

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_aa

    .line 205
    :cond_a7
    iput-object v1, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->address:Ljava/lang/String;

    goto :goto_48

    .line 206
    :cond_aa
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_b3

    .line 207
    iput-object v2, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->address:Ljava/lang/String;

    goto :goto_48

    .line 209
    :cond_b3
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "@"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->address:Ljava/lang/String;

    goto/16 :goto_48
.end method


# virtual methods
.method public getGroup(Z)[Lkorex/mail/internet/InternetAddress;
    .registers 3
    .param p1, "strict"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/internet/AddressException;
        }
    .end annotation

    .prologue
    .line 223
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->grouplist:[Lkorex/mail/internet/InternetAddress;

    if-nez v0, :cond_6

    .line 224
    const/4 v0, 0x0

    .line 225
    :goto_5
    return-object v0

    :cond_6
    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->grouplist:[Lkorex/mail/internet/InternetAddress;

    invoke-virtual {v0}, [Lkorex/mail/internet/InternetAddress;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lkorex/mail/internet/InternetAddress;

    check-cast v0, [Lkorex/mail/internet/InternetAddress;

    goto :goto_5
.end method

.method isEndOfGroup()Z
    .registers 2

    .prologue
    .line 215
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->group:Z

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->groupname:Ljava/lang/String;

    if-nez v0, :cond_a

    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isGroup()Z
    .registers 2

    .prologue
    .line 219
    iget-boolean v0, p0, Lcom/sun/mail/imap/protocol/IMAPAddress;->group:Z

    return v0
.end method
