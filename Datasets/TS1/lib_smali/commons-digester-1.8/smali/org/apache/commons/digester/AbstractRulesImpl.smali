.class public abstract Lorg/apache/commons/digester/AbstractRulesImpl;
.super Ljava/lang/Object;
.source "AbstractRulesImpl.java"

# interfaces
.implements Lorg/apache/commons/digester/Rules;


# instance fields
.field private digester:Lorg/apache/commons/digester/Digester;

.field private namespaceURI:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V
    .registers 4
    .param p1, "pattern"    # Ljava/lang/String;
    .param p2, "rule"    # Lorg/apache/commons/digester/Rule;

    .prologue
    .line 100
    iget-object v0, p0, Lorg/apache/commons/digester/AbstractRulesImpl;->digester:Lorg/apache/commons/digester/Digester;

    if-eqz v0, :cond_9

    .line 101
    iget-object v0, p0, Lorg/apache/commons/digester/AbstractRulesImpl;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {p2, v0}, Lorg/apache/commons/digester/Rule;->setDigester(Lorg/apache/commons/digester/Digester;)V

    .line 104
    :cond_9
    iget-object v0, p0, Lorg/apache/commons/digester/AbstractRulesImpl;->namespaceURI:Ljava/lang/String;

    if-eqz v0, :cond_12

    .line 105
    iget-object v0, p0, Lorg/apache/commons/digester/AbstractRulesImpl;->namespaceURI:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lorg/apache/commons/digester/Rule;->setNamespaceURI(Ljava/lang/String;)V

    .line 108
    :cond_12
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/digester/AbstractRulesImpl;->registerRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V

    .line 110
    return-void
.end method

.method public abstract clear()V
.end method

.method public getDigester()Lorg/apache/commons/digester/Digester;
    .registers 2

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/commons/digester/AbstractRulesImpl;->digester:Lorg/apache/commons/digester/Digester;

    return-object v0
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lorg/apache/commons/digester/AbstractRulesImpl;->namespaceURI:Ljava/lang/String;

    return-object v0
.end method

.method public match(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 140
    iget-object v0, p0, Lorg/apache/commons/digester/AbstractRulesImpl;->namespaceURI:Ljava/lang/String;

    invoke-virtual {p0, v0, p1}, Lorg/apache/commons/digester/AbstractRulesImpl;->match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public abstract match(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
.end method

.method protected abstract registerRule(Ljava/lang/String;Lorg/apache/commons/digester/Rule;)V
.end method

.method public abstract rules()Ljava/util/List;
.end method

.method public setDigester(Lorg/apache/commons/digester/Digester;)V
    .registers 2
    .param p1, "digester"    # Lorg/apache/commons/digester/Digester;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/apache/commons/digester/AbstractRulesImpl;->digester:Lorg/apache/commons/digester/Digester;

    .line 66
    return-void
.end method

.method public setNamespaceURI(Ljava/lang/String;)V
    .registers 2
    .param p1, "namespaceURI"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lorg/apache/commons/digester/AbstractRulesImpl;->namespaceURI:Ljava/lang/String;

    .line 86
    return-void
.end method
