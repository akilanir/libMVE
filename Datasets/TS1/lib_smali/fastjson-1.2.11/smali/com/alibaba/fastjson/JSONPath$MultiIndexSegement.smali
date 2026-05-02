.class Lcom/alibaba/fastjson/JSONPath$MultiIndexSegement;
.super Ljava/lang/Object;
.source "JSONPath.java"

# interfaces
.implements Lcom/alibaba/fastjson/JSONPath$Segement;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/JSONPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MultiIndexSegement"
.end annotation


# instance fields
.field private final indexes:[I


# direct methods
.method public constructor <init>([I)V
    .registers 2
    .param p1, "indexes"    # [I

    .prologue
    .line 1084
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1085
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$MultiIndexSegement;->indexes:[I

    .line 1086
    return-void
.end method


# virtual methods
.method public eval(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "rootObject"    # Ljava/lang/Object;
    .param p3, "currentObject"    # Ljava/lang/Object;

    .prologue
    .line 1089
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/alibaba/fastjson/JSONPath$MultiIndexSegement;->indexes:[I

    array-length v3, v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1090
    .local v2, "items":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_9
    iget-object v3, p0, Lcom/alibaba/fastjson/JSONPath$MultiIndexSegement;->indexes:[I

    array-length v3, v3

    if-ge v0, v3, :cond_1c

    .line 1091
    iget-object v3, p0, Lcom/alibaba/fastjson/JSONPath$MultiIndexSegement;->indexes:[I

    aget v3, v3, v0

    invoke-virtual {p1, p3, v3}, Lcom/alibaba/fastjson/JSONPath;->getArrayItem(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v1

    .line 1092
    .local v1, "item":Ljava/lang/Object;
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1090
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 1094
    .end local v1    # "item":Ljava/lang/Object;
    :cond_1c
    return-object v2
.end method
