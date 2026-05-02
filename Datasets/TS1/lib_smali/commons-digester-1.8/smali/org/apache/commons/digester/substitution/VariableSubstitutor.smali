.class public Lorg/apache/commons/digester/substitution/VariableSubstitutor;
.super Lorg/apache/commons/digester/Substitutor;
.source "VariableSubstitutor.java"


# instance fields
.field private attributesExpander:Lorg/apache/commons/digester/substitution/VariableExpander;

.field private bodyTextExpander:Lorg/apache/commons/digester/substitution/VariableExpander;

.field private variableAttributes:Lorg/apache/commons/digester/substitution/VariableAttributes;


# direct methods
.method public constructor <init>(Lorg/apache/commons/digester/substitution/VariableExpander;)V
    .registers 2
    .param p1, "expander"    # Lorg/apache/commons/digester/substitution/VariableExpander;

    .prologue
    .line 62
    invoke-direct {p0, p1, p1}, Lorg/apache/commons/digester/substitution/VariableSubstitutor;-><init>(Lorg/apache/commons/digester/substitution/VariableExpander;Lorg/apache/commons/digester/substitution/VariableExpander;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/digester/substitution/VariableExpander;Lorg/apache/commons/digester/substitution/VariableExpander;)V
    .registers 4
    .param p1, "attributesExpander"    # Lorg/apache/commons/digester/substitution/VariableExpander;
    .param p2, "bodyTextExpander"    # Lorg/apache/commons/digester/substitution/VariableExpander;

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/apache/commons/digester/Substitutor;-><init>()V

    .line 73
    iput-object p1, p0, Lorg/apache/commons/digester/substitution/VariableSubstitutor;->attributesExpander:Lorg/apache/commons/digester/substitution/VariableExpander;

    .line 74
    iput-object p2, p0, Lorg/apache/commons/digester/substitution/VariableSubstitutor;->bodyTextExpander:Lorg/apache/commons/digester/substitution/VariableExpander;

    .line 75
    new-instance v0, Lorg/apache/commons/digester/substitution/VariableAttributes;

    invoke-direct {v0}, Lorg/apache/commons/digester/substitution/VariableAttributes;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/digester/substitution/VariableSubstitutor;->variableAttributes:Lorg/apache/commons/digester/substitution/VariableAttributes;

    .line 76
    return-void
.end method


# virtual methods
.method public substitute(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p1, "bodyText"    # Ljava/lang/String;

    .prologue
    .line 100
    move-object v0, p1

    .line 101
    .local v0, "result":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/commons/digester/substitution/VariableSubstitutor;->bodyTextExpander:Lorg/apache/commons/digester/substitution/VariableExpander;

    if-eqz v1, :cond_b

    .line 102
    iget-object v1, p0, Lorg/apache/commons/digester/substitution/VariableSubstitutor;->bodyTextExpander:Lorg/apache/commons/digester/substitution/VariableExpander;

    invoke-interface {v1, p1}, Lorg/apache/commons/digester/substitution/VariableExpander;->expand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 104
    :cond_b
    return-object v0
.end method

.method public substitute(Lorg/xml/sax/Attributes;)Lorg/xml/sax/Attributes;
    .registers 5
    .param p1, "attributes"    # Lorg/xml/sax/Attributes;

    .prologue
    .line 83
    move-object v0, p1

    .line 84
    .local v0, "results":Lorg/xml/sax/Attributes;
    iget-object v1, p0, Lorg/apache/commons/digester/substitution/VariableSubstitutor;->attributesExpander:Lorg/apache/commons/digester/substitution/VariableExpander;

    if-eqz v1, :cond_e

    .line 85
    iget-object v1, p0, Lorg/apache/commons/digester/substitution/VariableSubstitutor;->variableAttributes:Lorg/apache/commons/digester/substitution/VariableAttributes;

    iget-object v2, p0, Lorg/apache/commons/digester/substitution/VariableSubstitutor;->attributesExpander:Lorg/apache/commons/digester/substitution/VariableExpander;

    invoke-virtual {v1, p1, v2}, Lorg/apache/commons/digester/substitution/VariableAttributes;->init(Lorg/xml/sax/Attributes;Lorg/apache/commons/digester/substitution/VariableExpander;)V

    .line 86
    iget-object v0, p0, Lorg/apache/commons/digester/substitution/VariableSubstitutor;->variableAttributes:Lorg/apache/commons/digester/substitution/VariableAttributes;

    .line 88
    :cond_e
    return-object v0
.end method
