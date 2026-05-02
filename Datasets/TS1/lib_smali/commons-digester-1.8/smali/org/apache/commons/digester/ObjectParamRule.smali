.class public Lorg/apache/commons/digester/ObjectParamRule;
.super Lorg/apache/commons/digester/Rule;
.source "ObjectParamRule.java"


# instance fields
.field protected attributeName:Ljava/lang/String;

.field protected param:Ljava/lang/Object;

.field protected paramIndex:I


# direct methods
.method public constructor <init>(ILjava/lang/Object;)V
    .registers 4
    .param p1, "paramIndex"    # I
    .param p2, "param"    # Ljava/lang/Object;

    .prologue
    .line 52
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lorg/apache/commons/digester/ObjectParamRule;-><init>(ILjava/lang/String;Ljava/lang/Object;)V

    .line 53
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Object;)V
    .registers 6
    .param p1, "paramIndex"    # I
    .param p2, "attributeName"    # Ljava/lang/String;
    .param p3, "param"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Lorg/apache/commons/digester/Rule;-><init>()V

    .line 76
    iput-object v1, p0, Lorg/apache/commons/digester/ObjectParamRule;->attributeName:Ljava/lang/String;

    .line 81
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/commons/digester/ObjectParamRule;->paramIndex:I

    .line 86
    iput-object v1, p0, Lorg/apache/commons/digester/ObjectParamRule;->param:Ljava/lang/Object;

    .line 65
    iput p1, p0, Lorg/apache/commons/digester/ObjectParamRule;->paramIndex:I

    .line 66
    iput-object p2, p0, Lorg/apache/commons/digester/ObjectParamRule;->attributeName:Ljava/lang/String;

    .line 67
    iput-object p3, p0, Lorg/apache/commons/digester/ObjectParamRule;->param:Ljava/lang/Object;

    .line 68
    return-void
.end method


# virtual methods
.method public begin(Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .registers 8
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "attributes"    # Lorg/xml/sax/Attributes;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 98
    const/4 v0, 0x0

    .line 99
    .local v0, "anAttribute":Ljava/lang/Object;
    iget-object v2, p0, Lorg/apache/commons/digester/ObjectParamRule;->digester:Lorg/apache/commons/digester/Digester;

    invoke-virtual {v2}, Lorg/apache/commons/digester/Digester;->peekParams()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    .line 101
    .local v1, "parameters":[Ljava/lang/Object;
    iget-object v2, p0, Lorg/apache/commons/digester/ObjectParamRule;->attributeName:Ljava/lang/String;

    if-eqz v2, :cond_1c

    .line 102
    iget-object v2, p0, Lorg/apache/commons/digester/ObjectParamRule;->attributeName:Ljava/lang/String;

    invoke-interface {p3, v2}, Lorg/xml/sax/Attributes;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, "anAttribute":Ljava/lang/String;
    if-eqz v0, :cond_1b

    .line 104
    iget v2, p0, Lorg/apache/commons/digester/ObjectParamRule;->paramIndex:I

    iget-object v3, p0, Lorg/apache/commons/digester/ObjectParamRule;->param:Ljava/lang/Object;

    aput-object v3, v1, v2

    .line 111
    .end local v0    # "anAttribute":Ljava/lang/String;
    :cond_1b
    :goto_1b
    return-void

    .line 109
    .local v0, "anAttribute":Ljava/lang/Object;
    :cond_1c
    iget v2, p0, Lorg/apache/commons/digester/ObjectParamRule;->paramIndex:I

    iget-object v3, p0, Lorg/apache/commons/digester/ObjectParamRule;->param:Ljava/lang/Object;

    aput-object v3, v1, v2

    goto :goto_1b
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 117
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "ObjectParamRule["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 118
    .local v0, "sb":Ljava/lang/StringBuffer;
    const-string v1, "paramIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 119
    iget v1, p0, Lorg/apache/commons/digester/ObjectParamRule;->paramIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 120
    const-string v1, ", attributeName="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 121
    iget-object v1, p0, Lorg/apache/commons/digester/ObjectParamRule;->attributeName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 122
    const-string v1, ", param="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    iget-object v1, p0, Lorg/apache/commons/digester/ObjectParamRule;->param:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 124
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 125
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
