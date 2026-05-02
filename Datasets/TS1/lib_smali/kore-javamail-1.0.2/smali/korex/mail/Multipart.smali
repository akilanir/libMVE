.class public abstract Lkorex/mail/Multipart;
.super Ljava/lang/Object;
.source "Multipart.java"


# instance fields
.field protected contentType:Ljava/lang/String;

.field protected parent:Lkorex/mail/Part;

.field protected parts:Ljava/util/Vector;


# direct methods
.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    .line 79
    const-string v0, "multipart/mixed"

    iput-object v0, p0, Lkorex/mail/Multipart;->contentType:Ljava/lang/String;

    .line 91
    return-void
.end method


# virtual methods
.method public declared-synchronized addBodyPart(Lkorex/mail/BodyPart;)V
    .registers 3
    .param p1, "part"    # Lkorex/mail/BodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 217
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    if-nez v0, :cond_c

    .line 218
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    .line 220
    :cond_c
    iget-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 221
    invoke-virtual {p1, p0}, Lkorex/mail/BodyPart;->setParent(Lkorex/mail/Multipart;)V
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 222
    monitor-exit p0

    return-void

    .line 217
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized addBodyPart(Lkorex/mail/BodyPart;I)V
    .registers 4
    .param p1, "part"    # Lkorex/mail/BodyPart;
    .param p2, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 240
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    if-nez v0, :cond_c

    .line 241
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    .line 243
    :cond_c
    iget-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    invoke-virtual {v0, p1, p2}, Ljava/util/Vector;->insertElementAt(Ljava/lang/Object;I)V

    .line 244
    invoke-virtual {p1, p0}, Lkorex/mail/BodyPart;->setParent(Lkorex/mail/Multipart;)V
    :try_end_14
    .catchall {:try_start_1 .. :try_end_14} :catchall_16

    .line 245
    monitor-exit p0

    return-void

    .line 240
    :catchall_16
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getBodyPart(I)Lkorex/mail/BodyPart;
    .registers 4
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 156
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    if-nez v0, :cond_10

    .line 157
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "No such BodyPart"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    .line 156
    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 159
    :cond_10
    :try_start_10
    iget-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/BodyPart;
    :try_end_18
    .catchall {:try_start_10 .. :try_end_18} :catchall_d

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized getContentType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 128
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Multipart;->contentType:Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getCount()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 139
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_f

    if-nez v0, :cond_8

    .line 140
    const/4 v0, 0x0

    .line 142
    :goto_6
    monitor-exit p0

    return v0

    :cond_8
    :try_start_8
    iget-object v0, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_f

    move-result v0

    goto :goto_6

    .line 139
    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getParent()Lkorex/mail/Part;
    .registers 2

    .prologue
    .line 268
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lkorex/mail/Multipart;->parent:Lkorex/mail/Part;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return-object v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeBodyPart(I)V
    .registers 5
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 197
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    if-nez v1, :cond_10

    .line 198
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    const-string v2, "No such BodyPart"

    invoke-direct {v1, v2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    .line 197
    :catchall_d
    move-exception v1

    monitor-exit p0

    throw v1

    .line 200
    :cond_10
    :try_start_10
    iget-object v1, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    invoke-virtual {v1, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkorex/mail/BodyPart;

    .line 201
    .local v0, "part":Lkorex/mail/BodyPart;
    iget-object v1, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    invoke-virtual {v1, p1}, Ljava/util/Vector;->removeElementAt(I)V

    .line 202
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lkorex/mail/BodyPart;->setParent(Lkorex/mail/Multipart;)V
    :try_end_21
    .catchall {:try_start_10 .. :try_end_21} :catchall_d

    .line 203
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized removeBodyPart(Lkorex/mail/BodyPart;)Z
    .registers 5
    .param p1, "part"    # Lkorex/mail/BodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 175
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    if-nez v1, :cond_10

    .line 176
    new-instance v1, Lkorex/mail/MessagingException;

    const-string v2, "No such body part"

    invoke-direct {v1, v2}, Lkorex/mail/MessagingException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_d

    .line 175
    :catchall_d
    move-exception v1

    monitor-exit p0

    throw v1

    .line 178
    :cond_10
    :try_start_10
    iget-object v1, p0, Lkorex/mail/Multipart;->parts:Ljava/util/Vector;

    invoke-virtual {v1, p1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    move-result v0

    .line 179
    .local v0, "ret":Z
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lkorex/mail/BodyPart;->setParent(Lkorex/mail/Multipart;)V
    :try_end_1a
    .catchall {:try_start_10 .. :try_end_1a} :catchall_d

    .line 180
    monitor-exit p0

    return v0
.end method

.method protected declared-synchronized setMultipartDataSource(Lkorex/mail/MultipartDataSource;)V
    .registers 5
    .param p1, "mp"    # Lkorex/mail/MultipartDataSource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 111
    monitor-enter p0

    :try_start_1
    invoke-interface {p1}, Lkorex/mail/MultipartDataSource;->getContentType()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lkorex/mail/Multipart;->contentType:Ljava/lang/String;

    .line 113
    invoke-interface {p1}, Lkorex/mail/MultipartDataSource;->getCount()I

    move-result v0

    .line 114
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_c
    if-ge v1, v0, :cond_18

    .line 115
    invoke-interface {p1, v1}, Lkorex/mail/MultipartDataSource;->getBodyPart(I)Lkorex/mail/BodyPart;

    move-result-object v2

    invoke-virtual {p0, v2}, Lkorex/mail/Multipart;->addBodyPart(Lkorex/mail/BodyPart;)V
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_1a

    .line 114
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    .line 116
    :cond_18
    monitor-exit p0

    return-void

    .line 111
    .end local v0    # "count":I
    .end local v1    # "i":I
    :catchall_1a
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized setParent(Lkorex/mail/Part;)V
    .registers 3
    .param p1, "parent"    # Lkorex/mail/Part;

    .prologue
    .line 283
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lkorex/mail/Multipart;->parent:Lkorex/mail/Part;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 284
    monitor-exit p0

    return-void

    .line 283
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public abstract writeTo(Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation
.end method
