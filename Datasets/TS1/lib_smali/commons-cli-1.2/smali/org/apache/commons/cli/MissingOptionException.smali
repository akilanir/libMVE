.class public Lorg/apache/commons/cli/MissingOptionException;
.super Lorg/apache/commons/cli/ParseException;
.source "MissingOptionException.java"


# instance fields
.field private missingOptions:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1}, Lorg/apache/commons/cli/ParseException;-><init>(Ljava/lang/String;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .registers 3
    .param p1, "missingOptions"    # Ljava/util/List;

    .prologue
    .line 54
    invoke-static {p1}, Lorg/apache/commons/cli/MissingOptionException;->createMessage(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/cli/MissingOptionException;-><init>(Ljava/lang/String;)V

    .line 55
    iput-object p1, p0, Lorg/apache/commons/cli/MissingOptionException;->missingOptions:Ljava/util/List;

    .line 56
    return-void
.end method

.method private static createMessage(Ljava/util/List;)Ljava/lang/String;
    .registers 5
    .param p0, "missingOptions"    # Ljava/util/List;

    .prologue
    .line 77
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v2, "Missing required option"

    invoke-direct {v0, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 78
    .local v0, "buff":Ljava/lang/StringBuffer;
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_35

    const-string v2, ""

    :goto_10
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 79
    const-string v2, ": "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 81
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 82
    .local v1, "it":Ljava/util/Iterator;
    :cond_1c
    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 84
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 85
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    .line 87
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1c

    .line 78
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_35
    const-string v2, "s"

    goto :goto_10

    .line 91
    .restart local v1    # "it":Ljava/util/Iterator;
    :cond_38
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public getMissingOptions()Ljava/util/List;
    .registers 2

    .prologue
    .line 66
    iget-object v0, p0, Lorg/apache/commons/cli/MissingOptionException;->missingOptions:Ljava/util/List;

    return-object v0
.end method
