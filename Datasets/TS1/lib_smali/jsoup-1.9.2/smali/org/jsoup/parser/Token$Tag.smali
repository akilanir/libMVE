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

.field private hasEmptyAttributeValue:Z

.field private hasPendingAttributeValue:Z

.field private pendingAttributeName:Ljava/lang/String;

.field private pendingAttributeValue:Ljava/lang/StringBuilder;

.field private pendingAttributeValueS:Ljava/lang/String;

.field selfClosing:Z

.field protected tagName:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jsoup/parser/Token;-><init>(Lorg/jsoup/parser/Token$1;)V

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    .line 74
    iput-boolean v1, p0, Lorg/jsoup/parser/Token$Tag;->hasEmptyAttributeValue:Z

    .line 75
    iput-boolean v1, p0, Lorg/jsoup/parser/Token$Tag;->hasPendingAttributeValue:Z

    .line 76
    iput-boolean v1, p0, Lorg/jsoup/parser/Token$Tag;->selfClosing:Z

    return-void
.end method

.method private ensureAttributeValue()V
    .registers 3

    .prologue
    .line 182
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jsoup/parser/Token$Tag;->hasPendingAttributeValue:Z

    .line 184
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValueS:Ljava/lang/String;

    if-eqz v0, :cond_11

    .line 185
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValueS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValueS:Ljava/lang/String;

    .line 188
    :cond_11
    return-void
.end method


# virtual methods
.method final appendAttributeName(C)V
    .registers 3
    .param p1, "append"    # C

    .prologue
    .line 155
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Token$Tag;->appendAttributeName(Ljava/lang/String;)V

    .line 156
    return-void
.end method

.method final appendAttributeName(Ljava/lang/String;)V
    .registers 3
    .param p1, "append"    # Ljava/lang/String;

    .prologue
    .line 151
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    if-nez v0, :cond_7

    .end local p1    # "append":Ljava/lang/String;
    :goto_4
    iput-object p1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    .line 152
    return-void

    .line 151
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
    .line 168
    invoke-direct {p0}, Lorg/jsoup/parser/Token$Tag;->ensureAttributeValue()V

    .line 169
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 170
    return-void
.end method

.method final appendAttributeValue(Ljava/lang/String;)V
    .registers 3
    .param p1, "append"    # Ljava/lang/String;

    .prologue
    .line 159
    invoke-direct {p0}, Lorg/jsoup/parser/Token$Tag;->ensureAttributeValue()V

    .line 160
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_e

    .line 161
    iput-object p1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValueS:Ljava/lang/String;

    .line 165
    :goto_d
    return-void

    .line 163
    :cond_e
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_d
.end method

