.class public Lorg/jivesoftware/smack/packet/Message;
.super Lorg/jivesoftware/smack/packet/Packet;
.source "Message.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/packet/Message$1;,
        Lorg/jivesoftware/smack/packet/Message$Type;,
        Lorg/jivesoftware/smack/packet/Message$Body;,
        Lorg/jivesoftware/smack/packet/Message$Subject;
    }
.end annotation


# instance fields
.field private final bodies:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/jivesoftware/smack/packet/Message$Body;",
            ">;"
        }
    .end annotation
.end field

.field private language:Ljava/lang/String;

.field private final subjects:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/jivesoftware/smack/packet/Message$Subject;",
            ">;"
        }
    .end annotation
.end field

.field private thread:Ljava/lang/String;

.field private type:Lorg/jivesoftware/smack/packet/Message$Type;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 63
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 53
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->normal:Lorg/jivesoftware/smack/packet/Message$Type;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    .line 57
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    .line 58
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 71
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 53
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->normal:Lorg/jivesoftware/smack/packet/Message$Type;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    .line 57
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    .line 58
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    .line 72
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message$Type;)V
    .registers 4
    .param p1, "to"    # Ljava/lang/String;
    .param p2, "type"    # Lorg/jivesoftware/smack/packet/Message$Type;

    .prologue
    .line 81
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 53
    sget-object v0, Lorg/jivesoftware/smack/packet/Message$Type;->normal:Lorg/jivesoftware/smack/packet/Message$Type;

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    .line 57
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    .line 58
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    .line 82
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 83
    iput-object p2, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 84
    return-void
.end method

