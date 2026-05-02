.class public Lorg/apache/commons/digester/WithDefaultsRulesWrapper;
.super Ljava/lang/Object;
.source "WithDefaultsRulesWrapper.java"

# interfaces
.implements Lorg/apache/commons/digester/Rules;


# instance fields
.field private allRules:Ljava/util/List;

.field private defaultRules:Ljava/util/List;

.field private wrappedRules:Lorg/apache/commons/digester/Rules;


# direct methods
.method public constructor <init>(Lorg/apache/commons/digester/Rules;)V
    .registers 4
    .param p1, "wrappedRules"    # Lorg/apache/commons/digester/Rules;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->defaultRules:Ljava/util/List;

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->allRules:Ljava/util/List;

    .line 70
    if-nez p1, :cond_1b

    .line 71
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Wrapped rules must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_1b
    iput-object p1, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    .line 74
    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/digester/Rules;->add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 162
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->allRules:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    return-void
.end method

.method public addDefault(Lorg/apache/commons/digester/Rule;)V
    .registers 3
    .param p1, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 132
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 133
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/commons/digester/Rule;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 136
    :cond_11
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_22

    .line 137
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/commons/digester/Rule;->setNamespaceURI(Ljava/lang/String;)V

    .line 140
    :cond_22
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->defaultRules:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 141
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->allRules:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    return-void
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 151
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->clear()V

    .line 152
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->allRules:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 153
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->defaultRules:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 154
    return-void
.end method

.method public getDefaults()Ljava/util/List;
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->defaultRules:Ljava/util/List;

    return-object v0
.end method

.method public getDigester()Lorg/apache/commons/digester/Digester;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v0

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0}, Lorg/apache/commons/digester/Rules;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public match(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 111
    const-string v0, ""

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 5
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 120
    iget-object v1, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v1, p1, p2}, Lorg/apache/commons/digester/Rules;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 121
    .local v0, "matches":Ljava/util/List;
    if-eqz v0, :cond_e

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_15

    .line 123
    :cond_e
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "matches":Ljava/util/List;
    iget-object v1, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->defaultRules:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 126
    :cond_15
    return-object v0
.end method

.method public rules()Ljava/util/List;
    .registers 2

    .prologue
    .line 146
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->allRules:Ljava/util/List;

    return-object v0
.end method

.method public setDigester(Lorg/apache/commons/digester/Digester;)V
    .registers 5
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 85
    iget-object v2, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v2, p1}, Lorg/apache/commons/digester/Rules;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 86
    iget-object v2, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->defaultRules:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 87
    .local v0, "it":Ljava/util/Iterator;
    :goto_b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_12

    .line 91
    return-void

    .line 88
    :cond_12
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/digester/Rule;

    .line 89
    .local v1, "rule":Lorg/apache/commons/digester/Rule;
    invoke-virtual {v1, p1}, Lorg/apache/commons/digester/Rule;->setDigester(Lorg/apache/commons/digester/Digester;)V

    goto :goto_b
.end method

.method public setNamespaceURI(Ljava/lang/String;)V
    .registers 3
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .prologue
    .line 100
    iget-object v0, p0, Lorg/apache/commons/digester/WithDefaultsRulesWrapper;->wrappedRules:Lorg/apache/commons/digester/Rules;

    invoke-interface {v0, p1}, Lorg/apache/commons/digester/Rules;->setNamespaceURI(Ljava/lang/String;)V

    .line 101
    return-void
.end method
