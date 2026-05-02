.class Lcom/larvalabs/svgandroid/SVGParser$StyleSet;
.super Ljava/lang/Object;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/larvalabs/svgandroid/SVGParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StyleSet"
.end annotation


# instance fields
.field styleMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .registers 11
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 689
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 687
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    iput-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$StyleSet;->styleMap:Ljava/util/HashMap;

    .line 690
    const-string v6, ";"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 691
    .local v5, "styles":[Ljava/lang/String;
    move-object v0, v5

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_13
    if-ge v1, v2, :cond_2f

    aget-object v3, v0, v1

    .line 692
    .local v3, "s":Ljava/lang/String;
    const-string v6, ":"

    invoke-virtual {v3, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 693
    .local v4, "style":[Ljava/lang/String;
    array-length v6, v4

    const/4 v7, 0x2

    if-ne v6, v7, :cond_2c

    .line 694
    iget-object v6, p0, Lcom/larvalabs/svgandroid/SVGParser$StyleSet;->styleMap:Ljava/util/HashMap;

    const/4 v7, 0x0

    aget-object v7, v4, v7

    const/4 v8, 0x1

    aget-object v8, v4, v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 691
    :cond_2c
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 697
    .end local v3    # "s":Ljava/lang/String;
    .end local v4    # "style":[Ljava/lang/String;
    :cond_2f
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/larvalabs/svgandroid/SVGParser$1;)V
    .registers 3
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Lcom/larvalabs/svgandroid/SVGParser$1;

    .prologue
    .line 686
    invoke-direct {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser$StyleSet;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getStyle(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 700
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$StyleSet;->styleMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method
