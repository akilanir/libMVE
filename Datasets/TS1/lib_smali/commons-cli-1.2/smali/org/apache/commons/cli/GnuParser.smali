.class public Lorg/apache/commons/cli/GnuParser;
.super Lorg/apache/commons/cli/Parser;
.source "GnuParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/commons/cli/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method protected flatten(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Z)[Ljava/lang/String;
    .registers 14
    .param p1, "options"    # Lorg/apache/commons/cli/Options;
    .param p2, "arguments"    # [Ljava/lang/String;
    .param p3, "stopAtNonOption"    # Z

    .prologue
    const/4 v9, 0x2

    const/16 v8, 0x3d

    const/4 v7, 0x0

    .line 51
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .local v4, "tokens":Ljava/util/List;
    const/4 v1, 0x0

    .line 55
    .local v1, "eatTheRest":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_b
    array-length v5, p2

    if-ge v2, v5, :cond_a6

    .line 57
    aget-object v0, p2, v2

    .line 59
    .local v0, "arg":Ljava/lang/String;
    const-string v5, "--"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2d

    .line 61
    const/4 v1, 0x1

    .line 62
    const-string v5, "--"

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    :goto_1e
    if-eqz v1, :cond_a2

    .line 104
    add-int/lit8 v2, v2, 0x1

    :goto_22
    array-length v5, p2

    if-ge v2, v5, :cond_a2

    .line 106
    aget-object v5, p2, v2

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 104
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    .line 64
    :cond_2d
    const-string v5, "-"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3b

    .line 66
    const-string v5, "-"

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 68
    :cond_3b
    const-string v5, "-"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_9d

    .line 70
    invoke-static {v0}, Lorg/apache/commons/cli/Util;->stripLeadingHyphens(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 72
    .local v3, "opt":Ljava/lang/String;
    invoke-virtual {p1, v3}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_51

    .line 74
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 78
    :cond_51
    invoke-virtual {v3, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_7f

    invoke-virtual {v3, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    invoke-virtual {v3, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7f

    .line 81
    invoke-virtual {v0, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    invoke-virtual {v0, v7, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    invoke-virtual {v0, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 84
    :cond_7f
    invoke-virtual {v0, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_98

    .line 87
    invoke-virtual {v0, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    invoke-virtual {v0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 92
    :cond_98
    move v1, p3

    .line 93
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1e

    .line 99
    .end local v3    # "opt":Ljava/lang/String;
    :cond_9d
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_1e

    .line 55
    :cond_a2
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_b

    .line 111
    .end local v0    # "arg":Ljava/lang/String;
    :cond_a6
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    check-cast v5, [Ljava/lang/String;

    return-object v5
.end method
