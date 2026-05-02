.class public abstract Lorg/apache/commons/digester/RuleSetBase;
.super Ljava/lang/Object;
.source "RuleSetBase.java"

# interfaces
.implements Lorg/apache/commons/digester/RuleSet;


# instance fields
.field protected namespaceURI:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/digester/RuleSetBase;->namespaceURI:Ljava/lang/String;

    .line 29
    return-void
.end method


# virtual methods
.method public abstract addRuleInstances(Lorg/apache/commons/digester/Digester;)V
.end method

.method public getNamespaceURI()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lorg/apache/commons/digester/RuleSetBase;->namespaceURI:Ljava/lang/String;

    return-object v0
.end method
