.class public Lorg/kore/kolab/notes/imap/RemoteTags;
.super Ljava/lang/Object;
.source "RemoteTags.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    }
.end annotation


# static fields
.field public static final RELATION_TYPE:Ljava/lang/String; = "tag"

.field public static final TYPE:Ljava/lang/String; = "relation"


# instance fields
.field private final account:Lorg/kore/kolab/notes/AccountInformation;

.field private final parser:Lorg/kore/kolab/notes/KolabParser;

.field private remoteTags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;",
            ">;"
        }
    .end annotation
.end field

.field private final tagPerTagname:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;",
            ">;"
        }
    .end annotation
.end field

.field private final tagsForDeletion:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final tagsPerNote:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Set",
            "<",
            "Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/kore/kolab/notes/KolabParser;Lorg/kore/kolab/notes/AccountInformation;)V
    .registers 4
    .param p1, "parser"    # Lorg/kore/kolab/notes/KolabParser;
    .param p2, "login"    # Lorg/kore/kolab/notes/AccountInformation;

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p2, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->account:Lorg/kore/kolab/notes/AccountInformation;

    .line 63
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsPerNote:Ljava/util/Map;

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagPerTagname:Ljava/util/Map;

    .line 65
    iput-object p1, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->parser:Lorg/kore/kolab/notes/KolabParser;

    .line 66
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsForDeletion:Ljava/util/Set;

    .line 67
    return-void
.end method


