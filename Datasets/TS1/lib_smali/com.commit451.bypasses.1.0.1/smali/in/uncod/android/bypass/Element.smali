.class public Lin/uncod/android/bypass/Element;
.super Ljava/lang/Object;
.source "Element.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lin/uncod/android/bypass/Element$Type;
    }
.end annotation


# static fields
.field public static final F_LIST_ORDERED:I = 0x1


# instance fields
.field attributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field children:[Lin/uncod/android/bypass/Element;

.field nestLevel:I

.field parent:Lin/uncod/android/bypass/Element;

.field text:Ljava/lang/String;

.field type:Lin/uncod/android/bypass/Element$Type;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "type"    # I

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lin/uncod/android/bypass/Element;->attributes:Ljava/util/Map;

    .line 62
    const/4 v0, 0x0

    iput v0, p0, Lin/uncod/android/bypass/Element;->nestLevel:I

    .line 65
    iput-object p1, p0, Lin/uncod/android/bypass/Element;->text:Ljava/lang/String;

    .line 66
    invoke-static {p2}, Lin/uncod/android/bypass/Element$Type;->fromInteger(I)Lin/uncod/android/bypass/Element$Type;

    move-result-object v0

    iput-object v0, p0, Lin/uncod/android/bypass/Element;->type:Lin/uncod/android/bypass/Element$Type;

    .line 67
    return-void
.end method


# virtual methods
.method public addAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 78
    iget-object v0, p0, Lin/uncod/android/bypass/Element;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    return-void
.end method

.method public getAttribute(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 82
    iget-object v0, p0, Lin/uncod/android/bypass/Element;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getParent()Lin/uncod/android/bypass/Element;
    .registers 2

    .prologue
    .line 86
    iget-object v0, p0, Lin/uncod/android/bypass/Element;->parent:Lin/uncod/android/bypass/Element;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .prologue
    .line 90
    iget-object v0, p0, Lin/uncod/android/bypass/Element;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lin/uncod/android/bypass/Element$Type;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lin/uncod/android/bypass/Element;->type:Lin/uncod/android/bypass/Element$Type;

    return-object v0
.end method

.method public isBlockElement()Z
    .registers 2

    .prologue
    .line 105
    iget-object v0, p0, Lin/uncod/android/bypass/Element;->type:Lin/uncod/android/bypass/Element$Type;

    # getter for: Lin/uncod/android/bypass/Element$Type;->value:I
    invoke-static {v0}, Lin/uncod/android/bypass/Element$Type;->access$000(Lin/uncod/android/bypass/Element$Type;)I

    move-result v0

    and-int/lit16 v0, v0, 0x100

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isSpanElement()Z
    .registers 3

    .prologue
    .line 109
    iget-object v0, p0, Lin/uncod/android/bypass/Element;->type:Lin/uncod/android/bypass/Element$Type;

    # getter for: Lin/uncod/android/bypass/Element$Type;->value:I
    invoke-static {v0}, Lin/uncod/android/bypass/Element$Type;->access$000(Lin/uncod/android/bypass/Element$Type;)I

    move-result v0

    and-int/lit16 v0, v0, 0x100

    const/16 v1, 0x100

    if-ne v0, v1, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public setChildren([Lin/uncod/android/bypass/Element;)V
    .registers 2
    .param p1, "children"    # [Lin/uncod/android/bypass/Element;

    .prologue
    .line 74
    iput-object p1, p0, Lin/uncod/android/bypass/Element;->children:[Lin/uncod/android/bypass/Element;

    .line 75
    return-void
.end method

.method public setParent(Lin/uncod/android/bypass/Element;)V
    .registers 2
    .param p1, "element"    # Lin/uncod/android/bypass/Element;

    .prologue
    .line 70
    iput-object p1, p0, Lin/uncod/android/bypass/Element;->parent:Lin/uncod/android/bypass/Element;

    .line 71
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 94
    iget-object v0, p0, Lin/uncod/android/bypass/Element;->children:[Lin/uncod/android/bypass/Element;

    if-eqz v0, :cond_8

    .line 95
    iget-object v0, p0, Lin/uncod/android/bypass/Element;->children:[Lin/uncod/android/bypass/Element;

    array-length v0, v0

    .line 97
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method
