.class public Lorg/apache/commons/digester/RegexRules;
.super Lorg/apache/commons/digester/AbstractRulesImpl;
.source "RegexRules.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/digester/RegexRules$RegisteredRule;
    }
.end annotation


# instance fields
.field private matcher:Lorg/apache/commons/digester/RegexMatcher;

.field private registeredRules:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Lorg/apache/commons/digester/RegexMatcher;)V
    .registers 3
    .param p1, "matcher"    # Lorg/apache/commons/digester/RegexMatcher;

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/apache/commons/digester/AbstractRulesImpl;-><init>()V

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/RegexRules;->registeredRules:Ljava/util/ArrayList;

    .line 54
    invoke-virtual {p0, p1}, Lorg/apache/commons/digester/RegexRules;->setRegexMatcher(Lorg/apache/commons/digester/RegexMatcher;)V

    .line 55
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2

    .prologue
    .line 95
    iget-object v0, p0, Lorg/apache/commons/digester/RegexRules;->registeredRules:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 96
    return-void
.end method

.method public getRegexMatcher()Lorg/apache/commons/digester/RegexMatcher;
    .registers 2

    .prologue
    .line 63
    iget-object v0, p0, Lorg/apache/commons/digester/RegexRules;->matcher:Lorg/apache/commons/digester/RegexMatcher;

    return-object v0
.end method

.method public match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .registers 8
    .param p1, "namespaceURI"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 117
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lorg/apache/commons/digester/RegexRules;->registeredRules:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 118
    .local v2, "rules":Ljava/util/ArrayList;
    iget-object v3, p0, Lorg/apache/commons/digester/RegexRules;->registeredRules:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 119
    .local v0, "it":Ljava/util/Iterator;
    :cond_11
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_18

    .line 125
    return-object v2

    .line 120
    :cond_18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/digester/RegexRules$RegisteredRule;

    .line 121
    .local v1, "next":Lorg/apache/commons/digester/RegexRules$RegisteredRule;
    iget-object v3, p0, Lorg/apache/commons/digester/RegexRules;->matcher:Lorg/apache/commons/digester/RegexMatcher;

    iget-object v4, v1, Lorg/apache/commons/digester/RegexRules$RegisteredRule;->pattern:Ljava/lang/String;

    invoke-virtual {v3, p2, v4}, Lorg/apache/commons/digester/RegexMatcher;->match(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 122
    iget-object v3, v1, Lorg/apache/commons/digester/RegexRules$RegisteredRule;->rule:Lorg/apache/commons/digester/Rule;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11
.end method

.method protected registerRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V
    .registers 5
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 88
    iget-object v0, p0, Lorg/apache/commons/digester/RegexRules;->registeredRules:Ljava/util/ArrayList;

    new-instance v1, Lorg/apache/commons/digester/RegexRules$RegisteredRule;

    invoke-direct {v1, p0, p1, p2}, Lorg/apache/commons/digester/RegexRules$RegisteredRule;-><init>(Lorg/apache/commons/digester/RegexRules;Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    return-void
.end method

.method public rules()Ljava/util/List;
    .registers 4

    .prologue
    .line 137
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/apache/commons/digester/RegexRules;->registeredRules:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 138
    .local v1, "rules":Ljava/util/ArrayList;
    iget-object v2, p0, Lorg/apache/commons/digester/RegexRules;->registeredRules:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 139
    .local v0, "it":Ljava/util/Iterator;
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_18

    .line 142
    return-object v1

    .line 140
    :cond_18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/digester/RegexRules$RegisteredRule;

    iget-object v2, v2, Lorg/apache/commons/digester/RegexRules$RegisteredRule;->rule:Lorg/apache/commons/digester/Rule;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11
.end method

.method public setRegexMatcher(Lorg/apache/commons/digester/RegexMatcher;)V
    .registers 4
    .param p1, "matcher"    # Lorg/apache/commons/digester/RegexMatcher;

    .prologue
    .line 73
    if-nez p1, :cond_a

    .line 74
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "RegexMatcher must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_a
    iput-object p1, p0, Lorg/apache/commons/digester/RegexRules;->matcher:Lorg/apache/commons/digester/RegexMatcher;

    .line 77
    return-void
.end method