.method private determineLanguage(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 392
    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    const/4 p1, 0x0

    .line 395
    :cond_9
    if-nez p1, :cond_12

    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    if-eqz v0, :cond_12

    .line 396
    iget-object p1, p0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    .line 402
    .end local p1    # "language":Ljava/lang/String;
    :cond_11
    :goto_11
    return-object p1

    .line 398
    .restart local p1    # "language":Ljava/lang/String;
    :cond_12
    if-nez p1, :cond_11

    .line 399
    invoke-static {}, Lorg/jivesoftware/smack/packet/Message;->getDefaultLanguage()Ljava/lang/String;

    move-result-object p1

    goto :goto_11
.end method

.method private getMessageBody(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Body;
    .registers 5
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 256
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->determineLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 257
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Message$Body;

    .line 258
    .local v0, "body":Lorg/jivesoftware/smack/packet/Message$Body;
    # getter for: Lorg/jivesoftware/smack/packet/Message$Body;->language:Ljava/lang/String;
    invoke-static {v0}, Lorg/jivesoftware/smack/packet/Message$Body;->access$400(Lorg/jivesoftware/smack/packet/Message$Body;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 262
    .end local v0    # "body":Lorg/jivesoftware/smack/packet/Message$Body;
    :goto_20
    return-object v0

    :cond_21
    const/4 v0, 0x0

    goto :goto_20
.end method

.method private getMessageSubject(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Subject;
    .registers 5
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->determineLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 138
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_21

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/Message$Subject;

    .line 139
    .local v1, "subject":Lorg/jivesoftware/smack/packet/Message$Subject;
    # getter for: Lorg/jivesoftware/smack/packet/Message$Subject;->language:Ljava/lang/String;
    invoke-static {v1}, Lorg/jivesoftware/smack/packet/Message$Subject;->access$100(Lorg/jivesoftware/smack/packet/Message$Subject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 143
    .end local v1    # "subject":Lorg/jivesoftware/smack/packet/Message$Subject;
    :goto_20
    return-object v1

    :cond_21
    const/4 v1, 0x0

    goto :goto_20
.end method


# virtual methods
.method public addBody(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Body;
    .registers 5
    .param p1, "language"    # Ljava/lang/String;
    .param p2, "body"    # Ljava/lang/String;

    .prologue
    .line 299
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->determineLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 300
    new-instance v0, Lorg/jivesoftware/smack/packet/Message$Body;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lorg/jivesoftware/smack/packet/Message$Body;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message$1;)V

    .line 301
    .local v0, "messageBody":Lorg/jivesoftware/smack/packet/Message$Body;
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 302
    return-object v0
.end method

.method public addSubject(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Subject;
    .registers 5
    .param p1, "language"    # Ljava/lang/String;
    .param p2, "subject"    # Ljava/lang/String;

    .prologue
    .line 179
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->determineLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 180
    new-instance v0, Lorg/jivesoftware/smack/packet/Message$Subject;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1}, Lorg/jivesoftware/smack/packet/Message$Subject;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/jivesoftware/smack/packet/Message$1;)V

    .line 181
    .local v0, "messageSubject":Lorg/jivesoftware/smack/packet/Message$Subject;
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-interface {v1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 182
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 475
    if-ne p0, p1, :cond_6

    move v2, v1

    .line 493
    :cond_5
    :goto_5
    return v2

    .line 476
    :cond_6
    if-eqz p1, :cond_5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-ne v3, v4, :cond_5

    move-object v0, p1

    .line 478
    check-cast v0, Lorg/jivesoftware/smack/packet/Message;

    .line 480
    .local v0, "message":Lorg/jivesoftware/smack/packet/Message;
    invoke-super {p0, v0}, Lorg/jivesoftware/smack/packet/Packet;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 481
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    if-ne v3, v4, :cond_5

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-interface {v3, v4}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 484
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    if-eqz v3, :cond_6f

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 487
    :cond_41
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    if-ne v3, v4, :cond_5

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-interface {v3, v4}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 490
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    if-eqz v3, :cond_74

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 493
    :cond_67
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    iget-object v4, v0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v3, v4, :cond_79

    :goto_6d
    move v2, v1

    goto :goto_5

    .line 484
    :cond_6f
    iget-object v3, v0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    if-eqz v3, :cond_41

    goto :goto_5

    .line 490
    :cond_74
    iget-object v3, v0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    if-eqz v3, :cond_67

    goto :goto_5

    :cond_79
    move v1, v2

    .line 493
    goto :goto_6d
.end method

.method public getBodies()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/packet/Message$Body;",
            ">;"
        }
    .end annotation

    .prologue
    .line 273
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .registers 2

    .prologue
    .line 238
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/packet/Message;->getBody(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBody(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 251
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->getMessageBody(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Body;

    move-result-object v0

    .line 252
    .local v0, "body":Lorg/jivesoftware/smack/packet/Message$Body;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return-object v1

    :cond_8
    # getter for: Lorg/jivesoftware/smack/packet/Message$Body;->message:Ljava/lang/String;
    invoke-static {v0}, Lorg/jivesoftware/smack/packet/Message$Body;->access$300(Lorg/jivesoftware/smack/packet/Message$Body;)Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method public getBodyLanguages()Ljava/util/Collection;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 339
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lorg/jivesoftware/smack/packet/Message;->getMessageBody(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Body;

    move-result-object v1

    .line 340
    .local v1, "defaultBody":Lorg/jivesoftware/smack/packet/Message$Body;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 341
    .local v3, "languages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_10
    :goto_10
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Message$Body;

    .line 342
    .local v0, "body":Lorg/jivesoftware/smack/packet/Message$Body;
    invoke-virtual {v0, v1}, Lorg/jivesoftware/smack/packet/Message$Body;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10

    .line 343
    # getter for: Lorg/jivesoftware/smack/packet/Message$Body;->language:Ljava/lang/String;
    invoke-static {v0}, Lorg/jivesoftware/smack/packet/Message$Body;->access$400(Lorg/jivesoftware/smack/packet/Message$Body;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 346
    .end local v0    # "body":Lorg/jivesoftware/smack/packet/Message$Body;
    :cond_2a
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v4

    return-object v4
.end method

.method public getLanguage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 376
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    return-object v0
.end method

.method public getSubject()Ljava/lang/String;
    .registers 2

    .prologue
    .line 120
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/packet/Message;->getSubject(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSubject(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 132
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->getMessageSubject(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Subject;

    move-result-object v0

    .line 133
    .local v0, "subject":Lorg/jivesoftware/smack/packet/Message$Subject;
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return-object v1

    :cond_8
    # getter for: Lorg/jivesoftware/smack/packet/Message$Subject;->subject:Ljava/lang/String;
    invoke-static {v0}, Lorg/jivesoftware/smack/packet/Message$Subject;->access$000(Lorg/jivesoftware/smack/packet/Message$Subject;)Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method public getSubjectLanguages()Ljava/util/Collection;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 217
    const/4 v4, 0x0

    invoke-direct {p0, v4}, Lorg/jivesoftware/smack/packet/Message;->getMessageSubject(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Subject;

    move-result-object v0

    .line 218
    .local v0, "defaultSubject":Lorg/jivesoftware/smack/packet/Message$Subject;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 219
    .local v2, "languages":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_10
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jivesoftware/smack/packet/Message$Subject;

    .line 220
    .local v3, "subject":Lorg/jivesoftware/smack/packet/Message$Subject;
    invoke-virtual {v3, v0}, Lorg/jivesoftware/smack/packet/Message$Subject;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_10

    .line 221
    # getter for: Lorg/jivesoftware/smack/packet/Message$Subject;->language:Ljava/lang/String;
    invoke-static {v3}, Lorg/jivesoftware/smack/packet/Message$Subject;->access$100(Lorg/jivesoftware/smack/packet/Message$Subject;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_10

    .line 224
    .end local v3    # "subject":Lorg/jivesoftware/smack/packet/Message$Subject;
    :cond_2a
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v4

    return-object v4
.end method

.method public getSubjects()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smack/packet/Message$Subject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 153
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public getThread()Ljava/lang/String;
    .registers 2

    .prologue
    .line 356
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lorg/jivesoftware/smack/packet/Message$Type;
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    return-object v0
.end method

.method public hashCode()I
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 499
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    if-eqz v2, :cond_3c

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v2}, Lorg/jivesoftware/smack/packet/Message$Type;->hashCode()I

    move-result v0

    .line 500
    .local v0, "result":I
    :goto_b
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int v0, v2, v3

    .line 501
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    if-eqz v2, :cond_3e

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_21
    add-int v0, v3, v2

    .line 502
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    if-eqz v3, :cond_2f

    iget-object v1, p0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_2f
    add-int v0, v2, v1

    .line 503
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 504
    return v0

    .end local v0    # "result":I
    :cond_3c
    move v0, v1

    .line 499
    goto :goto_b

    .restart local v0    # "result":I
    :cond_3e
    move v2, v1

    .line 501
    goto :goto_21
.end method

.method public removeBody(Ljava/lang/String;)Z
    .registers 5
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 312
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->determineLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 313
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Message$Body;

    .line 314
    .local v0, "body":Lorg/jivesoftware/smack/packet/Message$Body;
    # getter for: Lorg/jivesoftware/smack/packet/Message$Body;->language:Ljava/lang/String;
    invoke-static {v0}, Lorg/jivesoftware/smack/packet/Message$Body;->access$400(Lorg/jivesoftware/smack/packet/Message$Body;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 315
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    .line 318
    .end local v0    # "body":Lorg/jivesoftware/smack/packet/Message$Body;
    :goto_26
    return v2

    :cond_27
    const/4 v2, 0x0

    goto :goto_26
.end method

.method public removeBody(Lorg/jivesoftware/smack/packet/Message$Body;)Z
    .registers 3
    .param p1, "body"    # Lorg/jivesoftware/smack/packet/Message$Body;

    .prologue
    .line 329
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->bodies:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeSubject(Ljava/lang/String;)Z
    .registers 5
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 192
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/Message;->determineLanguage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 193
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/Message$Subject;

    .line 194
    .local v1, "subject":Lorg/jivesoftware/smack/packet/Message$Subject;
    # getter for: Lorg/jivesoftware/smack/packet/Message$Subject;->language:Ljava/lang/String;
    invoke-static {v1}, Lorg/jivesoftware/smack/packet/Message$Subject;->access$100(Lorg/jivesoftware/smack/packet/Message$Subject;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 195
    iget-object v2, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    .line 198
    .end local v1    # "subject":Lorg/jivesoftware/smack/packet/Message$Subject;
    :goto_26
    return v2

    :cond_27
    const/4 v2, 0x0

    goto :goto_26
.end method

.method public removeSubject(Lorg/jivesoftware/smack/packet/Message$Subject;)Z
    .registers 3
    .param p1, "subject"    # Lorg/jivesoftware/smack/packet/Message$Subject;

    .prologue
    .line 208
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/Message;->subjects:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setBody(Ljava/lang/String;)V
    .registers 3
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 282
    if-nez p1, :cond_8

    .line 283
    const-string v0, ""

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/packet/Message;->removeBody(Ljava/lang/String;)Z

    .line 287
    :goto_7
    return-void

    .line 286
    :cond_8
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smack/packet/Message;->addBody(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Body;

    goto :goto_7
.end method

.method public setLanguage(Ljava/lang/String;)V
    .registers 2
    .param p1, "language"    # Ljava/lang/String;

    .prologue
    .line 386
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    .line 387
    return-void
.end method

.method public setSubject(Ljava/lang/String;)V
    .registers 3
    .param p1, "subject"    # Ljava/lang/String;

    .prologue
    .line 163
    if-nez p1, :cond_8

    .line 164
    const-string v0, ""

    invoke-virtual {p0, v0}, Lorg/jivesoftware/smack/packet/Message;->removeSubject(Ljava/lang/String;)Z

    .line 168
    :goto_7
    return-void

    .line 167
    :cond_8
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smack/packet/Message;->addSubject(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Subject;

    goto :goto_7
.end method

.method public setThread(Ljava/lang/String;)V
    .registers 2
    .param p1, "thread"    # Ljava/lang/String;

    .prologue
    .line 366
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    .line 367
    return-void
.end method

.method public setType(Lorg/jivesoftware/smack/packet/Message$Type;)V
    .registers 4
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/Message$Type;

    .prologue
    .line 103
    if-nez p1, :cond_a

    .line 104
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Type cannot be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 106
    :cond_a
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    .line 107
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .registers 11

    .prologue
    const/4 v9, 0x0

    .line 408
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 409
    .local v1, "buf":Ljava/lang/StringBuilder;
    const-string v7, "<message"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getXmlns()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_24

    .line 411
    const-string v7, " xmlns=\""

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getXmlns()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 413
    :cond_24
    iget-object v7, p0, Lorg/jivesoftware/smack/packet/Message;->language:Ljava/lang/String;

    if-eqz v7, :cond_3b

    .line 414
    const-string v7, " xml:lang=\""

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getLanguage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    :cond_3b
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getPacketID()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_54

    .line 417
    const-string v7, " id=\""

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getPacketID()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    :cond_54
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getTo()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_71

    .line 420
    const-string v7, " to=\""

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getTo()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    :cond_71
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_8e

    .line 423
    const-string v7, " from=\""

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getFrom()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    :cond_8e
    iget-object v7, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    sget-object v8, Lorg/jivesoftware/smack/packet/Message$Type;->normal:Lorg/jivesoftware/smack/packet/Message$Type;

    if-eq v7, v8, :cond_a5

    .line 426
    const-string v7, " type=\""

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 428
    :cond_a5
    const-string v7, ">"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    invoke-direct {p0, v9}, Lorg/jivesoftware/smack/packet/Message;->getMessageSubject(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Subject;

    move-result-object v3

    .line 431
    .local v3, "defaultSubject":Lorg/jivesoftware/smack/packet/Message$Subject;
    if-eqz v3, :cond_c7

    .line 432
    const-string v7, "<subject>"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    # getter for: Lorg/jivesoftware/smack/packet/Message$Subject;->subject:Ljava/lang/String;
    invoke-static {v3}, Lorg/jivesoftware/smack/packet/Message$Subject;->access$000(Lorg/jivesoftware/smack/packet/Message$Subject;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</subject>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    :cond_c7
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getSubjects()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_cf
    :goto_cf
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_105

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/packet/Message$Subject;

    .line 437
    .local v6, "subject":Lorg/jivesoftware/smack/packet/Message$Subject;
    invoke-virtual {v6, v3}, Lorg/jivesoftware/smack/packet/Message$Subject;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_cf

    .line 439
    const-string v7, "<subject xml:lang=\""

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    # getter for: Lorg/jivesoftware/smack/packet/Message$Subject;->language:Ljava/lang/String;
    invoke-static {v6}, Lorg/jivesoftware/smack/packet/Message$Subject;->access$100(Lorg/jivesoftware/smack/packet/Message$Subject;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\">"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 440
    # getter for: Lorg/jivesoftware/smack/packet/Message$Subject;->subject:Ljava/lang/String;
    invoke-static {v6}, Lorg/jivesoftware/smack/packet/Message$Subject;->access$000(Lorg/jivesoftware/smack/packet/Message$Subject;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 441
    const-string v7, "</subject>"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_cf

    .line 444
    .end local v6    # "subject":Lorg/jivesoftware/smack/packet/Message$Subject;
    :cond_105
    invoke-direct {p0, v9}, Lorg/jivesoftware/smack/packet/Message;->getMessageBody(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Body;

    move-result-object v2

    .line 445
    .local v2, "defaultBody":Lorg/jivesoftware/smack/packet/Message$Body;
    if-eqz v2, :cond_122

    .line 446
    const-string v7, "<body>"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    # getter for: Lorg/jivesoftware/smack/packet/Message$Body;->message:Ljava/lang/String;
    invoke-static {v2}, Lorg/jivesoftware/smack/packet/Message$Body;->access$300(Lorg/jivesoftware/smack/packet/Message$Body;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</body>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    :cond_122
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getBodies()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_12a
    :goto_12a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_160

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/Message$Body;

    .line 451
    .local v0, "body":Lorg/jivesoftware/smack/packet/Message$Body;
    invoke-virtual {v0, v2}, Lorg/jivesoftware/smack/packet/Message$Body;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_12a

    .line 453
    const-string v7, "<body xml:lang=\""

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Message$Body;->getLanguage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\">"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 454
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/Message$Body;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    const-string v7, "</body>"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_12a

    .line 457
    .end local v0    # "body":Lorg/jivesoftware/smack/packet/Message$Body;
    :cond_160
    iget-object v7, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    if-eqz v7, :cond_175

    .line 458
    const-string v7, "<thread>"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lorg/jivesoftware/smack/packet/Message;->thread:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "</thread>"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 461
    :cond_175
    iget-object v7, p0, Lorg/jivesoftware/smack/packet/Message;->type:Lorg/jivesoftware/smack/packet/Message$Type;

    sget-object v8, Lorg/jivesoftware/smack/packet/Message$Type;->error:Lorg/jivesoftware/smack/packet/Message$Type;

    if-ne v7, v8, :cond_188

    .line 462
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getError()Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v4

    .line 463
    .local v4, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    if-eqz v4, :cond_188

    .line 464
    invoke-virtual {v4}, Lorg/jivesoftware/smack/packet/XMPPError;->toXML()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 468
    .end local v4    # "error":Lorg/jivesoftware/smack/packet/XMPPError;
    :cond_188
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/Message;->getExtensionsXML()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    const-string v7, "</message>"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 470
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method
