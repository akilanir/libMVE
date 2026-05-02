.class public Lorg/apache/commons/digester/PathCallParamRule;
.super Lorg/apache/commons/digester/Rule;
.source "PathCallParamRule.java"


# instance fields
.field protected paramIndex:I


# direct methods
.method public constructor <init>(I)V
    .registers 3
    .param p1, "paramIndex"    # I

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 55
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/digester/PathCallParamRule;->paramIndex:I

    .line 46
    iput p1, p0, Lorg/apache/commons/digester/PathCallParamRule;->paramIndex:I

    .line 48
    return-void
.end method


# virtual methods
.method public begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 7
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 73
    invoke-virtual {p0}, Lorg/apache/commons/digester/PathCallParamRule;->getDigester()Lorg/apache/commons/digester/Digester;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/commons/digester/Digester;->getMatch()Ljava/lang/String;

    move-result-object v0

    .line 75
    .local v0, "param":Ljava/lang/String;
    if-eqz v0, :cond_16

    .line 76
    iget-object v2, p0, Lorg/apache/commons/digester/PathCallParamRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v2}, Lorg/apache/commons/digester/Digester;->peekParams()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    .line 77
    .local v1, "parameters":[Ljava/lang/Object;
    iget v2, p0, Lorg/apache/commons/digester/PathCallParamRule;->paramIndex:I

    aput-object v0, v1, v2

    .line 80
    .end local v1    # "parameters":[Ljava/lang/Object;
    :cond_16
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 87
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "PathCallParamRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 88
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "paramIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 89
    iget v1, p0, Lorg/apache/commons/digester/PathCallParamRule;->paramIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 90
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 91
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
