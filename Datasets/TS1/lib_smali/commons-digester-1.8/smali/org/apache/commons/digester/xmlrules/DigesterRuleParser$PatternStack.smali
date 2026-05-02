.class public Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;
.super Lorg/apache/commons/collections/ArrayStack;
.source "DigesterRuleParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "PatternStack"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;


# direct methods
.method protected constructor <init>(Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;)V
    .registers 2
    .param p1, "this$0"    # Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/apache/commons/collections/ArrayStack;-><init>()V

    iput-object p1, p0, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;->this$0:Lorg/apache/commons/digester/xmlrules/DigesterRuleParser;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 91
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 92
    .local v2, "str":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_6
    invoke-virtual {p0}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;->size()I

    move-result v3

    if-lt v1, v3, :cond_11

    .line 101
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 93
    :cond_11
    invoke-virtual {p0, v1}, Lorg/apache/commons/digester/xmlrules/DigesterRuleParser$PatternStack;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 94
    .local v0, "elem":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2d

    .line 95
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    if-lez v3, :cond_2a

    .line 96
    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 98
    :cond_2a
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_6
.end method
