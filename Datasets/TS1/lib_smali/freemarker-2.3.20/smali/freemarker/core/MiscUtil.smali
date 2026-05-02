.class Lfreemarker/core/MiscUtil;
.super Ljava/lang/Object;
.source "MiscUtil.java"


# static fields
.field static final C_FALSE:Ljava/lang/String; = "false"

.field static final C_TRUE:Ljava/lang/String; = "true"


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static sortMapOfExpressions(Ljava/util/Map;)Ljava/util/List;
    .registers 3
    .param p0, "map"    # Ljava/util/Map;

    .prologue
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 25
    .local v0, "res":Ljava/util/ArrayList;
    new-instance v1, Lfreemarker/core/MiscUtil$1;

    invoke-direct {v1}, Lfreemarker/core/MiscUtil$1;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 46
    return-object v0
.end method
