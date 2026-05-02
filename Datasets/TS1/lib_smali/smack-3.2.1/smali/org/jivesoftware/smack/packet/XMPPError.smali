.class public Lorg/jivesoftware/smack/packet/XMPPError;
.super Ljava/lang/Object;
.source "XMPPError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;,
        Lorg/jivesoftware/smack/packet/XMPPError$Condition;,
        Lorg/jivesoftware/smack/packet/XMPPError$Type;
    }
.end annotation


# instance fields
.field private applicationExtensions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PacketExtension;",
            ">;"
        }
    .end annotation
.end field

.field private code:I

.field private condition:Ljava/lang/String;

.field private message:Ljava/lang/String;

.field private type:Lorg/jivesoftware/smack/packet/XMPPError$Type;


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "code"    # I

    .prologue
    const/4 v0, 0x0

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    .line 105
    iput p1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    .line 106
    iput-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .registers 4
    .param p1, "code"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    .line 118
    iput p1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    .line 119
    iput-object p2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    .line 120
    return-void
.end method

.method public constructor <init>(ILorg/jivesoftware/smack/packet/XMPPError$Type;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .registers 7
    .param p1, "code"    # I
    .param p2, "type"    # Lorg/jivesoftware/smack/packet/XMPPError$Type;
    .param p3, "condition"    # Ljava/lang/String;
    .param p4, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/jivesoftware/smack/packet/XMPPError$Type;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PacketExtension;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p5, "extension":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    .line 136
    iput p1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    .line 137
    iput-object p2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->type:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    .line 138
    iput-object p3, p0, Lorg/jivesoftware/smack/packet/XMPPError;->condition:Ljava/lang/String;

    .line 139
    iput-object p4, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    .line 140
    iput-object p5, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    .line 141
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V
    .registers 3
    .param p1, "condition"    # Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    .prologue
    const/4 v0, 0x0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    .line 79
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/XMPPError;->init(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    .line 80
    iput-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    .line 81
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;Ljava/lang/String;)V
    .registers 4
    .param p1, "condition"    # Lorg/jivesoftware/smack/packet/XMPPError$Condition;
    .param p2, "messageText"    # Ljava/lang/String;

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    .line 94
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/XMPPError;->init(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    .line 95
    iput-object p2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    .line 96
    return-void
.end method

.method private init(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V
    .registers 4
    .param p1, "condition"    # Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    .prologue
    .line 150
    invoke-static {p1}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->specFor(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;

    move-result-object v0

    .line 151
    .local v0, "defaultErrorSpecification":Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;
    # getter for: Lorg/jivesoftware/smack/packet/XMPPError$Condition;->value:Ljava/lang/String;
    invoke-static {p1}, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->access$000(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->condition:Ljava/lang/String;

    .line 152
    if-eqz v0, :cond_18

    .line 155
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->getType()Lorg/jivesoftware/smack/packet/XMPPError$Type;

    move-result-object v1

    iput-object v1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->type:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    .line 156
    invoke-virtual {v0}, Lorg/jivesoftware/smack/packet/XMPPError$ErrorSpecification;->getCode()I

    move-result v1

    iput v1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    .line 158
    :cond_18
    return-void
.end method


# virtual methods
.method public declared-synchronized addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V
    .registers 3
    .param p1, "extension"    # Lorg/jivesoftware/smack/packet/PacketExtension;

    .prologue
    .line 277
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    if-nez v0, :cond_c

    .line 278
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    .line 280
    :cond_c
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_11
    .catchall {:try_start_1 .. :try_end_11} :catchall_13

    .line 281
    monitor-exit p0

    return-void

    .line 277
    :catchall_13
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getCode()I
    .registers 2

    .prologue
    .line 183
    iget v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    return v0
.end method

.method public getCondition()Ljava/lang/String;
    .registers 2

    .prologue
    .line 165
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->condition:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .registers 7
    .param p1, "elementName"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 260
    monitor-enter p0

    :try_start_2
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;
    :try_end_4
    .catchall {:try_start_2 .. :try_end_4} :catchall_36

    if-eqz v3, :cond_a

    if-eqz p1, :cond_a

    if-nez p2, :cond_d

    :cond_a
    move-object v0, v2

    .line 268
    :goto_b
    monitor-exit p0

    return-object v0

    .line 263
    :cond_d
    :try_start_d
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_34

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 264
    .local v0, "ext":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-interface {v0}, Lorg/jivesoftware/smack/packet/PacketExtension;->getElementName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_13

    invoke-interface {v0}, Lorg/jivesoftware/smack/packet/PacketExtension;->getNamespace()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_30
    .catchall {:try_start_d .. :try_end_30} :catchall_36

    move-result v3

    if-eqz v3, :cond_13

    goto :goto_b

    .end local v0    # "ext":Lorg/jivesoftware/smack/packet/PacketExtension;
    :cond_34
    move-object v0, v2

    .line 268
    goto :goto_b

    .line 260
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_36
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getExtensions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PacketExtension;",
            ">;"
        }
    .end annotation

    .prologue
    .line 245
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    if-nez v0, :cond_b

    .line 246
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_12

    move-result-object v0

    .line 248
    :goto_9
    monitor-exit p0

    return-object v0

    :cond_b
    :try_start_b
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;
    :try_end_10
    .catchall {:try_start_b .. :try_end_10} :catchall_12

    move-result-object v0

    goto :goto_9

    .line 245
    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 192
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lorg/jivesoftware/smack/packet/XMPPError$Type;
    .registers 2

    .prologue
    .line 174
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/XMPPError;->type:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    return-object v0
.end method

.method public declared-synchronized setExtension(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smack/packet/PacketExtension;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 289
    .local p1, "extension":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->applicationExtensions:Ljava/util/List;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    .line 290
    monitor-exit p0

    return-void

    .line 289
    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 226
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .local v0, "txt":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->condition:Ljava/lang/String;

    if-eqz v1, :cond_e

    .line 228
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->condition:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    :cond_e
    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    iget-object v1, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    if-eqz v1, :cond_2e

    .line 232
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    :cond_2e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public toXML()Ljava/lang/String;
    .registers 6

    .prologue
    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 202
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v3, "<error code=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/jivesoftware/smack/packet/XMPPError;->code:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/XMPPError;->type:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    if-eqz v3, :cond_2d

    .line 204
    const-string v3, " type=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/XMPPError;->type:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    invoke-virtual {v3}, Lorg/jivesoftware/smack/packet/XMPPError$Type;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    const-string v3, "\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 208
    :cond_2d
    const-string v3, ">"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/XMPPError;->condition:Ljava/lang/String;

    if-eqz v3, :cond_46

    .line 210
    const-string v3, "<"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smack/packet/XMPPError;->condition:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    const-string v3, " xmlns=\"urn:ietf:params:xml:ns:xmpp-stanzas\"/>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    :cond_46
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    if-eqz v3, :cond_59

    .line 214
    const-string v3, "<text xml:lang=\"en\" xmlns=\"urn:ietf:params:xml:ns:xmpp-stanzas\">"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    iget-object v3, p0, Lorg/jivesoftware/smack/packet/XMPPError;->message:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    const-string v3, "</text>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    :cond_59
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/XMPPError;->getExtensions()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_61
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_75

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smack/packet/PacketExtension;

    .line 219
    .local v1, "element":Lorg/jivesoftware/smack/packet/PacketExtension;
    invoke-interface {v1}, Lorg/jivesoftware/smack/packet/PacketExtension;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_61

    .line 221
    .end local v1    # "element":Lorg/jivesoftware/smack/packet/PacketExtension;
    :cond_75
    const-string v3, "</error>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
