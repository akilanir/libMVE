.class public Lezvcard/io/ParseWarnings;
.super Ljava/lang/Object;
.source "ParseWarnings.java"


# instance fields
.field private final warnings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lezvcard/io/ParseWarnings;->warnings:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public varargs add(Ljava/lang/Integer;Ljava/lang/String;I[Ljava/lang/Object;)V
    .registers 7
    .param p1, "line"    # Ljava/lang/Integer;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "code"    # I
    .param p4, "args"    # [Ljava/lang/Object;

    .prologue
    .line 52
    sget-object v1, Lezvcard/Messages;->INSTANCE:Lezvcard/Messages;

    invoke-virtual {v1, p3, p4}, Lezvcard/Messages;->getParseMessage(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 53
    .local v0, "message":Ljava/lang/String;
    invoke-virtual {p0, p1, p2, v0}, Lezvcard/io/ParseWarnings;->add(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method public add(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .param p1, "line"    # Ljava/lang/Integer;
    .param p2, "propertyName"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    .line 63
    if-nez p1, :cond_a

    if-nez p2, :cond_a

    .line 64
    iget-object v2, p0, Lezvcard/io/ParseWarnings;->warnings:Ljava/util/List;

    invoke-interface {v2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 79
    :goto_9
    return-void

    .line 69
    :cond_a
    if-nez p1, :cond_28

    if-eqz p2, :cond_28

    .line 70
    const/16 v0, 0x23

    .line 77
    .local v0, "code":I
    :goto_10
    sget-object v2, Lezvcard/Messages;->INSTANCE:Lezvcard/Messages;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/4 v4, 0x1

    aput-object p2, v3, v4

    const/4 v4, 0x2

    aput-object p3, v3, v4

    invoke-virtual {v2, v0, v3}, Lezvcard/Messages;->getParseMessage(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 78
    .local v1, "warning":Ljava/lang/String;
    iget-object v2, p0, Lezvcard/io/ParseWarnings;->warnings:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 71
    .end local v0    # "code":I
    .end local v1    # "warning":Ljava/lang/String;
    :cond_28
    if-eqz p1, :cond_2f

    if-nez p2, :cond_2f

    .line 72
    const/16 v0, 0x25

    .restart local v0    # "code":I
    goto :goto_10

    .line 74
    .end local v0    # "code":I
    :cond_2f
    const/16 v0, 0x24

    .restart local v0    # "code":I
    goto :goto_10
.end method

.method public clear()V
    .registers 2

    .prologue
    .line 93
    iget-object v0, p0, Lezvcard/io/ParseWarnings;->warnings:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 94
    return-void
.end method

.method public copy()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 86
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lezvcard/io/ParseWarnings;->warnings:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