# virtual methods
.method addToNotesMap(Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;)V
    .registers 6
    .param p1, "tag"    # Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    .prologue
    .line 339
    invoke-virtual {p1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getMembers()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 340
    .local v0, "note":Ljava/lang/String;
    iget-object v3, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsPerNote:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    .line 342
    .local v1, "tagsOfNote":Ljava/util/Set;, "Ljava/util/Set<Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;>;"
    if-nez v1, :cond_28

    .line 343
    new-instance v1, Ljava/util/LinkedHashSet;

    .end local v1    # "tagsOfNote":Ljava/util/Set;, "Ljava/util/Set<Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;>;"
    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 344
    .restart local v1    # "tagsOfNote":Ljava/util/Set;, "Ljava/util/Set<Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;>;"
    iget-object v3, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsPerNote:Ljava/util/Map;

    invoke-interface {v3, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    :cond_28
    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 349
    .end local v0    # "note":Ljava/lang/String;
    .end local v1    # "tagsOfNote":Ljava/util/Set;, "Ljava/util/Set<Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;>;"
    :cond_2c
    return-void
.end method

.method public varargs applyLocalChanges([Lorg/kore/kolab/notes/Tag;)V
    .registers 9
    .param p1, "tags"    # [Lorg/kore/kolab/notes/Tag;

    .prologue
    .line 80
    array-length v3, p1

    const/4 v2, 0x0

    :goto_2
    if-ge v2, v3, :cond_52

    aget-object v1, p1, v2

    .line 81
    .local v1, "tag":Lorg/kore/kolab/notes/Tag;
    iget-object v4, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->remoteTags:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_c
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    .line 82
    .local v0, "detail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    invoke-virtual {v0}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v5

    invoke-virtual {v5}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Tag;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v6

    invoke-virtual {v6}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 83
    invoke-virtual {v0}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v4

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Tag;->getColor()Lorg/kore/kolab/notes/Color;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/kore/kolab/notes/Tag;->setColor(Lorg/kore/kolab/notes/Color;)V

    .line 84
    invoke-virtual {v0}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v4

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Tag;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/kore/kolab/notes/Tag;->setName(Ljava/lang/String;)V

    .line 85
    invoke-virtual {v0}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v4

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Tag;->getPriority()I

    move-result v5

    invoke-virtual {v4, v5}, Lorg/kore/kolab/notes/Tag;->setPriority(I)V

    .line 80
    .end local v0    # "detail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    :cond_4f
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 90
    .end local v1    # "tag":Lorg/kore/kolab/notes/Tag;
    :cond_52
    return-void
.end method

.method public varargs attachTags(Ljava/lang/String;[Lorg/kore/kolab/notes/Tag;)V
    .registers 11
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "tags"    # [Lorg/kore/kolab/notes/Tag;

    .prologue
    .line 127
    array-length v5, p2

    const/4 v4, 0x0

    :goto_2
    if-ge v4, v5, :cond_5c

    aget-object v3, p2, v4

    .line 128
    .local v3, "tag":Lorg/kore/kolab/notes/Tag;
    iget-object v6, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagPerTagname:Ljava/util/Map;

    invoke-virtual {v3}, Lorg/kore/kolab/notes/Tag;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    .line 129
    .local v0, "actDetail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    if-nez v0, :cond_3f

    .line 131
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 132
    .local v1, "member":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    new-instance v0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    .end local v0    # "actDetail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    invoke-virtual {v3}, Lorg/kore/kolab/notes/Tag;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v6

    invoke-virtual {v3}, Lorg/kore/kolab/notes/Tag;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v7

    invoke-direct {v0, v6, v7, v3, v1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;-><init>(Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lorg/kore/kolab/notes/Tag;Ljava/util/Set;)V

    .line 134
    .restart local v0    # "actDetail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    iget-object v6, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagPerTagname:Ljava/util/Map;

    invoke-virtual {v3}, Lorg/kore/kolab/notes/Tag;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    iget-object v6, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->remoteTags:Ljava/util/Set;

    if-nez v6, :cond_3a

    .line 136
    new-instance v6, Ljava/util/LinkedHashSet;

    invoke-direct {v6}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v6, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->remoteTags:Ljava/util/Set;

    .line 138
    :cond_3a
    iget-object v6, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->remoteTags:Ljava/util/Set;

    invoke-interface {v6, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 140
    .end local v1    # "member":Ljava/util/LinkedHashSet;, "Ljava/util/LinkedHashSet<Ljava/lang/String;>;"
    :cond_3f
    invoke-virtual {v0, p1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->addMember(Ljava/lang/String;)V

    .line 142
    iget-object v6, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsPerNote:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Set;

    .line 143
    .local v2, "perNote":Ljava/util/Set;, "Ljava/util/Set<Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;>;"
    if-nez v2, :cond_56

    .line 144
    new-instance v2, Ljava/util/LinkedHashSet;

    .end local v2    # "perNote":Ljava/util/Set;, "Ljava/util/Set<Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;>;"
    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    .line 145
    .restart local v2    # "perNote":Ljava/util/Set;, "Ljava/util/Set<Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;>;"
    iget-object v6, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsPerNote:Ljava/util/Map;

    invoke-interface {v6, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    :cond_56
    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 127
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 149
    .end local v0    # "actDetail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    .end local v2    # "perNote":Ljava/util/Set;, "Ljava/util/Set<Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;>;"
    .end local v3    # "tag":Lorg/kore/kolab/notes/Tag;
    :cond_5c
    return-void
.end method

.method connect(Lkorex/mail/Store;)Lkorex/mail/Store;
    .registers 6
    .param p1, "store"    # Lkorex/mail/Store;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 166
    if-nez p1, :cond_8

    .line 167
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-static {v0}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->openConnection(Lorg/kore/kolab/notes/AccountInformation;)Lkorex/mail/Store;

    move-result-object p1

    .line 170
    :cond_8
    invoke-virtual {p1}, Lkorex/mail/Store;->isConnected()Z

    move-result v0

    if-nez v0, :cond_29

    .line 171
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-virtual {v0}, Lorg/kore/kolab/notes/AccountInformation;->getHost()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-virtual {v1}, Lorg/kore/kolab/notes/AccountInformation;->getPort()I

    move-result v1

    iget-object v2, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-virtual {v2}, Lorg/kore/kolab/notes/AccountInformation;->getUsername()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-virtual {v3}, Lorg/kore/kolab/notes/AccountInformation;->getPassword()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v0, v1, v2, v3}, Lkorex/mail/Store;->connect(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 173
    :cond_29
    return-object p1
.end method

.method public varargs deleteTags([Lorg/kore/kolab/notes/Identification;)V
    .registers 7
    .param p1, "ident"    # [Lorg/kore/kolab/notes/Identification;

    .prologue
    .line 93
    array-length v2, p1

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_12

    aget-object v0, p1, v1

    .line 94
    .local v0, "i":Lorg/kore/kolab/notes/Identification;
    iget-object v3, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsForDeletion:Ljava/util/Set;

    invoke-virtual {v0}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 93
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 96
    .end local v0    # "i":Lorg/kore/kolab/notes/Identification;
    :cond_12
    return-void
.end method

.method getFromMessage(Lkorex/mail/Message;)Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    .registers 9
    .param p1, "message"    # Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 226
    invoke-virtual {p1}, Lkorex/mail/Message;->getContent()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkorex/mail/Multipart;

    .line 227
    .local v1, "content":Lkorex/mail/Multipart;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_7
    invoke-virtual {v1}, Lkorex/mail/Multipart;->getCount()I

    move-result v5

    if-ge v2, v5, :cond_30

    .line 228
    invoke-virtual {v1, v2}, Lkorex/mail/Multipart;->getBodyPart(I)Lkorex/mail/BodyPart;

    move-result-object v0

    .line 229
    .local v0, "bodyPart":Lkorex/mail/BodyPart;
    invoke-virtual {v0}, Lkorex/mail/BodyPart;->getContentType()Ljava/lang/String;

    move-result-object v5

    const-string v6, "APPLICATION/VND.KOLAB+XML"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2d

    .line 230
    invoke-virtual {v0}, Lkorex/mail/BodyPart;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 231
    .local v3, "inputStream":Ljava/io/InputStream;
    iget-object v5, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->parser:Lorg/kore/kolab/notes/KolabParser;

    invoke-interface {v5, v3}, Lorg/kore/kolab/notes/KolabParser;->parse(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    .line 232
    .local v4, "tag":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 236
    .end local v0    # "bodyPart":Lkorex/mail/BodyPart;
    .end local v3    # "inputStream":Ljava/io/InputStream;
    .end local v4    # "tag":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    :goto_2c
    return-object v4

    .line 227
    .restart local v0    # "bodyPart":Lkorex/mail/BodyPart;
    :cond_2d
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    .line 236
    .end local v0    # "bodyPart":Lkorex/mail/BodyPart;
    :cond_30
    const/4 v4, 0x0

    goto :goto_2c
.end method

.method public getTag(Ljava/lang/String;)Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 116
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/kore/kolab/notes/imap/RemoteTags;->init(Lkorex/mail/Store;)V

    .line 117
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagPerTagname:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    return-object v0
.end method

.method public getTags()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/kore/kolab/notes/imap/RemoteTags;->init(Lkorex/mail/Store;)V

    .line 76
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->remoteTags:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getTagsFromNote(Ljava/lang/String;)Ljava/util/Set;
    .registers 3
    .param p1, "uid"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;",
            ">;"
        }
    .end annotation

    .prologue
    .line 105
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/kore/kolab/notes/imap/RemoteTags;->init(Lkorex/mail/Store;)V

    .line 106
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsPerNote:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_f

    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    :goto_e
    return-object v0

    :cond_f
    iget-object v0, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsPerNote:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    goto :goto_e
.end method

.method init(Lkorex/mail/Store;)V
    .registers 15
    .param p1, "store"    # Lkorex/mail/Store;

    .prologue
    const/4 v9, 0x0

    .line 177
    iget-object v10, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->remoteTags:Ljava/util/Set;

    if-eqz v10, :cond_6

    .line 223
    :cond_5
    :goto_5
    return-void

    .line 181
    :cond_6
    new-instance v10, Ljava/util/LinkedHashSet;

    invoke-direct {v10}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v10, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->remoteTags:Ljava/util/Set;

    .line 184
    :try_start_d
    invoke-virtual {p0, p1}, Lorg/kore/kolab/notes/imap/RemoteTags;->connect(Lkorex/mail/Store;)Lkorex/mail/Store;

    move-result-object v4

    .line 186
    .local v4, "lstore":Lkorex/mail/Store;
    invoke-virtual {v4}, Lkorex/mail/Store;->getDefaultFolder()Lkorex/mail/Folder;

    move-result-object v7

    .line 187
    .local v7, "rFolder":Lkorex/mail/Folder;
    invoke-virtual {p0, v7}, Lorg/kore/kolab/notes/imap/RemoteTags;->searchConfigFolder(Lkorex/mail/Folder;)Lkorex/mail/Folder;

    move-result-object v0

    .line 189
    .local v0, "configFolder":Lkorex/mail/Folder;
    if-eqz v0, :cond_73

    .line 190
    const/4 v10, 0x1

    invoke-virtual {v0, v10}, Lkorex/mail/Folder;->open(I)V

    .line 192
    invoke-virtual {v0}, Lkorex/mail/Folder;->getMessages()[Lkorex/mail/Message;

    move-result-object v6

    .line 194
    .local v6, "messages":[Lkorex/mail/Message;
    new-instance v2, Lkorex/mail/FetchProfile;

    invoke-direct {v2}, Lkorex/mail/FetchProfile;-><init>()V

    .line 195
    .local v2, "fetchProfile":Lkorex/mail/FetchProfile;
    sget-object v10, Lkorex/mail/FetchProfile$Item;->CONTENT_INFO:Lkorex/mail/FetchProfile$Item;

    invoke-virtual {v2, v10}, Lkorex/mail/FetchProfile;->add(Lkorex/mail/FetchProfile$Item;)V

    .line 196
    sget-object v10, Lkorex/mail/FetchProfile$Item;->FLAGS:Lkorex/mail/FetchProfile$Item;

    invoke-virtual {v2, v10}, Lkorex/mail/FetchProfile;->add(Lkorex/mail/FetchProfile$Item;)V

    .line 197
    sget-object v10, Lkorex/mail/FetchProfile$Item;->ENVELOPE:Lkorex/mail/FetchProfile$Item;

    invoke-virtual {v2, v10}, Lkorex/mail/FetchProfile;->add(Lkorex/mail/FetchProfile$Item;)V

    .line 198
    invoke-virtual {v0, v6, v2}, Lkorex/mail/Folder;->fetch([Lkorex/mail/Message;Lkorex/mail/FetchProfile;)V

    .line 200
    array-length v10, v6

    :goto_3b
    if-ge v9, v10, :cond_6f

    aget-object v5, v6, v9

    .line 201
    .local v5, "message":Lkorex/mail/Message;
    const-string v11, "X-Kolab-Type"

    invoke-virtual {v5, v11}, Lkorex/mail/Message;->getHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 202
    .local v3, "header":[Ljava/lang/String;
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "application/x-vnd.kolab.configuration.relation"

    invoke-virtual {v11, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_6c

    .line 203
    invoke-virtual {p0, v5}, Lorg/kore/kolab/notes/imap/RemoteTags;->getFromMessage(Lkorex/mail/Message;)Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    move-result-object v8

    .line 205
    .local v8, "tag":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    if-eqz v8, :cond_6c

    .line 206
    iget-object v11, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->remoteTags:Ljava/util/Set;

    invoke-interface {v11, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 207
    iget-object v11, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagPerTagname:Ljava/util/Map;

    invoke-virtual {v8}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v12

    invoke-virtual {v12}, Lorg/kore/kolab/notes/Tag;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    invoke-virtual {p0, v8}, Lorg/kore/kolab/notes/imap/RemoteTags;->addToNotesMap(Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;)V

    .line 200
    .end local v8    # "tag":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    :cond_6c
    add-int/lit8 v9, v9, 0x1

    goto :goto_3b

    .line 213
    .end local v3    # "header":[Ljava/lang/String;
    .end local v5    # "message":Lkorex/mail/Message;
    :cond_6f
    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Lkorex/mail/Folder;->close(Z)V

    .line 216
    .end local v2    # "fetchProfile":Lkorex/mail/FetchProfile;
    .end local v6    # "messages":[Lkorex/mail/Message;
    :cond_73
    if-nez p1, :cond_5

    .line 217
    invoke-virtual {v4}, Lkorex/mail/Store;->close()V
    :try_end_78
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_78} :catch_79

    goto :goto_5

    .line 219
    .end local v0    # "configFolder":Lkorex/mail/Folder;
    .end local v4    # "lstore":Lkorex/mail/Store;
    .end local v7    # "rFolder":Lkorex/mail/Folder;
    :catch_79
    move-exception v1

    .line 220
    .local v1, "e":Ljava/lang/Exception;
    new-instance v9, Ljava/lang/IllegalStateException;

    invoke-direct {v9, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v9
.end method

.method isConfigurationFolder(Lkorex/mail/Folder;)Z
    .registers 5
    .param p1, "folder"    # Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 361
    iget-object v1, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-virtual {v1}, Lorg/kore/kolab/notes/AccountInformation;->isFolderAnnotationEnabled()Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 362
    new-instance v0, Lorg/kore/kolab/notes/imap/GetConfigurationCommand;

    invoke-virtual {p1}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/kore/kolab/notes/imap/GetConfigurationCommand;-><init>(Ljava/lang/String;)V

    .line 363
    .local v0, "metadataCommand":Lorg/kore/kolab/notes/imap/GetConfigurationCommand;
    check-cast p1, Lcom/sun/mail/imap/IMAPFolder;

    .end local p1    # "folder":Lkorex/mail/Folder;
    invoke-virtual {p1, v0}, Lcom/sun/mail/imap/IMAPFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    .line 364
    invoke-virtual {v0}, Lorg/kore/kolab/notes/imap/GetConfigurationCommand;->isConfigurationFolder()Z

    move-result v1

    .line 366
    .end local v0    # "metadataCommand":Lorg/kore/kolab/notes/imap/GetConfigurationCommand;
    :goto_1a
    return v1

    .restart local p1    # "folder":Lkorex/mail/Folder;
    :cond_1b
    const-string v1, "Configuration"

    invoke-virtual {p1}, Lkorex/mail/Folder;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    goto :goto_1a
.end method

.method public merge()V
    .registers 2

    .prologue
    .line 240
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/kore/kolab/notes/imap/RemoteTags;->merge(Lkorex/mail/Store;)V

    .line 241
    return-void
.end method

.method merge(Lkorex/mail/Store;)V
    .registers 24
    .param p1, "store"    # Lkorex/mail/Store;

    .prologue
    .line 244
    invoke-virtual/range {p0 .. p1}, Lorg/kore/kolab/notes/imap/RemoteTags;->init(Lkorex/mail/Store;)V

    .line 247
    :try_start_3
    invoke-virtual/range {p0 .. p1}, Lorg/kore/kolab/notes/imap/RemoteTags;->connect(Lkorex/mail/Store;)Lkorex/mail/Store;

    move-result-object v9

    .line 249
    .local v9, "lstore":Lkorex/mail/Store;
    invoke-virtual {v9}, Lkorex/mail/Store;->getDefaultFolder()Lkorex/mail/Folder;

    move-result-object v11

    .line 250
    .local v11, "rFolder":Lkorex/mail/Folder;
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lorg/kore/kolab/notes/imap/RemoteTags;->searchConfigFolder(Lkorex/mail/Folder;)Lkorex/mail/Folder;

    move-result-object v3

    .line 252
    .local v3, "configFolder":Lkorex/mail/Folder;
    if-nez v3, :cond_37

    .line 253
    const-string v15, "Configuration"

    invoke-virtual {v11, v15}, Lkorex/mail/Folder;->getFolder(Ljava/lang/String;)Lkorex/mail/Folder;

    move-result-object v3

    .line 254
    const/4 v15, 0x1

    invoke-virtual {v3, v15}, Lkorex/mail/Folder;->create(I)Z

    .line 256
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/kore/kolab/notes/imap/RemoteTags;->account:Lorg/kore/kolab/notes/AccountInformation;

    invoke-virtual {v15}, Lorg/kore/kolab/notes/AccountInformation;->isFolderAnnotationEnabled()Z

    move-result v15

    if-eqz v15, :cond_37

    .line 257
    move-object v0, v3

    check-cast v0, Lcom/sun/mail/imap/IMAPFolder;

    move-object v15, v0

    new-instance v16, Lorg/kore/kolab/notes/imap/SetConfigurationCommand;

    invoke-virtual {v3}, Lkorex/mail/Folder;->getFullName()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Lorg/kore/kolab/notes/imap/SetConfigurationCommand;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v15 .. v16}, Lcom/sun/mail/imap/IMAPFolder;->doCommand(Lcom/sun/mail/imap/IMAPFolder$ProtocolCommand;)Ljava/lang/Object;

    .line 261
    :cond_37
    invoke-virtual {v3}, Lkorex/mail/Folder;->isOpen()Z

    move-result v15

    if-nez v15, :cond_41

    .line 262
    const/4 v15, 0x2

    invoke-virtual {v3, v15}, Lkorex/mail/Folder;->open(I)V

    .line 265
    :cond_41
    invoke-virtual {v3}, Lkorex/mail/Folder;->getMessages()[Lkorex/mail/Message;

    move-result-object v13

    .line 267
    .local v13, "serverTags":[Lkorex/mail/Message;
    new-instance v5, Lkorex/mail/Flags;

    sget-object v15, Lkorex/mail/Flags$Flag;->DELETED:Lkorex/mail/Flags$Flag;

    invoke-direct {v5, v15}, Lkorex/mail/Flags;-><init>(Lkorex/mail/Flags$Flag;)V

    .line 269
    .local v5, "deleted":Lkorex/mail/Flags;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 270
    .local v10, "messagesToAdd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lkorex/mail/Message;>;"
    const/4 v4, 0x1

    .line 271
    .local v4, "createMessage":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/kore/kolab/notes/imap/RemoteTags;->remoteTags:Ljava/util/Set;

    invoke-interface {v15}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_5a
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_fd

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    .line 272
    .local v6, "detail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    invoke-virtual {v6}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v13}, Lorg/kore/kolab/notes/imap/RemoteTags;->searchForRemoteTag(Ljava/lang/String;[Lkorex/mail/Message;)Lkorex/mail/Message;

    move-result-object v12

    .line 274
    .local v12, "serverTag":Lkorex/mail/Message;
    if-eqz v12, :cond_a2

    .line 275
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsForDeletion:Ljava/util/Set;

    move-object/from16 v16, v0

    invoke-virtual {v6}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Lorg/kore/kolab/notes/Identification;->getUid()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v16 .. v17}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_d0

    .line 276
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Lkorex/mail/Message;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v12, v16, v17

    const/16 v17, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v3, v0, v5, v1}, Lkorex/mail/Folder;->setFlags([Lkorex/mail/Message;Lkorex/mail/Flags;Z)V

    .line 277
    const/4 v4, 0x0

    .line 291
    :cond_a2
    :goto_a2
    if-eqz v4, :cond_ce

    .line 292
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/RemoteTags;->account:Lorg/kore/kolab/notes/AccountInformation;

    move-object/from16 v16, v0

    .line 293
    invoke-virtual {v6}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getIdentification()Lorg/kore/kolab/notes/Identification;

    move-result-object v17

    .line 294
    invoke-virtual {v6}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getAuditInformation()Lorg/kore/kolab/notes/AuditInformation;

    move-result-object v18

    new-instance v19, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;

    const-string v20, "APPLICATION/VND.KOLAB+XML"

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/kore/kolab/notes/imap/RemoteTags;->parser:Lorg/kore/kolab/notes/KolabParser;

    move-object/from16 v21, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-direct {v0, v6, v1, v2}, Lorg/kore/kolab/notes/imap/IMAPKolabDataHandler;-><init>(Ljava/lang/Object;Ljava/lang/String;Lorg/kore/kolab/notes/KolabParser;)V

    const-string v20, "application/x-vnd.kolab.configuration.relation"

    .line 292
    invoke-static/range {v16 .. v20}, Lorg/kore/kolab/notes/imap/ImapNotesRepository;->createMessage(Lorg/kore/kolab/notes/AccountInformation;Lorg/kore/kolab/notes/Identification;Lorg/kore/kolab/notes/AuditInformation;Lkorex/activation/DataHandler;Ljava/lang/String;)Lkorex/mail/internet/MimeMessage;

    move-result-object v14

    .line 298
    .local v14, "tagMessage":Lkorex/mail/Message;
    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 300
    .end local v14    # "tagMessage":Lkorex/mail/Message;
    :cond_ce
    const/4 v4, 0x1

    .line 301
    goto :goto_5a

    .line 280
    :cond_d0
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/kore/kolab/notes/imap/RemoteTags;->getFromMessage(Lkorex/mail/Message;)Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    move-result-object v8

    .line 283
    .local v8, "fromMessage":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v8}, Lorg/kore/kolab/notes/imap/RemoteTags;->noChange(Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;)Z

    move-result v16

    if-eqz v16, :cond_e0

    .line 284
    const/4 v4, 0x0

    goto :goto_a2

    .line 286
    :cond_e0
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Lkorex/mail/Message;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v12, v16, v17

    const/16 v17, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v3, v0, v5, v1}, Lkorex/mail/Folder;->setFlags([Lkorex/mail/Message;Lkorex/mail/Flags;Z)V
    :try_end_f5
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_f5} :catch_f6

    goto :goto_a2

    .line 308
    .end local v3    # "configFolder":Lkorex/mail/Folder;
    .end local v4    # "createMessage":Z
    .end local v5    # "deleted":Lkorex/mail/Flags;
    .end local v6    # "detail":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    .end local v8    # "fromMessage":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    .end local v9    # "lstore":Lkorex/mail/Store;
    .end local v10    # "messagesToAdd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lkorex/mail/Message;>;"
    .end local v11    # "rFolder":Lkorex/mail/Folder;
    .end local v12    # "serverTag":Lkorex/mail/Message;
    .end local v13    # "serverTags":[Lkorex/mail/Message;
    :catch_f6
    move-exception v7

    .line 309
    .local v7, "e":Ljava/lang/Exception;
    new-instance v15, Ljava/lang/IllegalStateException;

    invoke-direct {v15, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v15

    .line 303
    .end local v7    # "e":Ljava/lang/Exception;
    .restart local v3    # "configFolder":Lkorex/mail/Folder;
    .restart local v4    # "createMessage":Z
    .restart local v5    # "deleted":Lkorex/mail/Flags;
    .restart local v9    # "lstore":Lkorex/mail/Store;
    .restart local v10    # "messagesToAdd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lkorex/mail/Message;>;"
    .restart local v11    # "rFolder":Lkorex/mail/Folder;
    .restart local v13    # "serverTags":[Lkorex/mail/Message;
    :cond_fd
    :try_start_fd
    move-object v0, v3

    check-cast v0, Lcom/sun/mail/imap/IMAPFolder;

    move-object v15, v0

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v16

    move/from16 v0, v16

    new-array v0, v0, [Lkorex/mail/Message;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v16

    check-cast v16, [Lkorex/mail/Message;

    invoke-virtual/range {v15 .. v16}, Lcom/sun/mail/imap/IMAPFolder;->addMessages([Lkorex/mail/Message;)[Lkorex/mail/Message;

    .line 304
    const/4 v15, 0x1

    invoke-virtual {v3, v15}, Lkorex/mail/Folder;->close(Z)V

    .line 305
    if-nez p1, :cond_11f

    .line 306
    invoke-virtual {v9}, Lkorex/mail/Store;->close()V
    :try_end_11f
    .catch Ljava/lang/Exception; {:try_start_fd .. :try_end_11f} :catch_f6

    .line 311
    :cond_11f
    return-void
.end method

.method noChange(Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;)Z
    .registers 7
    .param p1, "local"    # Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    .param p2, "remote"    # Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    .prologue
    const/4 v1, 0x0

    .line 314
    invoke-virtual {p2}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getMembers()Ljava/util/Set;

    move-result-object v2

    invoke-virtual {p1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getMembers()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3b

    invoke-virtual {p2}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v2

    invoke-virtual {v2}, Lorg/kore/kolab/notes/Tag;->getPriority()I

    move-result v2

    invoke-virtual {p1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v3

    invoke-virtual {v3}, Lorg/kore/kolab/notes/Tag;->getPriority()I

    move-result v3

    if-ne v2, v3, :cond_3b

    invoke-virtual {p2}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v2

    invoke-virtual {v2}, Lorg/kore/kolab/notes/Tag;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v3

    invoke-virtual {v3}, Lorg/kore/kolab/notes/Tag;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3b

    const/4 v0, 0x1

    .line 316
    .local v0, "noChange":Z
    :goto_38
    if-nez v0, :cond_3d

    .line 326
    :goto_3a
    return v1

    .end local v0    # "noChange":Z
    :cond_3b
    move v0, v1

    .line 314
    goto :goto_38

    .line 320
    .restart local v0    # "noChange":Z
    :cond_3d
    invoke-virtual {p2}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v1

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Tag;->getColor()Lorg/kore/kolab/notes/Color;

    move-result-object v1

    if-eqz v1, :cond_5d

    .line 321
    invoke-virtual {p2}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v1

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Tag;->getColor()Lorg/kore/kolab/notes/Color;

    move-result-object v1

    invoke-virtual {p1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v2

    invoke-virtual {v2}, Lorg/kore/kolab/notes/Tag;->getColor()Lorg/kore/kolab/notes/Color;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    :cond_5b
    :goto_5b
    move v1, v0

    .line 326
    goto :goto_3a

    .line 322
    :cond_5d
    invoke-virtual {p1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->getTag()Lorg/kore/kolab/notes/Tag;

    move-result-object v1

    invoke-virtual {v1}, Lorg/kore/kolab/notes/Tag;->getColor()Lorg/kore/kolab/notes/Color;

    move-result-object v1

    if-eqz v1, :cond_5b

    .line 323
    const/4 v0, 0x0

    goto :goto_5b
.end method

.method public removeTags(Ljava/lang/String;)V
    .registers 6
    .param p1, "uid"    # Ljava/lang/String;

    .prologue
    .line 157
    invoke-virtual {p0, p1}, Lorg/kore/kolab/notes/imap/RemoteTags;->getTagsFromNote(Ljava/lang/String;)Ljava/util/Set;

    move-result-object v1

    .line 159
    .local v1, "tags":Ljava/util/Set;, "Ljava/util/Set<Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_8
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_18

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;

    .line 160
    .local v0, "tag":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    invoke-virtual {v0, p1}, Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;->removeMember(Ljava/lang/String;)V

    goto :goto_8

    .line 162
    .end local v0    # "tag":Lorg/kore/kolab/notes/imap/RemoteTags$TagDetails;
    :cond_18
    iget-object v2, p0, Lorg/kore/kolab/notes/imap/RemoteTags;->tagsPerNote:Ljava/util/Map;

    new-instance v3, Ljava/util/LinkedHashSet;

    invoke-direct {v3}, Ljava/util/LinkedHashSet;-><init>()V

    invoke-interface {v2, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    return-void
.end method

.method searchConfigFolder(Lkorex/mail/Folder;)Lkorex/mail/Folder;
    .registers 7
    .param p1, "rFolder"    # Lkorex/mail/Folder;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 352
    const-string v1, "*"

    invoke-virtual {p1, v1}, Lkorex/mail/Folder;->list(Ljava/lang/String;)[Lkorex/mail/Folder;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_8
    if-ge v1, v3, :cond_16

    aget-object v0, v2, v1

    .line 353
    .local v0, "folder":Lkorex/mail/Folder;
    invoke-virtual {p0, v0}, Lorg/kore/kolab/notes/imap/RemoteTags;->isConfigurationFolder(Lkorex/mail/Folder;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 357
    .end local v0    # "folder":Lkorex/mail/Folder;
    :goto_12
    return-object v0

    .line 352
    .restart local v0    # "folder":Lkorex/mail/Folder;
    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 357
    .end local v0    # "folder":Lkorex/mail/Folder;
    :cond_16
    const/4 v0, 0x0

    goto :goto_12
.end method

.method searchForRemoteTag(Ljava/lang/String;[Lkorex/mail/Message;)Lkorex/mail/Message;
    .registers 7
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "messages"    # [Lkorex/mail/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lkorex/mail/MessagingException;
        }
    .end annotation

    .prologue
    .line 330
    array-length v2, p2

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_14

    aget-object v0, p2, v1

    .line 331
    .local v0, "m":Lkorex/mail/Message;
    invoke-virtual {v0}, Lkorex/mail/Message;->getSubject()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 335
    .end local v0    # "m":Lkorex/mail/Message;
    :goto_10
    return-object v0

    .line 330
    .restart local v0    # "m":Lkorex/mail/Message;
    :cond_11
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 335
    .end local v0    # "m":Lkorex/mail/Message;
    :cond_14
    const/4 v0, 0x0

    goto :goto_10
.end method
