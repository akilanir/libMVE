.class public abstract Lorg/hamcrest/BaseDescription;
.super Ljava/lang/Object;
.source "BaseDescription.java"

# interfaces
.implements Lorg/hamcrest/Description;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private appendList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;)Lorg/hamcrest/Description;
    .registers 7
    .param p1, "start"    # Ljava/lang/String;
    .param p2, "separator"    # Ljava/lang/String;
    .param p3, "end"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Iterator",
            "<+",
            "Lorg/hamcrest/SelfDescribing;",
            ">;)",
            "Lorg/hamcrest/Description;"
        }
    .end annotation

    .prologue
    .line 89
    .local p4, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<+Lorg/hamcrest/SelfDescribing;>;"
    const/4 v0, 0x0

    .line 91
    .local v0, "separate":Z
    invoke-virtual {p0, p1}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    .line 92
    :goto_4
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 93
    if-eqz v0, :cond_f

    invoke-virtual {p0, p2}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    .line 94
    :cond_f
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/hamcrest/SelfDescribing;

    invoke-virtual {p0, v1}, Lorg/hamcrest/BaseDescription;->appendDescriptionOf(Lorg/hamcrest/SelfDescribing;)Lorg/hamcrest/Description;

    .line 95
    const/4 v0, 0x1

    goto :goto_4

    .line 97
    :cond_1a
    invoke-virtual {p0, p3}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    .line 99
    return-object p0
.end method

.method private appendValueList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;)Lorg/hamcrest/Description;
    .registers 6
    .param p1, "start"    # Ljava/lang/String;
    .param p2, "separator"    # Ljava/lang/String;
    .param p3, "end"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Iterator",
            "<TT;>;)",
            "Lorg/hamcrest/Description;"
        }
    .end annotation

    .prologue
    .line 80
    .local p4, "values":Ljava/util/Iterator;, "Ljava/util/Iterator<TT;>;"
    new-instance v0, Lorg/hamcrest/internal/SelfDescribingValueIterator;

    invoke-direct {v0, p4}, Lorg/hamcrest/internal/SelfDescribingValueIterator;-><init>(Ljava/util/Iterator;)V

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/hamcrest/BaseDescription;->appendList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;)Lorg/hamcrest/Description;

    move-result-object v0

    return-object v0
.end method

.method private descriptionOf(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 62
    :try_start_0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    .line 65
    :goto_4
    return-object v1

    .line 64
    :catch_5
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "@"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_4
.end method

.method private toJavaSyntax(C)V
    .registers 3
    .param p1, "ch"    # C

    .prologue
    .line 127
    sparse-switch p1, :sswitch_data_20

    .line 141
    invoke-virtual {p0, p1}, Lorg/hamcrest/BaseDescription;->append(C)V

    .line 143
    :goto_6
    return-void

    .line 129
    :sswitch_7
    const-string v0, "\\\""

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    goto :goto_6

    .line 132
    :sswitch_d
    const-string v0, "\\n"

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    goto :goto_6

    .line 135
    :sswitch_13
    const-string v0, "\\r"

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    goto :goto_6

    .line 138
    :sswitch_19
    const-string v0, "\\t"

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    goto :goto_6

    .line 127
    nop

    :sswitch_data_20
    .sparse-switch
        0x9 -> :sswitch_19
        0xa -> :sswitch_d
        0xd -> :sswitch_13
        0x22 -> :sswitch_7
    .end sparse-switch
.end method

.method private toJavaSyntax(Ljava/lang/String;)V
    .registers 5
    .param p1, "unformatted"    # Ljava/lang/String;

    .prologue
    const/16 v2, 0x22

    .line 119
    invoke-virtual {p0, v2}, Lorg/hamcrest/BaseDescription;->append(C)V

    .line 120
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_16

    .line 121
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-direct {p0, v1}, Lorg/hamcrest/BaseDescription;->toJavaSyntax(C)V

    .line 120
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 123
    :cond_16
    invoke-virtual {p0, v2}, Lorg/hamcrest/BaseDescription;->append(C)V

    .line 124
    return-void
.end method


# virtual methods
.method protected abstract append(C)V
.end method

.method protected append(Ljava/lang/String;)V
    .registers 4
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 108
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_11

    .line 109
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {p0, v1}, Lorg/hamcrest/BaseDescription;->append(C)V

    .line 108
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 111
    :cond_11
    return-void
.end method

.method public appendDescriptionOf(Lorg/hamcrest/SelfDescribing;)Lorg/hamcrest/Description;
    .registers 2
    .param p1, "value"    # Lorg/hamcrest/SelfDescribing;

    .prologue
    .line 24
    invoke-interface {p1, p0}, Lorg/hamcrest/SelfDescribing;->describeTo(Lorg/hamcrest/Description;)V

    .line 25
    return-object p0
.end method

.method public appendList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Iterable;)Lorg/hamcrest/Description;
    .registers 6
    .param p1, "start"    # Ljava/lang/String;
    .param p2, "separator"    # Ljava/lang/String;
    .param p3, "end"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/hamcrest/SelfDescribing;",
            ">;)",
            "Lorg/hamcrest/Description;"
        }
    .end annotation

    .prologue
    .line 85
    .local p4, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/hamcrest/SelfDescribing;>;"
    invoke-interface {p4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/hamcrest/BaseDescription;->appendList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;)Lorg/hamcrest/Description;

    move-result-object v0

    return-object v0
