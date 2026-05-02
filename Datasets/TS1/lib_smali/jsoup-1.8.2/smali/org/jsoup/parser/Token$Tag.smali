.class abstract Lorg/jsoup/parser/Token$Tag;
.super Lorg/jsoup/parser/Token;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jsoup/parser/Token;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Tag"
.end annotation


# instance fields
.field attributes:Lorg/jsoup/nodes/Attributes;

.field private hasPendingAttributeValue:Z

.field private pendingAttributeName:Ljava/lang/String;

.field private pendingAttributeValue:Ljava/lang/StringBuilder;

.field selfClosing:Z

.field protected tagName:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 68
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jsoup/parser/Token;-><init>(Lorg/jsoup/parser/Token$1;)V

    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    .line 72
    iput-boolean v1, p0, Lorg/jsoup/parser/Token$Tag;->hasPendingAttributeValue:Z

    .line 73
    iput-boolean v1, p0, Lorg/jsoup/parser/Token$Tag;->selfClosing:Z

    return-void
.end method

.method private ensureAttributeValue()V
    .registers 2

    .prologue
    .line 163
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jsoup/parser/Token$Tag;->hasPendingAttributeValue:Z

    .line 164
    return-void
.end method


# virtual methods
.method final appendAttributeName(C)V
    .registers 3
    .param p1, "append"    # C

    .prologue
    .line 144
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Token$Tag;->appendAttributeName(Ljava/lang/String;)V

    .line 145
    return-void
.end method

.method final appendAttributeName(Ljava/lang/String;)V
    .registers 3
    .param p1, "append"    # Ljava/lang/String;

    .prologue
    .line 140
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    if-nez v0, :cond_7

    .end local p1    # "append":Ljava/lang/String;
    :goto_4
    iput-object p1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    .line 141
    return-void

    .line 140
    .restart local p1    # "append":Ljava/lang/String;
    :cond_7
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_4
.end method

.method final appendAttributeValue(C)V
    .registers 3
    .param p1, "append"    # C

    .prologue
    .line 153
    invoke-direct {p0}, Lorg/jsoup/parser/Token$Tag;->ensureAttributeValue()V

    .line 154
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 155
    return-void
.end method

.method final appendAttributeValue(Ljava/lang/String;)V
    .registers 3
    .param p1, "append"    # Ljava/lang/String;

    .prologue
    .line 148
    invoke-direct {p0}, Lorg/jsoup/parser/Token$Tag;->ensureAttributeValue()V

    .line 149
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    return-void
.end method

.method final appendAttributeValue([C)V
    .registers 3
    .param p1, "append"    # [C

    .prologue
    .line 158
    invoke-direct {p0}, Lorg/jsoup/parser/Token$Tag;->ensureAttributeValue()V

    .line 159
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 160
    return-void
.end method

.method final appendTagName(C)V
    .registers 3
    .param p1, "append"    # C

    .prologue
    .line 136
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method final appendTagName(Ljava/lang/String;)V
    .registers 3
    .param p1, "append"    # Ljava/lang/String;

    .prologue
    .line 132
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    if-nez v0, :cond_7

    .end local p1    # "append":Ljava/lang/String;
    :goto_4
    iput-object p1, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    .line 133
    return-void

    .line 132
    .restart local p1    # "append":Ljava/lang/String;
    :cond_7
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_4
.end method

.method final finaliseTag()V
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 107
    invoke-virtual {p0}, Lorg/jsoup/parser/Token$Tag;->newAttribute()V

    .line 109
    :cond_7
    return-void
.end method

.method final getAttributes()Lorg/jsoup/nodes/Attributes;
    .registers 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->attributes:Lorg/jsoup/nodes/Attributes;

    return-object v0
.end method

.method final isSelfClosing()Z
    .registers 2

    .prologue
    .line 122
    iget-boolean v0, p0, Lorg/jsoup/parser/Token$Tag;->selfClosing:Z

    return v0
.end method

.method final name()Ljava/lang/String;
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_13

    :cond_c
    const/4 v0, 0x1

    :goto_d
    invoke-static {v0}, Lorg/jsoup/helper/Validate;->isFalse(Z)V

    .line 113
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    return-object v0

    .line 112
    :cond_13
    const/4 v0, 0x0

    goto :goto_d
.end method

.method final name(Ljava/lang/String;)Lorg/jsoup/parser/Token$Tag;
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 117
    iput-object p1, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    .line 118
    return-object p0
.end method

.method final newAttribute()V
    .registers 4

    .prologue
    .line 88
    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->attributes:Lorg/jsoup/nodes/Attributes;

    if-nez v1, :cond_b

    .line 89
    new-instance v1, Lorg/jsoup/nodes/Attributes;

    invoke-direct {v1}, Lorg/jsoup/nodes/Attributes;-><init>()V

    iput-object v1, p0, Lorg/jsoup/parser/Token$Tag;->attributes:Lorg/jsoup/nodes/Attributes;

    .line 91
    :cond_b
    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    if-eqz v1, :cond_21

    .line 93
    iget-boolean v1, p0, Lorg/jsoup/parser/Token$Tag;->hasPendingAttributeValue:Z

    if-nez v1, :cond_2a

    .line 94
    new-instance v0, Lorg/jsoup/nodes/Attribute;

    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .local v0, "attribute":Lorg/jsoup/nodes/Attribute;
    :goto_1c
    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    .line 99
    .end local v0    # "attribute":Lorg/jsoup/nodes/Attribute;
    :cond_21
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    .line 100
    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-static {v1}, Lorg/jsoup/parser/Token$Tag;->reset(Ljava/lang/StringBuilder;)V

    .line 101
    return-void

    .line 96
    :cond_2a
    new-instance v0, Lorg/jsoup/nodes/Attribute;

    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    iget-object v2, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "attribute":Lorg/jsoup/nodes/Attribute;
    goto :goto_1c
.end method

.method reset()Lorg/jsoup/parser/Token$Tag;
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 78
    iput-object v1, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    .line 79
    iput-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    .line 80
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-static {v0}, Lorg/jsoup/parser/Token$Tag;->reset(Ljava/lang/StringBuilder;)V

    .line 81
    iput-boolean v2, p0, Lorg/jsoup/parser/Token$Tag;->hasPendingAttributeValue:Z

    .line 82
    iput-boolean v2, p0, Lorg/jsoup/parser/Token$Tag;->selfClosing:Z

    .line 83
    iput-object v1, p0, Lorg/jsoup/parser/Token$Tag;->attributes:Lorg/jsoup/nodes/Attributes;

    .line 84
    return-object p0
.end method

.method bridge synthetic reset()Lorg/jsoup/parser/Token;
    .registers 2

    .prologue
    .line 68
    invoke-virtual {p0}, Lorg/jsoup/parser/Token$Tag;->reset()Lorg/jsoup/parser/Token$Tag;

    move-result-object v0

    return-object v0
.end method
