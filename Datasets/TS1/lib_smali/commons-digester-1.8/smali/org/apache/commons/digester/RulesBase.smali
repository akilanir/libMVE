.class public Lorg/apache/commons/digester/RulesBase;
.super Ljava/lang/Object;
.source "RulesBase.java"

# interfaces
.implements Lorg/apache/commons/digester/Rules;


# instance fields
.field protected cache:Ljava/util/HashMap;

.field protected digester:Lorg/apache/commons/digester/Digester;

.field protected namespaceURI:Ljava/lang/String;

.field protected rules:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/RulesBase;->cache:Ljava/util/HashMap;

    .line 70
    iput-object v1, p0, Lorg/apache/commons/digester/RulesBase;->digester:Lorg/apache/commons/digester/Digester;

    .line 78
    iput-object v1, p0, Lorg/apache/commons/digester/RulesBase;->namespaceURI:Ljava/lang/String;

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/RulesBase;->rules:Ljava/util/ArrayList;

    .line 53
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V
    .registers 7
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 156
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 157
    .local v1, "patternLength":I
    const/4 v2, 0x1

    if-le v1, v2, :cond_16

    const-string v2, "/"

    invoke-virtual {p1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 158
    const/4 v2, 0x0

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {p1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 162
    :cond_16
    iget-object v2, p0, Lorg/apache/commons/digester/RulesBase;->cache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 163
    .local v0, "list":Ljava/util/List;
    if-nez v0, :cond_2a

    .line 164
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "list":Ljava/util/List;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .restart local v0    # "list":Ljava/util/List;
    iget-object v2, p0, Lorg/apache/commons/digester/RulesBase;->cache:Ljava/util/HashMap;

    invoke-virtual {v2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    :cond_2a
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 168
    iget-object v2, p0, Lorg/apache/commons/digester/RulesBase;->rules:Ljava/util/ArrayList;

    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 169
    iget-object v2, p0, Lorg/apache/commons/digester/RulesBase;->digester:Lorg/apache/commons/digester/Digester;

    if-eqz v2, :cond_3b

    .line 170
    iget-object v2, p0, Lorg/apache/commons/digester/RulesBase;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {p2, v2}, Lorg/apache/commons/digester/Rule;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 172
    :cond_3b
    iget-object v2, p0, Lorg/apache/commons/digester/RulesBase;->namespaceURI:Ljava/lang/String;

    if-eqz v2, :cond_44

    .line 173
    iget-object v2, p0, Lorg/apache/commons/digester/RulesBase;->namespaceURI:Ljava/lang/String;

    invoke-virtual {p2, v2}, Lorg/apache/commons/digester/Rule;->setNamespaceURI(Ljava/lang/String;)V

    .line 176
    :cond_44
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/commons/digester/RulesBase;->cache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 185
    iget-object v0, p0, Lorg/apache/commons/digester/RulesBase;->rules:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 187
    return-void
.end method

.method public getDigester()Lorg/apache/commons/digester/Digester;
    .registers 2

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/commons/digester/RulesBase;->digester:Lorg/apache/commons/digester/Digester;

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 125
    iget-object v0, p0, Lorg/apache/commons/digester/RulesBase;->namespaceURI:Ljava/lang/String;

    return-object v0
.end method

.method protected lookup(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 8
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 278
    iget-object v4, p0, Lorg/apache/commons/digester/RulesBase;->cache:Ljava/util/HashMap;

    invoke-virtual {v4, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 279
    .local v2, "list":Ljava/util/List;
    if-nez v2, :cond_c

    .line 280
    const/4 v3, 0x0

    .line 296
    :cond_b
    :goto_b
    return-object v3

    .line 282
    :cond_c
    if-eqz p1, :cond_14

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_16

    :cond_14
    move-object v3, v2

    .line 283
    goto :goto_b

    .line 287
    :cond_16
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 288
    .local v3, "results":Ljava/util/ArrayList;
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 289
    .local v1, "items":Ljava/util/Iterator;
    :cond_1f
    :goto_1f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b

    .line 290
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/digester/Rule;

    .line 291
    .local v0, "item":Lorg/apache/commons/digester/Rule;
    invoke-virtual {v0}, Lorg/apache/commons/digester/Rule;->getNamespaceURI()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3b

    invoke-virtual {v0}, Lorg/apache/commons/digester/Rule;->getNamespaceURI()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_1f

    .line 293
    :cond_3b
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1f
.end method

.method public match(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 203
    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/digester/RulesBase;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 10
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x1

    .line 222
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/digester/RulesBase;->lookup(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 223
    .local v3, "rulesList":Ljava/util/List;
    if-eqz v3, :cond_d

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-ge v4, v6, :cond_1f

    .line 225
    :cond_d
    const-string v2, ""

    .line 226
    .local v2, "longKey":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/commons/digester/RulesBase;->cache:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 227
    .local v1, "keys":Ljava/util/Iterator;
    :cond_19
    :goto_19
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_27

    .line 241
    .end local v1    # "keys":Ljava/util/Iterator;
    .end local v2    # "longKey":Ljava/lang/String;
    :cond_1f
    if-nez v3, :cond_26

    .line 242
    new-instance v3, Ljava/util/ArrayList;

    .end local v3    # "rulesList":Ljava/util/List;
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 244
    .restart local v3    # "rulesList":Ljava/util/List;
    :cond_26
    return-object v3

    .line 228
    .restart local v1    # "keys":Ljava/util/Iterator;
    .restart local v2    # "longKey":Ljava/lang/String;
    :cond_27
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 229
    .local v0, "key":Ljava/lang/String;
    const-string v4, "*/"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 230
    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4a

    invoke-virtual {v0, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 232
    :cond_4a
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-le v4, v5, :cond_19

    .line 234
    invoke-virtual {p0, p1, v0}, Lorg/apache/commons/digester/RulesBase;->lookup(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 235
    move-object v2, v0

    goto :goto_19
.end method

.method public rules()Ljava/util/List;
    .registers 2

    .prologue
    .line 258
    iget-object v0, p0, Lorg/apache/commons/digester/RulesBase;->rules:Ljava/util/ArrayList;

    return-object v0
.end method

.method public setDigester(Lorg/apache/commons/digester/Digester;)V
    .registers 5
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 109
    iput-object p1, p0, Lorg/apache/commons/digester/RulesBase;->digester:Lorg/apache/commons/digester/Digester;

    .line 110
    iget-object v2, p0, Lorg/apache/commons/digester/RulesBase;->rules:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 111
    .local v1, "items":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_f

    .line 116
    return-void

    .line 112
    :cond_f
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/digester/Rule;

    .line 113
    .local v0, "item":Lorg/apache/commons/digester/Rule;
    invoke-virtual {v0, p1}, Lorg/apache/commons/digester/Rule;->setDigester(Lorg/apache/commons/digester/Digester;)V

    goto :goto_8
.end method

.method public setNamespaceURI(Ljava/lang/String;)V
    .registers 2
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .prologue
    .line 140
    iput-object p1, p0, Lorg/apache/commons/digester/RulesBase;->namespaceURI:Ljava/lang/String;

    .line 142
    return-void
.end method