.end method

.method public appendText(Ljava/lang/String;)Lorg/hamcrest/Description;
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-virtual {p0, p1}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    .line 19
    return-object p0
.end method

.method public appendValue(Ljava/lang/Object;)Lorg/hamcrest/Description;
    .registers 6
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    const/16 v2, 0x22

    const/16 v1, 0x3c

    .line 30
    if-nez p1, :cond_c

    .line 31
    const-string v0, "null"

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    .line 57
    .end local p1    # "value":Ljava/lang/Object;
    :goto_b
    return-object p0

    .line 32
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_c
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_16

    .line 33
    check-cast p1, Ljava/lang/String;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lorg/hamcrest/BaseDescription;->toJavaSyntax(Ljava/lang/String;)V

    goto :goto_b

    .line 34
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_16
    instance-of v0, p1, Ljava/lang/Character;

    if-eqz v0, :cond_2a

    .line 35
    invoke-virtual {p0, v2}, Lorg/hamcrest/BaseDescription;->append(C)V

    .line 36
    check-cast p1, Ljava/lang/Character;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Character;->charValue()C

    move-result v0

    invoke-direct {p0, v0}, Lorg/hamcrest/BaseDescription;->toJavaSyntax(C)V

    .line 37
    invoke-virtual {p0, v2}, Lorg/hamcrest/BaseDescription;->append(C)V

    goto :goto_b

    .line 38
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_2a
    instance-of v0, p1, Ljava/lang/Short;

    if-eqz v0, :cond_3e

    .line 39
    invoke-virtual {p0, v1}, Lorg/hamcrest/BaseDescription;->append(C)V

    .line 40
    invoke-direct {p0, p1}, Lorg/hamcrest/BaseDescription;->descriptionOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    .line 41
    const-string v0, "s>"

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    goto :goto_b

    .line 42
    :cond_3e
    instance-of v0, p1, Ljava/lang/Long;

    if-eqz v0, :cond_52

    .line 43
    invoke-virtual {p0, v1}, Lorg/hamcrest/BaseDescription;->append(C)V

    .line 44
    invoke-direct {p0, p1}, Lorg/hamcrest/BaseDescription;->descriptionOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    .line 45
    const-string v0, "L>"

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    goto :goto_b

    .line 46
    :cond_52
    instance-of v0, p1, Ljava/lang/Float;

    if-eqz v0, :cond_66

    .line 47
    invoke-virtual {p0, v1}, Lorg/hamcrest/BaseDescription;->append(C)V

    .line 48
    invoke-direct {p0, p1}, Lorg/hamcrest/BaseDescription;->descriptionOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    .line 49
    const-string v0, "F>"

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    goto :goto_b

    .line 50
    :cond_66
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_7f

    .line 51
    const-string v0, "["

    const-string v1, ", "

    const-string v2, "]"

    new-instance v3, Lorg/hamcrest/internal/ArrayIterator;

    invoke-direct {v3, p1}, Lorg/hamcrest/internal/ArrayIterator;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/hamcrest/BaseDescription;->appendValueList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;)Lorg/hamcrest/Description;

    goto :goto_b

    .line 53
    :cond_7f
    invoke-virtual {p0, v1}, Lorg/hamcrest/BaseDescription;->append(C)V

    .line 54
    invoke-direct {p0, p1}, Lorg/hamcrest/BaseDescription;->descriptionOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(Ljava/lang/String;)V

    .line 55
    const/16 v0, 0x3e

    invoke-virtual {p0, v0}, Lorg/hamcrest/BaseDescription;->append(C)V

    goto/16 :goto_b
.end method

.method public appendValueList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Iterable;)Lorg/hamcrest/Description;
    .registers 6
    .param p1, "start"    # Ljava/lang/String;
    .param p2, "separator"    # Ljava/lang/String;
    .param p3, "end"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<TT;>;)",
            "Lorg/hamcrest/Description;"
        }
    .end annotation

    .prologue
    .line 76
    .local p4, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    invoke-interface {p4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/hamcrest/BaseDescription;->appendValueList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Iterator;)Lorg/hamcrest/Description;

    move-result-object v0

    return-object v0
.end method

.method public varargs appendValueList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lorg/hamcrest/Description;
    .registers 6
    .param p1, "start"    # Ljava/lang/String;
    .param p2, "separator"    # Ljava/lang/String;
    .param p3, "end"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[TT;)",
            "Lorg/hamcrest/Description;"
        }
    .end annotation

    .prologue
    .line 71
    .local p4, "values":[Ljava/lang/Object;, "[TT;"
    invoke-static {p4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/hamcrest/BaseDescription;->appendValueList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Iterable;)Lorg/hamcrest/Description;

    move-result-object v0

    return-object v0
.end method