.method final appendAttributeValue([C)V
    .registers 3
    .param p1, "append"    # [C

    .prologue
    .line 173
    invoke-direct {p0}, Lorg/jsoup/parser/Token$Tag;->ensureAttributeValue()V

    .line 174
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 175
    return-void
.end method

.method final appendTagName(C)V
    .registers 3
    .param p1, "append"    # C

    .prologue
    .line 147
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jsoup/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method final appendTagName(Ljava/lang/String;)V
    .registers 3
    .param p1, "append"    # Ljava/lang/String;

    .prologue
    .line 143
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    if-nez v0, :cond_7

    .end local p1    # "append":Ljava/lang/String;
    :goto_4
    iput-object p1, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    .line 144
    return-void

    .line 143
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
    .line 116
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    if-eqz v0, :cond_7

    .line 118
    invoke-virtual {p0}, Lorg/jsoup/parser/Token$Tag;->newAttribute()V

    .line 120
    :cond_7
    return-void
.end method

.method final getAttributes()Lorg/jsoup/nodes/Attributes;
    .registers 2

    .prologue
    .line 138
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->attributes:Lorg/jsoup/nodes/Attributes;

    return-object v0
.end method

.method final isSelfClosing()Z
    .registers 2

    .prologue
    .line 133
    iget-boolean v0, p0, Lorg/jsoup/parser/Token$Tag;->selfClosing:Z

    return v0
.end method

.method final name()Ljava/lang/String;
    .registers 2

    .prologue
    .line 123
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

    .line 124
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    return-object v0

    .line 123
    :cond_13
    const/4 v0, 0x0

    goto :goto_d
.end method

.method final name(Ljava/lang/String;)Lorg/jsoup/parser/Token$Tag;
    .registers 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    .line 129
    return-object p0
.end method

.method final newAttribute()V
    .registers 6

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 93
    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->attributes:Lorg/jsoup/nodes/Attributes;

    if-nez v1, :cond_d

    .line 94
    new-instance v1, Lorg/jsoup/nodes/Attributes;

    invoke-direct {v1}, Lorg/jsoup/nodes/Attributes;-><init>()V

    iput-object v1, p0, Lorg/jsoup/parser/Token$Tag;->attributes:Lorg/jsoup/nodes/Attributes;

    .line 96
    :cond_d
    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    if-eqz v1, :cond_2f

    .line 98
    iget-boolean v1, p0, Lorg/jsoup/parser/Token$Tag;->hasPendingAttributeValue:Z

    if-eqz v1, :cond_40

    .line 99
    new-instance v0, Lorg/jsoup/nodes/Attribute;

    iget-object v2, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_3d

    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_27
    invoke-direct {v0, v2, v1}, Lorg/jsoup/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .local v0, "attribute":Lorg/jsoup/nodes/Attribute;
    :goto_2a
    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->attributes:Lorg/jsoup/nodes/Attributes;

    invoke-virtual {v1, v0}, Lorg/jsoup/nodes/Attributes;->put(Lorg/jsoup/nodes/Attribute;)V

    .line 107
    .end local v0    # "attribute":Lorg/jsoup/nodes/Attribute;
    :cond_2f
    iput-object v4, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    .line 108
    iput-boolean v3, p0, Lorg/jsoup/parser/Token$Tag;->hasEmptyAttributeValue:Z

    .line 109
    iput-boolean v3, p0, Lorg/jsoup/parser/Token$Tag;->hasPendingAttributeValue:Z

    .line 110
    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-static {v1}, Lorg/jsoup/parser/Token$Tag;->reset(Ljava/lang/StringBuilder;)V

    .line 111
    iput-object v4, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValueS:Ljava/lang/String;

    .line 112
    return-void

    .line 100
    :cond_3d
    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValueS:Ljava/lang/String;

    goto :goto_27

    .line 101
    :cond_40
    iget-boolean v1, p0, Lorg/jsoup/parser/Token$Tag;->hasEmptyAttributeValue:Z

    if-eqz v1, :cond_4e

    .line 102
    new-instance v0, Lorg/jsoup/nodes/Attribute;

    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    const-string v2, ""

    invoke-direct {v0, v1, v2}, Lorg/jsoup/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v0    # "attribute":Lorg/jsoup/nodes/Attribute;
    goto :goto_2a

    .line 104
    .end local v0    # "attribute":Lorg/jsoup/nodes/Attribute;
    :cond_4e
    new-instance v0, Lorg/jsoup/nodes/BooleanAttribute;

    iget-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/jsoup/nodes/BooleanAttribute;-><init>(Ljava/lang/String;)V

    .restart local v0    # "attribute":Lorg/jsoup/nodes/Attribute;
    goto :goto_2a
.end method

.method reset()Lorg/jsoup/parser/Token$Tag;
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 81
    iput-object v1, p0, Lorg/jsoup/parser/Token$Tag;->tagName:Ljava/lang/String;

    .line 82
    iput-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeName:Ljava/lang/String;

    .line 83
    iget-object v0, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValue:Ljava/lang/StringBuilder;

    invoke-static {v0}, Lorg/jsoup/parser/Token$Tag;->reset(Ljava/lang/StringBuilder;)V

    .line 84
    iput-object v1, p0, Lorg/jsoup/parser/Token$Tag;->pendingAttributeValueS:Ljava/lang/String;

    .line 85
    iput-boolean v2, p0, Lorg/jsoup/parser/Token$Tag;->hasEmptyAttributeValue:Z

    .line 86
    iput-boolean v2, p0, Lorg/jsoup/parser/Token$Tag;->hasPendingAttributeValue:Z

    .line 87
    iput-boolean v2, p0, Lorg/jsoup/parser/Token$Tag;->selfClosing:Z

    .line 88
    iput-object v1, p0, Lorg/jsoup/parser/Token$Tag;->attributes:Lorg/jsoup/nodes/Attributes;

    .line 89
    return-object p0
.end method

.method bridge synthetic reset()Lorg/jsoup/parser/Token;
    .registers 2

    .prologue
    .line 69
    invoke-virtual {p0}, Lorg/jsoup/parser/Token$Tag;->reset()Lorg/jsoup/parser/Token$Tag;

    move-result-object v0

    return-object v0
.end method

.method final setEmptyAttributeValue()V
    .registers 2

    .prologue
    .line 178
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jsoup/parser/Token$Tag;->hasEmptyAttributeValue:Z

    .line 179
    return-void
.end method
