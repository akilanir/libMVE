.class Lcom/alibaba/fastjson/JSONPath$IntInSegement;
.super Ljava/lang/Object;
.source "JSONPath.java"

# interfaces
.implements Lcom/alibaba/fastjson/JSONPath$Filter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alibaba/fastjson/JSONPath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "IntInSegement"
.end annotation


# instance fields
.field private final not:Z

.field private final propertyName:Ljava/lang/String;

.field private final values:[J


# direct methods
.method public constructor <init>(Ljava/lang/String;[JZ)V
    .registers 4
    .param p1, "propertyName"    # Ljava/lang/String;
    .param p2, "values"    # [J
    .param p3, "not"    # Z

    .prologue
    .line 1160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1161
    iput-object p1, p0, Lcom/alibaba/fastjson/JSONPath$IntInSegement;->propertyName:Ljava/lang/String;

    .line 1162
    iput-object p2, p0, Lcom/alibaba/fastjson/JSONPath$IntInSegement;->values:[J

    .line 1163
    iput-boolean p3, p0, Lcom/alibaba/fastjson/JSONPath$IntInSegement;->not:Z

    .line 1164
    return-void
.end method


# virtual methods
.method public apply(Lcom/alibaba/fastjson/JSONPath;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 15
    .param p1, "path"    # Lcom/alibaba/fastjson/JSONPath;
    .param p2, "rootObject"    # Ljava/lang/Object;
    .param p3, "currentObject"    # Ljava/lang/Object;
    .param p4, "item"    # Ljava/lang/Object;

    .prologue
    const/4 v5, 0x0

    .line 1167
    iget-object v6, p0, Lcom/alibaba/fastjson/JSONPath$IntInSegement;->propertyName:Ljava/lang/String;

    invoke-virtual {p1, p4, v6, v5}, Lcom/alibaba/fastjson/JSONPath;->getPropertyValue(Ljava/lang/Object;Ljava/lang/String;Z)Ljava/lang/Object;

    move-result-object v2

    .line 1169
    .local v2, "propertyValue":Ljava/lang/Object;
    if-nez v2, :cond_a

    .line 1182
    .end local v2    # "propertyValue":Ljava/lang/Object;
    :cond_9
    :goto_9
    return v5

    .line 1173
    .restart local v2    # "propertyValue":Ljava/lang/Object;
    :cond_a
    instance-of v6, v2, Ljava/lang/Number;

    if-eqz v6, :cond_29

    .line 1174
    check-cast v2, Ljava/lang/Number;

    .end local v2    # "propertyValue":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    .line 1175
    .local v0, "longPropertyValue":J
    iget-object v7, p0, Lcom/alibaba/fastjson/JSONPath$IntInSegement;->values:[J

    array-length v8, v7

    move v6, v5

    :goto_18
    if-ge v6, v8, :cond_29

    aget-wide v3, v7, v6

    .line 1176
    .local v3, "value":J
    cmp-long v9, v3, v0

    if-nez v9, :cond_26

    .line 1177
    iget-boolean v6, p0, Lcom/alibaba/fastjson/JSONPath$IntInSegement;->not:Z

    if-nez v6, :cond_9

    const/4 v5, 0x1

    goto :goto_9

    .line 1175
    :cond_26
    add-int/lit8 v6, v6, 0x1

    goto :goto_18

    .line 1182
    .end local v0    # "longPropertyValue":J
    .end local v3    # "value":J
    :cond_29
    iget-boolean v5, p0, Lcom/alibaba/fastjson/JSONPath$IntInSegement;->not:Z

    goto :goto_9
.end method
