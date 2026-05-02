.class Lcom/alibaba/fastjson/JSONPath$RangeSegement;
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
    name = "RangeSegement"
.end annotation


# instance fields
.field private final end:I

.field private final start:I

.field private final step:I


# direct methods
.method public constructor <init>(III)V
    .registers 4
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "step"    # I

    .prologue
    .line 1104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1105
    iput p1, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->start:I

    .line 1106
    iput p2, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->end:I

    .line 1107
    iput p3, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->step:I

    .line 1108
    return-void
.end method


# virtual methods
.method public eval(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "rootObject"    # Ljava/lang/Object;
    .param p3, "currentObject"    # Ljava/lang/Object;

    .prologue
    .line 1111
    sget-object v6, Lcom/alibaba/fastjson/JSONPath$SizeSegement;->instance:Lcom/alibaba/fastjson/JSONPath$SizeSegement;

    invoke-virtual {v6, p1, p2, p3}, Lcom/alibaba/fastjson/JSONPath$SizeSegement;->eval(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 1112
    .local v4, "size":I
    iget v6, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->start:I

    if-ltz v6, :cond_32

    iget v5, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->start:I

    .line 1113
    .local v5, "start":I
    :goto_10
    iget v6, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->end:I

    if-ltz v6, :cond_37

    iget v0, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->end:I

    .line 1115
    .local v0, "end":I
    :goto_16
    new-instance v3, Ljava/util/ArrayList;

    sub-int v6, v0, v5

    iget v7, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->step:I

    div-int/2addr v6, v7

    add-int/lit8 v6, v6, 0x1

    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1116
    .local v3, "items":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    move v1, v5

    .local v1, "i":I
    :goto_23
    if-gt v1, v0, :cond_3c

    if-ge v1, v4, :cond_3c

    .line 1117
    invoke-virtual {p1, p3, v1}, Lcom/alibaba/fastjson/JSONPath;->getArrayItem(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    .line 1118
    .local v2, "item":Ljava/lang/Object;
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1116
    iget v6, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->step:I

    add-int/2addr v1, v6

    goto :goto_23

    .line 1112
    .end local v0    # "end":I
    .end local v1    # "i":I
    .end local v2    # "item":Ljava/lang/Object;
    .end local v3    # "items":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .end local v5    # "start":I
    :cond_32
    iget v6, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->start:I

    add-int v5, v6, v4

    goto :goto_10

    .line 1113
    .restart local v5    # "start":I
    :cond_37
    iget v6, p0, Lcom/alibaba/fastjson/JSONPath$RangeSegement;->end:I

    add-int v0, v6, v4

    goto :goto_16

    .line 1120
    .restart local v0    # "end":I
    .restart local v1    # "i":I
    .restart local v3    # "items":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_3c
    return-object v3
.end method
